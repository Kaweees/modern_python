alias i := install
alias r := run
alias t := test
alias b := build
alias p := pre_commit
alias c := clean
alias ch := check

# Install the virtual environment and pre-commit hooks
install:
  uv sync
  uv run pre-commit install

# Run pre-commit
pre_commit:
 uv run pre-commit run -a

# Clean the project
clean:
  # Remove cached files
  find . -type d -name "__pycache__" -exec rm -r {} +
  find . -type d -name "*.egg-info" -exec rm -r {} +

# Run a package
run *args='core':
  uv run {{args}}

# Test the code with pytest
test:
  uv run python -m pytest --cov --cov-config=pyproject.toml --cov-report=xml

# Run code quality tools
check:
  # Check lock file consistency
  uv lock --locked
  # Run pre-commit
  uv run pre-commit run -a
  # Run mypy
  uv run mypy .
  # Run deptry with ignored issues
  uv run deptry . --ignore=DEP002,DEP003

# Add scripts
add_scripts:
  uv add --script scripts/this.py 'typer>=0.12.5'

# Build dockerfile for DAG
build target:
  docker build -t packages/{{target}} --build-arg PACKAGE={{target}} .
