# Keeping Secrets: Multi-objective Genetic Improvement for Detecting and Reducing Information Leakage
Mesecan, Ibrahim; Blackwell, Daniel; Clark, David; Cohen, Myra B; Petke, Justyna

The artifacts for "Keeping Secrets: Multi-objective Genetic Improvement for Detecting and Reducing Information Leakage", published at 37th IEEE/ACM International Conference on Automated Software Engineering (ASE22), October 2022 Oakland Center, Michigan, United States.

## Citation
The pdf of the paper can be accessed at here.
To cite this work, please use the citation below.

```
@INPROCEEDINGS{mesecan2022Keeping,
    author={Mesecan, Ibrahim and Blackwell, Daniel and Clark, David and Cohen, Myra B and Petke, Justyna},
    booktitle={37th IEEE/ACM International Conference on Automated Software Engineering (ASE22)},
    title={Keeping Secrets: Multi-objective Genetic Improvement for Detecting and Reducing Information Leakage},
    year={2022},
    pages={739-750},
    doi={10.1145/3551349.3556947}
}
```

## Acknowledgments
This work is supported in part by
* NSF grant CCF-1909688 and
* UKRI EPSRC grants EP/P023991/1 and EP/P005888/1

Any opinions, findings, and conclusions or recommendations expressed in this material are those of the author(s) and do not necessarily reflect the views of the National Science Foundation
or the Engineering and Physical Sciences Research Council.
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
Results from parameter tuning tests can be found [here](./ptuning-results.md).

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

## Re-evaluation
We prepared [a docker file](Dockerfile) and its 
[run script](run-Docker.sh) for re-evaluation. 
For this,
1) download this repository 
2) run the [given script](run-Docker.sh).

The script will a) prepare a docker image; 
b) automatically unzip and build harnesses to run test 
subjects; c) evaluate and print QIF and Fail-ratio for 
GA and MO subjects generated by LeakReducer; d) copy results 
(*GA-results.txt* and *MO-results.txt*) back to 
the current folder.

### Reading Results
Result files (*GA-results.txt* and *MO-results.txt*)
contain re-evaluation information for the results developed
by LeakReducer on each run.  

The Table below presents sample results for Multi-Objective 
tests (MO) where Algorithm can be one of the four algorithms 
used in the tests: MOCell, NSGAII, NSGAIII, and SPEA2. 
And, the JobID is a unique id describing the job run. 
E.g. related information for the job id ```654613``` 
(1st row below) can be found in ```MO.zip``` 
and in ```MO/Classify/NSGAIII/654613``` folder.

Test Subject | Algorithm | JobID | Filename | QIF | Fail ratio
-------------|-----|-------|----------|-----|-----------
Classify | NSGAIII | 654613 | NSGAIII-16-6546139-classify.c | QIF: 0.1204 | Failed: 0.567
Classify | SPEA2   | 641077 | SPEA2-30-6410770-classify.c   | QIF: 1.0000 | Failed: 0.000
Classify | SPEA2   | 641077 | SPEA2-30-6410771-classify.c   | QIF: 0.0000 | Failed: 0.629
Classify | SPEA2   | 641077 | SPEA2-30-64107710-classify.c  | QIF: 0.7593 | Failed: 0.148
... | ... | ... | ... | ... | ...

And, the Table below presents sample results for Genetic 
algorithm (GA) where Test Generation Method (TGM) can be 
one of the four methods used in tests: Afl, Hash, Afl-TA, 
and Hash-TA. 

Test Subject | TGM | JobID | Filename | QIF | Fail ratio
-------------|-----|-------|----------|-----|-----------
Atalk | afl | 635348 | GA-0-6353480-atalk.c | QIF: 1.0000 | Failed: 0.000
Atalk | afl | 635349 | GA-1-6353490-atalk.c | QIF: 0.0000 | Failed: 0.551
Atalk | afl | 635350 | GA-2-6353500-atalk.c | QIF: 1.0000 | Failed: 0.000
... | ... | ... | ... | ... | ...

