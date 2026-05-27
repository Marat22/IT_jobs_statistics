from flask import Flask, render_template, request

from app.analytics import get_dashboard_data
from app.config import load_config


def create_app() -> Flask:
    app = Flask(__name__, template_folder="../templates", static_folder="../static")
    config = load_config()
    app.config["DATABASE_URL"] = config.database_url

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

    return app
