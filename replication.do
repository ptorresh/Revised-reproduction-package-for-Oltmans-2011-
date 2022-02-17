

/**************Replication Code for "The Wrong Side(s) of Tracks"**************/



clear all
set more off
cap log close
cls


*** User path: (change accordingly) [Here goes to the dropbox folder]
global user "/Users/`c(username)'/OneDrive/Escritorio/Andes/Microeconomía/Economía Urbana/Trabajo final/Replication data-The Wrong Side(s) of the Tracks/"


*** Relevant paths:

*Codes:
global codes "$user/Codes"

*Data
global data "$user/data"
global modified "$data/modified"
global raw "$data/raw"



 
* Results - tables
global results "$user/results"
global tables "$results/tables"
global graphs "$results/graphs"

********************************************************************************
use "$raw/aej_maindata.dta", clear
br


*table 2, panel 1, "main results"

/*preliminary replication*/

/*segregation is captured by a dissimilarity index (dism1990). From 0 to 1 where 1 es completely segregated.*/
/*Estimations control for total track lenght (lenper)*/

label var dism1990 "Dissimilarity Index"

ivreg lngini_w (dism1990=herf) lenper, robust
outreg2 using "$tables/table2_main_results.doc", replace keep(dism1990) ctitle("Gini index - Whites") label nor2 nonotes /// 
title(" Table 2 - Panel 1 - The Effects of Segregation on Poverty and Inequality Amoung Blacks and Whites. 2SLS RDI as instrument for 1990 dissimilarity") ///
addnote("Robust Standard Errors in Parentheses. * p<0.01, ** p<0.05, * p<0.1.                                                                                                                                              Table 2 - Panel 1 replicates main results from Table 2 - Panel 1 from the original paper. However, the code provided by the author does not include code to export table as .tex which is the final output in the paper. Therefore, outreg2 was included in the code to export these results. The actual output presented in the paper will be replicated in later deliveries, following provided instructions.")


ivreg lngini_b (dism1990=herf) lenper, robust
outreg2 using "$tables/table2_main_results.doc", append keep(dism1990) ctitle("Gini index - Blacks") label nor2 nonotes 

ivreg povrate_w (dism1990=herf) lenper, robust
outreg2 using "$tables/table2_main_results.doc", append keep(dism1990) ctitle("Poverty rate - Whites") label nor2 nonotes 

ivreg povrate_b (dism1990=herf) lenper, robust
outreg2 using "$tables/table2_main_results.doc", append keep(dism1990) ctitle("Poverty rate - Blacks") label nor2 nonotes 




												


















