import os

currDir = os.path.dirname(os.path.realpath(__file__))
busdata = []
busnames = []
branchdata = []


def solvebusname(line) :
    tmpLine = line[0:4] + line[18:128]
    busname = line[5:17]
    return tmpLine, busname

def createModelicaData(ieeeName) :

    ieeeDir = currDir + 'ieee/'+ieeeName+'.txt'
    bus = False     
    branch = False
    busdata = []
    busnames = []
    branchdata = []
    for line in open(ieeeDir) :

        fields = line.split() 
        if fields == []: continue
        if fields[0] == "-999":
            bus = False
            branch = False

        if bus == True:
            tmpLine = solvebusname(line)
            busdata.append(tmpLine[0].split())
            #busdata.append([float(x) for x in fields])
            busnames.append(tmpLine[1])
                   
        if branch == True:
            branchdata.append(line.split())
            #branchdata.append([float(x) for x in fields]) #float Konvertierung
        
        if fields[0] == "BUS":
            bus = True
        if fields[0] == "BRANCH":
            branch=True
      
               
    return busnames, busdata, branchdata

def createFiles(toM):
    busdir = "bus"+ieeeName+".csv"
    branchdir = "branch"+ieeeName+".csv"
    if os.path.exists(busdir):
       os.remove(busdir)
    if os.path.exists(branchdir):
       os.remove(branchdir)
    with open(busdir,"w+") as busFile:
        listTotxt(busFile,toM[1])
    with open(branchdir,"w+") as branchFile:
        listTotxt(branchFile,toM[2])      

def listTotxt(myfile,mylist):
    
    for  element in mylist:
        
        for el2 in element:
            myfile.write(str(el2)+"\t")

        myfile.write("\n")   

#createFiles(self.toModelica)

#block = "*********\t*********\t*********\t*********\t"
#print(block+"\n\n")
#print("\tSucessfully created raw IEEE matrices!\n\n");

#print(block+"\n")

# Naming convention
#
# bus data without name (17 attributes):
#|(1) Area|(2) Zone|Type|(3) Final Voltage p.u.|(4) Finale Angle (deg)|(5) Pload|(6) Qload|(7) Pgen|(8) Qgen|
#|(9) Base Voltage|(10) Desired Voltage|(11) Max.|(12) Min.|(13) G p.u.(Reactor)|(14) B p.u.(Capacitor)|(15) Remote Control|(16) Seq. Num.|

# branch data without (20 attributes):
#|(1) From|(2) To|Area|(3) Zone|(4) Circuit No.|(5) Type|(6) R p.u.|(7) X p.u.|(8) B p.u.|(9) MVA Rate 1|(10) MVA Rate 2|(11) MVA Rate 3|
#|(12) Control Bus|(13) Transformer Ratio|(14) Transformer Angle|(15) Tap/Phase Shift Range Min.|(16) Tap/Phase Shift Range Max.|
#|(17) Step Size|(18) Limit Max.|(19) Limit Min.| 