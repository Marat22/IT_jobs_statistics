TRUNCATE TABLE vacancies, resume_aggregates RESTART IDENTITY;

INSERT INTO vacancies (specialty, grade, skills, experience, work_format, salary_from, salary_to, salary_currency, created_at)
VALUES
    ('Backend Python', 'Junior', ARRAY['Python', 'SQL', 'Git', 'REST API'], 'No experience', 'Remote', 80000, 120000, 'RUB', NOW() - INTERVAL '7 days'),
    ('Backend Python', 'Junior', ARRAY['Python', 'Django/FastAPI', 'SQL', 'Docker'], '1-3 years', 'Hybrid', 100000, 145000, 'RUB', NOW() - INTERVAL '6 days'),
    ('Backend Python', 'Junior', ARRAY['Python', 'PostgreSQL', 'Git'], 'No experience', 'Office', 75000, 110000, 'RUB', NOW() - INTERVAL '5 days'),
    ('Backend Python', 'Middle', ARRAY['Python', 'SQL', 'Docker', 'FastAPI'], '1-3 years', 'Hybrid', 150000, 220000, 'RUB', NOW() - INTERVAL '4 days'),
    ('Backend Python', 'Middle', ARRAY['Python', 'Django/FastAPI', 'PostgreSQL', 'REST API'], '1-3 years', 'Remote', 160000, 230000, 'RUB', NOW() - INTERVAL '4 days'),
    ('Backend Python', 'Middle', ARRAY['Python', 'Docker', 'RabbitMQ', 'PostgreSQL'], '3-6 years', 'Remote', 180000, 250000, 'RUB', NOW() - INTERVAL '3 days'),
    ('Backend Python', 'Middle', ARRAY['Python', 'SQL', 'Redis', 'REST API'], '1-3 years', 'Office', 140000, 200000, 'RUB', NOW() - INTERVAL '3 days'),
    ('Backend Python', 'Senior', ARRAY['Python', 'PostgreSQL', 'Kubernetes', 'Docker'], '3-6 years', 'Remote', 260000, 360000, 'RUB', NOW() - INTERVAL '2 days'),
    ('Backend Python', 'Senior', ARRAY['Python', 'Django/FastAPI', 'System Design', 'PostgreSQL'], '3-6 years', 'Hybrid', 250000, 340000, 'RUB', NOW() - INTERVAL '2 days'),
    ('Backend Python', 'Lead', ARRAY['Python', 'Architecture', 'Team Lead', 'System Design'], '6+ years', 'Hybrid', 320000, 430000, 'RUB', NOW() - INTERVAL '1 day'),

    ('Frontend', 'Junior', ARRAY['JavaScript', 'HTML/CSS', 'Git'], 'No experience', 'Office', 70000, 110000, 'RUB', NOW() - INTERVAL '8 days'),
    ('Frontend', 'Junior', ARRAY['JavaScript', 'React', 'HTML/CSS'], 'No experience', 'Hybrid', 85000, 125000, 'RUB', NOW() - INTERVAL '7 days'),
    ('Frontend', 'Junior', ARRAY['TypeScript', 'React', 'HTML/CSS'], '1-3 years', 'Remote', 100000, 145000, 'RUB', NOW() - INTERVAL '7 days'),
    ('Frontend', 'Middle', ARRAY['TypeScript', 'React', 'Redux', 'REST API'], '1-3 years', 'Hybrid', 140000, 210000, 'RUB', NOW() - INTERVAL '6 days'),
    ('Frontend', 'Middle', ARRAY['TypeScript', 'React', 'Vite/Webpack', 'HTML/CSS'], '1-3 years', 'Remote', 150000, 220000, 'RUB', NOW() - INTERVAL '5 days'),
    ('Frontend', 'Middle', ARRAY['JavaScript', 'React', 'Redux', 'Testing'], '1-3 years', 'Office', 130000, 190000, 'RUB', NOW() - INTERVAL '5 days'),
    ('Frontend', 'Middle', ARRAY['TypeScript', 'Vue', 'HTML/CSS', 'REST API'], '3-6 years', 'Hybrid', 155000, 225000, 'RUB', NOW() - INTERVAL '4 days'),
    ('Frontend', 'Senior', ARRAY['TypeScript', 'React', 'Architecture', 'Testing'], '3-6 years', 'Remote', 240000, 330000, 'RUB', NOW() - INTERVAL '3 days'),
    ('Frontend', 'Senior', ARRAY['TypeScript', 'React', 'Vite/Webpack', 'System Design'], '3-6 years', 'Remote', 230000, 320000, 'RUB', NOW() - INTERVAL '2 days'),
    ('Frontend', 'Lead', ARRAY['TypeScript', 'Architecture', 'Team Lead', 'React'], '6+ years', 'Hybrid', 300000, 420000, 'RUB', NOW() - INTERVAL '1 day'),

    ('Data Analyst', 'Junior', ARRAY['SQL', 'Excel', 'Statistics'], 'No experience', 'Office', 65000, 100000, 'RUB', NOW() - INTERVAL '9 days'),
    ('Data Analyst', 'Junior', ARRAY['SQL', 'Python', 'Excel'], 'No experience', 'Hybrid', 80000, 120000, 'RUB', NOW() - INTERVAL '8 days'),
    ('Data Analyst', 'Middle', ARRAY['SQL', 'Python', 'Power BI/Tableau'], '1-3 years', 'Remote', 130000, 190000, 'RUB', NOW() - INTERVAL '7 days'),
    ('Data Analyst', 'Middle', ARRAY['SQL', 'Python', 'Statistics', 'A/B tests'], '1-3 years', 'Hybrid', 140000, 200000, 'RUB', NOW() - INTERVAL '6 days'),
    ('Data Analyst', 'Middle', ARRAY['SQL', 'Power BI/Tableau', 'Excel'], '1-3 years', 'Office', 120000, 175000, 'RUB', NOW() - INTERVAL '5 days'),
    ('Data Analyst', 'Senior', ARRAY['SQL', 'Python', 'A/B tests', 'Statistics'], '3-6 years', 'Remote', 210000, 300000, 'RUB', NOW() - INTERVAL '4 days'),
    ('Data Analyst', 'Senior', ARRAY['SQL', 'Python', 'Data Modeling', 'Power BI/Tableau'], '3-6 years', 'Hybrid', 220000, 310000, 'RUB', NOW() - INTERVAL '3 days'),
    ('Data Analyst', 'Lead', ARRAY['SQL', 'Product Analytics', 'Team Lead', 'Statistics'], '6+ years', 'Hybrid', 280000, 390000, 'RUB', NOW() - INTERVAL '2 days'),

    ('DevOps', 'Junior', ARRAY['Linux', 'Docker', 'Git', 'CI/CD'], 'No experience', 'Office', 90000, 130000, 'RUB', NOW() - INTERVAL '9 days'),
    ('DevOps', 'Junior', ARRAY['Linux', 'Docker', 'Bash'], '1-3 years', 'Hybrid', 110000, 150000, 'RUB', NOW() - INTERVAL '8 days'),
    ('DevOps', 'Middle', ARRAY['Linux', 'Docker', 'Kubernetes', 'CI/CD'], '1-3 years', 'Remote', 170000, 250000, 'RUB', NOW() - INTERVAL '7 days'),
    ('DevOps', 'Middle', ARRAY['Kubernetes', 'Terraform', 'Docker', 'Monitoring'], '3-6 years', 'Remote', 190000, 270000, 'RUB', NOW() - INTERVAL '6 days'),
    ('DevOps', 'Middle', ARRAY['Linux', 'CI/CD', 'Ansible', 'Monitoring'], '1-3 years', 'Hybrid', 160000, 230000, 'RUB', NOW() - INTERVAL '5 days'),
    ('DevOps', 'Senior', ARRAY['Kubernetes', 'Terraform', 'AWS/GCP', 'Monitoring'], '3-6 years', 'Remote', 260000, 360000, 'RUB', NOW() - INTERVAL '4 days'),
    ('DevOps', 'Senior', ARRAY['Kubernetes', 'Linux', 'Architecture', 'CI/CD'], '3-6 years', 'Hybrid', 250000, 340000, 'RUB', NOW() - INTERVAL '3 days'),
    ('DevOps', 'Lead', ARRAY['Architecture', 'Team Lead', 'Kubernetes', 'Terraform'], '6+ years', 'Remote', 330000, 450000, 'RUB', NOW() - INTERVAL '2 days');

