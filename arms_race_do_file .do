clear all 
set more off

use "https://github.com/azmeer54/BD-MM_arms_race/blob/main/arms_race_data.dta?raw=true"
drop country country_01
tsset year, yearly 


ipolate arms_import_usd_MM year , gen(iarms_import_usd_MM)
ipolate arms_import_usd_BD year, gen(iarms_import_usd_BD)
ipolate milex_cons_usd_2020_MM year, gen(imilex_cons_usd_2020_MM)

generate lnMilexBD=ln(milex_cons_usd_2020_BD)
generate DlnMilexBD=D.lnMilexBD
generate lnMilexMM=ln(imilex_cons_usd_2020_MM)
generate DlnMilexMM=D.lnMilexMM
generate lnRgdpBD=ln(rgdpna_BD)
generate lnRgdpMM=ln(rgdpna_MM)
generate lnAgeDepBD=ln(age_dependency_ratio_BD)
generate lnAgeDepMM=ln(age_dependency_ratio_MM)
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

varsoc lnMilexBD //lag is 3
varsoc lnMilexMM //lag is 4
varsoc lnRgdpBD // lag is 1 
varsoc lnRgdpMM //lag is 2 
varsoc lnAgeDepBD //lag is 1 
varsoc lnAgeDepMM //lag is 1 
varsoc polity2_BD //lag is 1 
varsoc polity2_MM //lag is 1 

////////////// lnMilexBD ///////////////
dfuller lnMilexBD, lags(1) //not stationary
dfuller lnMilexBD, lags(1) trend //stationary  
dfuller lnMilexBD, lags(1) drift //not stationary 

dfuller D.lnMilexBD, lags(1) //not stationary 
dfuller D.lnMilexBD, lags(1) trend //stationary 
dfuller D.lnMilexBD, lags(1) drift //stationary 

dfuller LD.lnMilexBD, lags(1) //stationary 
dfuller LD.lnMilexBD, lags(1) trend //stationary 
dfuller LD.lnMilexBD, lags(1) drift //stationary 

///////////////// lnMilexMM ////////////////////////
dfuller lnMilexMM, lags(1) //not stationary 
dfuller lnMilexMM, lags(1) trend //not stationary
dfuller lnMilexMM, lags(1) drift //not stationary 

dfuller D.lnMilexMM, lags(1) //stationary 
dfuller D.lnMilexMM, lags(1) trend //not stationary
dfuller D.lnMilexMM, lags(1) drift //stationary 

dfuller LD.lnMilexMM, lags(1) //stationary 
dfuller LD.lnMilexMM, lags(1) trend //stationary
dfuller LD.lnMilexMM, lags(1) drift //stationary 
//////////////// lnRgdpBD /////////////////////
dfuller lnRgdpBD, lags(1) //stationary 
dfuller lnRgdpBD, lags(1)  trend //not stationary 
dfuller lnRgdpBD, lags(1)  drift //not stationary 

dfuller D.lnRgdpBD, lags(1) //stationary 
dfuller D.lnRgdpBD, lags(1) trend //stationary 
dfuller D.lnRgdpBD, lags(1) drift //stationary 

dfuller LD.lnRgdpBD, lags(1) //stationary 
dfuller LD.lnRgdpBD, lags(1) trend //stationary 
dfuller LD.lnRgdpBD, lags(1) drift //stationary
 
/////////////// lnRgdpMM /////////////////////////
dfuller lnRgdpMM, lags(1) //not stationary
dfuller lnRgdpMM, lags(1)  trend //not stationary
dfuller lnRgdpMM, lags(1)  drift //not stationary

dfuller D.lnRgdpMM, lags(1) //not stationary
dfuller D.lnRgdpMM, lags(1) trend //not stationary
dfuller D.lnRgdpMM, lags(1) drift //stationary

dfuller LD.lnRgdpMM, lags(1) //not stationary
dfuller LD.lnRgdpMM, lags(1) trend //not stationary
dfuller LD.lnRgdpMM, lags(1) drift //stationary

////////////////// lnAgeDepBD ///////////////////////
dfuller lnAgeDepBD, lags(1) //not stationary 
dfuller lnAgeDepBD, lags(1)  trend //not stationary 
dfuller lnAgeDepBD, lags(1)  drift //not stationary 

dfuller D.lnAgeDepBD, lags(1) //not stationary 
dfuller D.lnAgeDepBD, lags(1) trend //not stationary 
dfuller D.lnAgeDepBD, lags(1) drift //not stationary 

dfuller LD.lnAgeDepBD, lags(1) //not stationary 
dfuller LD.lnAgeDepBD, lags(1) trend //not stationary 
dfuller LD.lnAgeDepBD, lags(1) drift //stationary 

