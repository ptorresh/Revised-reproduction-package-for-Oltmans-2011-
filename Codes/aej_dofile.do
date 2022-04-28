clear all  /*The purpose of this first four lines of code is to clean the workspace for the project*/
set more off
cap log close
cls


*** User path: (change accordingly) 
global user "/Users/`c(username)'/OneDrive/Documentos/GitHub/Revised-reproduction-package-for-Oltmans-2011-/"

*** Relevant paths (this paths are useful to keep the project organized): 

*Codes:
global codes "$user/Codes"

*Data
global data "$user/Data"
global raw "$data/Raw"
global modified "$data/Modified"


* Results - tables
global results "$user/Results"
global tables "$results/Tables"


use "$raw/aej_maindata.dta", clear /* Load the data provided by the author.*/

des /*Include code to describe the data*/

/*The next lines of code are added to label data and have a better idea of the variables that are being used*/
label var dism1990 "Dissimilarity Index that captures level of racial segreation in 1990 "
label var herf "RDI - quantifies the extent to which the city's land is divided into smaller units by railroads"
label var lenper "Track lenght per square kilometer"
label var area1910 "Physical area (square miles/1000) in 1910"
label var count1910 "Population in 1910"
label var ethseg10 "Ethnic dissimilarity index in 1910"
label var ethiso10 "Ethnic isolation index in 1910"
label var black1910 "Percent black population in 1910"
label var passpc "Street cars in 1915"
label var black1920 "Percent black population in 1920"
label var ctyliterate1920 "Percent of literate population in 1920"
label var lfp1920 "Labor force participation in 1920"
label var ctytrade_wkrs1920 "Percent of employment in trade in 1920"
label var ctymanuf_wkrs1920 "Percent of employment in manufacturing in 1920"
label var ctyrail_wkrs1920 "Percent of employment in railroads in 1920"
label var incseg "Income segregation in 1990"
label var lngini_w "ln of the gini index for the white population in 1990" 
label var lngini_b "ln of the gini index for the black population in 1990"
label var povrate_w "poverty rate for the white population in 1990"
label var povrate_b "poverty rate for the black population in 1990"
label var closeness "Closeness to the South"
label var ln90w90b "Between-race inequality- 90 white: 90 black"
label var ln10w10b "Between-race inequality- 10 white: 10 black"
label var ln90w10b "Between-race inequality- 90 white: 10 black"
label var ln90b10w "Between-race inequality- 90 black: 10 white"
label var pop1990 "Population in 1990"
label var pctbk1990 "Percent of black population in 1990"
label var hsdrop_w "Percentage of whites High school drop outs" /*I'm not sure about this one, but following the paper and the code it might be.*/
label var hsgrad_w "Share of whites who are high school graduates"
label var somecoll_w "Share of whites who have some college"
label var collgrad_w "Share of whites that graduated college" /*I'm not sure about this one, but following the paper and the code it might be.*/
label var manshr "Share employed in manufacturing"
label var lfp_w "White labor force participation"
label var lfp_b "Black labor force participation"
label var ngov "Number of local governments (N = 69)"
label var count1920 "Population in 1920"
label var black1920 "Percentage of black population in 1920"
label var herfscore "Propensity score"
label var mv_st_winus_w "Percentage of white residents who are in-migrants"
label var mv_st_winus_b "Percentage of black residents who are in-migrants"
label var medgrent_w "Median rent for whites"
label var medgrent_b "Median rent for blacks"
label var medgrentpinc_w "Median rent as a percentage of income for whites"
label var medgrentpinc_b "Median rent as a percentage of income for blacks"
label var mt1proom_w "Share of white households with more than one person per room"
label var mt1proom_b "Share of black households with more than one person per room"
label var hsdrop_b "Share of blacks who are high school dropouts"
label var hsgrad_b "Share of blacks who are high school graduates"
label var somecoll_b "Share of blacks who have some college"
label var collgrad_b "Share of blacks who are college graduates"

save "$modified/aej_maindata_modified.dta", replace /*Save data with labels to a new dataset.*/
use "$modified/aej_maindata_modified.dta", clear /*Use modified data*/

****table 1**** 

/*All of the following regressions control for total track lenght (lenper) to assure that RDI represents the configuration of track conditional on total track. Also, standard errors are robust to heteroskedasticity */
reg dism1990 herf lenper, robust /* This is the first stage regression that proofs the relevance assumption that states that the the instrument (herf) must generate a significant level of racial segregation (dism1990). */

/*The following 6 regressions are falsification checks that test the predictive power of the instrument (herf) on a small sampling of characteristics of cities prior to the start of the Great Migration. These are done to proof that the exclusion restriction holds. */
reg area1910 herf lenper, robust /*OLS regression to analyze how the instrument (herf) affects a city's physical area in 1910 (square miles/1000) (area1910) */
reg count1910 herf lenper, robust /*OLS regression to analyze how the instrument (herf) affects the population in 1910 (count1910) */
reg ethseg10 herf lenper, robust /*OLS regression to analyze how the instrument (herf) affects the ethnic dissimilarity index in 1910 (ethseg10)*/
reg ethiso10 herf lenper, robust /*OLS regression to analyze how the instrument (herf) affects the ethnic isolation index in 1910 (ethiso10)*/
reg black1910 herf lenper, robust /*OLS regression to analyze how the instrument (herf) affects the percentage of black population in 1910 (black1910)*/
reg passpc herf lenper, robust /*OLS regression to analyze how the instrument (herf) affects the stret-cars per cap in 1910 (passpc)*/

/*The following 6 regressions are falsification checks that test for the possibility that there existed initial selection to the cities by examining the human capital characteristics of cities in 1920 (after the first wave of the Great Migration and before segregation could begin to have noticeable effects on human capital). These are done to proof that the independence assumption holds. */
reg black1920 herf lenper, robust /*OLS regression to analyze how the instrument (herf) affects the percentage of black population in 1920 (black1920)*/
reg ctyliterate1920 herf lenper, robust /*OLS regression to analyze how the instrument (herf) affects the percentage of literates in 1920 (ctyliterate1920)*/
reg lfp1920 herf lenper, robust /*OLS regression to analyze how the instrument (herf) affects labor force participation in 1920 (lfp1920)*/
reg ctytrade_wkrs1920 herf lenper, robust /*OLS regression to analyze how the instrument (herf) affects the percentage of employment in trade in 1920 (ctytrade_wkrs1920)*/
reg ctymanuf_wkrs1920 herf lenper, robust /*OLS regression to analyze how the instrument (herf) affects the percentage of employment in manufacturing in 1920 (ctymanuf_wkrs1920)*/
reg ctyrail_wkrs1920 herf lenper, robust /*OLS regression to analyze how the instrument (herf) affects percentage of employment in railroads in 1920 (ctyrail_wkrs1920)*/


reg incseg herf lenper, robust /*The purpose of this regresion is to show that during the year of analysis (1990) the instrument (herf) does not predict income segregation (incseg) and thus the instrument only affects the dependent variables through segregation and not through some other mechanism (like income segregation).*/



