alias s := setup
alias r := run
alias t := test
alias b := build
alias p := pre_commit
alias c := clean

# Install python dependencies
install:
  uv sync

# Install pre-commit hooks
pre_commit_setup:
  uv run pre-commit install

# Install python dependencies and pre-commit hooks
setup: install pre_commit_setup

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

# Run pytest
test:
  uv run pytest tests

# Add scripts
add_scripts:
  uv add --script scripts/this.py 'typer>=0.12.5'

# Build dockerfile for DAG
build target:
  docker build -t packages/{{target}} --build-arg PACKAGE={{target}} .
