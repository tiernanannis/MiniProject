--First step is to create reference tables for each attribute

--Reference Table for Ethnicity
if OBJECT_ID('dbo.DimEthnos') is not null
begin
	drop table dbo.DimEthnos
end

select distinct
ethnos as ID
,case
when ethnos = 'A' then 'British (White)'
when ethnos = 'B' then 'Irish (White)'
when ethnos = 'C' then 'Any other White background'
when ethnos = 'D' then 'White and Black Caribbean (Mixed)'
when ethnos = 'E' then 'White and Black African (Mixed)'
when ethnos = 'F' then 'White and Asian (Mixed)'
when ethnos = 'G' then 'Any other Mixed background'
when ethnos = 'H' then 'Indian (Asian or Asian British)'
when ethnos = 'J' then 'Pakistani (Asian or Asian British)'
when ethnos = 'K' then 'Bangladeshi (Asian or Asian British)'
when ethnos = 'L' then 'Any other Asian background'
when ethnos = 'M' then 'Caribbean (Black or Black British)'
when ethnos = 'N' then 'African (Black or Black British)'
when ethnos = 'P' then 'Any other Black background'
when ethnos = 'R' then 'Chinese (other ethnic group)'
when ethnos = 'S' then 'Any other ethnic group'
when ethnos = 'Z' then 'Not stated'
when ethnos = 'X' then 'Not known (prior to 2013)'
when ethnos = '0' then 'White'
when ethnos = '1' then 'Black - Caribbean'
when ethnos = '2' then 'Black - African'
when ethnos = '3' then 'Black - Other'
when ethnos = '4' then 'Indian'
when ethnos = '5' then 'Pakistani'
when ethnos = '6' then 'Bangladeshi'
when ethnos = '7' then 'Chinese'
when ethnos = '8' then 'Any other ethnic group'
when ethnos = '9' then 'Not given'
when ethnos = '99' then 'Not known'
end as [ethnos]
into dbo.DimEthnos
from ['APC_Raw dataset$']

--Reference Table for Episode Type
if OBJECT_ID('dbo.DimEpiType') is not null
begin
	drop table dbo.DimEpiType
end

select distinct
epitype as ID
,case
when epitype = '1' then 'General Episode'
when epitype = '2' then 'Delivery Episode'
when epitype = '3' then 'Birth Episode'
when epitype = '4' then 'Formally detained under the provisions of mental health legislation or long-term (over one year) psychiatric patients who should have additional information recorded on the psychiatric census. This value can only appear in unfinished records (Episode Status (EPISTAT) = 1)'
when epitype = '5' then 'Other delivery event'
when epitype = '6' then 'Other birth event'
when epitype = '0' then 'Unknown'
end as [epitype]
into dbo.DimEpiType
from ['APC_Raw dataset$']

--Reference Table for Admin Category
if OBJECT_ID('dbo.DimAdminCat') is not null
begin
	drop table dbo.DimAdminCat
end

select distinct
admincat as ID
,case
when admincat = 1 then 'NHS patient, including overseas visitors charged under Section 121 of the
NHS Act 1977 as amended by Section 7(12) and (14) of the Health and Medicine
Act 1988.'
when admincat = 2 then 'Private patient: one who uses accommodation or services authorised under
section 65 and/or 66 of the NHS Act 1977 (Section 7(10) of Health and Medicine
Act 1988 refers) as amended by Section 26 of the National Health Service and
Community Care Act 1990.'
when admincat = 3 then 'Amenity patient: one who pays for the use of a single room or small ward in
accord with section 12 of the NHS Act 1977, as amended by section 7(12) and (14)
of the Health and Medicine Act 1988.'
when admincat = 4 then 'A category II patient: one for whom work is undertaken by hospital medical or
dental staff within categories II as defined in paragraph 37 of the Terms and
Conditions of Service of Hospital Medical and Dental Staff.'
when admincat = 98 then 'Not applicable.'
when admincat = 99 then 'Not known: a validation error.'
end as [admincat]
into dbo.DimAdminCat
from ['APC_Raw dataset$']

--Reference Table for Episode Status
if OBJECT_ID('dbo.DimEpiStat') is not null
begin
	drop table dbo.DimEpiStat
end

