from app import create_app


def test_dashboard_route_returns_ok():
    app = create_app()
    client = app.test_client()

    response = client.get("/")

    assert response.status_code == 200
    assert "Понять, куда идти и что учить".encode() in response.data


def test_dashboard_route_accepts_specialty_filter():
    app = create_app()
    client = app.test_client()

    response = client.get("/?specialty=Frontend")

    assert response.status_code == 200
    assert "Frontend".encode() in response.data
    assert "4.35".encode() in response.data
