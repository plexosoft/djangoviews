
# Setting Up and Deploying Documentation with Zensical

This guide explains how to create, configure, preview, and deploy a documentation site using **Zensical** and **GitHub Pages**.

The instructions use Zensical and the GitHub Actions workflow currently used by this project. The examples assume that the documentation source files are stored in a `docs/` directory and that `zensical.toml` is located in the repository root.

## 1. Project prerequisites

You need:

- Python 3.11 or newer.
- Git.
- A GitHub repository.
- A working project directory.
- A terminal with permission to install Python packages.

If the documentation belongs to a Django project, Django and the application's other dependencies should be installed separately. Zensical does not require Django, Gunicorn, or a database driver to build documentation.

### 1.1 Create or open your project

For a new documentation project, create and enter a directory:

```bash
mkdir docs
cd docs
```

For an existing Django or Python repository, open the repository root instead. Do not create a second project directory inside the existing repository unless that is intentional.

### 1.2 Create a virtual environment

It is recommended to install Zensical in a virtual environment so its dependencies remain separate from the rest of your Python environment.

**Linux and macOS:**

```bash
python3 -m venv .venv
source .venv/bin/activate
```

**Windows PowerShell:**

```powershell
py -3 -m venv .venv
.venv\Scripts\Activate.ps1
```

### 1.3 Install Zensical

Install the version used by this project's deployment workflow:

```bash
pip3 install zensical
```

Verify the installation:

```bash
zensical --version
pip3 freeze > requirements.txt
```

To keep the documentation dependencies reproducible, the last command will create a dedicated requirements file:

```text
# requirements.txt
```

Install it with, when needed:

```bash
pip3 install -r requirements.txt
```

If the repository already has a `requirements.txt` for the Django application, you can add Zensical there instead. A separate documentation requirements file is useful when application and documentation dependencies are managed independently.

> **Important:** You no longer need to install `mkdocs`, `mkdocs-material`, `pillow`, or `cairosvg` just to build a standard Zensical site.

## 2. Initialize the documentation

Zensical provides a command to create the initial project structure.

From the repository root, run:

```bash
zensical new .
```

The command creates the standard project files if they do not already exist:

```text
.
├── .github/
│   └── workflows/
│       └── docs.yml
├── docs/
│   ├── index.md
│   └── markdown.md
└── zensical.toml
```

The main files and directories are:

| Path | Purpose |
|---|---|
| `zensical.toml` | Main Zensical configuration |
| `docs/` | Markdown pages, images, CSS, JavaScript, and other documentation assets |
| `site/` | Generated website output |
| `.github/workflows/` | GitHub Actions workflows |

If you already have a `docs/` directory, keep your existing documentation files. The initialization command does not overwrite existing files.

If the project already has a `zensical.toml`, edit that file directly instead of trying to initialize the project again.

## 3. Organize the documentation files

Keep the documentation source files inside `docs/` unless you explicitly configure a different `docs_dir`.

A simple structure could look like this:

```text
.
├── .github/
│   └── workflows/
│       └── ci.yml
├── docs/
│   ├── index.md
│   ├── about/
│   │   └── overview.md
│   ├── assets/
│   │   └── img/
│   │       ├── logo.png
│   │       └── favicon.ico
│   ├── javascripts/
│   │   └── mathjax.js
│   └── stylesheets/
│       └── extra.css
├── requirements.txt
└── zensical.toml
```

The `docs/` directory is the source directory, not the generated website directory. Zensical writes the generated site to `site/` by default.

## 4. Configure Zensical

Create a `zensical.toml` file in the repository root and copy the following template into it. Update the project name, URL, navigation entries, and asset paths to match your own documentation.