WITH generated_backend AS (
    SELECT
        n,
        CASE
            WHEN n % 100 < 16 THEN 'Junior'
            WHEN n % 100 < 68 THEN 'Middle'
            WHEN n % 100 < 94 THEN 'Senior'
            ELSE 'Lead'
        END AS grade,
        CASE
            WHEN n % 100 < 8 THEN 'No experience'
            WHEN n % 100 < 57 THEN '1-3 years'
            WHEN n % 100 < 91 THEN '3-6 years'
            ELSE '6+ years'
        END AS experience,
        CASE
            WHEN n % 10 < 5 THEN 'Remote'
            WHEN n % 10 < 8 THEN 'Hybrid'
            ELSE 'Office'
        END AS work_format,
        CASE
            WHEN n % 7 IN (0, 1, 2) THEN ARRAY['FastAPI']::TEXT[]
            WHEN n % 7 IN (3, 4) THEN ARRAY['Django']::TEXT[]
            WHEN n % 7 = 5 THEN ARRAY['Flask']::TEXT[]
            ELSE ARRAY['Django/FastAPI']::TEXT[]
        END AS framework_skills,
        CASE
            WHEN n % 6 IN (0, 1, 2) THEN ARRAY['PostgreSQL']::TEXT[]
            WHEN n % 6 = 3 THEN ARRAY['MySQL']::TEXT[]
            WHEN n % 6 = 4 THEN ARRAY['MongoDB']::TEXT[]
            ELSE ARRAY['SQLAlchemy']::TEXT[]
        END AS database_skills,
        CASE
            WHEN n % 8 IN (0, 1, 2, 3) THEN ARRAY['Docker']::TEXT[]
            WHEN n % 8 IN (4, 5) THEN ARRAY['Docker', 'Kubernetes']::TEXT[]
            WHEN n % 8 = 6 THEN ARRAY['Linux']::TEXT[]
            ELSE ARRAY['CI/CD']::TEXT[]
        END AS infra_skills,
        CASE
            WHEN n % 9 IN (0, 1, 2) THEN ARRAY['REST API']::TEXT[]
            WHEN n % 9 IN (3, 4) THEN ARRAY['GraphQL']::TEXT[]
            WHEN n % 9 IN (5, 6) THEN ARRAY['gRPC']::TEXT[]
            ELSE ARRAY['OpenAPI']::TEXT[]
        END AS api_skills,
        CASE
            WHEN n % 12 IN (0, 1) THEN ARRAY['Redis']::TEXT[]
            WHEN n % 12 IN (2, 3) THEN ARRAY['RabbitMQ']::TEXT[]
            WHEN n % 12 = 4 THEN ARRAY['Kafka']::TEXT[]
            WHEN n % 12 = 5 THEN ARRAY['Celery']::TEXT[]
            WHEN n % 12 = 6 THEN ARRAY['Pytest']::TEXT[]
            WHEN n % 12 = 7 THEN ARRAY['AsyncIO']::TEXT[]
            WHEN n % 12 = 8 THEN ARRAY['Pydantic']::TEXT[]
            WHEN n % 12 = 9 THEN ARRAY['GitLab CI']::TEXT[]
            WHEN n % 12 = 10 THEN ARRAY['AWS/GCP']::TEXT[]
            ELSE ARRAY['System Design']::TEXT[]
        END AS extra_skills
    FROM generate_series(1, 1500) AS n
)
INSERT INTO vacancies (specialty, grade, skills, experience, work_format, salary_from, salary_to, salary_currency, created_at)
SELECT
    'Backend Python',
    grade,
    ARRAY['Python', 'SQL', 'Git']::TEXT[]
        || framework_skills
        || database_skills
        || infra_skills
        || api_skills
        || extra_skills,
    experience,
    work_format,
    CASE grade
        WHEN 'Junior' THEN 75000 + ((n % 8) * 5000)
        WHEN 'Middle' THEN 145000 + ((n % 12) * 7000)
        WHEN 'Senior' THEN 240000 + ((n % 11) * 10000)
        ELSE 320000 + ((n % 9) * 12000)
    END AS salary_from,
    CASE grade
        WHEN 'Junior' THEN 115000 + ((n % 8) * 6000)
        WHEN 'Middle' THEN 215000 + ((n % 12) * 8000)
        WHEN 'Senior' THEN 330000 + ((n % 11) * 12000)
        ELSE 430000 + ((n % 9) * 15000)
    END AS salary_to,
    'RUB',
    NOW() - ((n % 45) || ' days')::INTERVAL
