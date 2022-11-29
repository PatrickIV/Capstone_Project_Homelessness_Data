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