****table 2, panel 1****
/*The four following regressions are OLS estimations of the effect of segregation (dism1990) on within-race poverty and inequality. The standard errors are robust to heteroskedasticity. These regressions are not accounting for endogeneity in segregation. Therefore, the coefficients will be biased and will underestimate the effect of segregation.*/
reg lngini_w dism1990, robust /*OLS regression to estimate the effect of segregation (dism1990) on the natural logarithm of the Gini index for whites (lngini_w). Note: it is not clear why the author uses the ln transformation of the Gini instead of the original index.*/
reg lngini_b dism1990, robust /*OLS regression to estimate the effect of segregation (dism1990) on the natural logarithm of the Gini index for blacks (lngini_b). Note: it is not clear why the author uses the ln transformation of the Gini instead of the original index.*/
reg povrate_w dism1990, robust /*OLS regression to estimate the effect of segregation (dism1990) on the poverty rate of the white population (povrate_w). */
reg povrate_b dism1990, robust /*OLS regression to estimate the effect of segregation (dism1990) on the poverty rate of the black population (povrate_b). */

/*The following code exports the previos four regressions into a .tex table. Basically, it exports the OLS regressions from table 2, panel 1. Note: this code does not replicate the exact format presented in the paper, I was unable to replicate said format*/

*Define table content 
cd "$tables"

*Number of table
local tab `i'
di "`tab'"

estimates clear
local c = 1
	
