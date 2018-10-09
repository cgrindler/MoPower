import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

class NLPAnalyser:

    def __init__(self,dumpFile):
        
        self.dumpFile = dumpFile
        self.dumpList = list() 
        self.Form = ""
        self.props = dict() 
        self.Q = np.matrix
        self.A = np.matrix
        self.C = np.matrix
        self.c = list()
        self.b = list()
        self.d = list()
    def splitLists(self):

            key = "Init"
            Mat = dict()
            vec = dict()
            dumpDict = dict()
            tempSplit = list()
            
            for lines in open(self.dumpFile):
        
                self.dumpList.append(lines)
        
                if lines[:4] == "# Q:" or lines[:4] == "# c:" or lines[:4] == "# A:" or lines[:4] == "# b:" or lines[:4] == "# C:" or lines[:4] == "# d:":
                    key = lines[2]
                    
                tempSplit = lines.split()
                if  (key == "Q" or key == "A" or key == "C") and tempSplit[0] != "#":
                
                    if tempSplit[0] == "SparseMatrix:":                    
                        Mat[key] = np.matrix(np.zeros([int(tempSplit[1]),int(tempSplit[3])]))
                    
                    if tempSplit[0] == "row":                    
                        row = int(tempSplit[1][:-1])
                        
                        if len(tempSplit) == 5:
                            Mat[key][row, int(tempSplit[2].split(":")[0])] = float(tempSplit[2].split(":")[1])
                            Mat[key][row, int(tempSplit[3].split(":")[0])] = float(tempSplit[3].split(":")[1])
                            Mat[key][row, int(tempSplit[4].split(":")[0])] = float(tempSplit[4].split(":")[1])
                        else:
                            num = len(tempSplit) - 5 + 3
                            for i in range(num):
                                Mat[key][row, int(tempSplit[2+i].split(":")[0])] = float(tempSplit[2+i].split(":")[1])

                    elif len(tempSplit) == 3 and tempSplit[0] == "row":
                        Mat[key][row, int(tempSplit[0].split(":")[0])] = float(tempSplit[0].split(":")[1])
                        Mat[key][row, int(tempSplit[1].split(":")[0])] = float(tempSplit[1].split(":")[1])
                        Mat[key][row, int(tempSplit[2].split(":")[0])] = float(tempSplit[2].split(":")[1])
                if (key == "b" or key == "c" or key == "d") and tempSplit[0] != "#":
                    if tempSplit[0][0] == "V":
                        vec[key] = list()
                    else:
                        for elements in tempSplit:
                            vec[key].append(float(elements))
                if key == "Init":
                    self.Form+=lines

            self.A = Mat["A"]
            self.Q = Mat["Q"]
            self.C = Mat["C"] 
            self.b = vec["b"]
            self.c = vec["c"]
            self.d = vec["d"]
    def analyseElement(self,element):
        
        df = pd.DataFrame(element)
        print(df[df>0].min())        
    def printProperties(self):
        
        print("\nExploiting the structure of the following "+ self.Form.replace("#","").lstrip())
        print("Dimensions:\n\nQ: "+ str(self.Q.shape) + "\nA: "+ str(self.A.shape)+"\nC: "+ str(self.C.shape) + "\nc: "+ str(len(self.c))+"\nb: "+ str(len(self.b))+"\nd: "+ str(len(self.d)))                
    def showSparcity(self,mat):
    
        fig = plt.figure()
        plt.spy(mat, markersize=5)
        plt.show()
                
   