select distinct
epistat as ID
,case
when epistat = 1 then 'Unfinished'
when epistat = 3 then 'Finished'
when epistat = 9 then 'Derived unfinished (not present on processed data'
end as [epistat]
into dbo.DimEpiStat
from ['APC_Raw dataset$']

--Reference Table for Category
if OBJECT_ID('dbo.DimCategory') is not null
begin
	drop table dbo.DimCategory
end

select distinct
category as ID
,case
when category = 10 then 'NHS patient: not formally detained'
when category = 11 then 'NHS patient: formally detained under Part II of the Mental Health Act 1983'
when category = 12 then 'NHS patient: formally detained under Part III of the Mental Health Act 1983 or under other Acts'
when category = 13 then 'NHS patient: formally detained under part X, Mental Health Act 1983*'
when category = 20 then  'Private patient: not formally detained'
when category = 21 then  'Private patient: formally detained under Part II of the Mental Health Act 1983'
when category = 22 then  'Private patient: formally detained under Part III of the Mental Health Act 1983 or under other Acts'
when category = 23 then  'Private patient: formally detained under part X, Mental health Act 1983*'
when category = 30 then  'Amenity patient: not formally detained'
when category = 31 then 'Amenity patient: formally detained under Part II of the Mental Health Act 1983'
when category = 32 then 'Amenity patient: formally detained under Part III of the Mental Health Act 1983 or under other Acts'
when category = 33 then 'Amenity patient: formally detained under part X, Mental health Act 1983*'
when category = Null then 'Other maternity event.'
end as [category]
into dbo.DimCategory
from ['APC_Raw dataset$']

--Reference Table for Legal Category of Patient
if OBJECT_ID('dbo.DimLeglCat') is not null
begin
	drop table dbo.DimLeglCat
end

select distinct
leglcat as ID
,case
when leglcat = 1 then 'Informal'
when leglcat = 2 then 'Formally detained under the Mental Health Act, Section 2'
when leglcat = 3 then 'Formally detained under the Mental Health Act, Section 3'
when leglcat = 4 then 'Formally detained under the Mental Health Act, Section 4'
when leglcat = 5 then 'Formally detained under the Mental Health Act, Section 5(2)'
when leglcat = 6 then 'Formally detained under the Mental Health Act, Section 5(4)'
when leglcat = 7 then 'Formally detained under the Mental Health Act, Section 35'
when leglcat = 8 then 'Formally detained under the Mental Health Act, Section 36'
when leglcat = 9 then 'Formally detained under the Mental Health Act, Section 37 with Section 41 restrictions'
when leglcat = 10 then 'Formally detained under the Mental Health Act, Section 37 excluding Section 37(4)'
when leglcat = 11 then 'Formally detained under the Mental Health Act, Section 37(4)'
when leglcat = 12 then 'Formally detained under the Mental Health Act, Section 38'
when leglcat = 13 then 'Formally detained under the Mental Health Act, Section 44'
when leglcat = 14 then 'Formally detained under the Mental Health Act, Section 46'
when leglcat = 15 then 'Formally detained under the Mental Health Act, Section 47 with Section 49 restrictions'
when leglcat = 16 then 'Formally detained under the Mental Health Act, Section 47'
when leglcat = 17 then 'Formally detained under the Mental Health Act, Section 48 with Section 49 restrictions'
when leglcat = 18 then 'Formally detained under the Mental Health Act, Section 48'
when leglcat = 19 then 'Formally detained under the Mental Health Act, Section 135'
when leglcat = 20 then 'Formally detained under the Mental Health Act, Section 136'
when leglcat = 21 then 'Formally detained under the previous legislation (fifth schedule)'
when leglcat = 22 then 'Formally detained under Criminal Procedure (Insanity) Act 1964 as amended by the Criminal Procedures (Insanity and Unfitness to Plead) Act 1991'
when leglcat = 23 then 'Formally detained under other Acts'
when leglcat = 24 then 'Supervised discharge under the Mental Health (Patients in the Community) Act 1995'
when leglcat = 25 then 'Formally detained under the Mental Health Act, Section 45A'
when leglcat = 26 then 'Not applicable'
when leglcat = 27 then 'Not known'
when leglcat = 00 then 'Unknown'
end as [leglcat]
into dbo.DimLeglCat
from ['APC_Raw dataset$']