```toml
# GENERAL
[project]
site_name = "DjangoViews by Frank Arellano"
site_url = "https://plexosoft.github.io/djangoviews/"
copyright = """
&copy; 2023 by <a href="https://github.com/plexosoft" target="_blank" rel="noopener">Frank Arellano</a>
using
<a href="https://zensical.org/" target="_blank" rel="noopener">Zensical</a>
"""

# NAVIGATION
nav = [
  { "Home" = "index.md" },

  { "CBVs" = [
    { "Overview" = "oop/overview.md" },
    { "What Are CBVs?" = "oop/class/class.md" },
    { "What Are Django Views?" = "oop/class/django_views.md" },
    { "Traversing" = [
      { "CustomLoginView" = "oop/traversing/login_view.md" },
      { "CustomSignupView" = "oop/traversing/signup_view.md" },
      { "CustomLogoutView" = "oop/traversing/logout_view.md" },
      { "HomepageProductServiceView" = "oop/traversing/product_service_view.md" },
    ] },
  ] },

  { "FBVs" = [
    { "Overview" = "fbvs/overview.md" },
    { "What Are FBVs?" = "fbvs/fbvs/fbvs.md" },
    { "Traversing" = [
      { "Placeholder" = "fbvs/traversing/placeholder.md" },
    ] },
  ] },

  { "Snack" = [
    { "Overview" = "snack/overview.md" },
    { "Polymorphism" = "snack/polymorphism/polymorphism.md" },
    { "Initialize Zensical" = "snack/initialize/initial.md" },
    # { "Javascript" = "snack/javascript/javascript.md" },
    # { "JS Algorithms" = "snack/javascript/js_algorithms.md" },
  ] },

  { "About" = [
    { "About Me" = "about/about.md" },
    { "License" = "about/LICENSE.md" },
  ] },

  { "Credits" = [
    { "Acknowledgement" = "credits/credits.md" },
  ] },
]

# THEME
[project.theme]
name = "material"
logo = "assets/img/logo.png"

font.text = "Roboto"
font.code = "Roboto Mono"

features = [
  "navigation.tabs",
  "navigation.sections",
  "toc.integrate",
  "navigation.top",
  "search.suggest",
  "search.highlight",
  "content.tabs.link",
  "content.code.annotation",
  "content.code.copy",
]

# LIGHT MODE
[[project.theme.palette]]
scheme = "default"
primary = "white"
accent = "indigo"

[project.theme.palette.toggle]
icon = "lucide/toggle-right"
name = "Switch to dark mode"

# DARK MODE
[[project.theme.palette]]
scheme = "slate"
primary = "black"
accent = "yellow"

[project.theme.palette.toggle]
icon = "lucide/toggle-left"
name = "Switch to light mode"

# EXTRA
[[project.extra.social]]
icon = "fontawesome/brands/github-alt"
link = "https://github.com/plexosoft"

[[project.extra.social]]
icon = "fontawesome/brands/twitter"
link = "https://twitter.com/plexosoft"

[[project.extra.social]]
icon = "fontawesome/brands/linkedin"
link = "https://www.linkedin.com/in/arellanofrank/"

# MARKDOWN EXTENSIONS
[project.markdown_extensions]

tables = {}
admonition = {}
footnotes = {}
attr_list = {}

pymdownx.highlight.anchor_linenums = true
pymdownx.inlinehilite = {}
pymdownx.snippets = {}
pymdownx.arithmatex.generic = true
pymdownx.details = {}
pymdownx.superfences = {}
pymdownx.mark = {}
pymdownx.critic = {}
pymdownx.caret = {}
pymdownx.keys = {}
pymdownx.tilde = {}
pymdownx.tabbed.alternate_style = true

# ZENSICAL EMOJI SUPPORT
pymdownx.emoji.emoji_index = "zensical.extensions.emoji.twemoji"
pymdownx.emoji.emoji_generator = "zensical.extensions.emoji.to_svg"
```

## 5. Preview and build the documentation

### 5.1 Start the development server

Run:

```bash
zensical serve
```

Open the local address shown in the terminal. By default, Zensical serves the documentation at:

```text
http://localhost:8000
```

The development server watches the documentation files and rebuilds the site as you make changes.

### 5.2 Build the static website

To generate the website locally, run:

```bash
zensical build
```

For a clean build that clears the build cache first:

```bash
zensical build --clean
```

The generated website is written to:

```text
site/
```

You can inspect the generated HTML files and assets before deploying them.

## 6. Set up GitHub Actions

GitHub Actions can build the Zensical site automatically whenever changes are pushed to the `main` or `master` branch. It can also be started manually from the GitHub Actions interface.

This project uses GitHub Pages artifact deployment. The workflow builds the site, uploads the generated `site/` directory as a Pages artifact, and deploys that artifact.

### 6.1 Create the workflow directory

From the repository root, run:

```bash
mkdir -p .github/workflows
```

If you initialized the project with `zensical new .`, Zensical may already have created a workflow file named `docs.yml`. Review it and remove or replace it if you intend to use the `ci.yml` workflow below. Avoid keeping two workflows that deploy the same site unintentionally.

