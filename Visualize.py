import numpy as np
import os
import pandas as pd
import seaborn as sb
import matplotlib.pyplot as plt
plt.rcParams["font.weight"] = "bold"
#plt.rcParams["font.size"] = 25
plt.rcParams["axes.titlesize"] = 16
plt.rcParams["axes.labelsize"] = 16
plt.rcParams["xtick.labelsize"] = 16
plt.rcParams["ytick.labelsize"] = 16
plt.rcParams["axes.labelweight"] = "bold"
plt.rcParams["axes.titleweight"] = "bold"

from natsort import natsorted, ns


def main():

    logPath = "logs/logs_dd" 
    logPath2 = "logs/logs"

    lPaths = list()
    lPaths.append(logPath2)
    lPaths.append(logPath)
    step = 1
    case = "case300_2"
    steps = [0, 5, 24]
    cases = ["case14_2", "case14_7", "case30_2", "case30_7","case89_2","case89_7"]
    solvers = ["RedSpBKP", "Pardiso"]    

    #lookHorizonts(logPath,case,step,solvers,"10")
    seqTime = seqRuntime(solvers,cases,steps, lPaths, createSummary=True)
    plotSeqTime(seqTime, cases, solvers, steps)
    rFrame = createRuntimeFrame(step,case,solvers, logPath)
    sFrame = calculateSpeedUp(rFrame)
    plotTimes(rFrame, sFrame)
    

def createRuntimeFrame(Steps,case,solvers, logPath):

    runtimeFrame=pd.DataFrame()

    for solver in solvers:

        dirPath = logPath + "/" + case + "/" + str(Steps) + "/" + solver
        if not os.path.isdir(dirPath):
            continue
        logFiles = os.listdir(dirPath)    
        runTimes = []
        #runTimes = [None] * 15  
        
        for file in natsorted(logFiles, alg = ns.IGNORECASE):

            filePath = dirPath + "/" + file
            runTime, qpIt = getTimeAvg(filePath)
            runTimes.append(runTime)

        runtimeFrame[solver] = runTimes

    return runtimeFrame

def calculateSpeedUp(rFrame):
    
    speedUpFrame  = pd.DataFrame()
    for elements in rFrame.items():
        
        refTime = elements[1][0]
        speedUpList = list()

        for cores in elements[1]:
            
            speedUpList.append(refTime/cores)
                
        speedUpFrame[elements[0]]=speedUpList

    #speedUpFrame.index =  range(1,len(rFrame.index)+1)

    return speedUpFrame

def seqRuntime(solvers,cases,steps, lPaths, createSummary=False):


    seqTime = dict()
    if createSummary:
        sumUp = open("logs/SeqSummary.log", "w")

    for log in lPaths:
        for case in cases:
            
            casePath = log + "/" + case
            
            if not case in seqTime:
                seqTime[case] = dict()

            for step in steps:

                stepPath = casePath + "/" + str(step)
                
                if not str(step) in seqTime[case]:
                    seqTime[case][str(step)] = dict()

                for solver in solvers:

                    solverPath = stepPath + "/" + solver

                    if not os.path.isdir(solverPath):                  
                        continue
                    else:

                        logFile = solverPath + "/1.log"
                        if not os.path.isfile(logFile):         
                            runTime = 0
                            qpIt = 0
                        else:
                            runTime, qpIt = getTimeAvg(logFile)

                        if solver in seqTime[case][str(step)]:
                            tmpKey = "DD_" + solver
                        else: tmpKey = solver

                        seqTime[case][str(step)][tmpKey] = runTime
                        
                        if createSummary:
                            sumUpLine = log +""+ case + ", Steps: " + str(step) + ", Time: " + str(runTime) + ", Qp-It.: " + str(qpIt) + "(" + solver + ") \n"
                            sumUp.write(sumUpLine)
    if createSummary:
        sumUp.close()
    return seqTime

