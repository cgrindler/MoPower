import convertCDF as cdf
import pandas as pd
import numpy as np
import PowerToolbox as ptbx
import cmath
import os
import re
import pypower.api as pyp
import pypower.opf_args as opf_args
#from pypower.ext2int import ext2int
import re

#  region - PowerFlow Equations 
           
        #
        #                                 Wirkleistungsgleichung   
        #                               ___________________________
        #
        # Pi(V,phi) = |Vi| * Sum[1:n] (|Vj|*(Gij*cos(phi_i-phi_j)+Bij*sin(phi_i-phi_j)) 
        # <=>
        # Pi(V.re,V.im) = Sum[1:n] (Gij*(Vi.re*Vj.re+Vi.im*Vj.im)+Bik*(Vi.im*Vj.re-Vi.re*Vj.im))
        #
        #                                 Blindleistungsgleichung   
        #                               ___________________________
        #
        # Qi(|V|,phi) = |Vi| * Sum[1:n] (|Vj|*(Gij*sin(phi_i-phi_j)+Bij*cos(phi_i-phi_j))
        # <=>
        # Qi(V.re,V.im) = Sum[1:n] (Gij*(Vi.re*Vj.re-Vi.re*Vj.im)+ Bik*(Vi.im*Vj.re+Vi.re*Vj.im))
        # 
        # - phi_i: Spannungswinkel Bus[i]
        # - phi_j: Spannungswinkel Bus[j]
        # - Gij und Bij aus Admittanzmatrix 
        #
# endregion
# ------------------------------------------    

