SELECT
    skills_dim.skills skills,
    ROUND(AVG(jpf.salary_year_avg), 0) average_salary
FROM skills_job_dim
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
INNER JOIN job_postings_fact jpf ON skills_job_dim.job_id = jpf.job_id
WHERE
    jpf.job_title_short = 'Data Analyst' AND
    jpf.salary_year_avg IS NOT NULL AND
    jpf.job_work_from_home = TRUE
GROUP BY
    skills_dim.skills
ORDER BY
    average_salary DESC
LIMIT 25