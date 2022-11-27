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
    Overall_Homeless as Total,
    Sheltered_ES_Homeless as Emergency_Shelters,
    ROUND((Sheltered_ES_Homeless/Overall_Homeless)*100, 2) as Percentage
From 
	homelessness.homeless_data
Where
	Count_Year = 2014
order by 5 DESC
-- Looking at Total Sheltered Homeless vs Homeless in Transitional Housing
Select 
	CoC_Name as Location,
    Count_Year as Year,
    Overall_Homeless as Total,
    Sheltered_TH_Homeless as Transitional_Housing,
    ROUND((Sheltered_TH_Homeless/Overall_Homeless)*100, 2) as Percentage
From 
	homelessness.homeless_data
Where
	Count_Year = 2014
order by 5 DESC
-- Looking at Total Sheltered Homeless vs Homeless in Safe Haven Housing
Select 
	CoC_Name as Location,
    Count_Year as Year,
    Overall_Homeless as Total,
    Sheltered_SH_Homeless as SafeHaven_Housing,
    ROUND((Sheltered_SH_Homeless/Overall_Homeless)*100, 2) as Percentage
From 
	homelessness.homeless_data
Where
	Count_Year = 2014
order by 5 DESC
-- Looking at effectiveness of the Transitional Housing
with Overtime (Location, Year, Total, Homelessness_Overtime)
as
(
Select 
	CoC_Name as Location,
    Count_Year as Year,
    Overall_Homeless as Total,
    Overall_Homeless - LAG(Overall_Homeless) OVER (Partition by CoC_Name order by Coc_Name, Count_Year) as Homelessness_Overtime
From 
	homelessness.homeless_data
order by 1
)
-- Calculating effectiveness of Transitional Housing
loss_or_Gain_of_Homeless 
as
(
Select
	Location,
    Homelessness_Overtime
From 
	Overtime
Where
	Year = 2014
)
Select *
From loss_or_Gain_of_Homeless