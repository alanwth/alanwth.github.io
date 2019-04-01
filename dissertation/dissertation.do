***Clear data**
clear
eststo clear

***Install estout package in stata (Commented out as it only need to be install once), using the eststo to log regression results down**
***ssc install estout, replace***

***Import data from excel***
import excel "/Users/alan/Desktop/AED_DATA/master(deleted dates).xlsx", sheet("master") firstrow

***EXTENSION 1***
***Generate variable time as the order of dates, i.e. 06/01/2009 as 1 and 07/01/2009 as 2 etc, converting it to time-series format.
gen time = _n
tsset time

***Calculate CSAD for the Shanghai A-type and B-type shares***
gen SSA_CSAD = (abs(SS600602-SSA) + abs(SS600604-SSA) + abs(SS600611-SSA) + abs(SS600613-SSA) + abs(SS600612-SSA) + abs(SS600610-SSA) + abs(SS600614-SSA) + abs(SS600618-SSA) + abs(SS600623-SSA) + abs(SS600619-SSA) + abs(SS600639-SSA) + abs(SS600648-SSA) + abs(SS600617-SSA) + abs(SS600650-SSA) + abs(SS600818-SSA) + abs(SS600679-SSA) + abs(SS600851-SSA) + abs(SS600819-SSA) + abs(SS600695-SSA) + abs(SS600841-SSA) + abs(SS600689-SSA) + abs(SS600827-SSA) + abs(SS600843-SSA) + abs(SS600835-SSA) + abs(SS600845-SSA) + abs(SS600822-SSA) + abs(SS600663-SSA) + abs(SS600801-SSA) + abs(SS600754-SSA) + abs(SS600295-SSA) + abs(SS600726-SSA) + abs(SS600776-SSA) + abs(SS600054-SSA) + abs(SS600272-SSA) + abs(SS600221-SSA) + abs(SS600698-SSA) + abs(SS600320-SSA))/36
gen SSB_CSAD = (abs(SS900901-SSB) + abs(SS900902-SSB) + abs(SS900903-SSB) + abs(SS900904-SSB) + abs(SS900905-SSB) + abs(SS900906-SSB) + abs(SS900907-SSB) + abs(SS900908-SSB) + abs(SS900909-SSB) + abs(SS900910-SSB) + abs(SS900911-SSB) + abs(SS900912-SSB) + abs(SS900913-SSB) + abs(SS900914-SSB) + abs(SS900915-SSB) + abs(SS900916-SSB) + abs(SS900917-SSB) + abs(SS900918-SSB) + abs(SS900919-SSB) + abs(SS900920-SSB) + abs(SS900922-SSB) + abs(SS900923-SSB) + abs(SS900924-SSB) + abs(SS900925-SSB) + abs(SS900926-SSB) + abs(SS900927-SSB) + abs(SS900932-SSB) + abs(SS900933-SSB) + abs(SS900934-SSB) + abs(SS900936-SSB) + abs(SS900937-SSB) + abs(SS900941-SSB) + abs(SS900942-SSB) + abs(SS900943-SSB) + abs(SS900945-SSB) + abs(SS900946-SSB) + abs(SS900947-SSB))/36


***Calculate CSAD for the Shenzhen A-type and B-type shares***
gen SZA_CSAD = (abs(SZ000011 - SZA) + abs(SZ000012 - SZA) + abs(SZ000016 - SZA) + abs(SZ000017 - SZA) + abs(SZ000018 - SZA) + abs(SZ000020 - SZA) + abs(SZ000025 - SZA) + abs(SZ000026 - SZA) + abs(SZ000028 - SZA) + abs(SZ000037 - SZA) + abs(SZ000055 - SZA) + abs(SZ000413 - SZA) + abs(SZ000418 - SZA) + abs(SZ000488 - SZA) + abs(SZ000505 - SZA) + abs(SZ000521 - SZA) + abs(SZ000530 - SZA) + abs(SZ000541 - SZA) + abs(SZ000550 - SZA) + abs(SZ000553 - SZA) + abs(SZ000570 - SZA) + abs(SZ000581 - SZA) + abs(SZ000596 - SZA) + abs(SZ000613 - SZA) + abs(SZ000725 - SZA) + abs(SZ000726 - SZA) + abs(SZ000761 - SZA) + abs(SZ000869 - SZA))/28
gen SZB_CSAD = (abs(SZ200011 - SZB) + abs(SZ200012 - SZB) + abs(SZ200016 - SZB) + abs(SZ200017 - SZB) + abs(SZ200018 - SZB) + abs(SZ200020 - SZB) + abs(SZ200025 - SZB) + abs(SZ200026 - SZB) + abs(SZ200028 - SZB) + abs(SZ200037 - SZB) + abs(SZ200055 - SZB) + abs(SZ200413 - SZB) + abs(SZ200418 - SZB) + abs(SZ200488 - SZB) + abs(SZ200505 - SZB) + abs(SZ200521 - SZB) + abs(SZ200530 - SZB) + abs(SZ200541 - SZB) + abs(SZ200550 - SZB) + abs(SZ200553 - SZB) + abs(SZ200570 - SZB) + abs(SZ200581 - SZB) + abs(SZ200596 - SZB) + abs(SZ200613 - SZB) + abs(SZ200725 - SZB) + abs(SZ200726 - SZB) + abs(SZ200761 - SZB) + abs(SZ200869 - SZB))/28

