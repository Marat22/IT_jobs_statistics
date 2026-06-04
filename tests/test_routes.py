from app import create_app


def test_dashboard_route_returns_ok():
    app = create_app()
    client = app.test_client()

    response = client.get("/")

    assert response.status_code == 200
    assert "Куда идти и что учить".encode() in response.data


def test_dashboard_route_accepts_specialty_filter():
    app = create_app()
    client = app.test_client()

    response = client.get("/?specialty=Frontend")

    assert response.status_code == 200
    assert "Frontend".encode() in response.data
    assert "Конкурентность".encode() in response.data


def test_dashboard_route_accepts_all_filters():
    app = create_app()
    client = app.test_client()

    response = client.get(
        "/?specialty=Backend+Python&grade=Junior&skill=Python&work_format=Remote"
    )

    assert response.status_code == 200
    assert "Все грейды".encode() in response.data
    assert "Python".encode() in response.data