class PowerSystems:
    
    def __init__(self,toM,Sn=100,Un=33000,fn=50,format = 'pti'):

        self.toModelica = toM
        self.Snom = str(Sn);
        self.Unom = str(Un);
        self.fnom = str(fn)
        self.format = format
        self.ps = dict()
        self.trafoname=[]
        self.connect=[]
        self.busname=[]
        self.branchname=[]
        self.base = Sn

    def InitBus(self):
        busStr="\n"
        meterStr="\n"
        loadStr="\n"
        srcStr="\n"
        init5="\n"
        i=0;
        busname = self.toModelica[0]
        busdata = self.toModelica[1]
        ps = dict()
        
        self.ps["meter"]=""
        self.ps["src"]=""
        self.ps["connect"]=""
        self.ps["load"]=""
        self.ps["bus"]=""

        for element in busdata:
            
            busI = busdata[i]
            
            if self.format == 'pti':
                No = str(int(busI[0]))
                busType = str(int(busI[1]))
                Pload = str(busI[2])
                Qload = str(busI[3])
                v0 = str(busI[7])
                phi = str(busI[8])
                g = str(busI[4])
                b = str(busI[5])
            else:
                No = busI[0]
                busType = busI[3]
                Pload = busI[6]
                Qload = busI[7]
                v0 = busI[4]
                phi = busI[5]
                g = busI[14]
                b = busI[15]

            self.busname.append("bus" + No)
            self.ps["bus"] += "PowerSystems.AC3ph.Nodes.BusBar " + self.busname[i]+";\n"
            
            metername ="Phasor"+ No
            srcName = "Vsource"+No 
            self.ps["src"] += "PowerSystems.AC3ph.Sources.Voltage "+srcName+"(v0 = "+ v0+",alpha0 ="+phi+", V_nom(displayUnit = \"V\"));\n"         
            self.ps["meter"]+="PowerSystems.AC3ph.Sensors.Phasor "+metername+"(V_nom(displayUnit = \"V\"));\n"
            self.ps["src"] += "PowerSystems.AC1ph_DC.Nodes.GroundOne grd"+No+";\n"
   
                           
            if busType == "3": # reference/slack bus 
                
                self.ps["connect"]+="connect("+srcName+".neutral, grd"+No+".term);\n"
                self.ps["connect"]+="connect("+srcName+".term, "+metername+".term_p);\n"
                self.ps["connect"]+="connect("+metername+".term_n, "+self.busname[i]+".term);\n\n"
            
            if busType == "2": # generator/pv bus  -> PVSource             

                if float(Pload) == 0:
                    self.ps["connect"]+="connect("+srcName+".neutral, grd"+No+".term);\n"
                    self.ps["connect"]+="connect("+metername+".term_p, "+srcName+".term);\n" 
                    self.ps["connect"]+="connect("+metername+".term_n, "+self.busname[i]+".term);\n\n"

                else:

                    loadname = "Load"+No
                    self.ps["load"] += "PowerSystems.AC3ph.Sources.PQsource "+loadname+"(V_nom(displayUnit = \"V\"), pq0 = {"+str(float(Pload)/self.base)+", "+str(float(Qload)/self.base)+"});\n"      
                    self.ps["load"] += "PowerSystems.AC1ph_DC.Nodes.GroundOne grdL"+No+";\n"
                    self.ps["connect"]+="connect("+srcName+".neutral, grd"+No+".term);\n"
                    self.ps["connect"]+="connect("+srcName+".term, "+metername+".term_p);\n"
                    self.ps["connect"]+="connect("+metername+".term_n, "+self.busname[i]+".term);\n"                
                    self.ps["connect"]+="connect("+loadname+".term, "+self.busname[i]+".term);\n"
                    self.ps["connect"]+="connect("+loadname+".neutral, grdL"+No+".term);\n\n"

            if busType == "1": #load/pq bus -> PQLoad
                
                loadname = "Load"+No              
                self.ps["load"] += "PowerSystems.AC3ph.Sources.PQsource "+loadname+"(V_nom(displayUnit = \"V\"), pq0 = {"+str(float(Pload)/self.base)+", "+str(float(Qload)/self.base)+"});\n"
                self.ps["load"] += "PowerSystems.AC1ph_DC.Nodes.GroundOne grdL"+No+";\n"
                self.ps["connect"]+="connect("+srcName+".neutral, grd"+No+".term);\n"
                self.ps["connect"]+="connect("+srcName+".term, "+metername+".term_p);\n"
                self.ps["connect"]+="connect("+metername+".term_n, "+self.busname[i]+".term);\n"
                self.ps["connect"]+="connect("+self.busname[i]+".term, "+loadname+".term);\n"                
                self.ps["connect"]+="connect("+loadname+".neutral, grdL"+No+".term);\n\n"
         
            if float(g) != 0: #reactive shunt

                self.ps["src"]+="PowerSystems.AC3ph.Shunts.ReactiveShunt rShunt"+No+"(V_nom(displayUnit = \"V\"), f_nom = "+self.fnom+", g = "+g+");\n"
                self.ps["connect"]+="connect(rShunt"+No+".term, "+self.busname[i]+".term);\n\n"
                                
            if float(b) != 0: #capacitive shunt
            
                self.ps["src"]+="PowerSystems.AC3ph.Shunts.CapacitiveShunt cShunt"+No+"(V_nom(displayUnit = \"V\"), f_nom = "+self.fnom+", b_pg = "+b+", b_pp = 0);\n"
                self.ps["connect"]+="connect(cShunt"+No+".term, "+self.busname[i]+".term);\n\n"

            i=i+1

        #self.ieeeFile.write(busStr+"\n")
        #self.ieeeFile.write(loadStr+"\n")
        #self.ieeeFile.write(meterStr+"\n")
        #self.ieeeFile.write(srcStr+"\n")

    def InitLines(self):
        
        i=0;
        trafoCount = 0;
        self.ps["line"]=""
        self.ps["trafo"]=""

        for element in self.toModelica[2]:
            
            if self.format == 'pti':
                rpu = element[2]
                xpu = element[3]
                bpu = str(element[4])
                fr = str(int(element[0]))
                to = str(int(element[1]))
                ratio = str(element[8])
                angle = str(element[9])
            else:
                rpu = element[6]
                xpu = element[7]
                bpu = element[8]
                fr = element[0]
                to = element[1]
                ratio = element[14]
                ratio = element[15]

            self.branchname.append("line"+fr+"_"+to)
            #lineStr += "VPP.Component.Line "+self.branchname[i]+"(rpu = "+rpu+", xpu = "+xpu+", bpu = "+bpu+");\n"
            gBr = float(rpu)/(float(rpu)**2+float(xpu)**2)
            bBr = -float(xpu)/(float(rpu)**2+float(xpu)**2)
            
            if i>0:
                if(self.branchname[i] == self.branchname[i-1]): # falls Doppelleitung: langsame Methodik? 
                    self.branchname[i] = self.branchname[i] + "_"

            self.ps["line"] += "PowerFlow.Branch "+self.branchname[i]+"(G = "+str(gBr)+", B = "+str(bBr)+");\n"

            if float(rpu) == 0:
                
                if ratio == 0:
                    ratio = 1
                ratio = str(ratio)
                alpha = float(angle)#*np.pi/180
                self.trafoname.append("trafo"+fr+"_"+to)

                #trStr+="PowerSystems.AC3ph.Transformers.TrafoIdeal "+self.trafoname[trafoCount]+"(redeclare PowerSystems.AC3ph.Ports.Topology.Y top_p \"Y\", redeclare PowerSystems.AC3ph.Ports.Topology.Y top_n \"Y\", par(V_nom = {"+ratio+",1}, S_nom = "+self.Snom+", f_nom = "+self.fnom+"));\n"
                self.ps["trafo"]+="PowerSystems.AC3ph.Transformers.TrafoIdeal "+self.trafoname[trafoCount]+"(redeclare record Data = PowerSystems.AC3ph.Transformers.Parameters.TrafoIdeal(V_nom= {"+ratio+",1}));\n"#, redeclare model Topology_p = PowerSystems.AC3ph.Ports.Topology.PAR(alpha = "+str(alpha)+")));\n"
                trafoCount = trafoCount + 1;
            i=i+1;

        ##self.ieeeFile.write(lineStr+"\n")
        #self.ieeeFile.write(trStr+"\n")

    def connectBus(self):

        cnStr="\n"
        cnTrStr="\n"
        i = 0
        trafoCount = 0;

        for element in self.toModelica[2]:
            
            if self.format == 'pti':
                fr = str(int(element[0]))
                to = str(int(element[1]))
                rpu = str(element[2])
            else:
                fr = element[0]
                to = element[1]
                rpu = element[6]

            if float(rpu) != 0: # falls keine Transformatorverbindung
                self.ps["connect"]+="connect(bus"+fr+".term, "+self.branchname[i]+".term_p);\n" #Bus1 mit Kabel (+)
                self.ps["connect"]+="connect(bus"+to+".term, "+self.branchname[i]+".term_n);\n\n" #Kabel (-) mit Bus2
            else:
                self.ps["connect"]+="connect(bus"+fr+".term, "+self.trafoname[trafoCount]+".term_p);\n" #Bus1 mit Trafo (+)
                self.ps["connect"]+="connect("+self.trafoname[trafoCount]+".term_n, "+self.branchname[i]+".term_p);\n" #Trafo (-) mit Kabel (+)
                self.ps["connect"]+="connect("+self.branchname[i]+".term_n, bus"+to+".term);\n\n" #Kabel (-) mit Bus2
                trafoCount = trafoCount +1;

            i=i+1

        #self.ieeeFile.write(cnStr+"\n")
        #self.ieeeFile.write(cnTrStr+"\n")

    def startWrite(self,fdir,caseName):
        self.InitBus();
        self.InitLines();
        self.connectBus() 
        with open(fdir,"w+") as ieeeFile:
            ieeeFile.write("model "+caseName+"\n")
            ieeeFile.write("inner PowerSystems.System system(dynType = PowerSystems.Types.Dynamics.SteadyState, f_nom = "+self.fnom+");\n\n")
            
            ieeeFile.write(self.ps["bus"]+"\n")
            ieeeFile.write(self.ps["load"]+"\n")
            ieeeFile.write(self.ps["meter"]+"\n")
            ieeeFile.write(self.ps["src"]+"\n")
            ieeeFile.write(self.ps["trafo"]+"\n")
            ieeeFile.write(self.ps["line"]+"\n")
            ieeeFile.write("equation\n")   
            ieeeFile.write(self.ps["connect"]+"\n")
            ieeeFile.write("end "+caseName+";")

        block = "*********\t*********\t*********\t*********\t"
        print(block+"\n\n")
        print("\tSuccessfully created IEEE Modelica Model!\n\n");
        print(block+"\n\n")