### 6.2 Create `ci.yml`

Create the workflow file:

```bash
touch .github/workflows/ci.yml
```

Add the following configuration:

```yaml
name: ci
on:
  push:
    branches:
      - master
      - main
  workflow_dispatch:

permissions:
  contents: read
  pages: write
  id-token: write

jobs:
  deploy:
    runs-on: ubuntu-latest
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    steps:
      - uses: actions/configure-pages@v6
      - uses: actions/checkout@v7
      - uses: actions/setup-python@v6
        with:
          python-version: 3.x
      - run: pip install zensical
      - run: zensical build --clean
      - uses: actions/upload-pages-artifact@v5
        with:
          path: site
      - uses: actions/deploy-pages@v5
        id: deployment
```

### 6.3 Understand the workflow

| Component | Purpose |
|---|---|
| `push` | Starts the workflow when changes are pushed to `master` or `main`. |
| `workflow_dispatch` | Allows manual execution from GitHub Actions. |
| `configure-pages` | Configures GitHub Pages for the workflow. |
| `checkout` | Checks out the repository source code. |
| `setup-python` | Sets up Python on the GitHub Actions runner. |
| `pip install` | Installs the pinned Zensical version. |
| `zensical build --clean` | Generates a clean static website. |
| `upload-pages-artifact` | Uploads the generated `site/` directory. |
| `deploy-pages` | Publishes the uploaded artifact to GitHub Pages. |

The permissions are required for the workflow to read repository contents and deploy to GitHub Pages.

### 6.4 Commit and push the workflow

```bash
git add .
git commit -m "Configure Zensical GitHub Pages deployment"
git push
```

Make sure `.github/workflows/ci.yml` is tracked by Git. Do not exclude the `.github/` directory from version control.

## 7. Configure GitHub Pages

After committing the workflow:

1. Open your repository on GitHub.
2. Navigate to **Settings**.
3. Open **Pages** in the sidebar.
4. Under **Build and deployment**, set **Source** to **GitHub Actions**.
5. Save the configuration if GitHub presents a Save option.

Do not select **Deploy from a branch** for this workflow. The workflow uploads and deploys a Pages artifact directly, so a dedicated `gh-pages` branch is not required.

### 7.1 Verify the deployment

1. Open the **Actions** tab in your repository.
2. Select the `ci` workflow.
3. Open the latest workflow run.
4. Wait for the build and deployment jobs to complete successfully.
5. Open the deployment URL shown in the `github-pages` environment.

GitHub Pages can take a short time to make a newly deployed site available.

## 8. Logo and favicon

Create an asset directory inside `docs/`:

```bash
mkdir -p docs/assets/img
```

Place your image files there:

```text
docs/
└── assets/
    └── img/
        ├── logo.png
        └── favicon.ico
```

Then configure the paths in `zensical.toml`:

```toml
[project.theme]
logo = "assets/img/logo.png"
favicon = "assets/img/favicon.ico"
```

The logo and favicon paths are relative to `docs/`, not the repository root.

## 9. Update Zensical

To install the exact version used by the deployment workflow:

```bash
pip3 install --upgrade zensical
```

To update to a newer available version, change the version deliberately and update the pinned version in both your local dependency file and GitHub Actions workflow.

For example:

```bash
pip3 install --upgrade zensical
```

Then update `requirements.txt` and the `pip install` command in `.github/workflows/ci.yml` so local builds and CI use the same version.

After upgrading, perform a clean build:

```bash
zensical build --clean
```

Review the release notes and compatibility documentation before adopting a new version in production.

## 10. Install MathJax

MathJax and KaTeX are libraries for rendering mathematical notation in web browsers. This project uses MathJax 3.

### 10.1 Create the MathJax configuration file

Create the JavaScript directory if it does not already exist:

```bash
mkdir -p docs/javascripts
```

Create:

```text
docs/javascripts/mathjax.js
```

Add the following configuration:

```javascript
window.MathJax = {
  tex: {
    inlineMath: [["\\(", "\\)"]],
    displayMath: [["\\[", "\\]"]],
    processEscapes: true,
    processEnvironments: true
  },
  options: {
    ignoreHtmlClass: ".*",
    processHtmlClass: "arithmatex"
  }
};
```

This configures MathJax to recognize inline and display LaTeX expressions and process the HTML generated by the Arithmatex extension.

### 10.2 Configure Arithmatex and MathJax

