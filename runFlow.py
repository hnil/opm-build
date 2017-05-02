#!/usr/bin/env python
import sys#, string
import os#,pylab
import getopt
#import time
from timeit import default_timer as timer
#import timeit
#import numpy
import multiprocessing as mp
from time import sleep
import subprocess
#from multiprocessing import Pool

def runsimulation(sim_param):
    simulator = sim_param[0]
    inputdir=sim_param[1]
    outputdir=sim_param[2]
    command="%s %s output_dir=%s" % (simulator,inputdir,outputdir)
    print(mp.current_process())
    #print(command)
    try:
        #subprocess.call(command)
        #subprocess.call('ls')
        os.system(command)
    except OSError:
        print('Faild to run: %s' % (command) )
        #print myfile
    
    


def main(argv=None):
    #print sys.argv
    #options, remainder = getopt.getopt(sys.argv[1:], '--np', ['n='])
    #print options
    if len(sys.argv)<2:        
        print("Error: Usage runIGEMS --np=n file1 file 2")
        return -1
    
    try:
        options, myfiles = getopt.getopt(sys.argv[1:],\
                                                 '--np',\
                                                 ['np=',\
                                                 'simulator=',\
                                                 'outputdir='])
    except getopt.GetoptError as err:
        print(err)
        print("Error: Usage runIGEMS --np=n --outputdir=dir file1 file 2")
        print("runFlow.py --np=1 --simulator=dd  YY/XX_*/*.DATA")
        sys.exit(2)            
                                     
    print(options)                                 
    myfiles.sort
    num_pros=-1
    simulator = 'flow'
    outputdir = '.'
    for opt, arg in options:
        if opt in ('--np'):
            num_pros = int(arg)
        if opt in ('--simulator'):
            simulator = arg 
        if opt in ('--outputdir'): 
            outputdir = arg
        
    
    scommand= simulator # simulator command
    outputnames= [None] *len(myfiles)
    import texttable as tt
    tab = tt.Texttable()
    tab.header(['Input dir','OutPutDir'])
    sim_params=[]
    for i in range(len(myfiles)):
        tmp = myfiles[i].split('/')
        tmp=tmp[len(tmp)-1];
        tmp=tmp.split('.')
        tmp=tmp[0]
        #tmp=tmp[:len(tmp)-7];
        outputnames[i]= '%s/%s' % (outputdir,tmp)
        tab.add_row([myfiles[i],outputnames[i]])
        sim_params.append([scommand,myfiles[i],outputnames[i]])

    tab.set_cols_width([50,20])  
    tab.set_cols_align(['l','c'])
    tab.set_deco(tab.HEADER | tab.VLINES)
    s = tab.draw()
    log_file  = '%s/logfile.log' % (outputdir) 
    log  = open(log_file , 'w')
    print('Run OPM for the flowing datafiles')    
    print(s)
    print('***************************************************************')        
    print('Using %s with  %i number of processes' % (simulator,num_pros))
    print('Output dir is %s' % (outputdir))
    print('***************************************************************') 
    start = timer()
    #t = timeit.Timer('char in text', setup='text = "sample string"; char = "g"')
    if(num_pros<2):
        for sim_param in sim_params:
            if num_pros==0:
                print("%s %s %s" % (sim_param[0],sim_param[1],sim_param[2]))
            elif num_pros==1:
                runsimulation(sim_param)                
    elif(num_pros>1):
        pool=mp.Pool(processes=num_pros)
        pool.map(runsimulation,sim_params)
    else:
        print("Wrong simulation_type")
    
    end= timer()
    print('Total time used %g\n' % (end-start))
    log.write('Total time used %g\n' % (end-start))
       
if __name__ == "__main__":
    sys.exit(main())
else:
    main()
