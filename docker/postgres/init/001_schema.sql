CREATE TABLE IF NOT EXISTS vacancies (
    id BIGSERIAL PRIMARY KEY,
    specialty TEXT NOT NULL,
    grade TEXT,
    skills TEXT[] NOT NULL DEFAULT '{}',
    experience TEXT,
    work_format TEXT,
    salary_from INTEGER,
    salary_to INTEGER,
    salary_currency TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_vacancies_specialty ON vacancies (specialty);
CREATE INDEX IF NOT EXISTS idx_vacancies_grade ON vacancies (grade);

CREATE TABLE IF NOT EXISTS resume_aggregates (
    id BIGSERIAL PRIMARY KEY,
    specialty TEXT NOT NULL,
    grade TEXT,
    active_resume_count INTEGER NOT NULL CHECK (active_resume_count >= 0),
    collected_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_resume_aggregates_specialty ON resume_aggregates (specialty);
CREATE INDEX IF NOT EXISTS idx_resume_aggregates_collected_at ON resume_aggregates (collected_at DESC);