////////////////// lnAgeDepMM ////////////////////////////////
dfuller lnAgeDepMM, lags(1) //not stationary
dfuller lnAgeDepMM, lags(1)  trend //not stationary
dfuller lnAgeDepMM, lags(1)  drift //not stationary

dfuller D.lnAgeDepMM, lags(1) //stationary
dfuller D.lnAgeDepMM, lags(1) trend //stationary
dfuller D.lnAgeDepMM, lags(1) drift //stationary

dfuller LD.lnAgeDepMM, lags(1) //stationary
dfuller LD.lnAgeDepMM, lags(1) trend //stationary
dfuller LD.lnAgeDepMM, lags(1) drift //stationary

///////////////// polity2_BD ////////////////////////
dfuller polity2_BD, lags(1) //not stationary 
dfuller polity2_BD, lags(1)  trend //not stationary 
dfuller polity2_BD, lags(1)  drift //stationary 

dfuller D.polity2_BD, lags(1) //stationary 
dfuller D.polity2_BD, lags(1) trend //stationary 
dfuller D.polity2_BD, lags(1) drift //stationary 

dfuller LD.polity2_BD, lags(1) //stationary 
dfuller LD.polity2_BD, lags(1) trend //stationary 
dfuller LD.polity2_BD, lags(1) drift //stationary 

//////////// polity2_MM /////////////////////////////
dfuller polity2_MM, lags(1) //not stationary 
dfuller polity2_MM, lags(1)  trend //not stationary  
dfuller polity2_MM, lags(1)  drift //not stationary 

dfuller D.polity2_MM, lags(1) //stationary 
dfuller D.polity2_MM, lags(1) trend //stationary  
dfuller D.polity2_MM, lags(1) drift //stationary 

dfuller LD.polity2_MM, lags(1) //stationary 
dfuller LD.polity2_MM, lags(1) trend //stationary 
dfuller LD.polity2_MM, lags(1) drift //stationary 
////////////////////////////////////////////////////////

 
//pperron test 
pperron lnMilexBD, lags(1) //not stationary
pperron lnMilexBD, lags(1) trend //stationary 

pperron D.lnMilexBD, lags(1) //stationary 
pperron D.lnMilexBD, lags(1) trend //stationary 

pperron LD.lnMilexBD, lags(1) //stationary 
pperron LD.lnMilexBD, lags(1) trend //stationary 


pperron lnMilexMM, lags(1) //not stationary 
pperron lnMilexMM, lags(1) trend //not stationary 

pperron D.lnMilexMM, lags(1) //stationary 
pperron D.lnMilexMM, lags(1) trend //stationary 

pperron LD.lnMilexMM, lags(1) //stationary 
pperron LD.lnMilexMM, lags(1) trend //stationary 


pperron lnRgdpBD, lags(1) //not stationary 
pperron lnRgdpBD, lags(1) trend //not stationary 

pperron D.lnRgdpBD, lags(1) //stationary 
pperron D.lnRgdpBD, lags(1) trend //stationary 

pperron LD.lnRgdpBD, lags(1) //stationary 
pperron LD.lnRgdpBD, lags(1) trend //stationary 


pperron lnRgdpMM, lags(1) //not stationary
pperron lnRgdpMM, lags(1) trend //not stationary

pperron D.lnRgdpMM, lags(1) //not stationary
pperron D.lnRgdpMM, lags(1) trend //not stationary

pperron LD.lnRgdpMM, lags(1) //not stationary
pperron LD.lnRgdpMM, lags(1) trend //not stationary


pperron lnAgeDepBD, lags(1) //not stationary 
pperron lnAgeDepBD, lags(1) trend //not stationary 

pperron D.lnAgeDepBD, lags(1) //not stationary 
pperron D.lnAgeDepBD, lags(1) trend //stationary 

pperron LD.lnAgeDepBD, lags(1) //stationary 
pperron LD.lnAgeDepBD, lags(1) trend //stationary 


pperron lnAgeDepMM, lags(1) //not stationary
pperron lnAgeDepMM, lags(1) trend //not stationary

pperron D.lnAgeDepMM, lags(1) //stationary
pperron D.lnAgeDepMM, lags(1) trend //stationary

pperron LD.lnAgeDepMM, lags(1) //stationary
pperron LD.lnAgeDepMM, lags(1) trend //stationary


pperron polity2_BD, lags(1) //not stationary 
pperron polity2_BD, lags(1) trend //not stationary 

pperron D.polity2_BD, lags(1) //stationary 
pperron D.polity2_BD, lags(1) trend //stationary 

