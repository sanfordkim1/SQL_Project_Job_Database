SELECT
    quarter1_job_postings.job_location,
    quarter1_job_postings.job_title_short,
    quarter1_job_postings.salary_year_avg,
    quarter1_job_postings.job_posted_date::DATE

FROM (
    SELECT 
        job_posted_date,
        job_title_short,
        job_location,
        salary_year_avg
    FROM january_jobs

    UNION ALL

    SELECT 
        job_posted_date,
        job_title_short,
        job_location,
        salary_year_avg
    FROM february_jobs

    UNION ALL

    SELECT 
        job_posted_date,
        job_title_short,
        job_location,
        salary_year_avg
    FROM march_jobs) AS quarter1_job_postings

WHERE salary_year_avg > 70000 AND
        job_title_short = 'Data Analyst'

ORDER BY salary_year_avg

LIMIT 100;
