import PowerToolbox as ptbx
import SystemConstraints as sc
import numpy as np
import cmath
import os
import re
from sys import platform
from natsort import natsorted, ns
import decimal

class tclScripting:

    def __init__(self,caseName,config):
        
        case = ptbx.InitCases(caseName)
        self.Soft = config.Soft
        self.Modus = config.Modus
        coreConstraints= sc.CoreConstraints(case,self.Modus)
        self.gencost = case.gencost
        self.gen = case.gen      
        self.bus = case.busdata
        self.base = int(case.System["baseMVA"])
        self.getNodeNums()
        
        # classifcation of different nodes
        self.loadCount, self.loadBusNotZero, self.genBusLoads = self.getloadCount()
        self.loadBusZero = self.loadBusNum - self.loadBusNotZero
        
        # min. max. Power Flows
        self.Flows=  coreConstraints.Flows
        
        self.Test = coreConstraints.Test
        self.flowCount = len(self.Flows) 
        self.Limits = coreConstraints.Limits     

        #number of inputs/outputs
        self.InOutSize()
        self.listStr=[]
        self.fmuName = caseName + "_"+ str(self.Modus)
        self.fdir = "tcls/"+self.fmuName+".tcl"

    def InOutSize(self):
        if self.Modus == 1:
            self.outSize = self.flowCount + 2*(self.GenBusNum+1) + 2*self.loadBusNum  
            self.inSize = self.loadCount*2 + 2*(self.GenBusNum+1) + 2*self.loadBusNotZero 
        elif self.Modus == 2: 
            #| FlowLimits | Vabs | Sg | VLoad (without Load) + ceqSl = 2*loadBusNm
            self.outSize = self.flowCount+self.AllNum-1 + 2*(self.GenBusNum+1) + 2*self.loadBusNum #(NotZero: ceq, Zero: Vr)
            self.inSize = self.loadCount*2 + 2*(self.GenBusNum+1) + 2*self.loadBusNotZero 
        elif self.Modus == 3: 
            #| FlowLimits | Vabs | Ig | Sg | 
            self.outSize = self.flowCount+self.AllNum-1 +self.AllNum*2 +2*(self.GenBusNum+1) 
            self.inSize = self.loadCount*2 + 2*(self.GenBusNum+1) + 2*self.loadBusNum 
        elif self.Modus == 4:
            self.inSize =  self.loadCount*2 + 2*(self.GenBusNum+1)
            #|FlowLimits|Vabs|Sl|Vr,g|
            self.outSize = self.flowCount + self.AllNum-1 + 2*self.loadCount + 2*(self.GenBusNum+1) 
        elif self.Modus == 5:
            self.inSize = self.loadCount + (self.GenBusNum+1) 
        elif self.Modus == 6:
            self.inSize = self.loadCount*2 + (self.GenBusNum+1)*2 + self.loadCount*2
            self.outSize = self.flowCount+self.AllNum-1 + 2*(self.GenBusNum+1) + self.loadBusNum*2 + self.loadCount*2
        elif self.Modus == 7:
            self.inSize = self.loadCount*2 + (self.GenBusNum+1)*2 + self.loadCount*2
            self.outSize = self.flowCount+self.AllNum-1 + 2*(self.GenBusNum+1) + self.loadBusNum*2
            if self.Soft:
                self.outSize += self.loadCount*2
        elif self.Modus == 8:
            self.inSize = self.loadCount*2 + (self.GenBusNum+1)*2
            self.outSize = self.flowCount+self.AllNum-1 + 2*(self.GenBusNum+1) + 2*self.loadBusNum
    def InOutArrays(self):  
        flowDict = dict()
        flowDict["Flows"] = self.Flows            
        self.Limits.update(flowDict)
        self.sortedTuples = self.sortDicts(self.Limits)
        tclLists = self.setLists(self.sortedTuples)
        inputStr, outputStr = self.setTclMatrices(tclLists)

        return inputStr, outputStr
        
    def setupStrings(self):

        compileStr = "\n"
        compileStr += "source omc.tcl\nif {![file exists "+self.fmuName+".fmu]} {\nputs \"(1) Processing FMI: Compiling FMU\"\ncompileFMU "+self.fmuName+".mo\n} else { puts \"(1) Processing FMI: Model already compiled\" }"
        self.listStr.append(compileStr)

        loadStr = "load ../lib/libomu.so"
        self.listStr.append(loadStr)

        optStr = "prg_name DTOpt\nmdl_path "+self.fmuName+".fmu\nprg_K $::env(HORIZONT)\nprg_t0 {0}\nprg_setup_stages\nset dt {}\nset us {}\nset ts {}\n"
        self.listStr.append(optStr)

        solverStr = "sqp_eps 1e-2\nsqp_qp_solver Mehrotra\nqp_mat_solver $::env(QP_MAT_SOLVER)\n"
        self.listStr.append(solverStr)

        inputStr, outputStr = self.InOutArrays()
        self.listStr.append(inputStr)
        self.listStr.append(outputStr)

        solveStr = "puts \"(2) Solving Problem:\"\n"
        solveStr += "puts \"\\n********************************************************************************\\n\"\n"
        solveStr += "prg_setup\n\n"
        solveStr += "proc iterateOpt {} {\nprg_simulate\nsqp_init\nfor {set iter 1} {$iter <= 200} {incr iter} {\n"
        solveStr += "sqp_max_iters $iter\ncatch hqp_solve result\nif {$result != \"iters\"} break\n}\nreturn $result\n}\n"
        self.listStr.append(solveStr)

        solutionStr = "set timespec [time {set result [iterateOpt]}]\n"
        solutionStr += "puts \"\n(3) Solution:\"\n"
        solutionStr += "puts \"\\n********************************************************************************\\n\"\n"
        solutionStr += "puts \"\t\t\t        Run Time: [expr [lindex $timespec 0]/1000] ms\"\n"
        solutionStr += "puts \"\\n********************************************************************************\\n\"\n"
        solutionStr += "puts \"Result   : $result\" \nputs \"Objective: [prg_f]\"\n\n"              
        #solutionStr += "set x [prg_x]\nset n [llength $x]\nputs \"Variables:\"\nfor {set i 0} {$i < $n} {incr i} {\nputs [concat \"x$i: \" [lindex $x $i]]\n}\n"
        self.listStr.append(solutionStr)

    def writeTcl(self):
                   
        with open(self.fdir,"w+") as eqFile:
            for elements in self.listStr:
                eqFile.write(elements + "\n")
    def sortCostsAlphabet(self): 
        
        lenCosts = len(self.gencost[0])
    
        if self.gencost[0][3] != 3: 
            print("\n\n => HQP isn't supporting the defined cost structure - Please check your PTI!")
            #return

        costDict1 = dict()
        costDict2 = dict()
        sortList1 = []
        sortList2 = []
        for i, elements in enumerate(self.gencost):
            
            if  self.gencost[i][lenCosts-1] !=0 or self.gencost[i][0] != 2:
                print("\n\n => HQP isn't supporting the defined cost structure - Please check your PTI!")
                costDict1[int(self.gen[i][0])] = [self.gencost[i][lenCosts-2], 0]
                costDict2[int(self.gen[i][0])] = [self.gencost[i][lenCosts-3], 0]
                #return
            else:               
                costDict1[int(self.gen[i][0])] = [self.gencost[i][lenCosts-2], 0]
                costDict2[int(self.gen[i][0])] = [self.gencost[i][lenCosts-3], 0]
        
        sortDict1 = natsorted(costDict1.items(), alg = ns.IGNORECASE) 
        sortDict2 = natsorted(costDict2.items(), alg = ns.IGNORECASE)

        for element1, element2 in zip(sortDict1,sortDict2):
                
                sortList1.append(element1[1][0])
                sortList1.append(element1[1][1])
                sortList2.append(element2[1][0])
                sortList2.append(element2[1][1])

        return sortList1, sortList2 
    def sortDicts(self,myDict):
        newDict = dict()
        for keys in myDict:
            newDict[keys] = natsorted(myDict[keys].items(), alg = ns.IGNORECASE) #natural sort algorithm
        return newDict #list      
    def catchCosts(self):
        
        if self.Modus == 4 or self.Modus == 5:
              start = 0
              ende  = self.GenBusNum +1

        else:
            if self.Modus == 2:
                start = self.flowCount + self.AllNum-1 + self.loadBusNotZero*2 #(ceq_Sl, cns_I, cns_Vabs)
            elif self.Modus == 1:
                start = self.flowCount + self.loadBusNotZero*2 #(ceq_Sl, cns_I)        
            elif self.Modus == 3: 
                start = self.flowCount + self.AllNum-1
            elif self.Modus ==6:
                start = self.flowCount + self.loadCount*2 +  self.AllNum-1  
            elif self.Modus == 7:
                if self.Soft:
                    start = self.flowCount + self.loadCount*2 +self.AllNum-1    
                else:
                    start = self.flowCount + self.AllNum-1        
            elif self.Modus == 8:
                start = self.flowCount + self.AllNum-1

            ende =  start + 2*(self.GenBusNum+1)

        sortList1, sortList2 = self.sortCostsAlphabet()
        
        c1_i=[]
        c2_i=[]
        ynom=[]
        j=0       
         
        if self.Modus == 4 or self.Modus == 5:
            iLength  = self.inSize
        else:
            iLength  = self.outSize

        for i in range(iLength): 
            
            if  i < start or i >= ende:               
                c1_i.append("0")
                c2_i.append("0")
                ynom.append("1")
            else:
                if self.Soft:

                    # y_nom not possible with soft cons

                    c1_i.append(str(sortList1[j]*self.base**2))
                    c2_i.append(str(sortList2[j]*self.base))
                    
                    #c1_i.append("1 1")
                    #c2_i.append("1 1")
                    #ynom.append(str(1/self.base))
                else:
                    c1_i.append(str(sortList1[j]))
                    c2_i.append(str(sortList2[j]))
                    ynom.append(str(1/self.base))
                if self.Modus == 5:
                    j+=2 #jump over c,Qg
                else:
                    j+=1
             
        return " ".join(c1_i), " ".join(c2_i), " ".join(ynom)
    def getNodeNums(self):
        
        busTypes = self.bus[:,1]
        self.loadBusNum = len(busTypes[busTypes == 1])
        self.GenBusNum = len(busTypes[busTypes == 2])
        self.AllNum = self.loadBusNum + self.GenBusNum + 1    
    def getloadCount(self):
        loadCount = 0
        loadBusNotZero = 0
        genBusLoads = 0
        for elements in self.bus:
            if elements[2]!=0 or elements[3]!=0: #if there is a connected load to bus,i
                loadCount += 1
                if elements[1] == 1:
                    loadBusNotZero +=1
                if elements[1] == 2:
                    genBusLoads+=1
        return loadCount, loadBusNotZero,genBusLoads
    def setLists(self,sortedTuples):  
        
        tclLists = dict()
        tclLists["active"] = []
        tclLists["phiMin"] = []
        tclLists["phiMax"] = []
        tclLists["IgMin"] = []
        tclLists["IgMax"] = []
        for keys in sortedTuples:
            if self.Modus == 5:
                tclLists[keys]=[]
                for elements in sortedTuples[keys]:
                    if keys == "PMax":
                        tclLists["active"].append("1")
                    if (keys == "Vmax" or keys == "Vmin"):
                        if keys == "Vmax":
                            if elements[1][1] == 3:
                                 tclLists["phiMin"].append("0")
                                 tclLists["phiMax"].append("0")
                            else:
                                tclLists["phiMin"].append("-Inf")
                                tclLists["phiMax"].append("Inf")
                        tclLists[keys].append(elements[1][0]**2)
                    else:
                        tclLists[keys].append(elements[1])                
            elif self.Modus == 1:
                if (keys == "Vmax" or keys == "Vmin"):
                    tclLists["in"+keys]=[]
                    tclLists["out"+keys]=[]
                else:
                    tclLists[keys]=[]

                for elements in sortedTuples[keys]:
                    if (keys == "Vmax" or keys == "Vmin"):
                        if keys == "Vmax":
                            if elements[1][1] == 2: 
                                tclLists["active"].append("1 1")
                            elif elements[1][1] == 3:
                                tclLists["active"].append("0 0")
                            elif elements[1][1] == 1 and elements[1][2] == True: 
                                tclLists["active"].append("1 1")
                                          
                        if elements[1][1] != 1 or elements[1][2] == True:
                            tclLists["in"+keys].append(elements[1][0])
                        else:
                            tclLists["out"+keys].append(elements[1][0]) 
                    else:    
                        tclLists[keys].append(elements[1])       
            else:
                tclLists[keys]=[]
                for elements in sortedTuples[keys]:
                    
                    if self.Modus == 4 or self.Modus == 5:
                        if keys == "PMax":
                            tclLists["active"].append("1 1")
                        if (keys == "Vmax" or keys == "Vmin"):
                            tclLists[keys].append(elements[1][0]**2)
                        else:
                            tclLists[keys].append(elements[1])
                    else:
                        if (keys == "Vmax" or keys == "Vmin"):
                        
                            if keys == "Vmax":
                                if elements[1][1] == 2: 
                                    tclLists["active"].append("1 1")
                                elif elements[1][1] == 3: 
                                    tclLists["active"].append("0 0")
                                elif elements[1][1] == 1 and elements[1][2] == True and (self.Modus != 6 and self.Modus != 7 and self.Modus != 8): #if Loadbus has Load => input, else => output
                                    tclLists["active"].append("1 1")
                                
                                if self.Modus == 3:
                                    if elements[1][1] == 1:
                                        tclLists["IgMin"].append("0 0")
                                        tclLists["IgMax"].append("0 0")
                                    else:
                                        tclLists["IgMin"].append("-Inf -Inf")
                                        tclLists["IgMax"].append("Inf Inf")

                            if not elements[1][1] == 3:       
                                tclLists[keys].append(elements[1][0]**2)
                        else:
                            tclLists[keys].append(elements[1])
        return tclLists  
    def getu0(self):        

        Temp = dict()
        Temp["l"] = dict()
        Temp["in"] = dict()
        self.loadList = []
        self.loadMinStr = ""
        self.loadMaxStr = ""
        self.inList = []

        for elements in self.bus:
            busI = ptbx.convertBusElements(True,elements)
            if busI["Pload"] != 0 or busI["Qload"] != 0:
                Temp["l"][busI["No"]] = [busI["Pload"]/self.base, busI["Qload"]/self.base] # load inputs

            if not self.Modus == 4 or self.Modus == 5:
                if not (busI["busType"] == 1 and busI["Pload"] == 0 and busI["Qload"] == 0):  # voltage inputs: exclude voltages on load busses without load            
                
                    Vabs = busI["Vabs"]
                    phi = busI["phi"]   
                    meanv = (busI["Vmax"] + busI["Vmin"])/2             
                    if self.Modus ==2:
                        Vr = cmath.rect(float(Vabs),float(phi))   
                        Temp["in"][busI["No"]] = [Vr.real,Vr.imag]
                    if self.Modus  == 1:
                        Temp["in"][busI["No"]] = [Vabs ,phi]
                
                if (self.Modus == 6 or self.Modus == 7) and busI["busType"] != 1:
                    Vr = cmath.rect(float(Vabs),float(phi))   
                    Temp["in"][busI["No"]] = [Vr.real,Vr.imag]
                    
        if self.Modus == 4 or self.Modus == 5:   
            for elements in self.gen:
                genI = ptbx.convertGenElements(True,elements)
                Temp["in"][genI["No"]] = [genI["Pg"]/self.base,genI["Qg"]/self.base]
            
        Temp = self.sortDicts(Temp)
        for elements in Temp["in"]: 
            self.inList.append(elements[1][0])
            self.inList.append(elements[1][1])
        for elements in Temp["l"]: 
            self.loadList.append(elements[1][0])
            self.loadList.append(elements[1][1])
            if self.Modus == 5:
                self.loadMinStr += " -Inf"
                self.loadMaxStr += " Inf"  
            else:
                self.loadMinStr += " -Inf -Inf"
                self.loadMaxStr += " Inf Inf"                      
    def setTclMatrices(self,tclLists):
        

        vecObj = vecPara()
        vecStr = dict()
        vecNames = {"u_active","u0","u_min","u_max","y_weight1","y_weight2","y_soft_weight1",
                    "y_soft_weight2","y_min","y_nominal","y_max","y_soft_min","y_soft_max","y0"
                    "u_min","u_max","u_weight1","u_weight2","u_nominal"}

        for elements in vecNames:
            vecStr[elements] = "mdl_" + elements + " {"
       

        self.getu0()
        
        if self.Modus == 4 or self.Modus == 5:
            vecStr["y0"] = "\n"
            vecStr["y0"] = "\n"

        else:
            vecStr["u0"] += " ".join(map(str,self.loadList)) + " "
            vecStr["u0"] += " ".join(map(str,self.inList)) + "};\n"

        
        vecObj.FlowMinStr = vecObj.FlowMaxStr = ""
        if self.flowCount>0 and not self.Modus == 5:
            vecObj.FlowMaxStr =  " ".join(map(str,tclLists["Flows"])) + " "
            #vecObj.FlowMaxStr =  " ".join("Inf" for i in range(self.flowCount)) + " "
            vecObj.FlowMinStr =  " ".join("-Inf" for i in range(self.flowCount)) + " "

        vecObj.PminStr = " ".join(map(str,tclLists["PMin"])) + " "
        vecObj.PmaxStr = " ".join(map(str,tclLists["PMax"])) + " "
        Smin = [min for lZip in zip(tclLists["PMin"], tclLists["QMin"]) for min in lZip]
        Smax = [max for lZip in zip(tclLists["PMax"], tclLists["QMax"]) for max in lZip]
        vecObj.SmaxStr = " ".join(map(str,Smax)) + " "
        vecObj.SminStr = " ".join(map(str,Smin)) + " "

        vecObj.ceqStr = " ".join(map(str,tclLists["ceq_Sl"])) + " "

        if self.Modus == 1:

            vecObj.minInfStr  = " ".join("-Inf" for i in range(self.loadCount*2))+ " "; #belongs to Sl
            vecObj.maxInfStr  = " ".join("Inf" for i in range(self.loadCount*2))+ " "
            

            vecObj.inVminStr  = " -Inf ".join(map(str,tclLists["inVmin"]))  + " -Inf"
            vecObj.inVmaxStr  = " Inf ".join(map(str,tclLists["inVmax"])) + " Inf" 
            
            if tclLists["outVmin"]:
                vecObj.outVminStr  = " -Inf ".join(map(str,tclLists["outVmin"])) + " -Inf"  
                vecObj.outVmaxStr  = " Inf ".join(map(str,tclLists["outVmax"])) + " Inf" 
            else:
                vecObj. outVminStr=outVmaxStr=""


            vecStr = self.createVecDict(vecObj,vecStr,tclLists)

            inputStr = vecStr["u_active"] + vecStr["u_min"] + vecStr["u_max"] #+ vecStr["u0"]
            outputStr = vecStr["y_min"] + vecStr["y_max"] + vecStr["y_weight1"] + vecStr["y_weight2"]  + vecStr["y_nominal"]

        if self.Modus == 2 or self.Modus == 8:

            if self.Modus == 2:
                infSize = self.loadBusNum*2-self.loadBusNotZero*2   
            else:
                infSize = self.loadBusNum*2 

            vecObj.minInfStr  = " ".join("-Inf" for i in range(infSize));
            vecObj.maxInfStr  = " ".join("Inf" for i in range(infSize))
            vecObj.VminStr  = " ".join(map(str,tclLists["Vmin"])) + " "  
            vecObj.VmaxStr  = " ".join(map(str,tclLists["Vmax"])) + " "   
            
            vecStr = self.createVecDict(vecObj,vecStr,tclLists)
    
            inputStr =  vecStr["u_active"] #+ vecStr["u0"]

            if self.Soft: 
                outputStr = vecStr["y_min"] + vecStr["y_max"] + vecStr["y_weight1"] + vecStr["y_weight2"] + vecStr["y_soft_min"] + vecStr["y_soft_max"] + vecStr["y_soft_weight1"] + vecStr["y_soft_weight2"] + vecStr["y_nominal"]
            else:
                outputStr = vecStr["y_min"] + vecStr["y_max"] + vecStr["y_weight1"] + vecStr["y_weight2"] + vecStr["y_nominal"]

        if self.Modus == 3:

            vecObj.VminStr  = " ".join(map(str,tclLists["Vmin"])) + " "  
            vecObj.VmaxStr  = " ".join(map(str,tclLists["Vmax"])) + " "   
            
            vecObj.IgminStr = " ".join(map(str,tclLists["IgMin"])) + " "  
            vecObj.IgmaxStr = " ".join(map(str,tclLists["IgMax"])) + " "  
            vecStr = self.createVecDict(vecObj,vecStr,tclLists)
    
            inputStr =  vecStr["u_active"] #+ vecStr["u0"]

            if self.Soft: 
                outputStr = vecStr["y_min"] + vecStr["y_max"] + vecStr["y_weight1"] + vecStr["y_weight2"] + vecStr["y_soft_min"] + vecStr["y_soft_max"] + vecStr["y_soft_weight1"] + vecStr["y_soft_weight2"] + vecStr["y_nominal"]
            else:
                outputStr = vecStr["y_min"] + vecStr["y_max"] + vecStr["y_weight1"] + vecStr["y_weight2"] + vecStr["y_nominal"]

        if self.Modus == 4 or self.Modus == 5:

            vecObj.PhiMinStr =  " ".join(map(str,tclLists["phiMin"])) + " "
            vecObj.PhiMaxStr =  " ".join(map(str,tclLists["phiMax"])) + " "
            vecStr = self.createVecDict(vecObj,vecStr,tclLists)
            inputStr = vecStr["u_active"] + vecStr["u_min"] + vecStr["u_max"] + vecStr["u_weight1"] + vecStr["u_weight2"] + vecStr["u_nominal"]
            outputStr = vecStr["y_min"] + vecStr["y_max"] 

        if self.Modus == 6 or self.Modus == 7:

            vecObj.VminStr  = " ".join(map(str,tclLists["Vmin"])) + " "  
            vecObj.VmaxStr  = " ".join(map(str,tclLists["Vmax"])) + " "   

            vecObj.ceq0 = " ".join("0 0" for i in range(self.loadCount)) + " "
            vecObj.ceq1 = " ".join("1 1" for i in range(self.loadCount)) + " "

            infSize = self.loadBusNum*2 

            vecObj.minInfStr  = " ".join("-Inf" for i in range(infSize))
            vecObj.maxInfStr  = " ".join("Inf" for i in range(infSize))

            vecStr = self.createVecDict(vecObj,vecStr,tclLists) 
            inputStr = vecStr["u_active"]  #+ vecStr["u0"]
            if self.Soft:
                outputStr = vecStr["y_min"] + vecStr["y_max"] + vecStr["y_weight1"] + vecStr["y_weight2"] + vecStr["y_soft_min"] +vecStr["y_soft_max"]+vecStr["y_soft_weight1"]+vecStr["y_soft_weight2"]
            else:
                outputStr = vecStr["y_min"] + vecStr["y_max"] + vecStr["y_weight1"] + vecStr["y_weight2"] + vecStr["y_nominal"]

        return inputStr, outputStr
    def getSoftArrays(self):

        if self.Modus != 7:
            count = self.loadBusNotZero
        else:
            count = self.loadCount

        sminStr = smaxStr = " ".join("0 0" for i in range(count))+ " "
        sminStr += " ".join("-Inf" for i in range(self.outSize-count*2)) +"}\n"
        smaxStr += " ".join("Inf" for i in range(self.outSize-count*2)) +"}\n"
        
        str2 = str(self.base)
        str1 = str(self.base**2)

        #sw1Str  = " ".join(str1 + " " + str1 for i in range(count))+ " "
        #sw2Str  = " ".join(str2 + " " + str2 for i in range(count))+ " "

        sw1Str  = " ".join("1 1" for i in range(count))+ " "
        sw2Str  = " ".join("1 1" for i in range(count))+ " "

        sw1Str += " ".join("0" for i in range(self.outSize-count*2)) +"}\n"
        sw2Str += " ".join("0" for i in range(self.outSize-count*2)) +"}\n"
    
        return sminStr, smaxStr, sw1Str, sw2Str
    def createVecDict(self,vecObj,vecStr,tclLists):
        
        if self.Modus == 6 or self.Modus == 7:
            
            #if self.Soft:
             #  vecStr["y_min"] += " ".join("-Inf" for i in range(self.loadBusNotZero*2))+ " "
            #else:
             #   vecStr["y_min"] += vecObj.ceqStr
            if self.Modus == 6:

                vecStr["y_min"] += vecObj.ceq0
                vecStr["y_max"] += vecObj.ceq0

            if self.Soft:
                vecStr["y_min"] += " ".join("-Inf" for i in range(self.loadCount*2))+ " "
            #else:
             #   vecStr["y_min"] += " ".join("0" for i in range(self.loadCount*2))+ " "

            vecStr["y_min"] += vecObj.FlowMinStr 
            vecStr["y_min"] += vecObj.VminStr 
            vecStr["y_min"] += vecObj.SminStr
            vecStr["y_min"] += vecObj.minInfStr + "}\n"
            #if self.Soft:
             #   vecStr["y_max"] += " ".join("Inf" for i in range(self.loadBusNotZero*2))+ " "
            #else:
              #  vecStr["y_max"] += vecObj.ceqStr
            if self.Soft:
                vecStr["y_max"] += " ".join("Inf" for i in range(self.loadCount*2))+ " "

            #else:
             #   vecStr["y_max"] += " ".join("0" for i in range(self.loadCount*2))+ " "

            vecStr["y_max"] += vecObj.FlowMaxStr
            vecStr["y_max"] += vecObj.VmaxStr 
            vecStr["y_max"] += vecObj.SmaxStr
            vecStr["y_max"] += vecObj.maxInfStr + "}\n"
            w1, w2, ynom = self.catchCosts()
            vecStr["y_weight1"]  += w1+"}\n"
            vecStr["y_weight2"]  += w2+"}\n"
            #vecStr["y_nominal"] += vecObj.ceq1 
            vecStr["y_nominal"] += ynom + "}\n"


        if self.Modus == 5: #|DC-PowerFlow|

            vecStr["u_min"] += vecObj.PminStr 
            vecStr["u_min"] += self.loadMinStr + "}\n"
            vecStr["u_max"] += vecObj.PmaxStr 
            vecStr["u_max"] += self.loadMaxStr + "}\n"
            vecStr["y_min"]  += vecObj.PhiMinStr + "}\n"
            vecStr["y_max"]  += vecObj.PhiMaxStr + "}\n"
            w1,w2,ynom = self.catchCosts()
            vecStr["u_weight1"] += w1+"}\n"
            vecStr["u_weight2"] += w2+"}\n"
            vecStr["u_nominal"] += ynom + "}\n"

        if self.Modus == 3:

            vecStr["y_min"] += vecObj.FlowMinStr 
            vecStr["y_min"] += vecObj.VminStr
            vecStr["y_min"] += vecObj.IgminStr
            vecStr["y_min"] += vecObj.SminStr + "}\n"

            vecStr["y_max"] += vecObj.FlowMaxStr 
            vecStr["y_max"] += vecObj.VmaxStr
            vecStr["y_max"] += vecObj.IgmaxStr
            vecStr["y_max"] += vecObj.SmaxStr + "}\n"

            w1, w2, ynom = self.catchCosts()
            vecStr["y_weight1"]  += w1+"}\n"
            vecStr["y_weight2"]  += w2+"}\n"
            vecStr["y_nominal"] += ynom + "}\n"

        if self.Modus == 2 or self.Modus == 8:


            if self.Soft:
               vecStr["y_min"] += " ".join("-Inf" for i in range(self.loadBusNotZero*2))+ " "
            elif self.Modus != 8:
                vecStr["y_min"] += vecObj.ceqStr

            vecStr["y_min"] += vecObj.FlowMinStr 
            vecStr["y_min"] += vecObj.VminStr 
            vecStr["y_min"] += vecObj.SminStr
            vecStr["y_min"] += vecObj.minInfStr + "}\n"
            if self.Soft:
                vecStr["y_max"] += " ".join("Inf" for i in range(self.loadBusNotZero*2))+ " "
            elif self.Modus != 8:
                vecStr["y_max"] += vecObj.ceqStr

            vecStr["y_max"] += vecObj.FlowMaxStr
            vecStr["y_max"] += vecObj.VmaxStr 
            vecStr["y_max"] += vecObj.SmaxStr
            vecStr["y_max"] += vecObj.maxInfStr + "}\n"
            w1, w2, ynom = self.catchCosts()
            vecStr["y_weight1"]  += w1+"}\n"
            vecStr["y_weight2"]  += w2+"}\n"
            vecStr["y_nominal"] += ynom + "}\n"
      
        if self.Modus == 1:
            
            vecStr["u_min"] += vecObj.minInfStr
            vecStr["u_min"] += vecObj.inVminStr + "}\n"
            vecStr["u_max"] += vecObj.maxInfStr
            vecStr["u_max"]+= vecObj.inVmaxStr + "}\n"
            vecStr["y_min"] += vecObj.ceqStr
            vecStr["y_min"]+= vecObj.FlowMinStr
            vecStr["y_min"] += vecObj.SminStr
            vecStr["y_min"]  += vecObj.outVminStr + "}\n"
            vecStr["y_max"] += vecObj.ceqStr
            vecStr["y_max"]+= vecObj.FlowMaxStr
            vecStr["y_max"]+= vecObj.SmaxStr
            vecStr["y_max"] += vecObj.outVmaxStr +"}\n"
            w1,w2,ynom = self.catchCosts()
            vecStr["y_weight1"] += w1+"}\n"
            vecStr["y_weight2"] += w2+"}\n"
            vecStr["y_nominal"] += ynom + "}\n"

        if self.Soft:       
            smin,smax,sw1,sw2 = self.getSoftArrays()
            vecStr["y_soft_min"] += smin
            vecStr["y_soft_max"] += smax
            vecStr["y_soft_weight1"] += sw1
            vecStr["y_soft_weight2"] += sw2
            
        else: vecStr["y_soft_min"] = vecStr["y_soft_max"] = vecStr["y_soft_weight1"] = vecStr["y_soft_weight2"] = ""

        if self.Modus == 5:
            vecStr["u_active"] += " ".join(tclLists["active"]) + " "
            vecStr["u_active"] += " ".join("0" for i in range (self.loadCount)) + " " +"}\n" 
        else:
            if self.Modus == 6:
                vecStr["u_active"] += " ".join("1 1" for i in range (self.loadCount)) + " "

            if self.Modus == 7:
                if self.Soft:
                    vecStr["u_active"] += " ".join("1 1" for i in range (self.loadCount)) + " "
                else:
                    vecStr["u_active"] += " ".join("0 0" for i in range (self.loadCount)) + " "

            vecStr["u_active"] += " ".join("0 0" for i in range (self.loadCount)) + " "
            vecStr["u_active"] += " ".join(tclLists["active"])  +"}\n" 

        return vecStr
    def writeInputs(self):
        
        currDir = ""
        inputPath = currDir + "logInputs.log"
        inputFile = open(inputPath, "a")
        
        if self.Modus == 5:
            u = self.inSize - self.loadCount
        else : u = self.inSize - self.loadCount*2

        inputStr = self.fmuName + ", Inputs:" + str(u) + ", Loads: " + str(self.loadCount)  + "\n"      
        inputFile.write(inputStr)
        inputFile.close()



class vecPara(object): #struct like object
    pass