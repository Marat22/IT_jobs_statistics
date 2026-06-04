from __future__ import annotations

from pathlib import Path

import psycopg

from app.config import load_config


ROOT_DIR = Path(__file__).resolve().parents[1]
INIT_DIR = ROOT_DIR / "docker" / "postgres" / "init"
SQL_FILES = ["001_schema.sql", "002_seed.sql"]


def import_demo_data() -> None:
    """Refresh local PostgreSQL with prepared vacancy and resume aggregates."""
    config = load_config()

    with psycopg.connect(config.database_url) as conn:
        with conn.cursor() as cursor:
            for file_name in SQL_FILES:
                cursor.execute((INIT_DIR / file_name).read_text(encoding="utf-8"))
        conn.commit()


if __name__ == "__main__":
    import_demo_data()
    print("Demo vacancies and resume aggregates imported.")
