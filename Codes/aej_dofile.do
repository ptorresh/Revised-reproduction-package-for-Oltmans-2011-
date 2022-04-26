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


* Results - tables
global results "$user/Results"


use "$data/aej_maindata.dta", clear /* Load the data provided by the author.*/
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
label var collgrad_b "Percentage of blacks that graduated college" /*I'm not sure about this one, but following the paper and the code it might be.*/
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
label var hsdrop "Share who are high school dropouts"
label var hsgrad "Share who are high school graduates"
label var somecoll "Share who have some college"
label var collgrad "Share who are college graduates"

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


/*The four following regressions are IV estimations of the effect of segregation (dism1990) on within-race poverty and inequality. The Railroad Division Index (herf) is used as an instrumental variable of segregation (dism1990) to recover the causal effect of segregation on the outcomes of interest. These regressions control for total track lenght (lenper) to assure that RDI represents the configuration of track conditional on total track. The standard errors are robust to heteroskedasticity.*/
ivreg lngini_w (dism1990=herf) lenper, robust /*IV regression to estimate the causal effect of segregation (dism1990) on the natural logarithm of the Gini index for the white population (lngini_w). Note: it is not clear why the author uses the ln transformation of the Gini instead of the original index. The RDI (herf) is the instumental variable to recover the exogenous relationship between segregation (dism1990) and the gini index (lngini_w).*/
ivreg lngini_b (dism1990=herf) lenper, robust /*IV regression to estimate the causal effect of segregation (dism1990) on the natural logarithm of the Gini index for the black population (lngini_b). Note: it is not clear why the author uses the ln transformation of the Gini instead of the original index. The RDI (herf) is the instumental variable to recover the exogenous relationship between segregation (dism1990) and the gini index (lngini_b).*/
ivreg povrate_w (dism1990=herf) lenper, robust /*IV regression to estimate the causal effect of segregation (dism1990) on the poverty rate of the white population (povrate_w). The RDI (herf) is the instumental variable to recover the exogenous relationship between segregation (dism1990) and the poverty rate (povrate_w).*/
ivreg povrate_b (dism1990=herf) lenper, robust /*IV regression to estimate the causal effect of segregation (dism1990) on the poverty rate of the black population (povrate_b). The RDI (herf) is the instumental variable to recover the exogenous relationship between segregation (dism1990) and the poverty rate (povrate_b).*/


/*The four following regressions are falsification checks to prove that the instrument (herf) does not affect the outcomes of interest in cities far from the South. This is done to test for the possibility that the Railroad Index is affecting poverty and inequality directly rather than only through racial residential segregation. These falsification checks are performed with cities far from the South (closeness<-400) since those areas were minimally affected by the Great Migration. These regressions control for total track lenght (lenper) to assure that RDI represents the configuration of track conditional on total track. The standard errors are robust to heteroskedasticity.*/
reg lngini_w herf lenper if closeness<-400, robust /*OLS regression to test for the possibility that RDI is directly affecting inequality within the white population (lngini_w) in cities far from the South. */
reg lngini_b herf lenper if closeness<-400, robust /*OLS regression to test for the possibility that RDI is directly affecting inequality within the black population (lngini_b) in cities far from the South. */
reg povrate_w herf lenper if closeness<-400, robust /*OLS regression to test for the possibility that RDI is directly affecting the poverty rate within the white population (povrate_w) in cities far from the South. */
reg povrate_b herf lenper if closeness<-400, robust  /*OLS regression to test for the possibility that RDI is directly affecting the poverty rate within the black population (povrate_b) in cities far from the South. */



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

ivreg lngini_w (dism1990=herf) lenper pop1990, robust /*Same especification as the IV regression to estimate the causal effect of segregation (dism1990) on the natural logarithm of the Gini index for the white population (lngini_w) in table 2, but controlling for 1990 population (pop1990). */
ivreg lngini_b (dism1990=herf) lenper pop1990, robust /*Same especification as the IV regression to estimate the causal effect of segregation (dism1990) on the natural logarithm of the Gini index for the black population (lngini_b) in table 2, but controlling for 1990 population (pop1990). */
ivreg povrate_w (dism1990=herf) lenper pop1990, robust /*Same especification as the IV regression to estimate the causal effect of segregation (dism1990) on the poverty rate for the white population (povrate_w) in table 2, but controlling for 1990 population (pop1990). */
ivreg povrate_b (dism1990=herf) lenper pop1990, robust /*Same especification as the IV regression to estimate the causal effect of segregation (dism1990) on the poverty rate for the black population (povrate_b) in table 2, but controlling for 1990 population (pop1990). */

