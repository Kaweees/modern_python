# Like GNU `make`, but `just` rustier.
# https://just.systems/
# run `just` from this directory to see available commands

alias i := install
alias u := update
alias p := pre_commit
alias b := build
alias r := run
alias t := test
alias ch := check
alias c := clean
alias f := format
alias a := add_scripts

# Default command when 'just' is run without arguments
default:
  @just --list

# Install the virtual environment and pre-commit hooks
install:
  @echo "Installing..."
  @uv sync
  @uv run pre-commit install --install-hooks

update:
  @echo "Updating..."
  @uv sync --upgrade
  @uv run pre-commit autoupdate

# Run pre-commit
pre_commit:
  @echo "Running pre-commit..."
  @uv run pre-commit run -a

# Build the project
build target:
  @echo "Building..."
  @uv run hatch build --target {{target}}

# Run a package
run *args='core':
  @echo "Running..."
  @uv run {{args}}

# Test the project
test:
  @echo "Testing..."
  @uv run python -m pytest --cov --cov-config=pyproject.toml --cov-report=xml

# Run code quality tools
check:
  @echo "Checking..."
  @uv lock --locked
  @uv run pre-commit run -a
  @uv run mypy .
  @uv run deptry . --ignore=DEP002,DEP003

# Remove build artifacts and non-essential files
clean:
  @echo "Cleaning..."
  @find . -type d -name ".venv" -exec rm -rf {} +
  @find . -type d -name "__pycache__" -exec rm -rf {} +
  @find . -type d -name "*.ruff_cache" -exec rm -rf {} +
  @find . -type d -name "*.egg-info" -exec rm -rf {} +

# Format the project
format:
  @echo "Formatting..."
  @find . -name "*.nix" -type f -exec nixfmt {} \;

# Add scripts
add_scripts:
  @echo "Adding scripts..."
  @uv add --script scripts/this.py 'typer>=0.12.5'
