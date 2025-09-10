# Introduction
📊 Dive into the 'data' job market in India! Focusing on various 'Data' related jobs, this project explores 💰 top-paying jobs, 🔥 in-demand skills, and 📈 where high demand meets high salary in these jobs.

🔍 SQL queries? Check them out here: [project_sql folder](/project_sql/)

# Background
Driven by a quest to navigate the 'Data' job-market more effectively, this project was born from a desire to pinpoint top-paid and in-demand skills, streamlining others' work to find optimal jobs.

Data hails from: [Luke Barousse's SQL tutorial](https://www.youtube.com/watch?v=7mz73uXD9DA&t=13990s). It's packed with insights on job-titles, salaries, locations and essential skills.

### The questions I wanted to answer through my SQL queries were:
1. What are the top-paying 'Data' jobs?
2. What skills are required for the top-paying 'Data' jobs in India?
3. What are the most in-demand skills for 'Data' jobs in India?
4. What are the top skills based on salary in India?
5. What are the most optimal skills to learn (demand and pay for each skill)?

# Tools I used
For my deep-dive into the 'data' job-market, I harnessed the power of several key tools:

- **SQL**: The backbone of my analysis, allowing me to query the database and unearth critical insights.
- **PostgreSQL**: The chosen database management system, ideal for handling the job-posting data.
- **Visual Studio Code**: My go-to for database management and executing SQL queries.
- **Git & GitHub**: Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.

# The Analysis
Each query for this project aimed at investigating specific aspects of the data job-market. Here's how I approached each question:

### 1. Top-paying data jobs
To identify the highest paying data related posts in India, I sorted the positions in India based on the average yearly salary respective to each roles. This query helps in identifying the highest paying opportunities in this field.

```sql
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
```

# What I learned

# Conclusions

