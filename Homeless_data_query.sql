-- Looking at Totals vs Homeless in emergency shelters
Select 
	CoC_Name as Location,
    Count_Year as Year,
    Overall_Homeless as Total,
    Sheltered_ES_Homeless as Emergency_Shelters
From 
	homelessness.homeless_data
order by 1,2