***Generate R^2 and |R| for SSA,SSB, SZA and SZB***
gen SSA_R2 = SSA^2
gen SSA_ABS = abs(SSA)
gen SSB_R2 = SSB^2
gen SSB_ABS = abs(SSB)
gen SZA_R2 = SZA^2
gen SZA_ABS = abs(SZA)
gen SZB_R2 = SZB^2
gen SZB_ABS = abs(SZB)

***Calcuate 0.5, 1 and 2 percentile of return for SSA and SSB***
egen SSA_P995 = pctile(SSA),p(99.5)
egen SSA_P005 = pctile(SSA),p(0.5)
egen SSA_P990 = pctile(SSA),p(99)
egen SSA_P010 = pctile(SSA),p(1)
egen SSA_P980 = pctile(SSA),p(98)
egen SSA_P020 = pctile(SSA),p(2)
egen SSB_P995 = pctile(SSB),p(99.5)
egen SSB_P005 = pctile(SSB),p(0.5)
egen SSB_P990 = pctile(SSB),p(99)
egen SSB_P010 = pctile(SSB),p(1)
egen SSB_P980 = pctile(SSB),p(98)
egen SSB_P020 = pctile(SSB),p(2)

***Calcuate 0.5, 1 and 2 percentile of return for SZA and SZB***
egen SZA_P995 = pctile(SZA),p(99.5)
egen SZA_P005 = pctile(SZA),p(0.5)
egen SZA_P990 = pctile(SZA),p(99)
egen SZA_P010 = pctile(SZA),p(1)
egen SZA_P980 = pctile(SZA),p(98)
egen SZA_P020 = pctile(SZA),p(2)
egen SZB_P995 = pctile(SZB),p(99.5)
egen SZB_P005 = pctile(SZB),p(0.5)
egen SZB_P990 = pctile(SZB),p(99)
egen SZB_P010 = pctile(SZB),p(1)
egen SZB_P980 = pctile(SZB),p(98)
egen SZB_P020 = pctile(SZB),p(2)

***Create dummy variables Dh and Dl for SSA and SSB***
gen SSA_U005 = 0
replace SSA_U005 = 1 if SSA > SSA_P995
gen SSA_L005 = 0
replace SSA_L005 = 1 if SSA <= SSA_P005
gen SSA_U010 = 0
replace SSA_U010 = 1 if SSA > SSA_P990
gen SSA_L010 = 0
replace SSA_L010 = 1 if SSA <= SSA_P010
gen SSA_U020 = 0
replace SSA_U020 = 1 if SSA > SSA_P980
gen SSA_L020 = 0
replace SSA_L020 = 1 if SSA <= SSA_P020

gen SSB_U005 = 0
replace SSB_U005 = 1 if SSB > SSB_P995
gen SSB_L005 = 0
replace SSB_L005 = 1 if SSB <= SSB_P005
gen SSB_U010 = 0
replace SSB_U010 = 1 if SSB > SSB_P990
gen SSB_L010 = 0
replace SSB_L010 = 1 if SSB <= SSB_P010
gen SSB_U020 = 0
replace SSB_U020 = 1 if SSB > SSB_P980
gen SSB_L020 = 0
replace SSB_L020 = 1 if SSB <= SSB_P020

