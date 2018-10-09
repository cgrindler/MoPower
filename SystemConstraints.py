class CoreConstraints:

    def __init__(self,case,Modus):
        self.case = case
        self.Modus = Modus
        self.base = int(self.case.System["baseMVA"])
        self.initFlowLimits()
        self.initPowerVoltageLimits()

    def initFlowLimits(self):
        
        self.Flows = dict()
        self.Test = dict()
        checkMultiLine = []
        for elements in self.case.branchdata:
            rateA = float(elements[5])
            if rateA!=0:
                fr = int(elements[0])
                to = int(elements[1])

                if not {str(fr)+str(to)} in checkMultiLine:
                    self.Flows[str(fr)+"_"+str(to)] = (rateA/self.base)**2
                    self.Test[str(fr)+"_"+str(to)] = (rateA/self.base)**2
                    #self.Flows[chr(to)+"_"+chr(fr)] = rateA**2/self.base**2
                    checkMultiLine.append({str(fr)+str(to)})

    def initPowerVoltageLimits(self):

        self.Limits = dict()
        self.Limits["Vmax"] = dict()
        self.Limits["Vmin"] = dict()
        self.Limits["QMin"] = dict()
        self.Limits["QMax"] = dict()
        self.Limits["PMin"] = dict()
        self.Limits["PMax"] = dict()
        self.Limits["ceq_Sl"] = dict()

        genCount = 0
        for elements in self.case.busdata:      
            
            pLoad =  elements[2]
            qLoad =  elements[3] 
                
            vMin = elements[12]
            vMax = elements[11]
            No = elements[0]
            type = elements[1]
            if pLoad != 0 or qLoad != 0:               
                if type == 1:
                    
                    self.Limits["ceq_Sl"][No] = "0 0"
                isLoadhasLoad = True
            else:
                isLoadhasLoad = False

            self.Limits["Vmax"][No] = [vMax, type, isLoadhasLoad]
            self.Limits["Vmin"][No] = [vMin, type, isLoadhasLoad]

        for elements in self.case.gen:
            
            No = str(elements[0])
            qMin = elements[4]/self.base
            qMax = elements[3]/self.base
            pMin = elements[9]/self.base
            pMax = elements[8]/self.base
            self.Limits["QMin"][No] = qMin
            self.Limits["QMax"][No] = qMax
            self.Limits["PMin"][No] = pMin
            self.Limits["PMax"][No] = pMax

        


                

