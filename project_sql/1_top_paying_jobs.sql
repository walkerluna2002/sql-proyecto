SELECT 
job_id,
job_title,
salary_year_avg,
job_title_short,
job_location,
company_dim.name


FROM job_postings_fact

LEFT JOIN company_dim

ON job_postings_fact.company_id = company_dim.company_id

where 
job_title_short = 'Data Analyst' 
AND
salary_year_avg is NOT NULL
AND
job_location = 'Anywhere'

order by 
salary_year_avg DESC

LIMIT 10 