class PowerFlow:

    def __init__(self,toM,sys,config):
        
        self.toM = toM
        self.Modus = config.Modus
        self.pti = config.pti
        self.Soft = config.Soft
        self.sys = sys
        self.Y, self.Yf, self.Yt = self.getYfromPyPower()          
        
        self.YDense = pd.SparseDataFrame([ pd.SparseSeries(self.Y[i].toarray().ravel()) 
                              for i in np.arange(self.Y.shape[0]) ])  
        
        
        #self.YfDense = pd.SparseDataFrame([ pd.SparseSeries(self.Yf[i].toarray().ravel()) 
           #                   for i in np.arange(self.Yf.shape[0]) ])    
         
        if np.isscalar(self.sys['baseMVA']):
            self.base = self.sys['baseMVA']
        else: self.base = self.sys['baseMVA'][0]

    def PowerEquations(self):
        
        self.busdata = self.toM[1]
        self.refAngle = self.searchRefAngle()
        self.branchdata = self.toM[2]
        self.gendata = self.sys["gen"]
        self.branchtuple = self.branchdata[:,:2].tolist()
        
        self.X = dict()
        self.eq = dict()
        
        self.setHashes()        

        self.genCount = 0
        self.branchCount = 0 
        self.MultiLineCount = 0 
        self.checkMultiLine = []

        for i, busI in enumerate(self.busdata):           
            self.initBase(i)
            self.createEquation(i) 

        for i,branchI in enumerate(self.branchdata):
            self.setBranchFlows(i,branchI)

        for genI in self.gendata:
            self.initGen(genI)   
    
    def createEquation(self,i):
      
        # extract important values out of casedata:   
        
        bus_i = ptbx.convertBusElements(self.pti,self.busdata[i])  
        fr = str(bus_i['No'])
        Vr_i = cmath.rect(bus_i['Vabs'],bus_i['phi'])
        phi_i = self.addBracketsReturnString(bus_i['phi'])
        Vabs_i = self.addBracketsReturnString(bus_i['Vabs'])
        type_i = str(bus_i["busType"])
        
        if type_i == "3":
            self.slackNo = fr

        loadP_i = str(bus_i['Pload'])          
        loadQ_i = str(bus_i['Qload'])
        
        initG, load = self.initBranchEquations(fr,loadQ_i,loadP_i,type_i)         
        IfList = []

        # for each node: S,i respectively I,i is the sum of all line flows
               
        for elements in self.Y[i]: 
            
            tempList = []

            #all branches connected to bus,i 
            for ii, element in enumerate(elements.data):          
                
                j=elements.indices[ii]
                bus_j = ptbx.convertBusElements(self.pti,self.busdata[j])                                               
                to = str(bus_j['No'])

                if [int(fr), int(to)] in self.branchtuple:
                            
                    element2 = self.YDense.values[j,i]

                    #tapshift, modus = self.lookforTrafo(self.branchCount)                                                      
                    self.branchCount += 1

                #variable transformators disabled by default  
                Trafo=0   
                if Trafo == 0:
                    gij = element.real
                    bij = element.imag
                    Gij = self.addBracketsReturnString(gij)
                    Bij = self.addBracketsReturnString(bij)
                else:
                    Gij,Bij = self.setAdmittanceString(self.branchdata[self.branchCount],element,modus,self.branchCount)   
                
                brancheq = self.loneBranchEquation(fr,to,Gij,Bij)                
                tempList.append(brancheq)                 
            
            self.combineBranchEquations(initG,tempList,load,fr)
          
    def initBranchEquations(self,fr, loadP_i, loadQ_i,type_i):
        
        if float(loadP_i) == 0 and float(loadQ_i) == 0:
            load = ""        
        else:
            if self.Modus == 5:
                load = " + Pl"+fr
            elif self.Modus == 4:
                load = " + Sl"+fr
            
            #elif self.Modus == 7:
            #   load = " + Complex(Sl"+fr+"[1],Sl"+fr+"[2])"
            elif self.Modus == 7:
                load = " + Complex(Il_"+fr+"[1],Il_"+fr+"[2])"
            else: load = " + Complex(Il"+fr+"[1],Il"+fr+"[2])"
        
        if type_i == "1":

            if self.Modus == 5:
                initG = "0"
            elif self.Modus == 4:
                initG="{0,0}"            
            else:
                initG = "Complex(0,0)"
        else:
            if self.Modus == 5:
                initG = "Pg"+fr
            elif self.Modus == 4:
                initG = "Sg"+fr
            #elif self.Modus == 7:
            #    initG = "Complex(Sg"+fr+"[1],Sg"+fr+"[2])"
            else:
                initG = "Complex(Ig"+fr+"[1],Ig"+fr+"[2])"

        if self.Modus == 3:
            initG = "Complex(Ig"+fr+"[1],Ig"+fr+"[2])"

        return initG, load
        
    def loneBranchEquation(self,fr,to,Gij,Bij):

        if self.Modus == 1 or self.Modus == 2 or self.Modus == 3 or self.Modus == 4 or self.Modus == 6 or self.Modus == 7 or self.Modus == 8:

            Vi_re = "Vr" + fr + "[1]"
            Vi_im = "Vr" + fr + "[2]"
            Vj_re = "Vr" + to + "[1]"
            Vj_im = "Vr" + to + "[2]"

            #Pij = Gij*(Vi.re*Vj.re+Vi.im*Vj.im)+Bik*(Vi.im*Vj.re-Vi.re*Vj.im)
            #Qij = Gij*(Vi.re*Vj.re-Vi.re*Vj.im)+ Bik*(Vi.im*Vj.re+Vi.re*Vj.im)
            #Pi(V.re,V.im) = Sum[1:n] (Gij*(Vi.re*Vj.re+Vi.im*Vj.im)+Bik*(Vi.im*Vj.re-Vi.re*Vj.im))
            #Qi(V.re,V.im) = Sum[1:n] (Gij*(Vi.re*Vj.re-Vi.re*Vj.im)+ Bik*(Vi.im*Vj.re+Vi.re*Vj.im))
            if self.Modus == 4:
                return "{"+Gij+"*("+Vi_re+"*"+Vj_re+"+"+Vi_im+"*"+Vj_im+")+"+Bij+"*("+Vi_im+"*"+Vj_re+"-"+Vi_re+"*"+Vj_im+"),"+Gij+"*("+Vi_re+"*"+Vj_re+"-"+Vi_re+"*"+Vj_im+")+"+Bij+"*("+Vi_im+"*"+Vj_re+"+"+Vi_re+"*"+Vj_im+")}"
            else: 
                return "Complex("+Vj_re+","+Vj_im+")*Complex("+Gij+","+Bij+")"           
        else:

            phi_j = "Phi"+ to
            phi_i = "Phi"+ fr
            Vabs_i = "V"+ fr
            Vabs_j = "V"+ to
                 
            if self.Modus == 5: 
                if phi_i == phi_j:
                    tmpString  = "0"
                else:
                    tmpString = Bij+"*("+phi_i+"-"+phi_j+")"  
                return tmpString
            
            else: #toDo or delete
                tempString1 = Vabs_j +"*("+Gij+"*cos("+phi_i+"-"+phi_j+") + "+Bij+"*sin("+phi_i+"-"+phi_j+"))"            
                tempString2 = Vabs_j +"*("+Gij+"*sin("+phi_i+"-"+phi_j+") - "+Bij+"*cos("+phi_i+"-"+phi_j+"))"                
                return "Complex("+tempString1+","+tempString2+")"

    def combineBranchEquations(self,initG,tempList,load,fr):        
        
        sum_temp = " + " 
        if self.Modus == 4 or self.Modus == 5:
            self.eq["Sgen"] += initG+" = "+sum_temp.join(tempList)+load+";\n\n" 
        #elif self.Modus == 7:
         #   self.eq["Igen"] += initG+" = Complex(Vr"+fr+"[1],Vr"+fr+"[2])*("+sum_temp.join(tempList)+")"+load+";\n\n" 
        else:            
            if self.Modus == 1 or self.Modus == 2:                
                self.eq["Igen"] += initG+" = "+sum_temp.join(tempList)+load+";\n\n"               
            else:
                #self.eq["Igen"] += initG +" = "+Vabs_i+"*("+sum_temp.join(tempList)+")"+load+";\n\n"  
                self.eq["Igen"] +=  initG +" = "+sum_temp.join(tempList)+load+";\n\n" 
        
    def setBranchFlows(self,i,elements):

        Ytemp = self.Yf[i]
        
        Yff_re = Ytemp.data[0].real
        Yff_im = Ytemp.data[0].imag               
        Yft_re = Ytemp.data[1].real
        Yft_im = Ytemp.data[1].imag

        i = str(int(Ytemp.indices[0]))
        j = str(int(Ytemp.indices[1]))

        fr_ = str(int(elements[0]))
        to_ = str((int(elements[1])))
        flowRate = int(elements[5])
        if flowRate > 0 and not self.Modus == 5:
            if not fr_+to_ in self.checkMultiLine:
                    
                #self.eq["Iij"] += "I"+fr_+"_"+to_+"=Complex("+str(Yij.real)+","+str(Yij.imag)+")*(Complex(Vr"+to_+"[1],Vr"+to_+"[2])-Complex(Vr"+fr_+"[1],Vr"+fr_+"[2]));\n"
                self.X["cns_Iij"] += "output Real cns_I"+fr_+"_"+to_+";\n"
                self.X["Iij"] += "Complex I"+fr_+"_"+to_+";\n"
                self.eq["Iij"] += "I"+fr_+"_"+to_+"=Complex(Vr"+fr_+"[1],Vr"+fr_+"[2])*Complex("+str(Yff_re)+","+str(Yff_im)+")+Complex(Vr"+to_+"[1],Vr"+to_+"[2])*Complex("+str(Yft_re)+","+str(Yft_im)+");\n"
                self.eq["cns_Iij"] += "cns_I"+fr_+"_"+to_+" = I"+fr_+"_"+to_+".re^2 + I"+fr_+"_"+to_+".im^2 ;\n"
                self.checkMultiLine.append(fr_+to_)
   
    def initBase(self,i):

        bus_i = ptbx.convertBusElements(self.pti,self.sys['bus'][i])        
        fr = str(bus_i['No'])
        Vr = cmath.rect(bus_i['Vabs'],bus_i['phi'])  
        type = str(bus_i['busType'])
        loadP = bus_i["Pload"]
        loadQ = bus_i["Qload"]
        Vabs = str(bus_i["Vabs"])
        phi = str(bus_i["phi"])

        vmax = bus_i["Vmax"]
        vmin = bus_i["Vmin"]
        meanv =  (vmax+vmin)/2

        #initR = "(start={"+str(meanv)+","+self.refAngle+"});\n"
        #initP = "(start={"+str(meanv)+","+self.refAngle+"});\n"
        
        initR = "(start={"+str(Vr.real)+","+str(Vr.imag)+"});\n"
        initP = "(start={"+Vabs+","+phi+"});\n"
        initV = ""
        if self.Modus == 5:
            initP = "(start="+phi+");\n"

        else:    initP = "(start={"+Vabs+","+phi+"});\n"

        self.declareV(type,loadP,loadQ,fr,initR,initP)
        self.declareL(type,loadP,loadQ,fr,Vr)        
        self.setConstraints(bus_i)

    def declareV(self,type,loadP,loadQ,No,initR,initP):

        if type == "1":
            if loadP != 0 or loadQ != 0:
                input= "input "
            else:
                input= "output "
        else:
            input = "input "
        
        if (self.Modus == 7 or self.Modus == 6 or self.Modus == 8) and type == "1":
            input = "output "

        if self.Modus == 5 or self.Modus == 4:
            input = "output "

        if self.Modus == 3:
            input = "input "

        if self.Modus == 2 or self.Modus == 3 or self.Modus == 4 or self.Modus == 6 or self.Modus == 7 or self.Modus == 8:
            self.X[input[:-1]+"Vr"] += input + "Real[2] Vr" + No + initR
        
        elif self.Modus == 1: 
            self.X[input[:-1]+"Vp"] += input + "Real[2] Vp" + No + initP
            self.X['Vr'] += "Real[2] Vr" + No +initR   
            self.eq["Vr"] += "Vr" + No +" = Vp"+No+"[1]*{cos(SIunits.Conversions.from_deg(Vp"+No+"[2])),sin(SIunits.Conversions.from_deg(Vp"+No+"[2]))};\n"                 
        
        elif self.Modus == 5:
            self.X[input[:-1]+"Vp"] +=input+ "Real Phi" + No + initP

    def declareL(self,type,loadP,loadQ,fr,Vr):

        if loadP != 0 or loadQ != 0:
            if self.Modus == 5:
                self.X["Load"]  += "input Real Pl"+ fr + "(start="+str(loadP/self.base)+");\n"
            #elif self.Modus == 7 or self.Modus == 6:
                #self.X["Load"]  += "input Real[2] Sl"+ fr + "(start={"+str(loadP/self.base)+","+str(loadQ/self.base)+"});\n"
            else:
                self.X["Load"] += "input Real[2] Sl"+ fr + "(start={"+str(loadP/self.base)+","+str(loadQ/self.base)+"});\n"

            Sl_ = complex(loadP/self.base,-loadQ/self.base)                
            Il0 = Sl_/complex.conjugate(Vr)
            if not (self.Modus == 5 or self.Modus == 4 or self.Modus == 7):
                
                if self.Modus == 6:
                    self.X["ILoad"] += "input Real[2] Il"+ fr + ";\n" #"(start= {"+str(Il0.real)+","+str(Il0.imag)+"});\n"
                    self.X["ceq_Load"] += "output Real [2] ceq_Il"+fr+";\n"
                else:
                    self.X["ILoad"] += "Real[2] Il"+ fr +";\n"#(start = {"+str(Il0.real)+","+str(Il0.imag)+"});\n"
                if self.Modus != 6:
                    if type == "2" or type == "3" or self.Modus == 3 or self.Modus == 8:
                        self.eq["ILoad"] += "Complex(Sl"+fr+"[1],Sl"+fr+"[2])=Complex(Vr"+fr+"[1],Vr"+fr+"[2])*Complex(Il" + fr + "[1],-Il" + fr + "[2]);\n"
                    elif type == "1" and self.Modus != 8:
                        self.X["ceq_Load"] += "output Real[2] ceq_Sl"+fr+"(start={0,0});\n"
                        self.eq["ceq_Load"] += "Complex(ceq_Sl"+fr+"[1],ceq_Sl"+fr+"[2])=Complex(Vr"+fr+"[1],Vr"+fr+"[2])*Complex(Il" + fr + "[1],-Il" + fr + "[2])-Complex(Sl"+fr+"[1],Sl"+fr+"[2]);\n"
                else:
                    self.eq["ILoad"] += "Complex(ceq_Il"+fr+"[1],ceq_Il"+fr+"[2])=Complex(Sl"+fr+"[1],Sl"+fr+"[2])-Complex(Vr"+fr+"[1],Vr"+fr+"[2])*Complex(Il" + fr + "[1],-Il" + fr + "[2]);\n"

            elif self.Modus == 7:

                self.X["ILoad"] += "Real[2] Il"+ fr + ";\n"#(start= {"+str(Il0.real)+","+str(Il0.imag)+"});\n"

                if self.Soft:
                    self.X["cns_ILoad"] += "output Real[2] ceq_Il"+ fr +"(start = {0,0});\n"
                    self.X["ILoad_"] += "input Real[2] Il_"+ fr +";\n"
                else:
                    self.X["cns_ILoad"] += "input Real[2] ceq_Il"+ fr +"(start = {0,0});\n"
                    self.X["ILoad_"] += "Real[2] Il_"+ fr +";\n"

                self.eq["cns_ILoad"] += "Il_"+ fr +" - Il"+fr+" = ceq_Il"+fr+";\n"
                #self.eq["cns_ILoad"] += "Il_"+ fr +" - Il"+fr+" = {0,0};\n"
                self.eq["ILoad"] += "Complex(Sl"+fr+"[1],Sl"+fr+"[2])=Complex(Vr"+fr+"[1],Vr"+fr+"[2])*Complex(Il" + fr + "[1],-Il" + fr + "[2]);\n"


        if self.Modus == 3 and type == "1":
            self.X["Igen"] += "output Real[2] Ig"+fr+";\n"

    def initGen(self,genI):
        
        gen_i = ptbx.convertGenElements(self.pti,genI)
        No = str(gen_i["No"])             
        Pg = str(gen_i["Pg"]/self.base)
        Qg = str(gen_i["Qg"]/self.base)
        #Vr = cmath.rect(float(Vabs),float(phi))                
        #IgInit = complex(Pg,Qg)/Vr           

        Sre = "Sg"+No+".re"
        Sim = "Sg"+No+".im"
        if self.Modus == 5:
                self.X["Sgen"] += "input Real Pg"+No+"(start="+str(Pg)+");\n"

        elif self.Modus == 4:
            self.X["Sgen"] += "input Real[2] Sg"+No+"(start={"+str(Pg)+","+str(Qg)+"});\n"

        else: self.X["Sgen"] += "output Real[2] Sg"+No+"(start={"+str(Pg)+","+str(Qg)+"});\n"

        if not (self.Modus == 4 or self.Modus == 5):
            if self.Modus == 3:
                self.X["Igen"] += "Real[2] Ig"+No+";\n"
            else:
                self.X["Igen"] += "Real[2] Ig"+No+";\n"
            self.eq["Sgen"] += "Complex(Sg"+No+"[1],Sg"+No+"[2]) = Complex(Vr"+No+"[1],Vr"+No+"[2])*Complex(Ig"+No+"[1],-Ig"+No+"[2]);\n"   

    def setConstraints(self,bus_i):
        
        type = bus_i["busType"]
        No = str(bus_i["No"])
        if self.Modus == 2 or self.Modus == 3 or self.Modus == 4 or self.Modus == 6 or self.Modus == 7 or self.Modus == 8:
            if type != 3:
                self.X["Vabs"] += "output Real cns_Vabs"+No+";\n"
                self.eq["Vabs"] +="cns_Vabs"+No+" = Vr"+No+"[1]^2 + Vr"+No+"[2]^2;\n"
   
    def getYfromPyPower(self):
        
        sysN, sysopt = opf_args.opf_args2(self.sys)
        sysN = pyp.ext2int(sysN)
        #sysopt = pyp.ppoption(sysopt, OPF_ALG=0, VERBOSE=3)
        om = pyp.opf_setup(sysN,sysopt)        
        sysN = om.get_ppc()
        
        baseMVA = sysN['baseMVA']
        branch= sysN['branch']
        bus = sysN['bus']
        Y,Yf,Yt = pyp.makeYbus(baseMVA,bus,branch) 
                
        return Y,Yf,Yt
  
    def addBracketsReturnString(self, value):
        if value >= 0:
            val = str(value)
        else: val = "("+str(value)+")"
        return val       
        
    def setHashes(self):
        
        #Standard Optimal Power Flow
   
        xKeys = {"Sgen","Vr","inputVr","outputVr","outputVp","inputVp","Phi","Igen","cns_FlowMax","cns_Iij","cns_ILoad","ILoad_","Vabs","Load","ILoad","Iij","Vp","ceq_Load"}
        for keys in xKeys:
            self.X[keys] = "\n"

        eqKeys = {"Current","Sgen","Iij","Vr","Vabs","ILoad","Igen","ceq_Load","cns_Iij","cns_ILoad"}
        for keys in eqKeys:
            self.eq[keys]="\n"

    def setAdmittanceString(self,branch_i,element,modus,branchCount):        
                     
        ratio = branch_i[7]
        shift = branch_i[8]
        Rij = branch_i[2]
        Xij = branch_i[3]
        bs = branch_i[4]
            
        gij = Rij/(Rij**2 + Xij**2)
        bij =  Xij/(Rij**2 + Xij**2)

        gij = self.addBracketsReturnString(gij)
        bij = self.addBracketsReturnString(bij)  
        bsHalf= self.addBracketsReturnString(bs/2)
                      
        ratioName = "ratio"+str(branchCount)
        shiftName = "shift"+str(branchCount)
        self.X["ratio"] = "output Real" +ratioName
        self.X["shift"] = "output Real" +shiftName

        #toDo: implementing Phase-Angle       || -> tap*tap* instead of tap^2 underneath!! ||
        #tapStr1 = "ComplexMath.fromPolar("+ratioName+","+shiftName+")"
        #tapStr2 = ratioName + "*exp(Complex(0,1)*SIunits.from_deg("+shift+"));\n" 
                       
        Gij =  "("+gij+"-"+ratioName+"*"+gij+")/("+ratioName+"^2)"
        Bij =  "("+bij+"+"+bsHalf+"-"+bsHalf+"*"+ratioName+")/("+ratioName+"^2)"

                         
            #Yff = "(Ys + (j*Bc/2))/(tap*tap*)"
            #Yft = "-Ys/tap*"
            #Ytt = "(Ys + (j*Bc/2))"
            #Ytf = "-Ys/tap"
            #Shunts fehlen 
        #elif modus == 2: # ratio
            
            #ratio = branchdata[7]                        
            #Gij = "Tg2"
            #Bij = "Tb2"
        #elif modus == 3: #shift
            
            #shift = branchdata[8]                        
            #Gij = "Tg3"
            #Bij = "Tb3"

        return Gij, Bij

    def lookforTrafo(self,branchNo):

        tap = self.branchdata[branchNo][8]
        shift = self.branchdata[branchNo][9]

        tapshift=[]

        if tap != 0 and shift != 0:
            tapshift.append(tap)
            tapshift.append(shift)
            modus = 1
        if tap != 0 and shift == 0:
            tapshift.append(tap)
            modus = 2
        if tap == 0 and shift != 0:
            tapshift.append(shift)
            modus = 3
        if tap == 0 and shift == 0:
            modus = 0

        return tapshift, modus

