INSERT INTO vacancies (specialty, grade, skills, experience, work_format, salary_from, salary_to, salary_currency)
VALUES
    ('Backend Python', 'Junior', ARRAY['Python', 'SQL', 'Git'], 'No experience', 'Remote', 80000, 120000, 'RUB'),
    ('Backend Python', 'Middle', ARRAY['Python', 'SQL', 'Docker', 'FastAPI'], '1-3 years', 'Hybrid', 150000, 220000, 'RUB'),
    ('Backend Python', 'Senior', ARRAY['Python', 'PostgreSQL', 'Kubernetes'], '3-6 years', 'Remote', 260000, 360000, 'RUB'),
    ('Frontend', 'Junior', ARRAY['JavaScript', 'HTML/CSS'], 'No experience', 'Office', 70000, 110000, 'RUB'),
    ('Frontend', 'Middle', ARRAY['TypeScript', 'React', 'Redux'], '1-3 years', 'Hybrid', 140000, 210000, 'RUB'),
    ('Data Analyst', 'Middle', ARRAY['SQL', 'Python', 'Power BI'], '1-3 years', 'Remote', 130000, 190000, 'RUB');

INSERT INTO resume_aggregates (specialty, grade, active_resume_count, collected_at)
VALUES
    ('Backend Python', NULL, 344, NOW()),
    ('Frontend', NULL, 418, NOW()),
    ('Data Analyst', NULL, 226, NOW()),
    ('DevOps', NULL, 42, NOW());
