from app.analytics import get_dashboard_data


def test_dashboard_contract_contains_required_sections():
    dashboard = get_dashboard_data("Backend Python")

    assert set(dashboard) == {"filters", "metrics", "charts", "top_skills", "has_data"}
    assert dashboard["filters"]["selected_specialty"] == "Backend Python"
    assert dashboard["metrics"]["vacancies_count"] > 0
    assert dashboard["metrics"]["resumes_count"] > 0
    assert dashboard["metrics"]["competition_ratio"] is not None
    assert dashboard["charts"]["grades"]
    assert dashboard["top_skills"]


def test_unknown_specialty_falls_back_to_default():
    dashboard = get_dashboard_data("Unknown")

    assert dashboard["filters"]["selected_specialty"] == "Backend Python"


def test_competition_ratio_is_hidden_without_vacancies():
    dashboard = get_dashboard_data("DevOps")

    assert dashboard["metrics"]["vacancies_count"] == 0
    assert dashboard["metrics"]["competition_ratio"] is None
    assert dashboard["has_data"] is False
