
WITH skills_demand AS (

select 
skills_dim.skill_id,
skills_dim.skills,
COUNT (SKILLS_JOB_DIM.JOB_ID) AS DEMAND_COUNT

FROM job_postings_fact

INNER JOIN skills_job_dim

ON job_postings_fact.job_id = skills_job_dim.job_id

INNER JOIN skills_dim

ON skills_job_dim.skill_id = skills_dim.skill_id

WHERE 
JOB_TITLE_SHORT = 'Data Analyst' AND
job_work_from_home = true AND
salary_year_avg IS NOT NULL

GROUP by
skills_dim.SKILL_ID

), average_salary AS (

select 
SKILLS_JOB_DIM.skill_id,

ROUND(AVG(JOB_POSTINGS_FACT.salary_year_avg), 0) as salary

FROM job_postings_fact

INNER JOIN skills_job_dim

ON job_postings_fact.job_id = skills_job_dim.job_id

INNER JOIN skills_dim

ON skills_job_dim.skill_id = skills_dim.skill_id

WHERE 
JOB_TITLE_SHORT = 'Data Analyst' 
AND salary_year_avg IS NOT NULL
AND job_work_from_home = TRUE

GROUP by
skills_job_dim.skill_id

)

select 
SKILLS_DEMAND.SKILL_ID,
SKILLS_DEMAND.SKILLS,
SKILLS_DEMAND.DEMAND_COUNT,
average_salary.SALARY

FROM 
SKILLS_DEMAND

INNER JOIN average_salary
ON SKILLS_DEMAND.SKILL_ID = average_salary.SKILL_ID

WHERE 
DEMAND_COUNT > 10
ORDER BY
SALARY DESC,
DEMAND_COUNT DESC

LIMIT 25


select 
SKILLS_DIM.SKILL_ID,
SKILLS_DIM.SKILLS,
ROUND (AVG(JOB_POSTINGS_FACT.salary_year_avg), 0) as salary,
COUNT (SKILLS_JOB_DIM.JOB_ID) AS DEMAND_COUNT

FROM job_postings_fact

Inner join skills_job_dim

on job_postings_fact.job_id = skills_job_dim.job_id

INNER JOIN skills_dim

On skills_job_dim.skill_id = skills_dim.skill_id

WHERE
JOB_TITLE_SHORT = 'Data Analyst' AND
job_work_from_home = true AND
salary_year_avg IS NOT NULL  

GROUP BY 
SKILLS_DIM.SKILL_ID

HAVING
COUNT (SKILLS_JOB_DIM.JOB_ID) > 10

ORDER BY
salary DESC,
DEMAND_COUNT DESC

LIMIT
25