FROM generated_backend;

WITH generated_frontend AS (
    SELECT
        n,
        CASE
            WHEN n % 100 < 22 THEN 'Junior'
            WHEN n % 100 < 72 THEN 'Middle'
            WHEN n % 100 < 96 THEN 'Senior'
            ELSE 'Lead'
        END AS grade,
        CASE
            WHEN n % 100 < 12 THEN 'No experience'
            WHEN n % 100 < 62 THEN '1-3 years'
            WHEN n % 100 < 94 THEN '3-6 years'
            ELSE '6+ years'
        END AS experience,
        CASE
            WHEN n % 10 < 4 THEN 'Remote'
            WHEN n % 10 < 8 THEN 'Hybrid'
            ELSE 'Office'
        END AS work_format,
        CASE
            WHEN n % 10 IN (0, 1, 2, 3, 4, 5) THEN ARRAY['React']::TEXT[]
            WHEN n % 10 IN (6, 7) THEN ARRAY['Vue']::TEXT[]
            WHEN n % 10 = 8 THEN ARRAY['Angular']::TEXT[]
            ELSE ARRAY['Next.js']::TEXT[]
        END AS framework_skills,
        CASE
            WHEN n % 8 IN (0, 1, 2, 3) THEN ARRAY['Redux']::TEXT[]
            WHEN n % 8 IN (4, 5) THEN ARRAY['Zustand']::TEXT[]
            WHEN n % 8 = 6 THEN ARRAY['MobX']::TEXT[]
            ELSE ARRAY['React Query']::TEXT[]
        END AS state_skills,
        CASE
            WHEN n % 9 IN (0, 1, 2) THEN ARRAY['Vite/Webpack']::TEXT[]
            WHEN n % 9 IN (3, 4) THEN ARRAY['Jest']::TEXT[]
            WHEN n % 9 IN (5, 6) THEN ARRAY['Cypress']::TEXT[]
            WHEN n % 9 = 7 THEN ARRAY['Storybook']::TEXT[]
            ELSE ARRAY['Playwright']::TEXT[]
        END AS tooling_skills,
        CASE
            WHEN n % 7 IN (0, 1, 2) THEN ARRAY['REST API']::TEXT[]
            WHEN n % 7 IN (3, 4) THEN ARRAY['GraphQL']::TEXT[]
            WHEN n % 7 = 5 THEN ARRAY['WebSocket']::TEXT[]
            ELSE ARRAY['OpenAPI']::TEXT[]
        END AS api_skills,
        CASE
            WHEN n % 11 IN (0, 1) THEN ARRAY['Figma']::TEXT[]
            WHEN n % 11 IN (2, 3) THEN ARRAY['Accessibility']::TEXT[]
            WHEN n % 11 = 4 THEN ARRAY['SSR']::TEXT[]
            WHEN n % 11 = 5 THEN ARRAY['Microfrontends']::TEXT[]
            WHEN n % 11 = 6 THEN ARRAY['Docker']::TEXT[]
            WHEN n % 11 = 7 THEN ARRAY['CI/CD']::TEXT[]
            WHEN n % 11 = 8 THEN ARRAY['Performance']::TEXT[]
            WHEN n % 11 = 9 THEN ARRAY['Design System']::TEXT[]
            ELSE ARRAY['Team Lead']::TEXT[]
        END AS extra_skills
    FROM generate_series(1, 1400) AS n
)
INSERT INTO vacancies (specialty, grade, skills, experience, work_format, salary_from, salary_to, salary_currency, created_at)
SELECT
    'Frontend',
    grade,
    ARRAY['JavaScript', 'TypeScript', 'HTML/CSS', 'Git']::TEXT[]
        || framework_skills
        || state_skills
        || tooling_skills
        || api_skills
        || extra_skills,
    experience,
    work_format,
    CASE grade
        WHEN 'Junior' THEN 70000 + ((n % 8) * 5000)
        WHEN 'Middle' THEN 135000 + ((n % 12) * 7000)
        WHEN 'Senior' THEN 230000 + ((n % 11) * 10000)
        ELSE 300000 + ((n % 9) * 12000)
    END AS salary_from,
    CASE grade
        WHEN 'Junior' THEN 110000 + ((n % 8) * 6000)
        WHEN 'Middle' THEN 205000 + ((n % 12) * 8000)
        WHEN 'Senior' THEN 320000 + ((n % 11) * 12000)
        ELSE 410000 + ((n % 9) * 15000)
    END AS salary_to,
    'RUB',
    NOW() - ((n % 45) || ' days')::INTERVAL
