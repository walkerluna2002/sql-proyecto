
select 
skills,
COUNT (SKILLS_JOB_DIM.JOB_ID) AS DEMAND_COUNT

FROM job_postings_fact

INNER JOIN skills_job_dim

ON job_postings_fact.job_id = skills_job_dim.job_id

INNER JOIN skills_dim

ON skills_job_dim.skill_id = skills_dim.skill_id

WHERE 
JOB_TITLE_SHORT = 'Data Analyst' AND
job_work_from_home = true
GROUP by
SKILLS
ORDER BY
DEMAND_COUNT DESC
limit 5