ivreg lngini_w (dism1990=herf) lenper pctbk1990, robust /*Same especification as the IV regression to estimate the causal effect of segregation (dism1990) on the natural logarithm of the Gini index for the white population (lngini_w) in table 2, but controlling for percent of black population in 1990 (pctbk1990). */
ivreg lngini_b (dism1990=herf) lenper pctbk1990, robust /*Same especification as the IV regression to estimate the causal effect of segregation (dism1990) on the natural logarithm of the Gini index for the black population (lngini_b) in table 2, but controlling for percent of black population in 1990 (pctbk1990). */
ivreg povrate_w (dism1990=herf) lenper pctbk1990, robust /*Same especification as the IV regression to estimate the causal effect of segregation (dism1990) on the poverty rate for the white population (povrate_w) in table 2, but controlling for percent of black population in 1990 (pctbk1990). */
ivreg povrate_b (dism1990=herf) lenper pctbk1990, robust /*Same especification as the IV regression to estimate the causal effect of segregation (dism1990) on the poverty rate for the black population (povrate_b) in table 2, but controlling for percent of black population in 1990 (pctbk1990). */


ivreg lngini_w (dism1990=herf) lenper hsdrop_w- collgrad_b, robust
ivreg lngini_b (dism1990=herf) lenper hsdrop_w- collgrad_b, robust
ivreg povrate_w (dism1990=herf) lenper hsdrop_w- collgrad_b, robust
ivreg povrate_b (dism1990=herf) lenper hsdrop_w- collgrad_b, robust


ivreg lngini_w (dism1990=herf) lenper manshr, robust
ivreg lngini_b (dism1990=herf) lenper manshr, robust
ivreg povrate_w (dism1990=herf) lenper manshr, robust
ivreg povrate_b (dism1990=herf) lenper manshr, robust
 

ivreg lngini_w (dism1990=herf) lenper lfp_w lfp_b, robust
ivreg lngini_b (dism1990=herf) lenper lfp_w lfp_b, robust
ivreg povrate_w (dism1990=herf) lenper lfp_w lfp_b, robust
ivreg povrate_b (dism1990=herf) lenper lfp_w lfp_b, robust


ivreg lngini_w (dism1990=herf) lenper ngov, robust
ivreg lngini_b (dism1990=herf) lenper ngov, robust
ivreg povrate_w (dism1990=herf) lenper ngov, robust
ivreg povrate_b (dism1990=herf) lenper ngov, robust



ivreg lngini_w (dism1990=herf) lenper count1920, robust
ivreg lngini_b (dism1990=herf) lenper count1920, robust
ivreg povrate_w (dism1990=herf) lenper count1920, robust
ivreg povrate_b (dism1990=herf) lenper count1920, robust



ivreg lngini_w (dism1990=herf) lenper black1920, robust
ivreg lngini_b (dism1990=herf) lenper black1920, robust
ivreg povrate_w (dism1990=herf) lenper black1920, robust
ivreg povrate_b (dism1990=herf) lenper black1920, robust




ivreg lngini_w (dism1990=herf) lenper ctyliterate1920, robust
ivreg lngini_b (dism1990=herf) lenper ctyliterate1920, robust
ivreg povrate_w (dism1990=herf) lenper ctyliterate1920, robust
ivreg povrate_b (dism1990=herf) lenper ctyliterate1920, robust

ivreg lngini_w (dism1990=herf) lenper ctymanuf_wkrs1920, robust
ivreg lngini_b (dism1990=herf) lenper ctymanuf_wkrs1920, robust
ivreg povrate_w (dism1990=herf) lenper ctymanuf_wkrs1920, robust
ivreg povrate_b (dism1990=herf) lenper ctymanuf_wkrs1920, robust



