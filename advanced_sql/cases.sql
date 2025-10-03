-- JANUARY
/*CREATE TABLE january_jobs AS
    SELECT *
    FROM
        job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

-- FEBRUARY
CREATE TABLE february_jobs AS
    SELECT *
    FROM
        job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

-- MARCH
CREATE TABLE march_jobs AS
    SELECT *
    FROM
        job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3;
*/

SELECT 
    COUNT(job_id) AS number_of_jobs,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'On-site'
    END AS location_category
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY location_category
ORDER BY number_of_jobs DESC
LIMIT 50;