pperron LD.polity2_BD, lags(1) //stationary 
pperron LD.polity2_BD, lags(1) trend //stationary 



pperron polity2_MM, lags(1) //not stationary
pperron polity2_MM, lags(1) trend //not stationary

pperron D.polity2_MM, lags(1) //stationary
pperron D.polity2_MM, lags(1) trend //stationary

pperron LD.polity2_MM, lags(1) //stationary
pperron LD.polity2_MM, lags(1) trend //stationary

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

texdoc init "armsrace.tex", force cmdstrip nooutput replace

texdoc stlog "varsocBD"
varsoc lnMilexBD lnMilexMM lnRgdpBD  lnAgeDepBD  polity2_BD //lag is 1 
texdoc stlog close 

texdoc stlog "varsocMM"
varsoc lnMilexMM lnMilexBD lnRgdpMM lnAgeDepMM polity2_MM //lag is 2 
texdoc stlog close 

texdoc stlog "vecrankBD"
vecrank lnMilexBD lnMilexMM lnRgdpBD  lnAgeDepBD  polity2_BD, lags(1) trend(trend) //rank is 1 
texdoc stlog close 

texdoc stlog "vecrankMM"
vecrank lnMilexMM lnMilexBD lnRgdpMM lnAgeDepMM polity2_MM, lags(2) trend(trend) //rank is 3 
texdoc stlog close 

texdoc stlog "vecBD"
vec lnMilexBD lnMilexMM lnRgdpBD  lnAgeDepBD  polity2_BD, lags(2) rank(1) trend(trend) noetable 
estimates store BD
texdoc stlog close 

texdoc stlog "causalityBD"
test ([D_lnMilexBD]: LD.lnMilexMM) //lnMilexMM has short run effect lnMilexBD 
test ([D_lnMilexMM]: LD.lnMilexBD) //lnMilexBD has no short run effect on lnMilexMM 
texdoc stlog close 

texdoc stlog "vecBD1"
vec lnMilexMM lnMilexBD  lnRgdpBD  lnAgeDepBD  polity2_BD, lags(2) rank(1) trend(trend) noetable 
estimates store BD1 
texdoc stlog close 


texdoc stlog "vecMM"
vec lnMilexMM lnMilexBD lnRgdpMM lnAgeDepMM polity2_MM, lags(3) rank(3) trend(trend) noetable 
estimates store MM
texdoc stlog close 

texdoc stlog "causalityMM"
test ([D_lnMilexBD]: LD.lnMilexMM) //lnMilexMM has short run effect lnMilexBD 
test ([D_lnMilexMM]: LD.lnMilexBD) //lnMilexBD has no short run effect on lnMilexMM 
texdoc stlog close 

esttab BD using "BDshortrun.tex", unstack se longtable onecell nonumber noobs replace 

esttab BD1 using "BD1shortrun.tex", unstack se longtable onecell nonumber noobs replace

esttab MM using "MMshortrun.tex", unstack se longtable onecell nonumber noobs replace 

twoway (tsline milex_cons_usd_2020_BD imilex_cons_usd_2020_MM in 1/43), ytitle(Military Expenditure (USD, Constant 2020)) legend(label(1 "Bangladesh")label(2 "Myanmar"))
graph export trend.pdf, replace 

sum milex_shareof_gdp_BD milex_shareof_gdp_MM milex_cons_usd_2020_BD milex_cons_usd_2020_MM rgdpna_BD rgdpna_MM age_dependency_ratio_BD age_dependency_ratio_MM polity2_BD polity2_MM, separator(0)

outreg2 using "sum.tex", sum(log) keep(milex_shareof_gdp_BD milex_shareof_gdp_MM milex_cons_usd_2020_BD milex_cons_usd_2020_MM rgdpna_BD rgdpna_MM age_dependency_ratio_BD age_dependency_ratio_MM polity2_BD polity2_MM) replace 


fcast compute bd, step(10) dynamic(2019) estimate(BD) differences replace 
fcast graph bdlnMilexBD bdlnMilexMM
graph export BDfcast.pdf, replace 

fcast compute mm, step(10) dynamic(2019) estimate(MM) differences replace 
fcast graph mmlnMilexBD mmlnMilexMM
graph export MMfcast.pdf, replace 

texdoc stlog "forecasted"
list year bdlnMilexBD mmlnMilexBD bdlnMilexMM  mmlnMilexMM if year>=2018, table separator(1) divider noobs
texdoc stlog close 

corr bdlnMilexBD mmlnMilexBD if year>=2018
corr bdlnMilexMM  mmlnMilexMM if year>=2018

texdoc close 
clear all 

