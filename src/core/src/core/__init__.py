"""Core package."""

__version__ = "0.1.0"


def hello():
    print("Hello from core pkg")


def return_two() -> int:
    """Returns 2

    Returns:
        int: The number 2
    """
    return 2
