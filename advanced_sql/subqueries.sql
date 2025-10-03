
WITH remote_jobs AS (
SELECT
    COUNT(skill_id) AS skill_count,
    skill_id
FROM 
    skills_job_dim AS skills_to_job
INNER JOIN job_postings_fact AS job_postings ON job_postings.job_id = skills_to_job.job_id
WHERE job_postings.job_work_from_home = TRUE AND
        job_title_short = 'Data Analyst'
GROUP BY
    skill_id
)

SELECT 
    skill_count,
    skills AS skill_name,
    remote_jobs.skill_id
FROM  remote_jobs
INNER JOIN skills_dim ON skills_dim.skill_id = remote_jobs.skill_id
ORDER BY skill_count DESC
LIMIT 5