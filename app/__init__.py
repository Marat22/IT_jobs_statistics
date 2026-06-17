from flask import Flask, redirect, render_template, request, session, url_for

from app.analytics import get_dashboard_data
from app.config import load_config

ADMIN_PASSWORD = "12345678"


def create_app() -> Flask:
    app = Flask(__name__, template_folder="../templates", static_folder="../static")
    config = load_config()
    app.config["DATABASE_URL"] = config.database_url
    app.config["SECRET_KEY"] = "local-admin-panel-secret"

    @app.get("/")
    def dashboard():
        specialty = request.args.get("specialty")
        grade = request.args.get("grade")
        skill = request.args.get("skill")
        work_format = request.args.get("work_format")

        dashboard_data = get_dashboard_data(
            specialty=specialty,
            grade=grade,
            skill=skill,
            work_format=work_format,
        )

        return render_template("dashboard.html", dashboard=dashboard_data)

    @app.route("/admin", methods=["GET", "POST"])
    def admin():
        error = None
        notice = None

        if request.method == "POST":
            action = request.form.get("action")

            if action == "login":
                if request.form.get("password") == ADMIN_PASSWORD:
                    session["admin_authenticated"] = True
                    return redirect(url_for("admin"))

                error = "Неверный пароль"

            elif session.get("admin_authenticated") and action in {
                "add_skill",
                "add_specialty",
            }:
                notice = "Изменения сохранены. Сбор статистики обновлен."

        is_authenticated = bool(session.get("admin_authenticated"))

        return render_template(
            "admin.html",
            is_authenticated=is_authenticated,
            error=error,
            notice=notice,
        )

    return app
