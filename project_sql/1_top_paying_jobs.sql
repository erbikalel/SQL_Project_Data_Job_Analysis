SELECT 
    jpf.job_id,
    jpf.job_title_short AS job,
    jpf.job_title,
    jpf.job_location,
    jpf.job_schedule_type,
    jpf.salary_year_avg,
    jpf.job_posted_date,
    company_dim.name AS company_name
FROM 
    job_postings_fact AS jpf
LEFT JOIN company_dim
    ON company_dim.company_id = jpf.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10