Add the following property to the existing `[project.markdown_extensions]` table. If that table already exists, add the property there instead of declaring the table a second time:

```toml
pymdownx.arithmatex.generic = true
```

Register the configuration file before the MathJax library by adding this property to the existing `[project]` table near the beginning of `zensical.toml`. Do not reopen `[project]` after declaring nested tables:

```toml
extra_javascript = [
  "javascripts/mathjax.js",
  "https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js",
]
```

The order matters because MathJax must read the configuration before its main script loads.

### 10.3 Write mathematical expressions

Inline expression:

```markdown
The equation \(E = mc^2\) describes mass-energy equivalence.
```

Display expression:

```markdown
\[
E = mc^2
\]
```

Build and preview the site to verify that mathematical expressions render correctly.

> **Note:** The configuration above covers the standard page-rendering workflow. If you use client-side navigation or custom page replacement behavior, test mathematical rendering after navigating between pages as well. Any additional re-typesetting logic should be implemented using the navigation lifecycle supported by the installed Zensical version rather than assuming that the Material for MkDocs `document$` event is available.

## 11. Django and the ZoneInfo error

When working inside a Django project, you may encounter an error similar to:

```text
ValueError: ZoneInfo keys may not be absolute paths, got: /UTC
```

This is an application environment or dependency issue, not a Zensical installation requirement.

If you are maintaining an older Django project that requires a Django version below 4, install the appropriate version for that application:

```bash
pip3 install 'django<4'
```

Do not install or downgrade Django solely to make Zensical work. Check the Django project's own dependency requirements and Python compatibility before changing its version.

Other application dependencies, such as Gunicorn and `psycopg2`, are only necessary when required by the Django application:

```bash
pip3 install gunicorn psycopg2
```

## 12. Multi-language documentation

Zensical can be used to build separate language versions of a documentation site. A practical approach is to maintain one configuration file for each version and use a single GitHub Actions workflow to build all versions into separate output directories.

This example uses:

- A landing page.
- An English documentation version.
- A German documentation version.

### 12.1 Organize the language directories

For example:

```text
.
├── docs/
│   ├── index.md
│   ├── en/
│   │   ├── index.md
│   │   └── en.md
│   ├── de/
│   │   ├── index.md
│   │   └── de.md
│   └── assets/
│       └── img/
│           └── logo.png
├── zensical.toml
├── zensical_en.toml
├── zensical_de.toml
└── zensical_landing.toml
```

The language-specific pages are stored in their corresponding subdirectories.

### 12.2 Configure the landing page

Create `zensical_landing.toml`:

```toml
[project]
site_name = "Frank Arellano - Plexosoft"
site_url = "https://USERNAME.github.io/REPOSITORY/"
docs_dir = "docs"
site_dir = "site"

nav = [
  { "Welcome" = "index.md" },
]

[project.theme]
variant = "classic"
language = "en"
logo = "assets/img/logo.png"
```

Replace `USERNAME` and `REPOSITORY` with the correct GitHub Pages address.

### 12.3 Configure the English version

Create `zensical_en.toml`:

```toml
[project]
site_name = "Frank Arellano - Plexosoft"
site_url = "https://USERNAME.github.io/REPOSITORY/1/en/"
docs_dir = "docs"
site_dir = "site/1/en"

nav = [
  { "Home" = "en/index.md" },
  { "EN" = "en/en.md" },
]

[project.theme]
variant = "classic"
language = "en"
logo = "assets/img/logo.png"

[project.extra]

[[project.extra.alternate]]
name = "English"
link = "/REPOSITORY/1/en/"
lang = "en"

[[project.extra.alternate]]
name = "Deutsch"
link = "/REPOSITORY/2/de/"
lang = "de"
```

### 12.4 Configure the German version

Create `zensical_de.toml`:

```toml
[project]
site_name = "Frank Arellano - Plexosoft"
site_url = "https://USERNAME.github.io/REPOSITORY/2/de/"
docs_dir = "docs"
site_dir = "site/2/de"

nav = [
  { "Home" = "de/index.md" },
  { "DE" = "de/de.md" },
]

[project.theme]
variant = "classic"
language = "de"
logo = "assets/img/logo.png"

[project.extra]

[[project.extra.alternate]]
name = "English"
link = "/REPOSITORY/1/en/"
lang = "en"

[[project.extra.alternate]]
name = "Deutsch"
link = "/REPOSITORY/2/de/"
lang = "de"
```