***Create dummy variables Dh and Dl for SZA and SZB***
gen SZA_U005 = 0
replace SZA_U005 = 1 if SZA > SZA_P995
gen SZA_L005 = 0
replace SZA_L005 = 1 if SZA <= SZA_P005
gen SZA_U010 = 0
replace SZA_U010 = 1 if SZA > SZA_P990
gen SZA_L010 = 0
replace SZA_L010 = 1 if SZA <= SZA_P010
gen SZA_U020 = 0
replace SZA_U020 = 1 if SZA > SZA_P980
gen SZA_L020 = 0
replace SZA_L020 = 1 if SZA <= SZA_P020

gen SZB_U005 = 0
replace SZB_U005 = 1 if SZB > SZB_P995
gen SZB_L005 = 0
replace SZB_L005 = 1 if SZB <= SZB_P005
gen SZB_U010 = 0
replace SZB_U010 = 1 if SZB > SZB_P990
gen SZB_L010 = 0
replace SZB_L010 = 1 if SZB <= SZB_P010
gen SZB_U020 = 0
replace SZB_U020 = 1 if SZB > SZB_P980
gen SZB_L020 = 0
replace SZB_L020 = 1 if SZB <= SZB_P020

***Regress CSAD on R2 and |R| for SSA, SSB, SZA, SZB, with white robust standard errors***
regress SSA_CSAD SSA_R2 SSA_ABS
eststo
regress SSB_CSAD SSB_R2 SSB_ABS
eststo

regress SZA_CSAD SZA_R2 SZA_ABS
eststo
regress SZB_CSAD SZB_R2 SZB_ABS
eststo

***Regress CSAD on the dummy variables Dh and Dl, for SSA, SSB, SZA, SZB, with white robust standard errors***
regress SSA_CSAD SSA_U005 SSA_L005,rob
eststo
regress SSA_CSAD SSA_U010 SSA_L010,rob
eststo
regress SSA_CSAD SSA_U020 SSA_L020,rob
eststo

regress SSB_CSAD SSB_U005 SSB_L005,rob
eststo
regress SSB_CSAD SSB_U010 SSB_L010,rob
eststo
regress SSB_CSAD SSB_U020 SSB_L020,rob
eststo

regress SZA_CSAD SZA_U005 SZA_L005,rob
eststo
regress SZA_CSAD SZA_U010 SZA_L010,rob
eststo
regress SZA_CSAD SZA_U020 SZA_L020,rob
eststo

regress SZB_CSAD SZB_U005 SZB_L005,rob
eststo
regress SZB_CSAD SZB_U010 SZB_L010,rob
eststo
regress SZB_CSAD SZB_U020 SZB_L020,rob
eststo

***Output regression results to a csv file, with standard error in parentheses and adjusted R square in the bottom***
esttab using /Users/alan/Desktop/AED_DATA/regression.csv, se ar2





***EXTENSION 2***
***Generate predicted uhat for testing for serial correlation, for SSA (Optional)***
regress SSA_CSAD SSA_R2 SSA_ABS
predict uhat,r
***Create grpah to visulise the uhat regression, used for visually examine if there is serial correlation or not (Optional)***
tsline uhat if e(sample) == 1, yline(0)

***To be determine***
***Using the Durbin-Waston test for serial correlation***
regress SSA_CSAD SSA_R2 SSA_ABS,rob
dwstat
regress SSA_CSAD SSA_U005 SSA_L005,rob
dwstat
regress SSA_CSAD SSA_U010 SSA_L010,rob
dwstat
regress SSA_CSAD SSA_U020 SSA_L020,rob
dwstat

regress SSB_CSAD SSB_R2 SSB_ABS,rob
dwstat
regress SSB_CSAD SSB_U005 SSB_L005,rob
dwstat
regress SSB_CSAD SSB_U010 SSB_L010,rob
dwstat
regress SSB_CSAD SSB_U020 SSB_L020,rob
dwstat

regress SZA_CSAD SZA_R2 SZA_ABS,rob
dwstat
regress SZA_CSAD SZA_U005 SZA_L005,rob
dwstat
regress SZA_CSAD SZA_U010 SZA_L010,rob
dwstat
regress SZA_CSAD SZA_U020 SZA_L020,rob
dwstat

regress SZB_CSAD SZB_R2 SZB_ABS,rob
dwstat
regress SZB_CSAD SZB_U005 SZB_L005,rob
dwstat
regress SZB_CSAD SZB_U010 SZB_L010,rob
dwstat
regress SZB_CSAD SZB_U020 SZB_L020,rob
dwstat
