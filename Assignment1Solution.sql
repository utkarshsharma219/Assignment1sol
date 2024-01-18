CREATE DATABASE Assignment1
GO

USE Assignment1
GO

Select * from [dbo].[insurance_data - insurance_data]

--1.Show records of 'male' patient from 'southwest' region. Ans=152 rows
select * from [dbo].[insurance_data - insurance_data]
where gender='male' AND region='southwest'

--2.Show all records having bmi in range 30 to 45 both inclusive.Ans=688 rows
select * from [dbo].[insurance_data - insurance_data]
where bmi between 30 and 45

--3.Show minimum and maximum bloodpressure 
--of diabetic patient who smokes. Make column names as MinBP and MaxBP respectively. Ans=80,140
Select MIN(bloodpressure) from [dbo].[insurance_data - insurance_data] AS MinBP
WHERE diabetic=1 AND smoker='yes'

Select MAX(bloodpressure) from [dbo].[insurance_data - insurance_data] AS MaxBP
WHERE diabetic=1 AND smoker='yes'

--4.Find no of unique patients who are not from southwest region. Ans=1023
Select Distinct PatientID from [dbo].[insurance_data - insurance_data]
Where Region NOT IN ('southwest')

--5.Total claim amount from male smoker. Ans=5253678.98
Select sum(claim) from [dbo].[insurance_data - insurance_data]
where gender='male' and smoker='yes'

--6.Select all records of south region.Ans=757
select * from [dbo].[insurance_data - insurance_data]
where region='southeast' or region='southwest'

--7.No of patient having normal blood pressure. Normal range[90-120] Ans=758
Select count(PatientID) From [dbo].[insurance_data - insurance_data]
where bloodpressure between 90 AND 120

--8.No of pateint below 17 years of age having normal blood pressure as per below formula - Ans=8
--->BP normal range = 80+(age in years × 2) to 100 + (age in years × 2)
--->Note: Formula taken just for practice, don't take in real sense.

Select COUNT(PatientID) from [dbo].[insurance_data - insurance_data]
where bloodpressure between (80+(age*2)) AND (100+(age*2))

--9.What is the average claim amount for non-smoking female patients who are diabetic? Ans=8593.76

Select AVG(claim) from [dbo].[insurance_data - insurance_data]
where gender='female' AND smoker='no' AND diabetic=1

--10.Write a SQL query to update the claim amount for the patient with PatientID = 1234 to 5000.
Update [dbo].[insurance_data - insurance_data]
SET PatientID=5000
where PatientID=1234

--11.Write a SQL query to delete all records for patients who are smokers and have no children. Ans=115 rows deleted
DELETE FROM [dbo].[insurance_data - insurance_data]
WHERE smoker='yes' AND children=0
