from app.config import load_config


def test_load_config_builds_database_url_from_parts(monkeypatch):
    monkeypatch.delenv("DATABASE_URL", raising=False)
    monkeypatch.setenv("POSTGRES_HOST", "db")
    monkeypatch.setenv("POSTGRES_PORT", "5432")
    monkeypatch.setenv("POSTGRES_DB", "it_jobs")
    monkeypatch.setenv("POSTGRES_USER", "it_jobs")
    monkeypatch.setenv("POSTGRES_PASSWORD", "secret")

    config = load_config()

    assert config.database_url == "postgresql://it_jobs:secret@db:5432/it_jobs"
    assert config.postgres_host == "db"
    assert config.postgres_port == 5432


def test_load_config_prefers_database_url_when_provided(monkeypatch):
    monkeypatch.setenv("DATABASE_URL", "postgresql://custom:custom@localhost:5432/custom")

    config = load_config()

    assert config.database_url == "postgresql://custom:custom@localhost:5432/custom"
