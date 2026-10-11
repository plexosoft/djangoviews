# Base Dev Container image (Ubuntu 24.04)
FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

# Use bash so heredocs/newlines behave
SHELL ["/bin/bash", "-lc"]

# Avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Core OS packages, Python toolchain, build deps, gettext, utilities
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    ca-certificates curl wget gnupg lsb-release software-properties-common \
    build-essential pkg-config \
    python3 python3-pip python3-venv python3-dev \
    gettext \
    git unzip \
    libpq-dev \
 && rm -rf /var/lib/apt/lists/*

# WeasyPrint native runtime deps
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    libcairo2 \
    libpango-1.0-0 libpangocairo-1.0-0 libpangoft2-1.0-0 \
    libgdk-pixbuf-2.0-0 \
    libharfbuzz0b \
    libffi8 \
    shared-mime-info \
    fonts-dejavu fonts-liberation \
 && rm -rf /var/lib/apt/lists/*

# --- PostgreSQL (Ubuntu repo: 16 on 24.04) ---
RUN apt-get update \
 && apt-get install -y --no-install-recommends postgresql postgresql-client \
 && rm -rf /var/lib/apt/lists/*

# Make PG binaries available to pg_start/pg_stop (initdb, pg_ctl, etc.)
ENV PATH="/usr/lib/postgresql/16/bin:${PATH}"

# Heroku CLI
RUN curl -fsSL https://cli-assets.heroku.com/install-ubuntu.sh | sh

# Create script directory
RUN mkdir -p /usr/local/pgctl /usr/local/bin

# pg_start script (separate RUN just for the heredoc)
RUN cat >/usr/local/pgctl/pg_start <<'EOF'
#!/usr/bin/env bash
set -e
: "${PGDATA:=/workspaces/.pgsql/data}"
mkdir -p "$PGDATA" "$HOME/.pg_ctl/log" "$HOME/.pg_ctl/sockets"
if [ ! -f "$PGDATA/PG_VERSION" ]; then
  initdb --auth=trust -D "$PGDATA" >/dev/null
fi
pg_ctl -D "$PGDATA" -l "$HOME/.pg_ctl/log"/server.log -o "-k $HOME/.pg_ctl/sockets" start
echo "PostgreSQL started (socket: $HOME/.pg_ctl/sockets)"
EOF

# pg_stop script (separate RUN just for the heredoc)
RUN cat >/usr/local/pgctl/pg_stop <<'EOF'
#!/usr/bin/env bash
set -e
: "${PGDATA:=/workspaces/.pgsql/data}"
pg_ctl -D "$PGDATA" stop
echo "PostgreSQL stopped"
EOF

# Make scripts executable and add to PATH
RUN chmod +x /usr/local/pgctl/pg_start /usr/local/pgctl/pg_stop \
 && ln -sf /usr/local/pgctl/pg_start /usr/local/bin/pg_start \
 && ln -sf /usr/local/pgctl/pg_stop  /usr/local/bin/pg_stop

# Prepare bashrc snippets dir (useful if you add nvm/postCreate later)
RUN mkdir -p /home/vscode/.bashrc.d && chown -R vscode:vscode /home/vscode/.bashrc.d

# Default user for devcontainers
USER vscode
WORKDIR /workspaces

# User-local bin on PATH (pip --user, etc.)
ENV PATH=/home/vscode/.local/bin:${PATH}