--Reference Table for whether NHS number is valid
if OBJECT_ID('dbo.DimNewNHSNo_Check') is not null
begin
	drop table dbo.DimNewNHSNo_Check
end

select distinct
newnhsno_check as ID
,case
when newnhsno_check = 'Y' then 'Yes'
when newnhsno_check = 'N' then 'No'
end as [newnhsno_check]
into dbo.DimNewNHSNo_Check
from ['APC_Raw dataset$']

--Reference Table for Admission Method
if OBJECT_ID('dbo.DimAdmiMeth') is not null
begin
	drop table dbo.DimAdmiMeth
end

select distinct
admimeth as ID
,case
when admimeth = '11' then 'Waiting list. . A Patient admitted electively from a waiting list having been given no date of admission at a time a decision was made to admit'
when admimeth = '12' then 'Booked. A Patient admitted having been given a date at the time the decision to admit was made, determined mainly on the grounds of resource availability'
when admimeth = '13' then 'Planned. A Patient admitted, having been given a date or approximate date at the time that the decision to admit was made. This is usually part of a planned sequence of clinical care determined mainly on social or clinical criteria (e.g. check cystoscopy)". A planned admission is one where the date of admission is determined by the needs of the treatment, rather than by the availability of resources. Note that this does not include a transfer from another Hospital Provider (see 81 below).'
when admimeth = '21' then 'Accident and emergency or dental casualty department of the Health Care Provider'
when admimeth = '22' then 'General Practitioner: after a request for immediate admission has been made direct to a Hospital Provider, i.e. not through a Bed bureau, by a General Practitioner: or deputy'
when admimeth = '23' then 'Bed bureau'
when admimeth = '24' then 'Consultant Clinic, of this or another Health Care Provider'
when admimeth = '25' then 'Admission via Mental Health Crisis Resolution Team (available from 2013/14)'
when admimeth = '2A' then 'Accident and Emergency Department of another provider where the patient had not been admitted (available from 2013/14)'
when admimeth = '2B' then 'Transfer of an admitted patient from another Hospital Provider in an emergency (available from 2013/14)'
when admimeth = '2C' then 'Baby born at home as intended (available from 2013/14)'
when admimeth = '2D' then 'Other emergency admission (available from 2013/14)'
when admimeth = '28' then 'Other means'
when admimeth = '31' then 'Admitted ante-partum'
when admimeth = '32' then 'Admitted post-partum'
when admimeth = '82' then 'The birth of a baby in this Health Care Provider'
when admimeth = '83' then 'Baby born outside the Health Care Provider except when born at home as intended.'
when admimeth = '81' then 'Transfer of any admitted patient from other Hospital Provider other than in an emergency'
when admimeth = '84' then 'Admission by Admissions Panel of a High Security Psychiatric Hospital, patient not entered on the HSPH Admissions Waiting List (available between 1999 and 2006)'
when admimeth = '89' then 'HSPH Admissions Waiting List of a High Security Psychiatric Hospital (available between 1999 and 2006)'
when admimeth = '98' then 'Not applicable (available from 1996/97)'
when admimeth = '99' then 'Not known: a validation error'
end as [admimeth]
into dbo.DimAdmiMeth
from ['APC_Raw dataset$']

--Reference Table for Source of Admission
if OBJECT_ID('dbo.DimAdmiSorc') is not null
begin
	drop table dbo.DimAdmiSorc
end

