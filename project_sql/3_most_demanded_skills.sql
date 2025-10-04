SELECT
    job_postings_fact.job_id,
    job_postings_fact.job_title_short,
    skills_dim.skills AS skill_name,
    COUNT(skills_dim.skills) AS skill_count

SELECT *
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id

WHERE
    job_title_short = 'Data Analyst'

GROUP BY
    skills_dim.skill_count