#=========================================================
# generate and fill .mo Modelica file:

    def startWrite(self, fdir, eqName):

        with open(fdir,"w+") as eqFile:
            
            eqFile.write("model "+eqName+"\n")

            #load necessary libraries at the beginning of each file  
            eqFile.write("extends Modelica;\n")
            eqFile.write("import Modelica.Math;\n")                      
            # 1.) Variables
            # ------------------------------------------
            trenn = "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=" 

            commentStr = "\n// Inputs:\n//"+trenn+"\n"
            eqFile.write(commentStr)
            commentStr = "\n//Voltage:"
            eqFile.write(commentStr)       

            if self.Modus == 1 or self.Modus == 5:
                eqFile.write(self.X['inputVp'])

            if self.Modus == 1 or self.Modus ==2 or self.Modus==3 or self.Modus == 4 or self.Modus == 6 or self.Modus == 7 or self.Modus == 8:     
                eqFile.write(self.X['inputVr']) 
            
            #eqFile.write(self.X['Vabs']) 
            eqFile.write(self.X['Phi']) 

            commentStr = "\n//Load Power:"
            eqFile.write(commentStr)    
            eqFile.write(self.X['Load'])
            
            commentStr = "\n// Outputs:\n//"+trenn+"\n"
            eqFile.write(commentStr)
            
            if self.Modus == 1 or self.Modus ==2 or self.Modus == 4 or self.Modus == 6 or self.Modus == 7 or self.Modus == 8: #better look 
                
                commentStr = "\n//Voltage:"
                eqFile.write(commentStr)
                eqFile.write(self.X['outputVr'])
            eqFile.write(self.X["outputVp"])
            
            commentStr = "\n//All Branch Flows:"
            eqFile.write(commentStr)
            eqFile.write(self.X['cns_Iij'])
            eqFile.write(self.X['Iij'])

            commentStr = "\n//Trick equality constraints for Loads:"
            eqFile.write(commentStr)        
            eqFile.write(self.X['ceq_Load'])  

            if self.Modus == 2 or self.Modus == 3 or self.Modus == 4 or self.Modus == 6 or self.Modus == 7 or self.Modus == 8:
                commentStr = "\n//Voltage Magnitude:"
                eqFile.write(commentStr)  
                eqFile.write(self.X['Vabs'])
            
            commentStr = "\n//Generator Power:"
            eqFile.write(commentStr)
           
            eqFile.write(self.X["Sgen"])

            #eqFile.write("\nprotected\n")

            eqFile.write(self.X["Vr"])    
            commentStr = "//Generator Current:"
            eqFile.write(commentStr)
            eqFile.write(self.X['Igen'])   
            
            commentStr = "\n//Load Current:"
            eqFile.write(commentStr)
            eqFile.write(self.X['ILoad'])
            eqFile.write(self.X['ILoad_'])
            eqFile.write(self.X['cns_ILoad'])                  
            eqFile.write("\nequation\n")
           
            # 2.) Equations
            # ------------------------------------------

            # Power Flow Equations: S,i = Sgen,i - Sload,i
            commentStr = "\n//Generator Power Flow:\n//"+trenn+"\n"
            eqFile.write(commentStr)
            eqFile.write(self.eq["Sgen"]) 
            
            eqFile.write("\n//Load Power Flow Equations:\n//"+trenn+"\n")
            eqFile.write(self.eq['ILoad'])
            eqFile.write(self.eq['cns_ILoad'])
            commentStr = "\n//Trick equality constraints for Loads:\n//"+trenn+"\n"
            eqFile.write(commentStr)        
            eqFile.write(self.eq['ceq_Load']) 

            eqFile.write("\n//Kirchhoff's Law:\n//"+trenn+"\n")
            eqFile.write(self.eq['Igen'])
            eqFile.write("\n//Branch Flow Limits:\n//"+trenn+"\n")
            eqFile.write(self.eq['cns_Iij'])
            eqFile.write(self.eq['Iij'])

            
            if self.Modus == 2 or self.Modus == 3 or self.Modus == 4 or self.Modus== 6 or self.Modus == 7 or self.Modus == 8:
                commentStr = "\n//Voltage Magnitude Equations:\n//"+trenn+"\n"
                eqFile.write(commentStr)
                eqFile.write(self.eq['Vabs'])               
                #eqFile.write(self.eq['cns_VabsMax'])                      
            elif self.Modus == 1 or self.Modus == 4: # conversion phasor/magnitude <-> rectangular (Modus 1+2)
                commentStr = "\n//Conversion phasor/magnitude <-> rectangular:\n//"+trenn+"\n"
                eqFile.write(commentStr)                    
                eqFile.write(self.eq['Vr']) 
            
            eqFile.write("\nend "+eqName+";")


        block = "*********\t*********\t*********\t*********\t"
        print(block+"\n\n")
        print("\tSuccessfully created IEEE Power Equations!\n\n");
        print(block+"\n\n")      
        
    def searchRefAngle(self):
            
        for elements in self.busdata:

            bus_i = ptbx.convertBusElements(self.pti,elements)
            if  bus_i["busType"] == 3:
                return '%.3f' % round(bus_i["phi"], 3)
                
