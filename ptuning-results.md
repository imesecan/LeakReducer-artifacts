# Parameter Tuning Test Results
Table below lists the configurations
whose ```p-value``` is less than ```0.05```.
Wilcoxon rank sum test was used to measure 
statistical evidence of difference in means. 
It shows information for 3 parameters: 
1) Population Size 
2) Mutation Rate
3) Crossover Rate

together with the p-value and Mean Fitness.
The table is ordered according to the mean 
fitness of configurations. Based on the results, 
we chose the configuration whose ```p-value < 0.05```
while having the smallest median fitness
and the largest population.

Pop. Size | Mut. Rate | Cross. Rate |  p-value | Mean Fitness
----------|-----------|-------------|----------|-------------
40	| 1 	| 1	 	| 0.031   | **0.293**
**100**	| 1 	| 0.5	| 0.042   | **0.293**
40	| 1 	| 0.75 	| 0.028   | 0.294
80	| 1 	| 0.75 	| 0.049   | 0.294
80	| 1 	| 0.5	| 0.019   | 0.297
20	| 0.25	| 0.25	| 0.007	  | 0.346
20	| 0.25	| 0.75	| 0.036   | 0.347
100	| 0.5	| 0.75	| 0.047   | 0.348
60	| 0.25	| 0.75	| 0.022   | 0.348
100	| 0.25	| 0.5	| 0.014   | 0.349
80	| 0.25	| 0.5	| 0.033   | 0.349
20	| 0.25	| 1  	| 0.025   | 0.350
100	| 0.25	| 0.75	| 0.022	  | 0.351
80	| 0.25	| 0.75	| 0.031   | 0.353
80	| 0.25	| 0.25	| 0.008	  | 0.362
