/*
Evaluating Areas on their homelessness support based off multiple factors:
	- unsheltered vs sheltered homeless people
    - How many people in Emergency Shelters
    - How many people in Transitional Housing
    - How many people in Safe Haven Housing
    - How effective is the Transitional Housing
*/
-- Looking at unsheltered vs sheltered homeless people
Select 
	CoC_Name as Location,
    Count_Year as Year,
    Overall_Homeless as Total,
    Unsheltered_Homeless as Unsheltered,
    (Unsheltered_Homeless/Overall_Homeless)*100 as Percentage
From 
	homelessness.homeless_data
Where
	Count_Year = 2014
order by 5 DESC
-- Looking at Total Sheltered Homeless vs Homeless in emergency shelters
Select 
	CoC_Name as Location,
    Count_Year as Year,
    Homeless_Individuals as Total,
    Sheltered_ES_Homeless as Emergency_Shelters,
    (Sheltered_ES_Homeless/Overall_Homeless)*100 as Percentage
From 
	homelessness.homeless_data
Where
	Count_Year = 2014
order by 5 DESC
-- Looking at Total Sheltered Homeless vs Homeless in Transitional Housing
Select 
	CoC_Name as Location,
    Count_Year as Year,
    Homeless_Individuals as Total,
    Sheltered_ES_Homeless as Emergency_Shelters,
    (Sheltered_ES_Homeless/Overall_Homeless)*100 as Percentage
From 
	homelessness.homeless_data
Where
	Count_Year = 2014