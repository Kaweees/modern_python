# Like GNU `make`, but `just` rustier.
# https://just.systems/
# run `just` from this directory to see available commands

alias i := install
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
  @uv run pre-commit install

# Run pre-commit
pre_commit:
  @echo "Running pre-commit..."
  @uv run pre-commit run -a

# Build the project
build target:
  @echo "Building..."
  @docker build -t packages/{{target}} --build-arg PACKAGE={{target}} .

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
  @# Check lock file consistency
  @uv lock --locked
  @# Run pre-commit
  @uv run pre-commit run -a
  @# Run mypy
  @uv run mypy .
  @# Run deptry with ignored issues
  @uv run deptry . --ignore=DEP002,DEP003

# Remove build artifacts and non-essential files
clean:
  @echo "Cleaning..."
  @find . -type d -name ".venv" -exec rm -r {} +
  @find . -type d -name "__pycache__" -exec rm -r {} +
  @find . -type d -name "*.egg-info" -exec rm -r {} +

# Format the project
format:
  @echo "Formatting..."
  @find . -name "*.nix" -type f -exec nixfmt {} \;

# Add scripts
add_scripts:
  @echo "Adding scripts..."
  @uv add --script scripts/this.py 'typer>=0.12.5'
