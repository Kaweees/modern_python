from utils import get_token


def test_get_token(monkeypatch):
    # Set up mock environment variables for the test
    monkeypatch.setenv("TOKEN", "test_token")

    # Run assertions with mocked environment
    assert get_token("TOKEN") == "test_token"