ivreg lngini_w (dism1990=herf) lenper lfp1920, robust
ivreg lngini_b (dism1990=herf) lenper lfp1920, robust
ivreg povrate_w (dism1990=herf) lenper lfp1920, robust
ivreg povrate_b (dism1990=herf) lenper lfp1920, robust



ivreg lngini_w (dism1990=herf) lenper herfscore, robust
ivreg lngini_b (dism1990=herf) lenper herfscore, robust
ivreg povrate_w (dism1990=herf) lenper herfscore, robust
ivreg povrate_b (dism1990=herf) lenper herfscore, robust


*table 4

reg mv_st_winus_w dism1990, robust
reg mv_st_winus_b dism1990, robust
reg medgrent_w dism1990, robust
reg medgrent_b dism1990, robust
reg medgrentpinc_w dism1990, robust
reg medgrentpinc_b dism1990, robust
reg mt1proom_w dism1990, robust
reg mt1proom_b dism1990, robust


ivreg mv_st_winus_w (dism1990=herf) lenper, robust
ivreg mv_st_winus_b (dism1990=herf) lenper, robust
ivreg medgrent_w (dism1990=herf) lenper, robust
ivreg medgrent_b (dism1990=herf) lenper, robust
ivreg medgrentpinc_w (dism1990=herf) lenper, robust
ivreg medgrentpinc_b (dism1990=herf) lenper, robust
ivreg mt1proom_w (dism1990=herf) lenper, robust
ivreg mt1proom_b (dism1990=herf) lenper, robust

reg mv_st_winus_w herf lenper if closeness<-400, robust
reg mv_st_winus_b herf lenper if closeness<-400, robust
reg medgrent_w herf lenper if closeness<-400, robust
reg medgrent_b herf lenper if closeness<-400, robust
reg medgrentpinc_w herf lenper if closeness<-400, robust
reg medgrentpinc_b herf lenper if closeness<-400, robust
reg mt1proom_w herf lenper if closeness<-400, robust
reg mt1proom_b herf lenper if closeness<-400, robust

*table 5

use table_5

reg hsdrop dism1980 agedum* if black==0, cluster(name)
reg hsdrop dism1980 agedum* if black==1, cluster(name)
reg hsgrad dism1980 agedum* if black==0, cluster(name)
reg hsgrad dism1980 agedum* if black==1, cluster(name)
reg somecoll dism1980 agedum* if black==0, cluster(name)
reg somecoll dism1980 agedum* if black==1, cluster(name)
reg collgrad dism1980 agedum* if black==0, cluster(name)
reg collgrad dism1980 agedum* if black==1, cluster(name)


ivreg hsdrop (dism1980=herf) lenper agedum* if black==0, cluster(name)
ivreg hsdrop (dism1980=herf) lenper  agedum* if black==1, cluster(name)
ivreg hsgrad (dism1980=herf) lenper  agedum* if black==0, cluster(name)
ivreg hsgrad (dism1980=herf) lenper  agedum* if black==1, cluster(name)
ivreg somecoll (dism1980=herf) lenper  agedum* if black==0, cluster(name)
ivreg somecoll (dism1980=herf) lenper  agedum* if black==1, cluster(name)
ivreg collgrad (dism1980=herf) lenper  agedum* if black==0, cluster(name)
ivreg collgrad (dism1980=herf) lenper  agedum* if black==1, cluster(name)


reg hsdrop herf lenper agedum* if black==0 & closeness<-400, cluster(name)
reg hsdrop herf lenper agedum* if black==1 & closeness<-400, cluster(name)
reg hsgrad herf lenper agedum* if black==0 & closeness<-400, cluster(name)
reg hsgrad herf lenper agedum* if black==1 & closeness<-400, cluster(name)
reg somecoll herf lenper agedum* if black==0 & closeness<-400, cluster(name)
reg somecoll herf lenper agedum* if black==1 & closeness<-400, cluster(name)
reg collgrad herf lenper agedum* if black==0 & closeness<-400, cluster(name)
reg collgrad herf lenper agedum* if black==1 & closeness<-400, cluster(name)
*table A1

use table_A1.dta
*all data from CGV, except indicator for "in my sample"

for var pop1890-central: ttest X, by(sample)
