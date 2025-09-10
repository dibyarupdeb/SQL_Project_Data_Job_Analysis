/*
    What are the most optimal skills to learn (demand and pay for each skill)?
    * Identify skills which are in high demand and also pay high salary.
    * Target skills that offer job-security (high demand) and financial benefits (high salary) offering strategic insights in data-driven roles.
*/

WITH skills_demand AS (
    SELECT
        skills_dim.skill_id AS skills_demand_id,
        skills,
        COUNT(*) AS skill_demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim
        ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim
        ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_country = 'India'
    GROUP BY skills_demand_id
), skills_average_salary AS (
    SELECT 
        skills_dim.skill_id AS skills_average_salary_id,
        skills,
        ROUND(AVG(salary_year_avg), 2) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim
        ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim
        ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        salary_year_avg IS NOT NULL
        AND job_country = 'India'
    GROUP BY skills_average_salary_id
)

SELECT 
    skills_demand.skills_demand_id,
    skills_demand.skills,
    skill_demand_count,
    avg_salary
FROM skills_demand
INNER JOIN skills_average_salary
    ON skills_demand.skills_demand_id = skills_average_salary.skills_average_salary_id
ORDER BY
    skill_demand_count DESC,
    avg_salary DESC;