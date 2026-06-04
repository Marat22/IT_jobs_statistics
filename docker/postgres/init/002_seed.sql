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

INSERT INTO resume_aggregates (specialty, grade, active_resume_count, collected_at)
VALUES
    ('Backend Python', NULL, 3920, NOW()),
    ('Backend Python', 'Junior', 980, NOW()),
    ('Backend Python', 'Middle', 2080, NOW()),
    ('Backend Python', 'Senior', 720, NOW()),
    ('Backend Python', 'Lead', 140, NOW()),

    ('Frontend', NULL, 418, NOW()),
    ('Frontend', 'Junior', 196, NOW()),
    ('Frontend', 'Middle', 162, NOW()),
    ('Frontend', 'Senior', 52, NOW()),
    ('Frontend', 'Lead', 8, NOW()),

    ('Data Analyst', NULL, 226, NOW()),
    ('Data Analyst', 'Junior', 92, NOW()),
    ('Data Analyst', 'Middle', 98, NOW()),
    ('Data Analyst', 'Senior', 31, NOW()),
    ('Data Analyst', 'Lead', 5, NOW()),

    ('DevOps', NULL, 118, NOW()),
    ('DevOps', 'Junior', 36, NOW()),
    ('DevOps', 'Middle', 48, NOW()),
    ('DevOps', 'Senior', 27, NOW()),
    ('DevOps', 'Lead', 7, NOW()),

    ('QA Engineer', NULL, 64, NOW());