select distinct
admisorc as ID
,case
when admisorc = 19 then 'The usual place of residence, unless listed below, for example, a private dwelling whether owner occupied or owned by Local Authority, housing association or other landlord. This includes wardened accommodation but not residential accommodation where health care is provided. It also includes PATIENTS with no fixed abode.'
when admisorc = 29 then 'Temporary place of residence when usually resident elsewhere, for example, hotels and residential educational establishments'
when admisorc = 30 then 'Repatriation from high security psychiatric hospital (1999-00 to 2006-07)'
when admisorc = 37 then 'Penal establishment: court (1999-00 to 2006-07)'
when admisorc = 38 then 'Penal establishment: police station (1999-00 to 2006-07)'
when admisorc = 39 then 'Penal establishment, Court or Police Station / Police Custody Suite'
when admisorc = 48 then 'High security psychiatric hospital, Scotland (1999-00 to 2006-07)'
when admisorc = 49 then 'NHS other hospital provider: high security psychiatric accommodation in an NHS hospital provider (NHS trust or NHS Foundation Trust)'
when admisorc = 50 then 'NHS other hospital provider: medium secure unit (1999-00 to 2006-07)'
when admisorc = 51 then 'NHS other hospital provider: ward for general patients or the younger physically disabled or A&E department'
when admisorc = 52 then 'NHS other hospital provider: ward for maternity patients or neonates'
when admisorc = 53 then 'NHS other hospital provider: ward for patients who are mentally ill or have learning disabilities'
when admisorc = 54 then 'NHS run Care Home'
when admisorc = 65 then 'Local authority residential accommodation i.e. where care is provided'
when admisorc = 66 then 'Local authority foster care, but not in residential accommodation i.e. where care is provided'
when admisorc = 69 then 'Local authority home or care (1989-90 to 1995-96)'
when admisorc = 79 then 'Babies born in or on the way to hospital'
when admisorc = 85 then 'Non-NHS (other than Local Authority) run care home'
when admisorc = 86 then 'Non-NHS (other than Local Authority) run nursing home'
when admisorc = 87 then 'Non-NHS run hospital'
when admisorc = 88 then 'non-NHS (other than Local Authority) run hospice'
when admisorc = 89 then 'Non-NHS institution (1989-90 to 1995-96)'
when admisorc = 98 then 'Not applicable'
when admisorc = 99 then 'Not known'end as [admisorc]
into dbo.DimAdmiSorc
from ['APC_Raw dataset$']

--Reference Table for Duration of Elective Wait
if OBJECT_ID('dbo.DimElecDur') is not null
begin
	drop table dbo.DimElecDur
end

select distinct
elecdur as ID
,case
when elecdur = 9998 then 'not applicable'
when elecdur = 9999 then 'not known (i.e. no date known for decision to admit): a validation error'
when elecdur = null then 'not known / not applicable'else elecdurend as [elecdur]
into dbo.DimElecDur
from ['APC_Raw dataset$']

--Reference Table for Patient Classification
if OBJECT_ID('dbo.DimClassPat') is not null
begin
	drop table dbo.DimClassPat
end

select distinct
classpat as ID
,case
when classpat = 1 then 'Ordinary admission'
when classpat = 2 then 'Day case admission'
when classpat = 3 then 'Regular day attender'
when classpat = 4 then 'Regular night attender'
when classpat = 5 then 'Mothers and babies using only delivery facilities'
when classpat = 8 then 'Not applicable (other maternity event)'
when classpat = 9 then 'Not known'end as [classpat]
into dbo.DimClassPat
from ['APC_Raw dataset$']

--Reference Table for Sex Determination
if OBJECT_ID('dbo.DimSex') is not null
begin
	drop table dbo.DimSex
end

select distinct
sex as ID
,case
when sex = 1 then 'Male'
when sex = 2 then 'Female'
when sex = 9 then 'Not specified'
when sex = 0 then 'Not known'
when sex = 3 then 'Indeterminate, including those undergoing sex change operations'end as [sex]
into dbo.DimSex
from ['APC_Raw dataset$']

--Reference Table for Beginning of Spell Indicator
if OBJECT_ID('dbo.DimSpelBgin') is not null
begin
	drop table dbo.DimSpelBgin
end

select distinct
spellbgin as ID
,case
when spellbgin = '0' then 'Not the first episode of spell'
when spellbgin = '1' then 'First episode of spell that started in a previous year'
when spellbgin = '2' then 'First episode of spell that started in current year'
when spellbgin = 'Null' then 'Not applicable'end as [spellbgin]
into dbo.DimSpelBgin
from ['APC_Raw dataset$']

--Reference Table for Admin Category at Start
if OBJECT_ID('dbo.DimAdminCatSt') is not null
begin
	drop table dbo.DimAdminCatSt
end

