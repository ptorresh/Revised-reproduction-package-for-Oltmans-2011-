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

*table 1
reg dism1990 herf lenper, robust 
reg area1910 herf lenper, robust
reg count1910 herf lenper, robust
reg ethseg10 herf lenper, robust
reg ethiso10 herf lenper, robust
reg black1910 herf lenper, robust
reg passpc herf lenper, robust
reg black1920 herf lenper, robust
reg ctyliterate1920 herf lenper, robust
reg lfp1920 herf lenper, robust
reg ctytrade_wkrs1920 herf lenper, robust
reg ctymanuf_wkrs1920 herf lenper, robust
reg ctyrail_wkrs1920 herf lenper, robust
reg incseg herf lenper, robust

*table 2, panel 1
reg lngini_w dism1990, robust
reg lngini_b dism1990, robust
reg povrate_w dism1990, robust
reg povrate_b dism1990, robust

ivreg lngini_w (dism1990=herf) lenper, robust
ivreg lngini_b (dism1990=herf) lenper, robust
ivreg povrate_w (dism1990=herf) lenper, robust
ivreg povrate_b (dism1990=herf) lenper, robust

reg lngini_w herf lenper if closeness<-400, robust
reg lngini_b herf lenper if closeness<-400, robust
reg povrate_w herf lenper if closeness<-400, robust
reg povrate_b herf lenper if closeness<-400, robust

*table 2, panel 2

reg ln90w90b dism1990, robust
reg ln10w10b dism1990, robust
reg ln90w10b dism1990, robust
reg ln90b10w dism1990, robust

ivreg ln90w90b (dism1990=herf) lenper, robust
ivreg ln10w10b (dism1990=herf) lenper, robust
ivreg ln90w10b (dism1990=herf) lenper, robust
ivreg ln90b10w (dism1990=herf) lenper, robust

reg ln90w90b herf lenper if closeness<-400, robust
reg ln10w10b herf lenper if closeness<-400, robust
reg ln90w10b herf lenper if closeness<-400, robust
reg ln90b10w herf lenper if closeness<-400, robust


*table 3

ivreg lngini_w (dism1990=herf) lenper pop1990, robust
ivreg lngini_b (dism1990=herf) lenper pop1990, robust
ivreg povrate_w (dism1990=herf) lenper pop1990, robust
ivreg povrate_b (dism1990=herf) lenper pop1990, robust

ivreg lngini_w (dism1990=herf) lenper pctbk1990, robust
ivreg lngini_b (dism1990=herf) lenper pctbk1990, robust
ivreg povrate_w (dism1990=herf) lenper pctbk1990, robust
ivreg povrate_b (dism1990=herf) lenper pctbk1990, robust


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