def getTimeAvg(filePath):

    avgList = []
    qpList = []
    avgTime = 0

    for lines in open(filePath):
        
        splitLines = lines.split()

        if len(splitLines) > 1:
            if splitLines[1] == "Time:":
                avgList.append(float(splitLines[2]))

            if splitLines[1] == "qp-it":
                qpList.append(float(splitLines[0]))        
        #if splitLines[0] == "not Optimal" :
         #   print("deleteLine")

    if len(avgList)>0 and len(qpList)>0:
        avgTime=sum(avgList)/len(avgList)
        qpIt = sum(qpList)/len(qpList)
        runTime = avgTime/1000  
    else: runTime = qpIt = float('nan')     
     
      
    return runTime,qpIt  

def lookHorizonts(logPath,case,maxStep,solvers,core):
    
    casePath = logPath + "/" + case
    coreTimes=dict()

    for solver in solvers:
        coreTimes[solver] = list()

    for i in range(0,maxStep+2):
        
        stepPath = casePath + "/" + str(i)
        

        for solver in solvers:

            solverPath = stepPath + "/" + solver

            if not os.path.isdir(solverPath):
                    
                continue
            else:

                logFile = solverPath + "/"+core+".log" 
                runTime, qpIt = getTimeAvg(logFile)     
                coreTimes[solver].append(runTime)

    plotCoreTimes(coreTimes)


def plotCoreTimes(coreTimes):

    for element in coreTimes:
        plt.plot(coreTimes[element])

    plt.show() 
   
def plotTimes(rFrame,sFrame):
    #plt.gca().set_color_cycle(["red", "green"])       

    fig, ax1 = plt.subplots() # Create matplotlib figure
    ax2 = ax1.twinx() 
    rFrame.plot(ax=ax1)
    sFrame.plot(ax=ax2, kind="bar", alpha = 0.3)

    ax1.set_ylabel("Runtime [s]")
    ax1.set_xlabel("Anzahl der Prozessoren")
    #ax1.legend(loc='upper center')
    ax2.set_ylabel("SpeedUp",fontweight = "bold")
    #ax2.legend(loc='upper c')
    #plt.legend(loc='upper center', bbox_to_anchor=(0.5, 1.1), 
          #fancybox=True, shadow=True, ncol =2)  
    ax1.set_xticklabels(range(1,len(rFrame.index)+1))
    ax1.legend(loc = "upper right")
    ax2.legend(loc = "upper right")
    plt.show()

    

def plotSeqTime(seqTime, cases, solvers,steps):

    timeCount = len(steps)
    plt.style.use('classic')

    fig, ax = plt.subplots(timeCount,1)
    stepDict = dict()
    for step in steps:
        stepDict[step] = dict()
        for ii, solver in enumerate(seqTime.values().__iter__().__next__().values().__iter__().__next__()):
          stepDict[step][solver] = list()
        #for solver in solvers:
         #   stepDict[step][solver] = list()

    for i, step in enumerate(steps):   
        for case in cases:
            for ii, solver in enumerate(seqTime.values().__iter__().__next__().values().__iter__().__next__()):                        
                if str(step) in seqTime[case]:
                    if solver in seqTime[case][str(step)]:
                        stepDict[step][solver].append(seqTime[case][str(step)][solver]) 
                    else: stepDict[step][solver].append(float('nan'))
                else: stepDict[step][solver].append(float('nan'))
        head = str(step) + " Zeitschritte"
        newcases=list()
        for elements in cases:
            if elements[-1] == "7":
                newcases.append(elements.replace("_7"," IV"))
            if elements[-1] == "2":
                newcases.append(elements.replace("_2"," II"))

        tempFrame =  pd.DataFrame(stepDict[step], index = newcases)
        tempFrame.plot(kind="barh",ax=ax[i], rot=0, grid = True)
        ax[i].set_xscale("log")
        tmplabelY = ax[i].set_ylabel("Modelle", fontsize = 16)
        ax[i].set_xlabel("Laufzeit [s]", fontsize=16)
        ax[i].set_title(head,y=0.98)
        ax[i].xaxis.set_label_coords(1.06, -0.02)
        ax[i].yaxis.set_label_coords(-0.07, 1)
        tmplabelY.set_rotation(0)

    fig.suptitle("Optimal Power Flow Directional Derivatives - 12 Core", fontsize = 16)
    plt.show()


    
main()








