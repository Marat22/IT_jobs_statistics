from __future__ import annotations

import os
from dataclasses import dataclass


@dataclass(frozen=True)
class AppConfig:
    database_url: str
    postgres_host: str
    postgres_port: int
    postgres_db: str
    postgres_user: str
    postgres_password: str


def load_config() -> AppConfig:
    postgres_host = os.getenv("POSTGRES_HOST", "localhost")
    postgres_port = int(os.getenv("POSTGRES_PORT", "5432"))
    postgres_db = os.getenv("POSTGRES_DB", "it_jobs")
    postgres_user = os.getenv("POSTGRES_USER", "it_jobs")
    postgres_password = os.getenv("POSTGRES_PASSWORD", "it_jobs")

    database_url = os.getenv("DATABASE_URL")
    if not database_url:
        database_url = (
            f"postgresql://{postgres_user}:{postgres_password}"
            f"@{postgres_host}:{postgres_port}/{postgres_db}"
        )

    return AppConfig(
        database_url=database_url,
        postgres_host=postgres_host,
        postgres_port=postgres_port,
        postgres_db=postgres_db,
        postgres_user=postgres_user,
        postgres_password=postgres_password,
    )
