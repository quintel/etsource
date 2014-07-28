#### This "eu" folder contains load profiles for the EU27 dataset (base year 2011). 

This documents the origin of the EU profiles. For an extended documentation, please refer to the Source Analyses of the EU dataset. 

##### agriculture_chp.csv
	identical to NL profile

##### buildings_chp.csv
	identical to NL profile

##### industry_chp.csv
	always on

##### river.csv
	identical to NL profile

##### solar_pv.csv
	tbd

##### total_demand.csv

	The original curves (per country and per month) have been downloaded from ENTSO-E, see https://www.entsoe.eu/db-query/consumption/mhlv-all-countries-for-a-specific-month 
	We consider 26 out of the 27 EU countries, only Malta is missing. (Be aware that the original data considers dailight savings, which means that we needed to correct two non-continuous hours in March and October)
	We add all EU load curves together, unit: MW. 

##### wind_coastal.csv
	tbd

##### wind_inland.csv
	tbd

##### wind_offshore.csv
	tbd

