from __future__ import annotations

from copy import deepcopy
from typing import Any


SPECIALTIES = [
    "Backend Python",
    "Frontend",
    "Data Analyst",
    "DevOps",
]


MOCK_ANALYTICS: dict[str, dict[str, Any]] = {
    "Backend Python": {
        "metrics": {
            "vacancies_count": 128,
            "resumes_count": 344,
        },
        "charts": {
            "grades": [
                {"label": "Junior", "value": 24},
                {"label": "Middle", "value": 68},
                {"label": "Senior", "value": 31},
                {"label": "Lead", "value": 5},
            ],
            "experience": [
                {"label": "Без опыта", "value": 8},
                {"label": "1-3 года", "value": 57},
                {"label": "3-6 лет", "value": 49},
                {"label": "6+ лет", "value": 14},
            ],
            "work_format": [
                {"label": "Удаленно", "value": 61},
                {"label": "Гибрид", "value": 39},
                {"label": "Офис", "value": 28},
            ],
        },
        "top_skills": [
            {"name": "Python", "count": 112, "share": 0.88},
            {"name": "SQL", "count": 86, "share": 0.67},
            {"name": "Django/FastAPI", "count": 64, "share": 0.50},
            {"name": "Docker", "count": 57, "share": 0.45},
            {"name": "PostgreSQL", "count": 54, "share": 0.42},
            {"name": "REST API", "count": 42, "share": 0.33},
        ],
    },
    "Frontend": {
        "metrics": {
            "vacancies_count": 96,
            "resumes_count": 418,
        },
        "charts": {
            "grades": [
                {"label": "Junior", "value": 29},
                {"label": "Middle", "value": 48},
                {"label": "Senior", "value": 17},
                {"label": "Lead", "value": 2},
            ],
            "experience": [
                {"label": "Без опыта", "value": 11},
                {"label": "1-3 года", "value": 51},
                {"label": "3-6 лет", "value": 29},
                {"label": "6+ лет", "value": 5},
            ],
            "work_format": [
                {"label": "Удаленно", "value": 43},
                {"label": "Гибрид", "value": 35},
                {"label": "Офис", "value": 18},
            ],
        },
        "top_skills": [
            {"name": "JavaScript", "count": 84, "share": 0.88},
            {"name": "TypeScript", "count": 69, "share": 0.72},
            {"name": "React", "count": 63, "share": 0.66},
            {"name": "HTML/CSS", "count": 58, "share": 0.60},
            {"name": "Redux", "count": 31, "share": 0.32},
            {"name": "Vite/Webpack", "count": 28, "share": 0.29},
        ],
    },
    "Data Analyst": {
        "metrics": {
            "vacancies_count": 74,
            "resumes_count": 226,
        },
        "charts": {
            "grades": [
                {"label": "Junior", "value": 22},
                {"label": "Middle", "value": 39},
                {"label": "Senior", "value": 12},
                {"label": "Lead", "value": 1},
            ],
            "experience": [
                {"label": "Без опыта", "value": 10},
                {"label": "1-3 года", "value": 36},
                {"label": "3-6 лет", "value": 24},
                {"label": "6+ лет", "value": 4},
            ],
            "work_format": [
                {"label": "Удаленно", "value": 28},
                {"label": "Гибрид", "value": 29},
                {"label": "Офис", "value": 17},
            ],
        },
        "top_skills": [
            {"name": "SQL", "count": 66, "share": 0.89},
            {"name": "Python", "count": 43, "share": 0.58},
            {"name": "Excel", "count": 38, "share": 0.51},
            {"name": "Power BI/Tableau", "count": 31, "share": 0.42},
            {"name": "Статистика", "count": 22, "share": 0.30},
            {"name": "A/B тесты", "count": 15, "share": 0.20},
        ],
    },
    "DevOps": {
        "metrics": {
            "vacancies_count": 0,
            "resumes_count": 42,
        },
        "charts": {
            "grades": [],
            "experience": [],
            "work_format": [],
        },
        "top_skills": [],
    },
}


def get_dashboard_data(
    specialty: str | None = None,
    grade: str | None = None,
    skill: str | None = None,
    work_format: str | None = None,
) -> dict[str, Any]:
    selected_specialty = specialty if specialty in SPECIALTIES else SPECIALTIES[0]
    specialty_data = deepcopy(MOCK_ANALYTICS.get(selected_specialty, {}))
    metrics = specialty_data.get("metrics", {})
    vacancies_count = metrics.get("vacancies_count", 0)
    resumes_count = metrics.get("resumes_count", 0)

    return {
        "filters": {
            "specialties": SPECIALTIES,
            "grades": ["Junior", "Middle", "Senior", "Lead"],
            "skills": ["Python", "SQL", "JavaScript", "Docker", "React"],
            "work_formats": ["Удаленно", "Гибрид", "Офис"],
            "selected_specialty": selected_specialty,
            "selected_grade": grade or "",
            "selected_skill": skill or "",
            "selected_work_format": work_format or "",
        },
        "metrics": {
            "vacancies_count": vacancies_count,
            "resumes_count": resumes_count,
            "competition_ratio": _competition_ratio(resumes_count, vacancies_count),
        },
        "charts": specialty_data.get(
            "charts",
            {"grades": [], "experience": [], "work_format": []},
        ),
        "top_skills": specialty_data.get("top_skills", []),
        "has_data": vacancies_count > 0,
    }


def _competition_ratio(resumes_count: int, vacancies_count: int) -> float | None:
    if vacancies_count <= 0:
        return None
    return round(resumes_count / vacancies_count, 2)