Replace the example repository paths with the actual paths used by your GitHub Pages project. If you use a custom domain, adjust the canonical `site_url` values and language links accordingly.

The examples show the essential configuration for each version. Copy the theme, Markdown extension, social link, and other shared settings from your main configuration into each language configuration when those settings are required.

### 12.5 Build all language versions

Each configuration uses a different `site_dir`, so the generated files can coexist:

```bash
zensical build --config-file zensical_landing.toml --clean

zensical build --config-file zensical_en.toml

zensical build --config-file zensical_de.toml
```

The resulting structure is:

```text
site/
├── index.html
├── assets/
├── 1/
│   └── en/
│       ├── index.html
│       └── ...
└── 2/
    └── de/
        ├── index.html
        └── ...
```

Check the generated output and confirm that each version has the correct links and assets before deployment.

### 12.6 Deploy all language versions with GitHub Actions

For a multi-language site, replace the single build command in `.github/workflows/ci.yml` with the following three build commands:

```yaml
      - name: Build landing page
        run: zensical build --config-file zensical_landing.toml --clean

      - name: Build English documentation
        run: zensical build --config-file zensical_en.toml

      - name: Build German documentation
        run: zensical build --config-file zensical_de.toml
```

Keep the artifact upload and deployment steps unchanged:

```yaml
      - uses: actions/upload-pages-artifact@v5
        with:
          path: site

      - uses: actions/deploy-pages@v5
        id: deployment
```

The workflow now publishes the landing page and both language versions together.

### 12.7 Maintain the language versions

When adding or changing documentation:

1. Update the relevant language-specific Markdown files.
2. Update the navigation in the corresponding TOML configuration.
3. Keep shared theme and Markdown extension settings synchronized.
4. Check the language switcher links.
5. Build all versions locally before pushing changes.

If you add another language, create another configuration file and a separate output directory for it, then add the corresponding build step to the workflow.

## 13. Git and repository maintenance

Make sure the following files are committed:

```text
zensical.toml
requirements.txt
.github/workflows/ci.yml
docs/
```

A suitable `.gitignore` should exclude generated and local files without excluding the GitHub Actions workflow:

```gitignore
.venv/
__pycache__/
*.py[cod]
.pytest_cache/
.mypy_cache/
.ruff_cache/
site/
.cache/
.env
```

Do not add `.github/` to `.gitignore`. GitHub needs the workflow file to be present in the repository.

Commit your changes:

```bash
git add .
git commit -m "Migrate documentation to Zensical"
git push
```

## 14. Troubleshooting

### Zensical command not found

Make sure the virtual environment is activated and Zensical is installed:

```bash
pip3 install zensical
```

### Build errors after changing the configuration

Run a clean build:

```bash
zensical build --clean
```

Check the TOML syntax and verify that configuration tables are not declared more than once.

### Missing images, CSS, or JavaScript

Check that the assets are inside the configured documentation directory and that paths are relative to that directory.

For example:

```text
docs/assets/img/logo.png
```

should be referenced as:

```toml
logo = "assets/img/logo.png"
```

### GitHub Pages deployment fails

Check the following:

1. The workflow file is located in `.github/workflows/`.
2. The workflow has the required `contents`, `pages`, and `id-token` permissions.
3. GitHub Pages uses **GitHub Actions** as its source.
4. The Zensical build completes successfully.
5. The `site/` directory exists before the artifact upload step.
6. The deployment job uses the `github-pages` environment.

### Changes do not appear on the website

Check that the latest workflow run completed successfully. If necessary, run a clean local build and inspect the generated output.

Also check the browser cache and verify that the deployed URL points to the correct repository or custom domain.

## 15. Official documentation

Use these resources when checking configuration options, compatibility, and deployment behavior:

- [Zensical documentation](https://zensical.org/docs/)
- [Create your site](https://zensical.org/docs/create-your-site/)
- [Zensical configuration](https://zensical.org/docs/setup/basics/)
- [Migrate from MkDocs](https://zensical.org/docs/compatibility/mkdocs/migration/)
- [Zensical build command](https://zensical.org/docs/usage/build/)
- [Zensical customization](https://zensical.org/docs/customization/)
- [GitHub Pages publishing source](https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site)
- [GitHub Pages custom workflows](https://docs.github.com/en/pages/getting-started-with-github-pages/using-custom-workflows-with-github-pages)