select distinct
admincatst as ID
,case
when admincatst = 1 then 'NHS patient'
when admincatst = 2 then 'Private patient'
when admincatst = 3 then 'Amenity patient'
when admincatst = 4 then 'Category II patient'
when admincatst = 98 then 'Not applicable'
when admincatst = 99 then 'Not known: a validation error'end as [admincatst]
into dbo.DimAdminCatSt
from ['APC_Raw dataset$']

--After reference tables have been made, they need to be referenced to the main data set through joins
--These joins are added at the end of this select query

--A table with be created based on this query result, dbo.CleanData
--The attributes selected from the Raw dataset have all been renamed for easy understanding
--Additionally, there is a cleansing process taking place as part of this select query
--As such, use of case when to cleanse bedyear, endage, newnhsno and elecdate
drop table dbo.CleanData
select
	spell as Spell,
	episode as Episode,
	epistart as [Episode Start],
	epiend as [Episode End],
	dbo.DimEpiType.epitype as [Episode Type],
	dbo.DimSex.sex as [Sex],
	case
	when bedyear is null then datediff(dd, epistart, epiend)
	else bedyear
	end as [Bed Days],
	epidur as [Episode Duration],
	dbo.DimEpiStat.epistat as [Episode Status],
	dbo.DimSpelBgin.spellbgin as [Beginning of Spell Indicator],
	activage as [Age at Activity Date],
	admiage as [Age on Admission],
	dbo.DimAdminCat.admincat as [Administrative Category],
	dbo.DimAdminCatSt.admincatst as [Administrative Category at Start of Episode],
	dbo.DimCategory.category as [Administrative & Legal Status of Patient],
	dob as [Date of Birth],
	case
	when endage is null then 'Unknown'
	else endage
	end as [Age at End of Episode],
	dbo.DimEthnos.ethnos as [Ethnic Category],
	hesid as [Patient Identifier],
	dbo.DimLeglCat.leglcat as [Legal Category of Patient],
	lopatid as [Local Patient Identifier],
	mydob as [Date of Birth - Month and Year],
	case 
	when newnhsno is null then 'Unknown'
	else newnhsno 
	end as [NHS Number],
	dbo.DimNewNHSNo_Check.newnhsno_check as [NHS Number Valid Flag],
	startage as [Age at Start of Episode],
	admistart as [Start of Admission Date],
	dbo.DimAdmiMeth.admimeth as [Method of Admission],
	dbo.DimAdmiSorc.admisorc as [Source of Admission],
	case
	when elecdate is null then 'Unknown'
	else elecdate
	end as [Date of Decision to Admit],
	dbo.DimElecDur.elecdur as	[Duration of Elective Wait],
	elecdur_calc as [Calculation of Elecdur],
	dbo.DimClassPat.classpat as [Patient Classification],
	diag_01 as [Diagnosis Number]
into dbo.CleanData
from ['APC_Raw dataset$']
join dbo.DimEthnos on ['APC_Raw dataset$'].ethnos = DimEthnos.ID
join dbo.DimEpiType on ['APC_Raw dataset$'].epitype = DimEpiType.ID
join dbo.DimAdmiMeth on ['APC_Raw dataset$'].admimeth = DimAdmiMeth.ID
join dbo.DimAdminCat on ['APC_Raw dataset$'].admincat = DimAdminCat.ID
join dbo.DimCategory on ['APC_Raw dataset$'].category = DimCategory.ID
join dbo.DimClassPat on ['APC_Raw dataset$'].classpat = DimClassPat.ID
join dbo.DimEpiStat on ['APC_Raw dataset$'].epistat = DimEpiStat.ID
join dbo.DimNewNHSNo_Check on ['APC_Raw dataset$'].newnhsno_check = DimNewNHSNo_Check.ID
join dbo.DimSex on ['APC_Raw dataset$'].sex = DimSex.ID
join dbo.DimAdmiSorc on ['APC_Raw dataset$'].admisorc = DimAdmiSorc.ID
join dbo.DimElecDur on ['APC_Raw dataset$'].elecdur = DimElecDur.ID
join dbo.DimLeglCat on ['APC_Raw dataset$'].leglcat = DimLeglCat.ID
join dbo.DimSpelBgin on ['APC_Raw dataset$'].spellbgin = DimSpelBgin.ID
join dbo.DimAdminCatSt on ['APC_Raw dataset$'].admincatst = DimAdminCatSt.ID

select * from CleanData

