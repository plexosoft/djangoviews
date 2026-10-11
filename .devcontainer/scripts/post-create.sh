#!/usr/bin/env bash
set -euo pipefail

cd /workspaces/djangoviews

# --- Node via nvm ---
NODE_VERSION="20.14.0"

if [ ! -d "/home/vscode/.nvm" ]; then
  curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
fi

. "/home/vscode/.nvm/nvm.sh"

nvm install "${NODE_VERSION}"
nvm alias default "${NODE_VERSION}"

npm install -g typescript yarn node-gyp

mkdir -p /home/vscode/.bashrc.d

cat > /home/vscode/.bashrc.d/50-node <<'EOF'
. "/home/vscode/.nvm/nvm.sh"
EOF

cat > /home/vscode/.bashrc.d/60-aliases <<'EOF'
alias python=python3
alias pip=pip3
alias pg_start=pg_start
alias pg_stop=pg_stop
alias mkrun='mkdocs serve -a 0.0.0.0:8000'
alias djrun='python3 manage.py runserver 0.0.0.0:8000'
alias uvrun='uvicorn django_plexosoft.asgi:application --reload --host 0.0.0.0 --port 8000'

# Activate the project virtual environment in interactive shells
source /workspaces/djangoviews/.venv/bin/activate
EOF

# --- Python: project venv (PEP 668 compliant) ---
VENV_DIR="/workspaces/djangoviews/.venv"

python3 -m venv "${VENV_DIR}"

"${VENV_DIR}/bin/python" -m pip install --upgrade pip setuptools wheel

if [ -f "/workspaces/djangoviews/requirements-dev.txt" ]; then
    "${VENV_DIR}/bin/pip" install -r "/workspaces/djangoviews/requirements-dev.txt"
fi

# Optional developer tools
"${VENV_DIR}/bin/pip" install \
    pylint \
    flake8 \
    mypy \
    autopep8 \
    black \
    bandit \
    twine \
    pipenv \
    virtualenv

# Configure VS Code to use the project interpreter
mkdir -p /workspaces/djangoviews/.vscode

cat > /workspaces/djangoviews/.vscode/settings.json <<'JSON'
{
  "python.defaultInterpreterPath": "/workspaces/djangoviews/.venv/bin/python"
}
JSON

# Ensure bash sources ~/.bashrc.d
if ! grep -q "bashrc.d" /home/vscode/.bashrc; then
cat >> /home/vscode/.bashrc <<'EOF'

for f in ~/.bashrc.d/*; do
    [ -r "$f" ] && . "$f"
done
EOF
fi

# Prepare directories expected by the PG scripts
mkdir -p "$HOME/.pg_ctl/log" "$HOME/.pg_ctl/sockets"

# gettext already installed in image; ensure it exists
if ! command -v msgfmt >/dev/null 2>&1; then
    echo "Installing gettext (msgfmt)"
    sudo apt-get update
    sudo apt-get install -y gettext
fi

# Heroku cache permissions
sudo mkdir -p /home/vscode/.cache/heroku
sudo chown -R vscode:vscode /home/vscode/.cache/heroku

# Optional: generate translation files
if [ -x "${VENV_DIR}/bin/django-admin" ]; then
    "${VENV_DIR}/bin/django-admin" makemessages -l es || true
fi

echo "post-create completed"