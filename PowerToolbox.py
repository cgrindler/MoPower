import pypower.api as pyp
import networkx as nx
from matplotlib import pyplot as plt
import cmath
import os
from sys import platform

class InitCases:

    def __init__(self,fcn):
        
        currDir = os.getcwd()
        if platform == "linux" or platform == "linux2":
            mdir_ = currDir +"/cases/"+fcn 
        elif platform == "win32":
            mdir_ = currDir +"/cases/"+fcn 

        if not hasattr(pyp,fcn):

            currDir = os.getcwd()
            mdir = mdir_ +".py" 
            if not os.path.isfile(mdir):
               mdir = mdir_ +".mat"  
            if not os.path.isfile(mdir): print("\nNo case could be detected!\n")   
             
            self.System = pyp.loadcase(mdir)
        else: 
            sysfcn = getattr(pyp,fcn)
            self.System = sysfcn()

        self.busdata = self.System['bus']
        self.branchdata = self.System['branch']
        self.gen = self.System['gen']
        if 'gencost' in self.System:
            self.gencost= self.System['gencost']
        else: 
            self.System['gencost'] = ""
            self.gencost= ""

class createOPF():

    # ====================================      Indices     ==================================== #
    #
    # t: time, j:scenario, k: post-contigency case, i: bus
    #
    # ====================================    Constraints    ==================================== #
    #
    # 
    # ==================================== Control Variables ==================================== #
    #
    # u = u(Pg_i,Qg_i,phi_ik (phase-shift),T_ik (tap-shift))
    #
    # ====================================  State Variables  ==================================== #
    #
    # x = x(phi)
    
    def FlowLimits():
        
        #h_tjki(phi_tjki,V_tjki,P_tjki,Q_tjki) <= 0 
        # -------------------------------------------  
        # Pmin_i <= Pg_tjki <= Pmax_i
        # Qmin_i <= Qg_tjki <= Qmax_i
        # Vmin_i <= V_tjki <= Vmax_i
        # phimin_i <= phi_tjki <= phimax_i
        
        #Beispiel Primer:
        # 
        # 0.1 <= Pg_3 <= 0.4
        # 0.05 <= Pg_4 <= 0.4
        # -0.2 <= Qg_3 <= 0.3
        # -0.2 <= Qg_4 <=0.2
        # 0.95 <= Vabs_i <= 1.05
        # -180° <= phi_i <= 180°
        #
        # -30° <= phi_34 <= 30°
        # 0.95 <= T_35 <= 1.05
        
        print("Flow Limits")

class createNetwork:
    
    def __init__(self,System):
        self.busdata = System['bus']
        self.branchdata = System['branch']
        self.G = nx.Graph()

    def EdgesAndNodes(self):
        
        for elements in self.busdata:
            bus = "Bus: " + str(elements[0])
            type = int(elements[1])
            nodesd = dict()
            if type == 1:            
                self.G.add_node(bus, attr_dict={'type': 'PQ'})
            elif type == 2:
                self.G.add_node(bus, attr_dict={'type': 'PV'})
            elif type == 3:
                self.G.add_node(bus, attr_dict={'type': 'Slack'})
            else: self.G.add_node(bus, attr_dict={'type': 'X'})
        
        for elements in self.branchdata:
            
            busFr = "Bus: " +str(elements[0])
            busTo = "Bus: "+ str(elements[1])
            self.G.add_edge(busFr,busTo)

    def showNetwork(self):
        
        #fig, ax = plt.subplots(1, 1, figsize=(16, 10))
        #pos = graphviz_layout(self.G, prog='sfdp')
        #nx.draw_networkx_nodes(self.G, pos, ax=ax, node_size=50, node_color='red', nodelist=[n for n, d in self.G.nodes(data=True) if d.get('type', None) == 'PV'])
        #nx.draw_networkx_nodes(self.G, pos, ax=ax, node_size=50, node_color='blue', nodelist=[n for n, d in self.G.nodes(data=True) if d.get('type', None) == 'PQ'])
        #nx.draw_networkx_nodes(self.G, pos, ax=ax, node_size=50, nodelist=[n for n, d in self.G.nodes(data=True) if d.get('type', None) == 'Slack'])
        #nx.draw_networkx_edges(self.G, pos, ax=ax)
        bbox_props = dict(boxstyle="round, pad=1", facecolor="blue",edgecolor="black",alpha=0.5)
        pos = nx.spring_layout(self.G,scale =1)
        nx.draw_networkx_nodes(self.G,pos,node_color="b",alpha = 0.3)
        nx.draw_networkx_edges(self.G,pos, width=1, alpha=0.3, edge_color='b')
        
        nx.draw_networkx_labels(self.G,pos,font_size = 5, font_weight = "heavy",alpha = 0.4 ,bbox=bbox_props)
        #h = HivePlot(sorted(self.G.nodes(),self.G.edges()))
        #h.draw()
        plt.show()

class configPara(object):
    pass

def convertBusElements(pti,busI):

    bus = dict()
    if pti == True:
        bus['No'] = int(busI[0])
        bus['busType'] = int(busI[1])
        bus['Pload'] = busI[2]
        bus['Qload'] = busI[3]
        bus['Vabs'] = busI[7]
        bus['phi'] = busI[8]*cmath.pi/180
        bus['g'] = busI[4]
        bus['b'] = busI[5]
        bus["Vmax"] = busI[11]
        bus["Vmin"] = busI[12]
    else:
        bus['No'] = int(busI[0])
        bus['busType'] = int(busI[3])
        bus['Pload'] = float(busI[6])
        bus['Qload'] = float(busI[7])
        bus['Vabs'] = float(busI[4])
        bus['phi'] = float(busI[5]*cmath.pi/180)
        bus['g'] = float(busI[14])
        bus['b'] = float(busI[15])    
    return bus  

def convertBranchElements(pti,branchI):
    branch=dict()
    if pti == True:
        branch['from'] = int(branchI[0])
        branch['to'] = int(branchI[1])
        branch['R'] = branchI[2]
        branch['X'] = branchI[3]
        branch['rateA'] = branchI[5]
        branch['rateB'] = branchI[6]
        branch['rateC'] = branchI[7]
        branch['tap'] = branchI[8]
        branch["shift"] = branchI[9]

    return branch

def convertGenElements(pti,genI):
    gen  = dict()
    if pti == True:
        gen["No"] = int(genI[0])
        gen['Pg'] = genI[1]
        gen['Qg'] = genI[2]
        gen['Qmax'] = genI[3]
        gen['Qmin'] = genI[4]
        gen['Vg'] = genI[5]
        gen['base'] = genI[6]
        gen['status'] = genI[7]
        gen["Pmax"] = genI[8]
        gen["Pmin"] = genI[9]

    return gen





        
