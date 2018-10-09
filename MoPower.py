import pandas as pd
import numpy as np
import convertCDF as cdf
import createModelicaCode as cmc
import AnalyseNLP as nlp
import PowerToolbox as ptbx
import xlsxToolbox as xlsx
import tkinter as tk
import os
import pypower.api as pyp
import pypower.opf_args as opf_args
import sys
import json
from pypower.ext2int import ext2int
import createTcls as tcls

def main():

    with open('./config.json') as myjson:
        data = json.load(myjson)

    config = ptbx.configPara()
    config.pti = True
    config.Soft = data["soft"]
    mode = data["mode"]
    caseList = data["cases"]
    codegen = data["codegen"]
    
    for element in caseList:
        for m in mode:
            config.Modus = m
            if (codegen == "modelica"):  
                createModelicaModel(element, config)
            elif (codegen == "powerflow"):  
                createPowerEquations(element,config)
            elif (codegen == "tcl"):  
                createTclScript(element,config)
            else: raise ValueError("wrong mode specified\n \
                please choose 'powerflow' for modelica equation based code generation \
                or 'powersystems' for modelica power systems based code generation \
                or 'tcl' for tcl script generation") 

     
    #createExcelConfig("case300",config)
    #nlpObj = nlp.NLPAnalyser(".\\QP_Logs\\"+case)
    #nlpObj.splitLists()
    #nlpObj.printProperties()
  

def createModelicaModel(caseName,config):
    
    toModelica =[]
    if config.Soft:
        caseName = caseName+"S"
    fdir = "mdls/"+caseName+"_"+str(config.Modus)+"_ps.mo"
    if config.pti == True:
        pySys = ptbx.InitCases(caseName)
        toModelica.append("")
        toModelica.append(pySys.busdata)
        toModelica.append(pySys.branchdata)
    else:
        toModelica = cdf.createModelicaData(caseName)

    PS = cmc.PowerSystems(toModelica)
    PS.startWrite(fdir,caseName)

def createPowerEquations(caseName,config):
        
    currDir = os.path.dirname(os.path.realpath(__file__))
    eqName = caseName+"_"+str(config.Modus)

    fdir = "mdls/"+eqName+".mo"
    bxObj = ptbx.InitCases(caseName)
        
    toModelica = []
    toModelica.append("")
    toModelica.append(bxObj.busdata)
    toModelica.append(bxObj.branchdata)
    
    pfObj = cmc.PowerFlow(toModelica,bxObj.System,config)
    pfObj.getYfromPyPower()  
    pfObj.PowerEquations()

    if config.Modus == 7 and config.Soft:
        eqName = eqName+"S"
    pfObj.startWrite(fdir,eqName)

def solveOpf(caseName,config):
    bxObj = ptbx.InitCases(caseName)
    sysN, sysopt = opf_args.opf_args2(bxObj.System)
    sysopt = pyp.ppoption(sysopt, VERBOSE=3)
    results = pyp.runopf(bxObj.System,sysopt)
    print("Success")

def visualizeNetwork(caseName,config):
    
    sysObj = ptbx.InitCases(caseName)
    netObj = ptbx.createNetwork(sysObj.System)
    netObj.EdgesAndNodes()
    netObj.showNetwork()
    
def createTclScript(caseName,config):

    tclObj = tcls.tclScripting(caseName,config)
    tclObj.writeInputs()
    tclObj.setupStrings()
    tclObj.writeTcl()

def createExcelConfig(caseName,config):

    mStr = "Modus" + str(config.Modus)
    bxObj = ptbx.InitCases(caseName)
    wbObj = xlsx.createWorkBook(bxObj.System,caseName+mStr,config.Modus,config.dynamic)
    wbObj.setDependencies()
    wbObj.saveWorkbook()
    block = "~~**~~**~~**~~**~~**~~**~~**~~**~~**~~**~~**~~**~~**~~**~~**~~**~~**~~**~~**"
    print("\n"+block+ "\n")
    print("\tExcel Configuration initializing Dynamic Optimizer completed\n")
    print(block+ "\n")

def runTclFiles(tclFile,dump):
    os.chdir(".\Testing")
    r = tk.Tcl()
    if dump:
        r.eval('source '+ tclFile + '1')
    else:
        r.eval('source '+ tclFile)

main()

