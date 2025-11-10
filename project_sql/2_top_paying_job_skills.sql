WITH top_paying_jobs AS (
SELECT 
JOB_ID,
job_title,
job_title_short,
salary_year_avg,
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
)
Select 
top_paying_jobs.*,
skills

FROM top_paying_jobs

INNER JOIN skills_job_dim

ON top_paying_jobs.job_id = skills_job_dim.job_id

INNER JOIN skills_dim

ON skills_job_dim.skill_id = skills_dim.skill_id

order BY
salary_year_avg DESC