FROM generated_frontend;

WITH generated_data_analyst AS (
    SELECT
        n,
        CASE
            WHEN n % 100 < 24 THEN 'Junior'
            WHEN n % 100 < 76 THEN 'Middle'
            WHEN n % 100 < 97 THEN 'Senior'
            ELSE 'Lead'
        END AS grade,
        CASE
            WHEN n % 100 < 14 THEN 'No experience'
            WHEN n % 100 < 66 THEN '1-3 years'
            WHEN n % 100 < 95 THEN '3-6 years'
            ELSE '6+ years'
        END AS experience,
        CASE
            WHEN n % 10 < 3 THEN 'Remote'
            WHEN n % 10 < 7 THEN 'Hybrid'
            ELSE 'Office'
        END AS work_format,
        CASE
            WHEN n % 8 IN (0, 1, 2) THEN ARRAY['Power BI/Tableau']::TEXT[]
            WHEN n % 8 IN (3, 4) THEN ARRAY['Power BI']::TEXT[]
            WHEN n % 8 IN (5, 6) THEN ARRAY['Tableau']::TEXT[]
            ELSE ARRAY['Looker Studio']::TEXT[]
        END AS bi_skills,
        CASE
            WHEN n % 7 IN (0, 1, 2) THEN ARRAY['Pandas']::TEXT[]
            WHEN n % 7 IN (3, 4) THEN ARRAY['NumPy']::TEXT[]
            WHEN n % 7 = 5 THEN ARRAY['Jupyter']::TEXT[]
            ELSE ARRAY['Airflow']::TEXT[]
        END AS python_skills,
        CASE
            WHEN n % 9 IN (0, 1, 2) THEN ARRAY['Statistics']::TEXT[]
            WHEN n % 9 IN (3, 4) THEN ARRAY['A/B tests']::TEXT[]
            WHEN n % 9 IN (5, 6) THEN ARRAY['Product Analytics']::TEXT[]
            WHEN n % 9 = 7 THEN ARRAY['Cohort Analysis']::TEXT[]
            ELSE ARRAY['Unit Economics']::TEXT[]
        END AS analytics_skills,
        CASE
            WHEN n % 10 IN (0, 1) THEN ARRAY['ETL']::TEXT[]
            WHEN n % 10 IN (2, 3) THEN ARRAY['Data Modeling']::TEXT[]
            WHEN n % 10 = 4 THEN ARRAY['ClickHouse']::TEXT[]
            WHEN n % 10 = 5 THEN ARRAY['PostgreSQL']::TEXT[]
            WHEN n % 10 = 6 THEN ARRAY['BigQuery']::TEXT[]
            WHEN n % 10 = 7 THEN ARRAY['Excel']::TEXT[]
            WHEN n % 10 = 8 THEN ARRAY['Dashboard Design']::TEXT[]
            ELSE ARRAY['Stakeholder Management']::TEXT[]
        END AS extra_skills
    FROM generate_series(1, 1200) AS n
)
INSERT INTO vacancies (specialty, grade, skills, experience, work_format, salary_from, salary_to, salary_currency, created_at)
SELECT
    'Data Analyst',
    grade,
    ARRAY['SQL', 'Python', 'Excel']::TEXT[]
        || bi_skills
        || python_skills
        || analytics_skills
        || extra_skills,
    experience,
    work_format,
    CASE grade
        WHEN 'Junior' THEN 65000 + ((n % 8) * 4500)
        WHEN 'Middle' THEN 125000 + ((n % 12) * 6500)
        WHEN 'Senior' THEN 205000 + ((n % 11) * 9500)
        ELSE 275000 + ((n % 9) * 11500)
    END AS salary_from,
    CASE grade
        WHEN 'Junior' THEN 100000 + ((n % 8) * 5500)
        WHEN 'Middle' THEN 185000 + ((n % 12) * 7500)
        WHEN 'Senior' THEN 295000 + ((n % 11) * 11500)
        ELSE 385000 + ((n % 9) * 14500)
    END AS salary_to,
    'RUB',
    NOW() - ((n % 45) || ' days')::INTERVAL
