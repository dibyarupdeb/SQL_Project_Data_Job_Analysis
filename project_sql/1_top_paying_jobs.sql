/*
    What are the top-paying 'Data' jobs?
    * Identify the top 10 highest-paying 'Data' jobs that are available in India.
    * Focus on job postings with specified salaries (remove nulls).
    * Highlight the top-paying opportunities for 'Data' roles offering insights into employment options.
*/


SELECT 
    job_title_short,
    job_title,
    job_location,
    job_country,
    salary_year_avg,
    name AS company_name
FROM job_postings_fact
LEFT JOIN company_dim
    ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    job_country = 'India' AND
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;


