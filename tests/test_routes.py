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


def test_admin_route_shows_login_form():
    app = create_app()
    client = app.test_client()

    response = client.get("/admin")

    assert response.status_code == 200
    assert "Админ-панель".encode() in response.data
    assert "Пароль".encode() in response.data


def test_admin_route_rejects_wrong_password():
    app = create_app()
    client = app.test_client()

    response = client.post(
        "/admin",
        data={"action": "login", "password": "wrong"},
    )

    assert response.status_code == 200
    assert "Неверный пароль".encode() in response.data


def test_admin_route_accepts_hardcoded_password():
    app = create_app()
    client = app.test_client()

    response = client.post(
        "/admin",
        data={"action": "login", "password": "12345678"},
        follow_redirects=True,
    )

    assert response.status_code == 200
    assert "Добавить навык".encode() in response.data
    assert "Добавить специальность".encode() in response.data
