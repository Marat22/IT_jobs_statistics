from app.analytics import get_dashboard_data
import app.analytics as analytics


def test_dashboard_contract_contains_required_sections(monkeypatch):
    monkeypatch.setattr(analytics, "_build_db_dashboard_data", lambda **_: None)

    dashboard = get_dashboard_data("Backend Python")

    assert set(dashboard) == {
        "filters",
        "metrics",
        "charts",
        "top_skills",
        "insights",
        "source",
        "has_data",
    }
    assert dashboard["filters"]["selected_specialty"] == "Backend Python"
    assert dashboard["metrics"]["vacancies_count"] > 0
    assert dashboard["metrics"]["resumes_count"] > 0
    assert dashboard["metrics"]["competition_ratio"] is not None
    assert dashboard["charts"]["grades"]
    assert dashboard["top_skills"]
    assert dashboard["insights"]["top_skill"]
    assert dashboard["source"]["name"]


def test_unknown_specialty_falls_back_to_default(monkeypatch):
    monkeypatch.setattr(analytics, "_build_db_dashboard_data", lambda **_: None)

    dashboard = get_dashboard_data("Unknown")

    assert dashboard["filters"]["selected_specialty"] == "Backend Python"


def test_competition_ratio_is_hidden_without_vacancies(monkeypatch):
    monkeypatch.setattr(analytics, "_build_db_dashboard_data", lambda **_: None)

    dashboard = get_dashboard_data("DevOps")

    assert dashboard["metrics"]["vacancies_count"] == 0
    assert dashboard["metrics"]["competition_ratio"] is None
    assert dashboard["has_data"] is False


def test_uses_db_payload_when_available(monkeypatch):
    payload = {
        "filters": {
            "specialties": ["Backend Python"],
            "grades": ["Junior"],
            "skills": ["Python"],
            "work_formats": ["Remote"],
            "selected_specialty": "Backend Python",
            "selected_grade": "",
            "selected_skill": "",
            "selected_work_format": "",
        },
        "metrics": {
            "vacancies_count": 10,
            "resumes_count": 20,
            "competition_ratio": 2.0,
        },
        "charts": {
            "grades": [{"label": "Junior", "value": 10}],
            "experience": [{"label": "No experience", "value": 10}],
            "work_format": [{"label": "Remote", "value": 10}],
        },
        "top_skills": [{"name": "Python", "count": 10, "share": 1.0}],
        "insights": {"top_skill": "Python"},
        "source": {"name": "PostgreSQL"},
        "has_data": True,
    }

    monkeypatch.setattr(analytics, "_build_db_dashboard_data", lambda **_: payload)

    dashboard = get_dashboard_data("Backend Python")

    assert dashboard is payload


def test_falls_back_to_mock_when_db_payload_is_unavailable(monkeypatch):
    monkeypatch.setattr(analytics, "_build_db_dashboard_data", lambda **_: None)

    dashboard = get_dashboard_data("Frontend")

    assert dashboard["metrics"]["vacancies_count"] == 96
    assert dashboard["metrics"]["competition_ratio"] == 4.35