foreach var of varlist lngini_w lngini_b povrate_w  povrate_b {	


		foreach con in dism1990 {	

			eststo regs`c': reg `var' `con', r

			
qui sum `e(depvar)' if e(sample) 
local medi `r(mean)'

estadd scalar med=`medi' : regs`c' // Recuperamos la media de la variable dependiente.
qui unique name if e(sample) // Contamos cuantas observaciones hay.
estadd scalar part = `r(unique)': regs`c' // Guardamos número anterior en un escalar.

local estimates`c' `estimates1' regs`c'

			local c = `c'+1
		}
	}
	
	

*Keep coefficients
local coefs _cons dism1990 /*Run this code with the table */

*-------------------------------------------------------------------------------
*Tex table
*Tile of table
local title_tab "The Effects of Segregation on Poverty and Inequality Amoung Blacks and Whites (OLS)"
local titles "& \multicolumn{4}{c}{OLS: Effect of 1990 dissimilarity index} \\ \cmidrule{2-5} & \multicolumn{2}{c}{Gini Index} & \multicolumn{2}{c}{Poverty rate} \\"
local numbers " \cmidrule(lr){2-3} \cmidrule(lr){4-5} & Whites & Blacks & Whites & Blacks  \\ \midrule"

esttab `estimates1'  using "table2.tex", 					     ///
replace b(3) lines se bookt nodepvars 							 ///
star(* 0.10 ** 0.05 *** 0.01) fragment label                     ///
eqlabels(none) keep(dism1990) ///
coeflabels(dism1990 "Dissimilarity Index" ) ///
collabels(none) nomtitles title(\label(table2)) substitute(\_ _) ///
nonumbers posthead( " `titles'  `numbers' ")                       ///
prehead(\begin{table}[H]										 ///
		\centering 												 ///
		\scalebox{0.8}{ 											 ///
		\begin{threeparttable} 									 ///
	 \caption{`title_tab'} ///
		\begin{tabular}{lccccccc} 								 ///
		\toprule[0.5pt] \toprule[0.5pt])
		

esttab `estimates1'  using "table2.tex", 					     ///
append b(3) plain se bookt nodepvars nonumbers					 ///
star(* 0.10 ** 0.05 *** 0.01) fragment label                     ///
eqlabels(none) drop(`coefs')                          ///
stats(med r2, fmt(3 3 0 0) ///
labels("Mean Dep. Variable" "R Squared")) ///
collabels(none) nomtitles posthead(\midrule) ///
postfoot(\bottomrule[0.5pt]  									 ///
         \label{tab:table2} 								 ///
         \end{tabular} 											 ///
		 \vspace{-13pt} 										 ///
         \begin{tablenotes}[flushleft]{\setlength{\itemindent}{-3pt}} ///
         \small 												 ///
         \item Notes: Gini Index are logged. Robust standard errors in   parentheses  ///
         \end{tablenotes} 										 ///
         \end{threeparttable} 									 /// 
         } 														 ///
         \end{table})

		 


/*The four following regressions are IV estimations of the effect of segregation (dism1990) on within-race poverty and inequality. The Railroad Division Index (herf) is used as an instrumental variable of segregation (dism1990) to recover the causal effect of segregation on the outcomes of interest. These regressions control for total track lenght (lenper) to assure that RDI represents the configuration of track conditional on total track. The standard errors are robust to heteroskedasticity.*/
ivreg lngini_w (dism1990=herf) lenper, robust /*IV regression to estimate the causal effect of segregation (dism1990) on the natural logarithm of the Gini index for the white population (lngini_w). Note: it is not clear why the author uses the ln transformation of the Gini instead of the original index. The RDI (herf) is the instumental variable to recover the exogenous relationship between segregation (dism1990) and the gini index (lngini_w).*/
ivreg lngini_b (dism1990=herf) lenper, robust /*IV regression to estimate the causal effect of segregation (dism1990) on the natural logarithm of the Gini index for the black population (lngini_b). Note: it is not clear why the author uses the ln transformation of the Gini instead of the original index. The RDI (herf) is the instumental variable to recover the exogenous relationship between segregation (dism1990) and the gini index (lngini_b).*/
ivreg povrate_w (dism1990=herf) lenper, robust /*IV regression to estimate the causal effect of segregation (dism1990) on the poverty rate of the white population (povrate_w). The RDI (herf) is the instumental variable to recover the exogenous relationship between segregation (dism1990) and the poverty rate (povrate_w).*/
ivreg povrate_b (dism1990=herf) lenper, robust /*IV regression to estimate the causal effect of segregation (dism1990) on the poverty rate of the black population (povrate_b). The RDI (herf) is the instumental variable to recover the exogenous relationship between segregation (dism1990) and the poverty rate (povrate_b).*/


/*The following code exports the previos four regressions into a .tex table. Basically, it exports the IV regressions from table 2, panel 1. Note: this code does not replicate the exact format presented in the paper, I was unable to replicate said format*/

*Define table content 
cd "$tables"

*Number of table
local tab `i'
di "`tab'"

estimates clear
local c = 1
	
foreach var of varlist lngini_w lngini_b povrate_w  povrate_b {	


		foreach con in dism1990 {	

			eststo regs`c': ivreg `var' (`con'=herf) lenper, r

			
qui sum `e(depvar)' if e(sample) 
local medi `r(mean)'

estadd scalar med=`medi' : regs`c' // Recuperamos la media de la variable dependiente.
qui unique name if e(sample) // Contamos cuantas observaciones hay.
estadd scalar part = `r(unique)': regs`c' // Guardamos número anterior en un escalar.

local estimates`c' `estimates1' regs`c'

			local c = `c'+1
		}
	}
	
	

*Keep coefficients
local coefs _cons dism1990 lenper /*Run this code with the table */

*-------------------------------------------------------------------------------
*Tex table
*Tile of table
local title_tab "The Effects of Segregation on Poverty and Inequality Amoung Blacks and Whites (IV)"
local titles "& \multicolumn{4}{c}{\makecell{Main results: 2SLS RDI as instrument for \\ 1990 dissimilarity}} \\ \cmidrule{2-5} & \multicolumn{2}{c}{Gini Index} & \multicolumn{2}{c}{Poverty rate} \\"
local numbers " \cmidrule(lr){2-3} \cmidrule(lr){4-5} & Whites & Blacks & Whites & Blacks  \\ \midrule"

esttab `estimates1'  using "table2_IV.tex", 					     ///
replace b(3) lines se bookt nodepvars 							 ///
star(* 0.10 ** 0.05 *** 0.01) fragment label                     ///
eqlabels(none) keep(dism1990) ///
coeflabels(dism1990 "Dissimilarity Index" ) ///
collabels(none) nomtitles title(\label(table2)) substitute(\_ _) ///
nonumbers posthead( " `titles'  `numbers' ")                       ///
prehead(\begin{table}[H]										 ///
		\centering 												 ///
		\scalebox{0.8}{ 											 ///
		\begin{threeparttable} 									 ///
	 \caption{`title_tab'} ///
		\begin{tabular}{lccccccc} 								 ///
		\toprule[0.5pt] \toprule[0.5pt])
		

esttab `estimates1'  using "table2_IV.tex", 					     ///
append b(3) plain se bookt nodepvars nonumbers					 ///
star(* 0.10 ** 0.05 *** 0.01) fragment label                     ///
eqlabels(none) drop(`coefs')                          ///
stats(med r2, fmt(3 3 0 0) ///
labels("Mean Dep. Variable" "R Squared")) ///
collabels(none) nomtitles posthead(\midrule) ///
postfoot(\bottomrule[0.5pt]  									 ///
         \label{tab:table2} 								 ///
         \end{tabular} 											 ///
		 \vspace{-13pt} 										 ///
         \begin{tablenotes}[flushleft]{\setlength{\itemindent}{-3pt}} ///
         \small 												 ///
         \item Notes: Gini Index are logged. Controls for total track lenght. Robust standard errors in   parentheses.   ///
         \end{tablenotes} 										 ///
         \end{threeparttable} 									 /// 
         } 														 ///
         \end{table})


/*The four following regressions are falsification checks to prove that the instrument (herf) does not affect the outcomes of interest in cities far from the South. This is done to test for the possibility that the Railroad Index is affecting poverty and inequality directly rather than only through racial residential segregation. These falsification checks are performed with cities far from the South (closeness<-400) since those areas were minimally affected by the Great Migration. These regressions control for total track lenght (lenper) to assure that RDI represents the configuration of track conditional on total track. The standard errors are robust to heteroskedasticity.*/
reg lngini_w herf lenper if closeness<-400, robust /*OLS regression to test for the possibility that RDI is directly affecting inequality within the white population (lngini_w) in cities far from the South. */
reg lngini_b herf lenper if closeness<-400, robust /*OLS regression to test for the possibility that RDI is directly affecting inequality within the black population (lngini_b) in cities far from the South. */
reg povrate_w herf lenper if closeness<-400, robust /*OLS regression to test for the possibility that RDI is directly affecting the poverty rate within the white population (povrate_w) in cities far from the South. */
reg povrate_b herf lenper if closeness<-400, robust  /*OLS regression to test for the possibility that RDI is directly affecting the poverty rate within the black population (povrate_b) in cities far from the South. */

/*The following code exports the previos four regressions into a .tex table. Basically, it exports the falsification regressions from table 2, panel 1. Note: this code does not replicate the exact format presented in the paper, I was unable to replicate said format*/

*Define table content 
cd "$tables"

*Number of table
local tab `i'
di "`tab'"

estimates clear
local c = 1
	
foreach var of varlist lngini_w lngini_b povrate_w  povrate_b {	


		foreach con in herf {	

			eststo regs`c': reg `var' `con' lenper if closeness<-400, r

			
qui sum `e(depvar)' if e(sample) 
local medi `r(mean)'

estadd scalar med=`medi' : regs`c' // Recuperamos la media de la variable dependiente.
qui unique name if e(sample) // Contamos cuantas observaciones hay.
estadd scalar part = `r(unique)': regs`c' // Guardamos número anterior en un escalar.

local estimates`c' `estimates1' regs`c'

			local c = `c'+1
		}
	}
	
	

*Keep coefficients
local coefs _cons herf lenper/*Run this code with the table */

*-------------------------------------------------------------------------------
*Tex table
*Tile of table
local title_tab "The Effects of Segregation on Poverty and Inequality Amoung Blacks and Whites (Falsification)"
local titles "& \multicolumn{4}{c}{\makecell{Falsification: Reduced form effect of RDI \\ among cities far from the south }} & \\ \cmidrule{2-5} & \multicolumn{2}{c}{Gini Index} & \multicolumn{2}{c}{Poverty rate} \\"
local numbers " \cmidrule(lr){2-3} \cmidrule(lr){4-5} & Whites & Blacks & Whites & Blacks  \\ \midrule"

esttab `estimates1'  using "table2_falsification.tex", 					     ///
replace b(3) lines se bookt nodepvars 							 ///
star(* 0.10 ** 0.05 *** 0.01) fragment label                     ///
eqlabels(none) keep(herf) ///
coeflabels(herf "RDI" ) ///
collabels(none) nomtitles title(\label(table2)) substitute(\_ _) ///
nonumbers posthead( " `titles'  `numbers' ")                       ///
prehead(\begin{table}[H]										 ///
		\centering 												 ///
		\scalebox{0.8}{ 											 ///
		\begin{threeparttable} 									 ///
	 \caption{`title_tab'} ///
		\begin{tabular}{lccccccc} 								 ///
		\toprule[0.5pt] \toprule[0.5pt])
		

esttab `estimates1'  using "table2_falsification.tex", 					     ///
append b(3) plain se bookt nodepvars nonumbers					 ///
star(* 0.10 ** 0.05 *** 0.01) fragment label                     ///
eqlabels(none) drop(`coefs')                          ///
stats(med r2, fmt(3 3 0 0) ///
labels("Mean Dep. Variable" "R Squared")) ///
collabels(none) nomtitles posthead(\midrule) ///
postfoot(\bottomrule[0.5pt]  									 ///
         \label{tab:table2} 								 ///
         \end{tabular} 											 ///
		 \vspace{-13pt} 										 ///
         \begin{tablenotes}[flushleft]{\setlength{\itemindent}{-3pt}} ///
         \small 												 ///
         \item Notes: Gini Index are logged. Controls for total track lenght. Robust standard errors in   parentheses.   ///
         \end{tablenotes} 										 ///
         \end{threeparttable} 									 /// 
         } 														 ///
         \end{table})


****table 2, panel 2****
/*The four following regressions are OLS estimations to examine the effect of segregation (dism1990) on inequality between blacks and whites. Note: it is not clear how the author constructed the variables of interest or how they capture between race inequality. The standard errors are robust to heteroskedasticity. */

reg ln90w90b dism1990, robust /*OLS regression to identify the effect of segregation (dism1990) on inequality between well-off whites and well-off blacks (those in the 90th percentile of each income distribution).*/
reg ln10w10b dism1990, robust /*OLS regression to identify the effect of segregation (dism1990) on inequality between worst-off whites and worst-off blacks (those in the 10th percentile of each income distribution).*/
reg ln90w10b dism1990, robust /*OLS regression to identify the effect of segregation (dism1990) on inequality between well-off whites (those in the 90th percentile of income distribution) and worst-off blacks (those in the 10th percentile of income distribution).*/
reg ln90b10w dism1990, robust /*OLS regression to identify the effect of segregation (dism1990) on inequality between well-off blacks (those in the 90th percentile of income distribution) and worst-off whites (those in the 10th percentile of income distribution).*/ 


/*The four following regressions are IV estimations to examine the effect of segregation (dism1990) on inequality between blacks and whites. Note: it is not clear how the author constructed the variables of interest or how they capture between race inequality. The Railroad Division Index (herf) is used as an instrumental variable of segregation (dism1990) to recover the causal effect of segregation on the outcomes of interest. These regressions control for total track lenght (lenper) to assure that RDI represents the configuration of track conditional on total track. The standard errors are robust to heteroskedasticity. */

ivreg ln90w90b (dism1990=herf) lenper, robust /*IV regression to identify the causal effect of segregation (dism1990) on inequality between well-off whites and well-off blacks (those in the 90th percentile of each income distribution). The RDI (herf) is the instumental variable to recover the exogenous relationship between segregation (dism1990) and between-race inequality */
ivreg ln10w10b (dism1990=herf) lenper, robust /*IV regression to identify the causal effect of segregation (dism1990) on inequality between worst-off whites and worst-off blacks (those in the 10th percentile of each income distribution). The RDI (herf) is the instumental variable to recover the exogenous relationship between segregation (dism1990) and between-race inequality */
ivreg ln90w10b (dism1990=herf) lenper, robust /*IV regression to identify the causal effect of segregation (dism1990) on inequality between well-off whites (those in the 90th percentile of income distribution) and worst-off blacks (those in the 10th percentile of income distribution).The RDI (herf) is the instumental variable to recover the exogenous relationship between segregation (dism1990) and between-race inequality */
ivreg ln90b10w (dism1990=herf) lenper, robust /*IV regression to identify the causal effect of segregation (dism1990) on inequality between well-off blacks (those in the 90th percentile of income distribution) and worst-off whites (those in the 10th percentile of income distribution). The RDI (herf) is the instumental variable to recover the exogenous relationship between segregation (dism1990) and between-race inequality */



/*The four following regressions are falsification checks to prove that the instrument (herf) does not affect the outcomes of interest in cities far from the South. This is done to test for the possibility that the Railroad Index is affecting between-race inequality directly, rather than only through racial residential segregation. These falsification checks are performed with cities far from the South (closeness<-400) since those areas were minimally affected by the Great Migration. These regressions control for total track lenght (lenper) to assure that RDI represents the configuration of track conditional on total track. The standard errors are robust to heteroskedasticity.*/

reg ln90w90b herf lenper if closeness<-400, robust /*OLS regression to test for the possibility that RDI is directly affecting inequality between well-off whites and well-off blacks (those in the 90th percentile of each income distribution) in cities far from the South. */
reg ln10w10b herf lenper if closeness<-400, robust /*OLS regression to test for the possibility that RDI is directly affecting inequality between worst-off whites and worst-off blacks (those in the 10th percentile of each income distribution) in cities far from the South. */
reg ln90w10b herf lenper if closeness<-400, robust /*OLS regression to test for the possibility that RDI is directly affecting inequality between well-off whites (those in the 90th percentile of income distribution) and worst-off blacks (those in the 10th percentile of income distribution) in cities far from the South. */
reg ln90b10w herf lenper if closeness<-400, robust /*OLS regression to test for the possibility that RDI is directly affecting inequality between well-off blacks (those in the 90th percentile of income distribution) and worst-off whites (those in the 10th percentile of income distribution) in cities far from the South. */



****table 3****
/*Table 3 regressions are robustness checks that replicate the main 2SLS estimates of the effect of segregation (dism1990) on black and white Gini indexes and poverty rates while controlling for different city characteristics. These are done to prove that the relationship between the instrument (herf) and the outcomes of interest is only induced through segregation and not through other characteristics. These regressions control for total track lenght (lenper) to assure that RDI represents the configuration of track conditional on total track. The standard errors are robust to heteroskedasticity. */

ivreg lngini_w (dism1990=herf) lenper pop1990, robust /*Same specification as the IV regression to estimate the causal effect of segregation (dism1990) on the natural logarithm of the Gini index for the white population (lngini_w) in table 2, but controlling for 1990 population (pop1990). */
ivreg lngini_b (dism1990=herf) lenper pop1990, robust /*Same specification as the IV regression to estimate the causal effect of segregation (dism1990) on the natural logarithm of the Gini index for the black population (lngini_b) in table 2, but controlling for 1990 population (pop1990). */
ivreg povrate_w (dism1990=herf) lenper pop1990, robust /*Same specification as the IV regression to estimate the causal effect of segregation (dism1990) on the poverty rate for the white population (povrate_w) in table 2, but controlling for 1990 population (pop1990). */
ivreg povrate_b (dism1990=herf) lenper pop1990, robust /*Same specification as the IV regression to estimate the causal effect of segregation (dism1990) on the poverty rate for the black population (povrate_b) in table 2, but controlling for 1990 population (pop1990). */


ivreg lngini_w (dism1990=herf) lenper pctbk1990, robust /*Same specification as the IV regression to estimate the causal effect of segregation (dism1990) on the natural logarithm of the Gini index for the white population (lngini_w) in table 2, but controlling for percent of black population in 1990 (pctbk1990). */
ivreg lngini_b (dism1990=herf) lenper pctbk1990, robust /*Same specification as the IV regression to estimate the causal effect of segregation (dism1990) on the natural logarithm of the Gini index for the black population (lngini_b) in table 2, but controlling for percent of black population in 1990 (pctbk1990). */
ivreg povrate_w (dism1990=herf) lenper pctbk1990, robust /*Same specification as the IV regression to estimate the causal effect of segregation (dism1990) on the poverty rate for the white population (povrate_w) in table 2, but controlling for percent of black population in 1990 (pctbk1990). */
ivreg povrate_b (dism1990=herf) lenper pctbk1990, robust /*Same specification as the IV regression to estimate the causal effect of segregation (dism1990) on the poverty rate for the black population (povrate_b) in table 2, but controlling for percent of black population in 1990 (pctbk1990). */


ivreg lngini_w (dism1990=herf) lenper hsdrop_w- collgrad_b, robust /*Same specification as the IV regression to estimate the causal effect of segregation (dism1990) on the natural logarithm of the Gini index for the white population (lngini_w) in table 2, but controlling for all the variables related to education in 1990 (high school drop-out and graduation, some college and college graduate both for blacks and whites.) However, due to multicollinearity, two of the variables (white high school grad and black college grad) are omitted. Therefore, the right specification should exclude a baseline education category for the black population and a baseline education cateogry for the white population to avoid the perfect multicollinearity that exists between these variables. */
ivreg lngini_b (dism1990=herf) lenper hsdrop_w- collgrad_b, robust /*Same specification as the IV regression to estimate the causal effect of segregation (dism1990) on the natural logarithm of the Gini index for the black population (lngini_b) in table 2, but controlling for all the variables related to education in 1990 (high school drop-out and graduation, some college and college graduate both for blacks and whites.) However, due to multicollinearity, two of the variables (white high school grad and black college grad) are omitted. Therefore, the right specification should exclude a baseline education category for the black population and a baseline education cateogry for the white population to avoid the perfect multicollinearity that exists between these variables. */
ivreg povrate_w (dism1990=herf) lenper hsdrop_w- collgrad_b, robust /*Same specification as the IV regression to estimate the causal effect of segregation (dism1990) on the poverty rate for the white population (povrate_w) in table 2, but controlling for all the variables related to education in 1990 (high school drop-out and graduation, some college and college graduate both for blacks and whites.) However, due to multicollinearity, two of the variables (white high school grad and black college grad) are omitted. Therefore, the right specification should exclude a baseline education category for the black population and a baseline education cateogry for the white population to avoid the perfect multicollinearity that exists between these variables. */
ivreg povrate_b (dism1990=herf) lenper hsdrop_w- collgrad_b, robust /*Same specification as the IV regression to estimate the causal effect of segregation (dism1990) on the poverty rate for the black population (povrate_b) in table 2, but controlling for all the variables related to education in 1990 (high school drop-out and graduation, some college and college graduate both for blacks and whites.) However, due to multicollinearity, two of the variables (white high school grad and black college grad) are omitted. Therefore, the right specification should exclude a baseline education category for the black population and a baseline education cateogry for the white population to avoid the perfect multicollinearity that exists between these variables. */


ivreg lngini_w (dism1990=herf) lenper manshr, robust /*Same specification as the IV regression to estimate the causal effect of segregation (dism1990) on the natural logarithm of the Gini index for the white population (lngini_w) in table 2, but controlling for the share employed in manufacturing in 1990 (manshr). */
ivreg lngini_b (dism1990=herf) lenper manshr, robust /*Same specification as the IV regression to estimate the causal effect of segregation (dism1990) on the natural logarithm of the Gini index for the black population (lngini_b) in table 2, but controlling for the share employed in manufacturing in 1990 (manshr). */
ivreg povrate_w (dism1990=herf) lenper manshr, robust /*Same specification as the IV regression to estimate the causal effect of segregation (dism1990) on the poverty rate for the white population (povrate_w) in table 2, but controlling for the share employed in manufacturing in 1990 (manshr).  */
ivreg povrate_b (dism1990=herf) lenper manshr, robust /*Same specification as the IV regression to estimate the causal effect of segregation (dism1990) on the poverty rate for the black population (povrate_b) in table 2, but controlling for the share employed in manufacturing in 1990 (manshr). */
 

ivreg lngini_w (dism1990=herf) lenper lfp_w lfp_b, robust /*Same specification as the IV regression to estimate the causal effect of segregation (dism1990) on the natural logarithm of the Gini index for the white population (lngini_w) in table 2, but controlling for the white (lfp_w) and black (lfp_b) labor force participation in 1990. */
ivreg lngini_b (dism1990=herf) lenper lfp_w lfp_b, robust /*Same specification as the IV regression to estimate the causal effect of segregation (dism1990) on the natural logarithm of the Gini index for the black population (lngini_b) in table 2, but controlling for the white (lfp_w) and black (lfp_b) labor force participation in 1990. */
ivreg povrate_w (dism1990=herf) lenper lfp_w lfp_b, robust /*Same specification as the IV regression to estimate the causal effect of segregation (dism1990) on the poverty rate for the white population (povrate_w) in table 2, but controlling for the white (lfp_w) and black (lfp_b) labor force participation in 1990. */
ivreg povrate_b (dism1990=herf) lenper lfp_w lfp_b, robust /*Same specification as the IV regression to estimate the causal effect of segregation (dism1990) on the poverty rate for the black population (povrate_b) in table 2, but controlling for the white (lfp_w) and black (lfp_b) labor force participation in 1990. */


ivreg lngini_w (dism1990=herf) lenper ngov, robust /*Same specification as the IV regression to estimate the causal effect of segregation (dism1990) on the natural logarithm of the Gini index for the white population (lngini_w) in table 2, but controlling for the number of local governments (N=69). */ 
ivreg lngini_b (dism1990=herf) lenper ngov, robust /*Same specification as the IV regression to estimate the causal effect of segregation (dism1990) on the natural logarithm of the Gini index for the black population (lngini_b) in table 2, but controlling for the number of local governments (N=69). */ 
ivreg povrate_w (dism1990=herf) lenper ngov, robust /*Same specification as the IV regression to estimate the causal effect of segregation (dism1990) on the poverty rate for the white population (povrate_w) in table 2, but controlling for the number of local governments (N=69). */ 
ivreg povrate_b (dism1990=herf) lenper ngov, robust /*Same specification as the IV regression to estimate the causal effect of segregation (dism1990) on the poverty rate for the black population (povrate_b) in table 2, but controlling for the number of local governments (N=69). */ 


ivreg lngini_w (dism1990=herf) lenper count1920, robust /*Same specification as the IV regression to estimate the causal effect of segregation (dism1990) on the natural logarithm of the Gini index for the white population (lngini_w) in table 2, but controlling for 1920 population (count1920). */
ivreg lngini_b (dism1990=herf) lenper count1920, robust /*Same specification as the IV regression to estimate the causal effect of segregation (dism1990) on the natural logarithm of the Gini index for the black population (lngini_b) in table 2, but controlling for 1920 population (count1920). */
ivreg povrate_w (dism1990=herf) lenper count1920, robust /*Same specification as the IV regression to estimate the causal effect of segregation (dism1990) on the poverty rate for the white population (povrate_w) in table 2, but controlling for 1920 population (count1920). */ 
ivreg povrate_b (dism1990=herf) lenper count1920, robust /*Same specification as the IV regression to estimate the causal effect of segregation (dism1990) on the poverty rate for the black population (povrate_b) in table 2, but controlling for 1920 population (count1920). */



ivreg lngini_w (dism1990=herf) lenper black1920, robust /*Same specification as the IV regression to estimate the causal effect of segregation (dism1990) on the natural logarithm of the Gini index for the white population (lngini_w) in table 2, but controlling for percent of black population in 1920 (black1920). */
ivreg lngini_b (dism1990=herf) lenper black1920, robust /*Same specification as the IV regression to estimate the causal effect of segregation (dism1990) on the natural logarithm of the Gini index for the black population (lngini_b) in table 2, but controlling for percent of black population in 1920 (black1920). */
ivreg povrate_w (dism1990=herf) lenper black1920, robust /*Same specification as the IV regression to estimate the causal effect of segregation (dism1990) on the poverty rate for the white population (povrate_w) in table 2, but controlling for percent of black population in 1920 (black1920). */
ivreg povrate_b (dism1990=herf) lenper black1920, robust /*Same specification as the IV regression to estimate the causal effect of segregation (dism1990) on the poverty rate for the black population (povrate_b) in table 2, but controlling for percent of black population in 1920 (black1920). */



ivreg lngini_w (dism1990=herf) lenper ctyliterate1920, robust /*Same specification as the IV regression to estimate the causal effect of segregation (dism1990) on the natural logarithm of the Gini index for the white population (lngini_w) in table 2, but controlling for percent of literates in 1920 (ctyliterate1920). */
ivreg lngini_b (dism1990=herf) lenper ctyliterate1920, robust /*Same specification as the IV regression to estimate the causal effect of segregation (dism1990) on the natural logarithm of the Gini index for the black population (lngini_b) in table 2, but controlling for percent of literates in 1920 (ctyliterate1920). */
ivreg povrate_w (dism1990=herf) lenper ctyliterate1920, robust /*Same specification as the IV regression to estimate the causal effect of segregation (dism1990) on the poverty rate for the white population (povrate_w) in table 2, but controlling for percent of literates in 1920 (ctyliterate1920). */
ivreg povrate_b (dism1990=herf) lenper ctyliterate1920, robust /*Same specification as the IV regression to estimate the causal effect of segregation (dism1990) on the poverty rate for the black population (povrate_b) in table 2, but controlling for percent of literates in 1920 (ctyliterate1920). */



ivreg lngini_w (dism1990=herf) lenper ctymanuf_wkrs1920, robust /*Same specification as the IV regression to estimate the causal effect of segregation (dism1990) on the natural logarithm of the Gini index for the white population (lngini_w) in table 2, but controlling for the share employed in manufacturing in 1920 (ctymanuf_wkrs1920). */
ivreg lngini_b (dism1990=herf) lenper ctymanuf_wkrs1920, robust /*Same specification as the IV regression to estimate the causal effect of segregation (dism1990) on the natural logarithm of the Gini index for the black population (lngini_b) in table 2, but controlling for the share employed in manufacturing in 1920 (ctymanuf_wkrs1920). */
ivreg povrate_w (dism1990=herf) lenper ctymanuf_wkrs1920, robust /*Same specification as the IV regression to estimate the causal effect of segregation (dism1990) on the poverty rate for the white population (povrate_w) in table 2, but controlling for the share employed in manufacturing in 1920 (ctymanuf_wkrs1920). */
ivreg povrate_b (dism1990=herf) lenper ctymanuf_wkrs1920, robust /*Same specification as the IV regression to estimate the causal effect of segregation (dism1990) on the poverty rate for the black population (povrate_b) in table 2,  but controlling for the share employed in manufacturing in 1920 (ctymanuf_wkrs1920). */




ivreg lngini_w (dism1990=herf) lenper lfp1920, robust /*Same specification as the IV regression to estimate the causal effect of segregation (dism1990) on the natural logarithm of the Gini index for the white population (lngini_w) in table 2, but controlling for the labor force participation in 1920 (lfp1920). */
ivreg lngini_b (dism1990=herf) lenper lfp1920, /*Same specification as the IV regression to estimate the causal effect of segregation (dism1990) on the natural logarithm of the Gini index for the black population (lngini_b) in table 2, robust but controlling for the labor force participation in 1920 (lfp1920). */
ivreg povrate_w (dism1990=herf) lenper lfp1920, robust /*Same specification as the IV regression to estimate the causal effect of segregation (dism1990) on the poverty rate for the white population (povrate_w) in table 2, but controlling for the labor force participation in 1920 (lfp1920). */
ivreg povrate_b (dism1990=herf) lenper lfp1920, robust /*Same specification as the IV regression to estimate the causal effect of segregation (dism1990) on the poverty rate for the black population (povrate_b) in table 2, but controlling for the labor force participation in 1920 (lfp1920). */



ivreg lngini_w (dism1990=herf) lenper herfscore, robust /*Same specification as the IV regression to estimate the causal effect of segregation (dism1990) on the natural logarithm of the Gini index for the white population (lngini_w) in table 2, but controlling for a propensity score for the probability of having an above-median RDI (herfscore). */
ivreg lngini_b (dism1990=herf) lenper herfscore, robust /*Same specification as the IV regression to estimate the causal effect of segregation (dism1990) on the natural logarithm of the Gini index for the black population (lngini_b) in table 2, but controlling for a propensity score for the probability of having an above-median RDI (herfscore). */
ivreg povrate_w (dism1990=herf) lenper herfscore, robust /*Same specification as the IV regression to estimate the causal effect of segregation (dism1990) on the poverty rate for the white population (povrate_w) in table 2, but controlling for a propensity score for the probability of having an above-median RDI (herfscore). */
ivreg povrate_b (dism1990=herf) lenper herfscore, robust /*Same specification as the IV regression to estimate the causal effect of segregation (dism1990) on the poverty rate for the black population (povrate_b) in table 2, but controlling for a propensity score for the probability of having an above-median RDI (herfscore). */


****table 4****
/*The eight following regressions are OLS estimates of the effect of segregation (dism1990) on 1990 city demand variables. These regressions will produce biased results since they don't take into account that segregation is endogenous. Therefore, estimates from these regressions will underestimate the effect of segregation on 1990 city demand. The standard errors are robust to heteroskedasticity. */


reg mv_st_winus_w dism1990, robust /*OLS regression to identify the effect of segregation (dism1990) on  the percent of residents who are white in-migrants (mv_st_winus_w). */
reg mv_st_winus_b dism1990, robust /*OLS regression to identify the effect of segregation (dism1990) on  the percent of residents who are black in-migrants (mv_st_winus_b). */
reg medgrent_w dism1990, robust /*OLS regression to identify the effect of segregation (dism1990) on the median rent for whites (medgrent_w). */
reg medgrent_b dism1990, robust /*OLS regression to identify the effect of segregation (dism1990) on the median rent for blacks (medgrent_b). */
reg medgrentpinc_w dism1990, robust /*OLS regression to identify the effect of segregation (dism1990) on the median rent as a percent of income for whites (medgrentpinc_w). */
reg medgrentpinc_b dism1990, robust /*OLS regression to identify the effect of segregation (dism1990) on the median rent as a percent of income for blacks (medgrentpinc_b). */
reg mt1proom_w dism1990, robust /*OLS regression to identify the effect of segregation (dism1990) on the share of white households with more than one person per room (mt1proom_w). */
reg mt1proom_b dism1990, robust /*OLS regression to identify the effect of segregation (dism1990) on the share of black households with more than one person per room (mt1proom_b). */


/*The following code exports the previos eight regressions into a .tex table. Basically, it exports the OLS regressions from table 4. Note: this code does not replicate the exact format presented in the paper, I was unable to replicate said format*/

*Define table content 
cd "$tables"

*Number of table
local tab `i'
di "`tab'"

estimates clear
local c = 1
	
foreach var of varlist mv_st_winus_w mv_st_winus_b medgrent_w medgrent_b medgrentpinc_w medgrentpinc_b mt1proom_w mt1proom_b {	


		foreach con in dism1990 {	

			eststo regs`c': reg `var' `con', r

			
qui sum `e(depvar)' if e(sample) 
local medi `r(mean)'

estadd scalar med=`medi' : regs`c' // Recuperamos la media de la variable dependiente.
qui unique name if e(sample) // Contamos cuantas observaciones hay.
estadd scalar part = `r(unique)': regs`c' // Guardamos número anterior en un escalar.

local estimates`c' `estimates1' regs`c'

			local c = `c'+1
		}
	}
	
	

*Keep coefficients
local coefs _cons dism1990 /*Run this code with the table */

*-------------------------------------------------------------------------------
*Tex table
*Tile of table
local title_tab "The Effects of 1990 Segregation on 1990 City Demand (OLS)"
local titles " & \multicolumn{2}{c}{\makecell{Outcome: Percent of \\ residents who \\ are in-migrants}} & \multicolumn{2}{c}{Outcome: Median rent} & \multicolumn{2}{c}{\makecell{Outcome: Median rent \\ as a percent of income}} & \multicolumn{2}{c}{\makecell{Outcome: Share of \\ households with more \\ than one person per room}} \\"
local numbers " \cmidrule(lr){2-3} \cmidrule(lr){4-5} \cmidrule(lr){6-7} \cmidrule(lr){8-9} & Whites & Blacks & Whites & Blacks & Whites & Blacks & Whites & Blacks  \\ \midrule"

esttab `estimates1'  using "table4_OLS.tex", 					     ///
replace b(3) lines se bookt nodepvars 							 ///
star(* 0.10 ** 0.05 *** 0.01) fragment label                     ///
eqlabels(none) keep(dism1990) ///
coeflabels(dism1990 "Dissimilarity Index" ) ///
collabels(none) nomtitles title(\label(table2)) substitute(\_ _) ///
nonumbers posthead( " `titles'  `numbers' ")                       ///
prehead(\begin{table}[H]										 ///
		\centering 												 ///
		\scalebox{0.8}{ 											 ///
		\begin{threeparttable} 									 ///
	 \caption{`title_tab'} ///
		\begin{tabular}{lcccccccc} 								 ///
		\toprule[0.5pt] \toprule[0.5pt])
		

esttab `estimates1'  using "table4_OLS.tex", 					     ///
append b(3) plain se bookt nodepvars nonumbers					 ///
star(* 0.10 ** 0.05 *** 0.01) fragment label                     ///
eqlabels(none) drop(`coefs')                          ///
stats(med r2, fmt(3 3 0 0) ///
labels("Mean Dep. Variable" "R Squared")) ///
collabels(none) nomtitles posthead(\midrule) ///
postfoot(\bottomrule[0.5pt]  									 ///
         \label{tab:table2} 								 ///
         \end{tabular} 											 ///
		 \vspace{-13pt} 										 ///
         \begin{tablenotes}[flushleft]{\setlength{\itemindent}{-3pt}} ///
         \small 												 ///
         \item Notes: Robust standard errors in   parentheses.   ///
         \end{tablenotes} 										 ///
         \end{threeparttable} 									 /// 
         } 														 ///
         \end{table})

/*The eight following regressions are IV estimates of the effect of segregation (dism1990) on 1990 city demand variables. The RDI (herf) is the instrumental variable that allows to capture the causal effect of segregation on 1990 city demand variables. These regressions control for total track lenght (lenper) to assure that RDI (herf) represents the configuration of track conditional on total track.  The standard errors are robust to heteroskedasticity. */

ivreg mv_st_winus_w (dism1990=herf) lenper, robust /*IV regression to identify the causal effect of segregation (dism1990) on  the percent of residents who are white in-migrants (mv_st_winus_w) using the Railroad Division Index (herf) as an instrumental variable for segregation (herf). */
ivreg mv_st_winus_b (dism1990=herf) lenper, robust /*IV regression to identify the causal effect of segregation (dism1990) on  the percent of residents who are black in-migrants (mv_st_winus_b) using the Railroad Division Index (herf) as an instrumental variable for segregation (herf). */
ivreg medgrent_w (dism1990=herf) lenper, robust /*IV regression to identify the causal effect of segregation (dism1990) on the median rent for whites (medgrent_w) using the Railroad Division Index (herf) as an instrumental variable for segregation (herf). */
ivreg medgrent_b (dism1990=herf) lenper, robust /*IV regression to identify the causal effect of segregation (dism1990) on the median rent for blacks (medgrent_b) using the Railroad Division Index (herf) as an instrumental variable for segregation (herf). */
ivreg medgrentpinc_w (dism1990=herf) lenper, robust /*IV regression to identify the causal effect of segregation (dism1990) on the median rent as a percent of income for whites (medgrentpinc_w) using the Railroad Division Index (herf) as an instrumental variable for segregation (herf). */
ivreg medgrentpinc_b (dism1990=herf) lenper, robust /*IV regression to identify the causal effect of segregation (dism1990) on the median rent as a percent of income for blacks (medgrentpinc_b) using the Railroad Division Index (herf) as an instrumental variable for segregation (herf). */
ivreg mt1proom_w (dism1990=herf) lenper, robust /*IV regression to identify the causal effect of segregation (dism1990) on the share of white households with more than one person per room (mt1proom_w) using the Railroad Division Index (herf) as an instrumental variable for segregation (herf). */
ivreg mt1proom_b (dism1990=herf) lenper, robust /*IV regression to identify the causal effect of segregation (dism1990) on the share of black households with more than one person per room (mt1proom_b) using the Railroad Division Index (herf) as an instrumental variable for segregation (herf). */



/*The eight following regressions are falsification tests of the relationship between RDI (herf) and city demand in cities far from the South (closeness<-400). These estimations are done to prove that the instrument has no direct effect on city demand. These regressions control for total track lenght (lenper) to assure that RDI (herf) represents the configuration of track conditional on total track. The standard errors are robust to heteroskedasticity. */

reg mv_st_winus_w herf lenper if closeness<-400, robust /*Falsification test of the relationship between Railroad Division Index (herf) and the percent of residents who are white in-migrants (mv_st_winus_w). */
reg mv_st_winus_b herf lenper if closeness<-400, robust /*Falsification test of the relationship between Railroad Division Index (herf) and  the percent of residents who are black in-migrants (mv_st_winus_b) */
reg medgrent_w herf lenper if closeness<-400, robust /*Falsification test of the relationship between Railroad Division Index (herf) and median rent for whites (medgrent_w) */ 
reg medgrent_b herf lenper if closeness<-400, robust /*Falsification test of the relationship between Railroad Division Index (herf) and median rent for blacks (medgrent_b) */ 
reg medgrentpinc_w herf lenper if closeness<-400, robust /*Falsification test of the relationship between Railroad Division Index (herf) and median rent as a percent of income for whites (medgrentpinc_w) */
reg medgrentpinc_b herf lenper if closeness<-400, robust /*Falsification test of the relationship between Railroad Division Index (herf) and median rent as a percent of income for blacks (medgrentpinc_b) */
reg mt1proom_w herf lenper if closeness<-400, robust /*Falsification test of the relationship between Railroad Division Index (herf) and share of white households with more than one person per room (mt1proom_w) */
reg mt1proom_b herf lenper if closeness<-400, robust /*Falsification test of the relationship between Railroad Division Index (herf) and share of black households with more than one person per room (mt1proom_b) */



****table 5 ****
/*Table 5 uses a different dataset. The purpose of this data is to analyze the effect of 1980 segregation (dism1980) on human capital of 22 to 30 year olds in 1980.*/

use "$raw/table_5.dta", clear /*Load dataset that has the information for table 5*/
des /*Include code to describe the data*/

/*Label variables based on the paper*/
label var hsdrop "Share who are high school dropouts"
label var hsgrad "Share who are high school graduates"
label var somecoll "Share who have some college"
label var collgrad "Share who are college graduates"
label var dism1980 "Dissimilarity Index that captures level of racial segreation in 1980"
label var black "1 if black"
label var name "City name"
label var herf "RDI - quantifies the extent to which the city's land is divided into smaller units by railroads"
label var lenper "Track lenght per square kilometer"

save "$modified/table_5_modified.dta", replace /*Save modified data*/

/*The 8 following regressions are OLS estimates of the effect of 1980 segregation (dism1980) on human capital of 22 to 30 year olds in 1980. These regressions will produce biased results since they don't take into account that segregation is endogenous. Therefore, estimates from these regressions will underestimate the effect of segregation on human capital. The standard errors are clustered at the city label (name) to correct for arbitrary nonindependence of observations within a city. Estimates also control for age levels (agedum* are dummies for group ages from 22 to 30). Note: the specifications for this table should exclude one age dummy due to perfect multicollinearity. */

reg hsdrop dism1980 agedum* if black==0, cluster(name) /*OLS regression to identify the effect of 1980 segregation (dism1980) on the share of whites (black==0) who are high school dropouts (hsdrop).*/
reg hsdrop dism1980 agedum* if black==1, cluster(name) /*OLS regression to identify the effect of 1980 segregation (dism1980) on the share of blacks (black==1) who are high school dropouts (hsdrop).*/
reg hsgrad dism1980 agedum* if black==0, cluster(name) /*OLS regression to identify the effect of 1980 segregation (dism1980) on the share of whites (black==0) who are high school graduates (hsgrad).*/
reg hsgrad dism1980 agedum* if black==1, cluster(name) /*OLS regression to identify the effect of 1980 segregation (dism1980) on the share of blacks (black==1) who are high school graduates (hsgrad).*/
reg somecoll dism1980 agedum* if black==0, cluster(name) /*OLS regression to identify the effect of 1980 segregation (dism1980) on the share of whites (black==0) who have some college (somecoll).*/
reg somecoll dism1980 agedum* if black==1, cluster(name) /*OLS regression to identify the effect of 1980 segregation (dism1980) on the share of blacks (black==1) who have some college (somecoll).*/
reg collgrad dism1980 agedum* if black==0, cluster(name) /*OLS regression to identify the effect of 1980 segregation (dism1980) on the share of whites (black==0) who are college graduates (collgrad).*/
reg collgrad dism1980 agedum* if black==1, cluster(name) /*OLS regression to identify the effect of 1980 segregation (dism1980) on the share of blacks (black==1) who are college graduates (collgrad).*/



/*The 8 following regressions are IV estimates of the effect of 1980 segregation (dism1980) on human capital of 22 to 30 year olds in 1980. The RDI (herf) is the instrumental variable that allows to capture the causal effect of 1980 segregation on human capital. These regressions control for total track lenght (lenper) to assure that RDI (herf) represents the configuration of track conditional on total track. The standard errors are clustered at the city label (name) to correct for arbitrary nonindependence of observations within a city. Estimates also control for age levels (agedum* are dummies for group ages from 22 to 30)  */

ivreg hsdrop (dism1980=herf) lenper agedum* if black==0, cluster(name) /*IV regression to identify the causal effect of 1980 segregation (dism1980) on the share of whites (black==0) who are high school dropouts (hsdrop). */
ivreg hsdrop (dism1980=herf) lenper  agedum* if black==1, cluster(name) /*IV regression to identify the causal effect of 1980 segregation (dism1980) on the share of blacks (black==1) who are high school dropouts (hsdrop).*/
ivreg hsgrad (dism1980=herf) lenper  agedum* if black==0, cluster(name) /*IV regression to identify the causal effect of 1980 segregation (dism1980) on the share of whites (black==0) who are high school graduates (hsgrad).*/
ivreg hsgrad (dism1980=herf) lenper  agedum* if black==1, cluster(name) /*IV regression to identify the causal effect of 1980 segregation (dism1980) on the share of blacks (black==1) who are high school graduates (hsgrad).*/
ivreg somecoll (dism1980=herf) lenper  agedum* if black==0, cluster(name) /*IV regression to identify the causal effect of 1980 segregation (dism1980) on the share of whites (black==0) who have some college (somecoll).*/
ivreg somecoll (dism1980=herf) lenper  agedum* if black==1, cluster(name) /*IV regression to identify the causal effect of 1980 segregation (dism1980) on the share of blacks (black==1) who have some college (somecoll).*/
ivreg collgrad (dism1980=herf) lenper  agedum* if black==0, cluster(name) /*IV regression to identify the causal effect of 1980 segregation (dism1980) on the share of whites (black==0) who are college graduates (collgrad).*/
ivreg collgrad (dism1980=herf) lenper  agedum* if black==1, cluster(name) /*IV regression to identify the causal effect of 1980 segregation (dism1980) on the share of blacks (black==1) who are college graduates (collgrad).*/


/*The eight following regressions are falsification tests of the relationship between RDI (herf) and human capital in cities far from the South (closeness<-400). These estimations are done to prove that the instrument (herf) has no direct effect on human capital. These regressions control for total track lenght (lenper) to assure that RDI (herf) represents the configuration of track conditional on total track. Estimates also control for age levels (agedum* are dummies for group ages from 22 to 30). The standard errors are clustered at the city label (name) to correct for arbitrary nonindependence of observations within a city. */

reg hsdrop herf lenper agedum* if black==0 & closeness<-400, cluster(name) /*Falsification test of the relationship between Railroad Division Index (herf) and the share of whites (black==0) who are high school dropouts (hsdrop). */
reg hsdrop herf lenper agedum* if black==1 & closeness<-400, cluster(name) /*Falsification test of the relationship between Railroad Division Index (herf) and  the share of blacks (black==1) who are high school dropouts (hsdrop). */
reg hsgrad herf lenper agedum* if black==0 & closeness<-400, cluster(name) /*Falsification test of the relationship between Railroad Division Index (herf) and the share of whites (black==0) who are high school graduates (hsgrad). */
reg hsgrad herf lenper agedum* if black==1 & closeness<-400, cluster(name) /*Falsification test of the relationship between Railroad Division Index (herf) and the share of blacks (black==1) who are high school graduates (hsgrad). */
reg somecoll herf lenper agedum* if black==0 & closeness<-400, cluster(name) /*Falsification test of the relationship between Railroad Division Index (herf) and the share of whites (black==0) who have some college (somecoll). */
reg somecoll herf lenper agedum* if black==1 & closeness<-400, cluster(name) /*Falsification test of the relationship between Railroad Division Index (herf) and the share of blacks (black==1) who have some college (somecoll). */
reg collgrad herf lenper agedum* if black==0 & closeness<-400, cluster(name) /*Falsification test of the relationship between Railroad Division Index (herf) and the share of whites (black==0) who are college graduates (collgrad). */
reg collgrad herf lenper agedum* if black==1 & closeness<-400, cluster(name) /*Falsification test of the relationship between Railroad Division Index (herf) and the share of blacks (black==1) who are college graduates (collgrad).*/




**** table A1 ****

use "$raw/table_A1.dta", clear /*Load dataset that has the information for table A1. This is a table presented in the paper's appendix.*/
*all data from CGV, except indicator for "in my sample"
des /*Include code to describe the data*/

for var pop1890-central: ttest X, by(sample) /*This code is to perform ttest for each variable in the dataset between in an out of sample. It is not clear which value of the variable "sample" represents the in sample and which value represents the out sample. */

/*Note: there is no code to replicate the graphs*/
