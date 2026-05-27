from __future__ import annotations

from copy import deepcopy
from typing import Any

from app.config import load_config

try:
    import psycopg
except ModuleNotFoundError:  # pragma: no cover - optional in local mock-only runs
    psycopg = None


SPECIALTIES = [
    "Backend Python",
    "Frontend",
    "Data Analyst",
    "DevOps",
]

DEFAULT_GRADES = ["Junior", "Middle", "Senior", "Lead"]
DEFAULT_SKILLS = ["Python", "SQL", "JavaScript", "Docker", "React"]
DEFAULT_WORK_FORMATS = ["Remote", "Hybrid", "Office"]


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
                {"label": "No experience", "value": 8},
                {"label": "1-3 years", "value": 57},
                {"label": "3-6 years", "value": 49},
                {"label": "6+ years", "value": 14},
            ],
            "work_format": [
                {"label": "Remote", "value": 61},
                {"label": "Hybrid", "value": 39},
                {"label": "Office", "value": 28},
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
                {"label": "No experience", "value": 11},
                {"label": "1-3 years", "value": 51},
                {"label": "3-6 years", "value": 29},
                {"label": "6+ years", "value": 5},
            ],
            "work_format": [
                {"label": "Remote", "value": 43},
                {"label": "Hybrid", "value": 35},
                {"label": "Office", "value": 18},
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
                {"label": "No experience", "value": 10},
                {"label": "1-3 years", "value": 36},
                {"label": "3-6 years", "value": 24},
                {"label": "6+ years", "value": 4},
            ],
            "work_format": [
                {"label": "Remote", "value": 28},
                {"label": "Hybrid", "value": 29},
                {"label": "Office", "value": 17},
            ],
        },
        "top_skills": [
            {"name": "SQL", "count": 66, "share": 0.89},
            {"name": "Python", "count": 43, "share": 0.58},
            {"name": "Excel", "count": 38, "share": 0.51},
            {"name": "Power BI/Tableau", "count": 31, "share": 0.42},
            {"name": "Statistics", "count": 22, "share": 0.30},
            {"name": "A/B tests", "count": 15, "share": 0.20},
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
    db_payload = _build_db_dashboard_data(
        specialty=specialty,
        grade=grade,
        skill=skill,
        work_format=work_format,
    )
    if db_payload is not None:
        return db_payload

    return _build_mock_dashboard_data(
        specialty=specialty,
        grade=grade,
        skill=skill,
        work_format=work_format,
    )


def _build_mock_dashboard_data(
    specialty: str | None,
    grade: str | None,
    skill: str | None,
    work_format: str | None,
) -> dict[str, Any]:
    selected_specialty = specialty if specialty in SPECIALTIES else SPECIALTIES[0]
    specialty_data = deepcopy(MOCK_ANALYTICS.get(selected_specialty, {}))
    metrics = specialty_data.get("metrics", {})
    vacancies_count = int(metrics.get("vacancies_count", 0))
    resumes_count = int(metrics.get("resumes_count", 0))

    return {
        "filters": {
            "specialties": SPECIALTIES,
            "grades": DEFAULT_GRADES,
            "skills": DEFAULT_SKILLS,
            "work_formats": DEFAULT_WORK_FORMATS,
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


def _build_db_dashboard_data(
    specialty: str | None,
    grade: str | None,
    skill: str | None,
    work_format: str | None,
) -> dict[str, Any] | None:
    if psycopg is None:
        return None

    try:
        database_url = load_config().database_url
        with psycopg.connect(database_url) as conn:
            with conn.cursor() as cursor:
                specialties = _ordered_specialties(_fetch_specialties(cursor))
                if not specialties:
                    return None

                selected_specialty = specialty if specialty in specialties else specialties[0]
                where_sql, where_params = _vacancy_filters(
                    specialty=selected_specialty,
                    grade=grade,
                    skill=skill,
                    work_format=work_format,
                )

                vacancies_count = _fetch_vacancies_count(cursor, where_sql, where_params)
                resumes_count = _fetch_resumes_count(cursor, selected_specialty, grade)

                grades = _fetch_distinct_values(cursor, "grade")
                skills = _fetch_distinct_skills(cursor)
                work_formats = _fetch_distinct_values(cursor, "work_format")

                return {
                    "filters": {
                        "specialties": specialties,
                        "grades": grades or DEFAULT_GRADES,
                        "skills": skills or DEFAULT_SKILLS,
                        "work_formats": work_formats or DEFAULT_WORK_FORMATS,
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
                    "charts": {
                        "grades": _fetch_distribution(cursor, "grade", where_sql, where_params),
                        "experience": _fetch_distribution(cursor, "experience", where_sql, where_params),
                        "work_format": _fetch_distribution(cursor, "work_format", where_sql, where_params),
                    },
                    "top_skills": _fetch_top_skills(cursor, where_sql, where_params, vacancies_count),
                    "has_data": vacancies_count > 0,
                }
    except Exception:
        return None


def _fetch_specialties(cursor: Any) -> list[str]:
    cursor.execute(
        """
        SELECT DISTINCT specialty
        FROM (
            SELECT specialty FROM vacancies
            UNION
            SELECT specialty FROM resume_aggregates
        ) specialties
        ORDER BY specialty
        """
    )
    return [row[0] for row in cursor.fetchall() if row[0]]


def _ordered_specialties(db_specialties: list[str]) -> list[str]:
    if not db_specialties:
        return []
    preferred = [item for item in SPECIALTIES if item in db_specialties]
    rest = [item for item in db_specialties if item not in preferred]
    return preferred + rest


def _vacancy_filters(
    specialty: str,
    grade: str | None,
    skill: str | None,
    work_format: str | None,
) -> tuple[str, list[Any]]:
    clauses = ["specialty = %s"]
    params: list[Any] = [specialty]

    if grade:
        clauses.append("grade = %s")
        params.append(grade)
    if work_format:
        clauses.append("work_format = %s")
        params.append(work_format)
    if skill:
        clauses.append("%s = ANY(skills)")
        params.append(skill)

    return " AND ".join(clauses), params


def _fetch_vacancies_count(cursor: Any, where_sql: str, params: list[Any]) -> int:
    cursor.execute(f"SELECT COUNT(*) FROM vacancies WHERE {where_sql}", params)
    row = cursor.fetchone()
    return int(row[0]) if row else 0


def _fetch_resumes_count(cursor: Any, specialty: str, grade: str | None) -> int:
    if grade:
        cursor.execute(
            """
            SELECT active_resume_count
            FROM resume_aggregates
            WHERE specialty = %s AND grade = %s
            ORDER BY collected_at DESC
            LIMIT 1
            """,
            (specialty, grade),
        )
        row = cursor.fetchone()
        if row:
            return int(row[0])

    cursor.execute(
        """
        SELECT active_resume_count
        FROM resume_aggregates
        WHERE specialty = %s AND grade IS NULL
        ORDER BY collected_at DESC
        LIMIT 1
        """,
        (specialty,),
    )
    row = cursor.fetchone()
    return int(row[0]) if row else 0


def _fetch_distinct_values(cursor: Any, field_name: str) -> list[str]:
    cursor.execute(
        f"""
        SELECT DISTINCT {field_name}
        FROM vacancies
        WHERE {field_name} IS NOT NULL AND {field_name} <> ''
        ORDER BY {field_name}
        """
    )
    return [row[0] for row in cursor.fetchall() if row[0]]


def _fetch_distinct_skills(cursor: Any) -> list[str]:
    cursor.execute(
        """
        SELECT DISTINCT skill
        FROM (
            SELECT unnest(skills) AS skill
            FROM vacancies
        ) skills
        WHERE skill IS NOT NULL AND skill <> ''
        ORDER BY skill
        """
    )
    return [row[0] for row in cursor.fetchall() if row[0]]


def _fetch_distribution(
    cursor: Any,
    dimension: str,
    where_sql: str,
    params: list[Any],
) -> list[dict[str, Any]]:
    cursor.execute(
        f"""
        SELECT COALESCE(NULLIF({dimension}, ''), 'Not specified') AS label,
               COUNT(*) AS value
        FROM vacancies
        WHERE {where_sql}
        GROUP BY label
        ORDER BY value DESC, label
        """,
        params,
    )
    return [{"label": row[0], "value": int(row[1])} for row in cursor.fetchall()]


def _fetch_top_skills(
    cursor: Any,
    where_sql: str,
    params: list[Any],
    vacancies_count: int,
) -> list[dict[str, Any]]:
    cursor.execute(
        f"""
        WITH filtered AS (
            SELECT skills
            FROM vacancies
            WHERE {where_sql}
        )
        SELECT skill, COUNT(*) AS skill_count
        FROM (
            SELECT unnest(skills) AS skill
            FROM filtered
        ) expanded
        WHERE skill IS NOT NULL AND skill <> ''
        GROUP BY skill
        ORDER BY skill_count DESC, skill
        LIMIT 10
        """,
        params,
    )

    result = []
    for name, count in cursor.fetchall():
        count_value = int(count)
        share = round(count_value / vacancies_count, 2) if vacancies_count else 0.0
        result.append({"name": name, "count": count_value, "share": share})
    return result


def _competition_ratio(resumes_count: int, vacancies_count: int) -> float | None:
    if vacancies_count <= 0:
        return None
    return round(resumes_count / vacancies_count, 2)
