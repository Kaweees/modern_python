import os

from dotenv import load_dotenv

load_dotenv()


def get_token(token_name: str) -> str:
    """Get a token from the environment variables

    Args:
        token_name (str): The name of the token to get

    Returns:
        str: The token
    """
    token = os.environ.get(token_name)
    if token is None:
        raise ValueError(f"{token_name} not found in environment variables")
    return token