FROM generated_data_analyst;

WITH generated_devops AS (
    SELECT
        n,
        CASE
            WHEN n % 100 < 10 THEN 'Junior'
            WHEN n % 100 < 60 THEN 'Middle'
            WHEN n % 100 < 93 THEN 'Senior'
            ELSE 'Lead'
        END AS grade,
        CASE
            WHEN n % 100 < 5 THEN 'No experience'
            WHEN n % 100 < 48 THEN '1-3 years'
            WHEN n % 100 < 90 THEN '3-6 years'
            ELSE '6+ years'
        END AS experience,
        CASE
            WHEN n % 10 < 5 THEN 'Remote'
            WHEN n % 10 < 8 THEN 'Hybrid'
            ELSE 'Office'
        END AS work_format,
        CASE
            WHEN n % 8 IN (0, 1, 2, 3) THEN ARRAY['Kubernetes']::TEXT[]
            WHEN n % 8 IN (4, 5) THEN ARRAY['Docker']::TEXT[]
            WHEN n % 8 = 6 THEN ARRAY['OpenShift']::TEXT[]
            ELSE ARRAY['Helm']::TEXT[]
        END AS container_skills,
        CASE
            WHEN n % 7 IN (0, 1, 2) THEN ARRAY['Terraform']::TEXT[]
            WHEN n % 7 IN (3, 4) THEN ARRAY['Ansible']::TEXT[]
            WHEN n % 7 = 5 THEN ARRAY['Pulumi']::TEXT[]
            ELSE ARRAY['GitLab CI']::TEXT[]
        END AS infra_skills,
        CASE
            WHEN n % 9 IN (0, 1, 2) THEN ARRAY['AWS/GCP']::TEXT[]
            WHEN n % 9 IN (3, 4) THEN ARRAY['AWS']::TEXT[]
            WHEN n % 9 IN (5, 6) THEN ARRAY['Yandex Cloud']::TEXT[]
            WHEN n % 9 = 7 THEN ARRAY['Azure']::TEXT[]
            ELSE ARRAY['Bare Metal']::TEXT[]
        END AS cloud_skills,
        CASE
            WHEN n % 10 IN (0, 1) THEN ARRAY['Prometheus']::TEXT[]
            WHEN n % 10 IN (2, 3) THEN ARRAY['Grafana']::TEXT[]
            WHEN n % 10 = 4 THEN ARRAY['ELK']::TEXT[]
            WHEN n % 10 = 5 THEN ARRAY['SRE']::TEXT[]
            WHEN n % 10 = 6 THEN ARRAY['Bash']::TEXT[]
            WHEN n % 10 = 7 THEN ARRAY['Python']::TEXT[]
            WHEN n % 10 = 8 THEN ARRAY['Networking']::TEXT[]
            ELSE ARRAY['Incident Management']::TEXT[]
        END AS extra_skills
    FROM generate_series(1, 1100) AS n
)
INSERT INTO vacancies (specialty, grade, skills, experience, work_format, salary_from, salary_to, salary_currency, created_at)
SELECT
    'DevOps',
    grade,
    ARRAY['Linux', 'CI/CD', 'Git', 'Monitoring']::TEXT[]
        || container_skills
        || infra_skills
        || cloud_skills
        || extra_skills,
    experience,
    work_format,
    CASE grade
        WHEN 'Junior' THEN 90000 + ((n % 8) * 5500)
        WHEN 'Middle' THEN 165000 + ((n % 12) * 8000)
        WHEN 'Senior' THEN 255000 + ((n % 11) * 11000)
        ELSE 330000 + ((n % 9) * 13000)
    END AS salary_from,
    CASE grade
        WHEN 'Junior' THEN 130000 + ((n % 8) * 6500)
        WHEN 'Middle' THEN 245000 + ((n % 12) * 9000)
        WHEN 'Senior' THEN 360000 + ((n % 11) * 13000)
        ELSE 455000 + ((n % 9) * 16000)
    END AS salary_to,
    'RUB',
    NOW() - ((n % 45) || ' days')::INTERVAL
