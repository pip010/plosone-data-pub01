import sys
import os
import time

#https://docs.python.org/2/library/optparse.html
from optparse import OptionParser

#http://linux.byexamples.com/archives/366/python-how-to-run-a-command-line-within-python/
#https://waymoot.org/home/python_string/

def run_ext_proc(cmd):
    
    print "*** Executing: " + cmd
    
    begin_t = time.time()
    
    ret_val = os.system(cmd)
    
    if ret_val == 0 :
        print "*** Status: SUCCESS"
    else : 
        print "*** Status: FAILURE"
    
    end_t = time.time()
    
    print "*** Elapsed time in seconds : " + str(end_t - begin_t)
    
    return ret_val


if __name__ == "__main__":

    usage = "usage: %prog [options]"
    parser = OptionParser(usage=usage)
    parser.add_option("-f", dest="pipefile", help="specify input config (.scirun) pipeline file", default='pipeline.scirun')
    parser.add_option("-s", dest="stage", help="specify stage", default=0)
    options, args = parser.parse_args()
    
    if options.pipefile is None:
        print "A mandatory option is missing: -f pipeline.scirun"
        parser.print_help()
        exit(-1)
    
    if not os.path.isfile(options.pipefile):
		print "File name not found: " + options.pipefile
		exit(-1)

    print "*** START scirun pipeline ***"

    sci_cmd = "scirun --nosplash "
    
    sci_nets = [ ]
    
    with open(options.pipefile) as pipefile :
        for line in pipefile :
            if '#' not in line :
                sci_nets.append(line)
	    else :
		print "*** Skipping pipeline step: " + line

    if (long(options.stage) > 0 and long(options.stage) <= len(sci_nets) ) :
        run_ext_proc ( sci_cmd + sci_nets[long(options.stage)-1] )
    else:
        for a_net in sci_nets :
            run_ext_proc(sci_cmd + a_net)

    
    #convert any png to jpg (OPTIONAL!?)
    #os.system("mogrify -format jpg *.png")


    print "*** END scirun pipeline ***"
