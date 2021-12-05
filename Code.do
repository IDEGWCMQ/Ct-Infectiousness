use Dataset

gen Sex=1 if gender=="Male"
replace Sex=2 if gender=="Female"
replace Sex=1 if Sex==.
label define Sex 1"Male" 2"Female"
label values Sex Sex
gen AgeCat=1 if Age<10
replace AgeCat=2 if (Age>=10 & Age<20)
replace AgeCat=3 if (Age>=20 & Age<30)
replace AgeCat=4 if (Age>=30 & Age<40)
replace AgeCat=5 if (Age>=40 & Age<50)
replace AgeCat=6 if (Age>=50 & Age<60)
replace AgeCat=7 if (Age>=60 & Age<70)
replace AgeCat=8 if Age>=70
label define AgeCat 1"0-9" 2"10-19" 3"20-29" 4"30-39" 5"40-49" 6"50-59" 7"60-69" 8"70+"
label values AgeCat AgeCat
gen CaseControl1=1 if Group==2
replace CaseControl1=0 if Group==1
label define CaseControl1 1"Reinfections" 0"Unvaccinated"
label values CaseControl1 CaseControl
ccmatch Sex AgeCat reason1 WeekInterval, cc(CaseControl) id(hcno)
keep if match~=.
summ summct1 if CaseControl1==0, detail
summ summct1 if CaseControl1==1, detail
summ Age if CaseControl1==1, detail
summ Age if CaseControl1==0, detail
ttest Age, by(CaseControl1)
tab AgeCatR CaseControl1, col  chi2
tab Sex CaseControl1, col  chi2
tab Natr CaseControl1, col chi2
tab Variant CaseControl1, col nofreq chi2
gen summct1ContDum=summct1 if CaseControl1==0
bys match: egen summct1Cont=max(summct1ContDum)
ttest summct1=summct1Cont if CaseControl1==1
clear all
use Dataset
gen CaseControl2=1 if Group==3
replace CaseControl2=0 if Group==1
label define CaseControl2 1"Vaccinated-Pfizer" 0"Unvaccinated"
label values CaseControl2 CaseControl2
ccmatch Sex AgeCat reason1 WeekInterval, cc(CaseControl2) id(hcno)
keep if match~=.
summ summct1 if CaseControl2==0, detail
summ summct1 if CaseControl2==1, detail
summ Age if CaseControl2==1, detail
summ Age if CaseControl2==0, detail
ttest Age, by(CaseControl2)
tab AgeCatR CaseControl2, col nofreq chi2
tab Sex CaseControl2, col nofreq chi2
tab Natr CaseControl2, col chi2
tab Variant CaseControl2, col chi2
gen summct1ContDum=summct1 if CaseControl2==0
bys match: egen summct1Cont=max(summct1ContDum)
ttest summct1=summct1Cont if CaseControl2==1
clear all
use Dataset
gen CaseControl3=1 if Group==4
replace CaseControl3=0 if Group==1
label define CaseControl3 0"Unvaccinated" 1"Vaccinated-Moderna"
label values CaseControl3 CaseControl3
ccmatch Sex AgeCat reason1 WeekInterval, cc(CaseControl3) id(hcno)
keep if match~=.
summ summct1 if CaseControl3==0, detail
summ summct1 if CaseControl3==1, detail
summ Age if CaseControl3==1, detail
summ Age if CaseControl3==0, detail
ttest Age, by(CaseControl3)
tab AgeCatR CaseControl3, col  chi2
tab Sex CaseControl3, col  chi2
tab Natr CaseControl3, col chi2
tab Variant CaseControl3, col  chi2
gen summct1ContDum=summct1 if CaseControl3==0
bys match: egen summct1Cont=max(summct1ContDum)
ttest summct1=summct1Cont if CaseControl3==1
clear all
use Dataset
gen CaseControl4=1 if Group==3
replace CaseControl4=0 if Group==4
label define CaseControl4 1"Vaccinated-Pfizer" 0"Vaccinated-Moderna"
label values CaseControl4 CaseControl4
ccmatch Sex AgeCat reason1 WeekInterval, cc(CaseControl4) id(hcno)
keep if match~=.
summ summct1 if CaseControl4==0, detail
summ summct1 if CaseControl4==1, detail
summ Age if CaseControl4==1, detail
summ Age if CaseControl4==0, detail
ttest Age, by(CaseControl4)
tab AgeCatR CaseControl4, col  chi2
tab Sex CaseControl4, col  chi2
tab Natr CaseControl4, col chi2
tab Variant CaseControl4, col nofreq chi2
gen summct1ContDum=summct1 if CaseControl4==0
bys match: egen summct1Cont=max(summct1ContDum)
ttest summct1=summct1Cont if CaseControl4==1
clear all
use Dataset
gen CaseControl5=1 if Group==2
replace CaseControl5=0 if Group==3
label define CaseControl5 0"Vaccinated-Pfizer" 1"Reinfection"
label values CaseControl5 CaseControl5
ccmatch Sex AgeCat reason1 WeekInterval, cc(CaseControl5) id(hcno)
keep if match~=.
summ summct1 if CaseControl5==0, detail
summ summct1 if CaseControl5==1, detail
summ Age if CaseControl5==1, detail
summ Age if CaseControl5==0, detail
ttest Age, by(CaseControl5)
tab AgeCatR CaseControl5, col  chi2
tab Sex CaseControl5, col  chi2
tab Natr CaseControl5, col chi2
tab Variant CaseControl5, col chi2
gen summct1ContDum=summct1 if CaseControl5==0
bys match: egen summct1Cont=max(summct1ContDum)
ttest summct1=summct1Cont if CaseControl5==1
clear all
use Dataset
gen CaseControl6=1 if Group==2
replace CaseControl6=0 if Group==4
label define CaseControl6 0"Vaccinated-Moderna" 1"Reinfection"
label values CaseControl6 CaseControl6
ccmatch Sex AgeCat reason1 WeekInterval, cc(CaseControl6) id(hcno)
keep if match~=.
summ summct1 if CaseControl6==0, detail
summ summct1 if CaseControl6==1, detail
summ Age if CaseControl6==1, detail
summ Age if CaseControl6==0, detail
ttest Age, by(CaseControl6)
tab AgeCatR CaseControl6, col  chi2
tab Sex CaseControl6, col  chi2
tab Natr CaseControl6, col chi2
tab Variant CaseControl6, col nofreq chi2
gen summct1ContDum=summct1 if CaseControl6==0
bys match: egen summct1Cont=max(summct1ContDum)
ttest summct1=summct1Cont if CaseControl6==1
