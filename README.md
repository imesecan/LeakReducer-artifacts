# Keeping Secrets: Multi-objective Genetic Improvement for Detecting and Reducing Information Leakage
Submitted to ASE22. <br>
Disclaimer: The material here is under review and not meant for distribution. 
Please do not use or reveal information on this site or share the link until 
the paper review period is complete.

## Test Subjects

There are 6 test subjects used in the research:
1. [Apple Talk (Atalk)](./subjects/atalk.c) was taken from [\[22\]](https://dl.acm.org/doi/abs/10.1145/1920261.1920300) and code adapted from atalk_getname function is in net/appletalk/ddp.c file from Linux 2.6.30 version. 
2. [Bignum](./subjects/bn_lib.c) bin2bn function in crypto/bn/bn_lib.c file from [openssl-1.1.1j](https://ftp.openssl.org/source/old/1.1.1/) version.
3. [Classify](./subjects/classify.c) was prepared by the authors to demonstrate the need for multi-objective optimization.
4. [Heartbleed](./subjects/d1_both.c) dtls1_process_heartbeat is in ssl/d1_both.c file in [openssl-1.0.1f](https://www.openssl.org/source/old/1.0.1/) version and reported by [CVE-2014-0160](https://nvd.nist.gov/vuln/detail/CVE-2014-0160).
5. [Triangle](./subjects/triangle.c) was taken from [\[31\]](https://ieeexplore.ieee.org/abstract/document/9678758/)
6. [Underflow](./subjects/underflow.c) was taken from [\[22\]](https://dl.acm.org/doi/abs/10.1145/1920261.1920300).

### Test Inputs
1. [Atalk](test-sets/atalk-tests.md)
2. [Bignum](./test-sets/bignum-tests.md)
3. [Classify](./test-sets/classify-tests.md)
4. [Heartbleed](./test-sets/heartbleed-tests.md)
5. [Triangle](test-sets/triangle-tests.md)
6. [Underflow](test-sets/underflow-tests.md)


## Artifacts
Top 10 results from parameter tuning tests can be found [here](./ptuning-results.md).

There are results from 3 tests:
1. Download [Parameter tuning tests](./TuningTests.zip)
2. Download [Single objective LeakReducer tests](./GA.zip)
3. Download Multi-objective tests [part1](./MO-part1.zip) [part2](./MO-part2.zip)

Every zip file has study subjects as subfolders. E.g. Multi-objective 
tests has subject subfolders like: Atalk, Bignum, etc. Then, in every 
subject folder there are algorithms or test method subfolders, 
like: MOCell, SPEA2, etc. Under algorithms job ids are listed. 

Every folder contains information for one job (one run). For example, 
MO-part1/Triangle/MOCell/640827 folder contains job information 
for the jobid 640827 for the Triangle test subject using MOCell 
algorithm. And, that contains the following files
* FUN.MOCell-triangle-640827-9	
* MOCell-9-6408270-triangle.c		
* MOCell-9-6408271-triangle.c		
* MOCell-9-6408272-triangle.c		
* MOCell-9-6408273-triangle.c		
* MOCell-triangle-640827-9.png
* VAR.MOCell-triangle-640827-9
* errtslr-640827.txt
* out-all-M1-C0.5-P50-640827.txt
* outtslr-640827.txt

where 

* Each of ```AlgorithmName*.c``` file contains one program variant reported 
  by LeakReducer. Single objective algorithm reports one solution. 
  Multi-objective algorithms may report one or more solutions. 
* ```FUN..``` file contains fitness results reported by jMetalPy
* ```VAR..``` file contains list of mutation operators for each program 
  variant (solution) listed. Every program variant may contain several 
  mutation operators. And mutation operators for each program variant 
  is separated by an empty line.
* ```out-*.txt``` file contains report prepared by LeakReducer. Report files contain
    * Reported objective values,
    * Algorithm name
    * Problem name
    * HyperVolume for MO algorithms
    * Number of solutions found for MO algorithms
    * Elapsed time in seconds
    * Statements found in the program
    * Identifiers found in the program
* ```err*.txt``` and ```out*slr*.txt``` files are the report files prepared by the HPC job
* And, there is ```*.png``` file for MO jobs which plots reported pareto front.

