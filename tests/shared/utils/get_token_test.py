from utils import get_token


def get_token_test(monkeypatch):
    # Set up mock environment variables for the test
    monkeypatch.setenv("TOKEN", "test_token")

    # Run assertions with mocked environment
    assert get_token("TOKEN") == "test_token"
