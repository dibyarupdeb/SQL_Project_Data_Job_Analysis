/*
    What skills are required for the top-paying 'Data' jobs in India?
    * Use the top 10 highest-paying 'Data' jobs from the first query.
    * Show the specific skills required for these roles.
    * Why? 
        It provides a detailed look at which high-paying jobs demand certain skills, helping job-seekers to understand which skills to develop that align with top salaries.
*/

WITH top_paying_jobs AS (
    SELECT
        job_id,
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
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim
    ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id;

/*
    Key Insights.
    * Python is foundational: Proficiency in Python is a common requirement, highlighting its role as the industry standard for data manipulation and machine learning.
    * Big Data Tools are Essential: Skills like Spark and Airflow are highly valued. This suggests that these top-tier jobs often involve handling large datasets and require expertise in building scalable and automated data pipelines.
    * Machine Learning Specialization: The strong presence of frameworks like TensorFlow, Keras, and PyTorch points to a high demand for specialized skills in machine learning and deep learning. This indicates that the highest-paying roles are often focused on advanced analytical tasks and model development rather than just basic data analysis.
    * Cloud Computing: The presence of AWS (mentioned 3 times) and Docker (mentioned 3 times) highlights the importance of cloud computing and containerization for deploying and managing machine learning models and applications.
*/