create database hantavirus_project;
show tables;
use hantavirus_project;
select * from global_hantavirus_surveillance_dataset_2026;
select sum(CASE WHEN country is NULL then 1 else 0 end ) as missing_countries,
sum(case when patient_age is null then 1 else 0 end) as missing_age,
sum(case when fatality is null then 1 else 0 end) as missing_fatality_data 
from global_hantavirus_surveillance_dataset_2026;
select country,
count(*) as total_cases,
round(avg(patient_age), 1)
avg_recovery_days
from global_hantavirus_surveillance_dataset_2026
group by country
order by total_cases desc;
select virus_strain,
count(*) AS total_cases,
sum(case when fatality = 'YES' then 1 else 0 end) as total_deaths,
round( (SUM(CASE WHEN fatality = 'yes' then 1 else 0 end) / count(*)) * 100, 2)
as fatality_rate_percent
from global_hantavirus_surveillance_dataset_2026
group by virus_strain
order by fatality_rate_percent desc;
select exposure_source,
transmission_type,
count(*) as total_cases
from global_hantavirus_surveillance_dataset_2026
group by exposure_source,
transmission_type
order by total_cases desc;

