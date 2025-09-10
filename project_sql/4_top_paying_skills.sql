/*
    What are the top skills based on salary in India?
    * Look at the average salary associated with each skill for 'Data' jobs.
    * Focus on jobs with mentioned salaries.
    * Why?
        It reveals - how different skills reveal salary levels for 'Data' roles, and help in identifying the most financially rewarding skills to learn.
*/

SELECT 
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
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 25;

/*
    * Average Salary Benchmark: Across the listed skills, the average salary is about $140.1K USD. The highest-paying skill (GDPR) reaches $163.7K USD.
    * Top Skills: The highest-paying skills include GDPR, Haskell, Cognos, Watson, and RShiny, all offering $155K–163K USD on average.
    * Categories:
        - Compliance/Security (GDPR) leads with the highest salary.
        - AI/ML (Watson) and Data Tools (Cognos) are equally lucrative, around $157K USD.
        - Programming (Haskell, RShiny, Rust, etc.) averages $156K USD, showing strong demand for niche languages.
    * Broader Trend: Skills related to regulatory compliance, AI/ML platforms, and niche programming/data tools are among the most rewarding.

    Overall, focusing on specialized/niche tools and compliance-related knowledge seems to pay better than generic programming or data skills.
*/