FROM generated_devops;

INSERT INTO resume_aggregates (specialty, grade, active_resume_count, collected_at)
VALUES
    ('Backend Python', NULL, 3920, NOW()),
    ('Backend Python', 'Junior', 980, NOW()),
    ('Backend Python', 'Middle', 2080, NOW()),
    ('Backend Python', 'Senior', 720, NOW()),
    ('Backend Python', 'Lead', 140, NOW()),

    ('Frontend', NULL, 4520, NOW()),
    ('Frontend', 'Junior', 1510, NOW()),
    ('Frontend', 'Middle', 2320, NOW()),
    ('Frontend', 'Senior', 610, NOW()),
    ('Frontend', 'Lead', 80, NOW()),

    ('Data Analyst', NULL, 2860, NOW()),
    ('Data Analyst', 'Junior', 840, NOW()),
    ('Data Analyst', 'Middle', 1510, NOW()),
    ('Data Analyst', 'Senior', 450, NOW()),
    ('Data Analyst', 'Lead', 60, NOW()),

    ('DevOps', NULL, 2050, NOW()),
    ('DevOps', 'Junior', 290, NOW()),
    ('DevOps', 'Middle', 890, NOW()),
    ('DevOps', 'Senior', 720, NOW()),
    ('DevOps', 'Lead', 150, NOW()),

    ('QA Engineer', NULL, 64, NOW());