# region - options  
#                                                                       Options
#
# Each bus is described by 4 parameters:
# (1) P_i (2) Q_i (3) Vm_i (4)Va_i
#
# CDF convention:
#
# busdata without name (17 attributes):
# --------------------------------------
#|(1) Area|(2) Zone|Type|(3) Final Voltage p.u.|(4) Finale Angle ([°])|(5) Pload|(6) Qload|(7) Pgen|(8) Qgen|
#|(9) Base Voltage|(10) Desired Voltage|(11) Max.|(12) Min.|(13) G p.u.(Reactor)|(14) B p.u.(Capacitor)|(15) Remote Control|(16) Seq. Num.|

# branchdata  (20 attributes):
# ------------------------------------
#|(1) From|(2) To|(3) Area|(4) Zone|(5) Circuit No.|(6) Type|(7) R p.u.|(8) X p.u.|(9) B p.u.|(10) MVA Rate 1|(11) MVA Rate 2|(12) MVA Rate 3|
#|(13) Control Bus|(14) Side |(15) Transformer Ratio|(16) Transformer Angle|(17) Tap/Phase Shift Range Min.|(18) Tap/Phase Shift Range Max.|
#|(19) Step Size|(20) Limit Min.|(21) Limit Max.| 
#
# PTI convention:
#
# busdata:
# ----------
#|(1) No. |(2) Type | (3) Pd (MW)|(4) Qd[MW] |(5) Gs |(6) Bs|(7) Area|(8) Vm [p.u.]| (9) Va [°] (10) BASE_KV [kV]|
#|(11) Zone |(12) Vmax [p.u.] |(13) Vmin [p.u.]|(14) Lam_P [u/MW]|(15) Lam_Q[u/MVar]|(16) MU_Vmax [u/p.u.]| MU_Vmin [u/p.u.]
#
#
# branchdata:
# ------------
#|(1) From |(2) To | (3) R [p.u.]|(4) X [p.u.] |(5) Line Suceptance [p.u.]|(6) Rate A [MVA]|(7) Rate B [MVA] |(8) Rate C [MVA]| (9) Tap| (10) Shift [°] (11) Status|
#
#
# gendata:
# --------
# (1) No. (2) Pg (3) Qg (4) Qg,max (5) Qg,min (6) Vg (7) base (8) status (9) Pg,max (1) Pg,min
#
# Bus Types:
# 
# (3) Slack/Reference Bus:
# Known: V, phi_i | Unknown: P,Q
#
# (2) PV/Generator/Voltage Controlled Bus:
# Known: P,V(=1) | Unknown: Q, phi_i
#
# (1) PQ/Load Bus:
#
# Known: P,Q | Unknown: V, phi_i
#
#                                                                   Hinweise - Optimal Power Flow
# 
# (1) Pi_i = Pg_i - Pl_i  
# 
# Achtung: für PF-Verfahren ist Pg bekannt -> bei OPF wird Pg bestimmt
# PQ: Pl_i > 0 PV: Pg_i > 0
# Unbekannte => PQ: Spannung, PV Bus: Q_i und Winkel, Ref. Bus 0 P_i, Q_i
# => N(gen) + M(load)- 1 + N unbekannte Variablen (überbestimmtes System ? -> PF-Gleichungen 2(N+M))
# Gesucht: Pg_i u= Pi_i + Pl_i und Qg_i 
#endregion
#------------------------------------------   
