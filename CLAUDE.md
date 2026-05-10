# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Stack

Pure HTML/CSS/JS — no build step, no dependencies, no package manager. Deployed via GitHub Pages from the root of the `master` branch.

## Development

Open `index.html` directly in a browser, or run a local server:

```bash
python3 -m http.server 8080
# then visit http://localhost:8080
```

## Structure

```
index.html        # single-page site
style.css         # all styles
images/
  michael_lohier.jpg
  logo.svg
  tech/           # SVG logos used in the tech stack section
  projects/       # project card images (project1.jpg, project2.jpg, ...)
favicon.png
.nojekyll         # prevents GitHub Pages from running Jekyll
```

## Architecture

Everything is in `index.html` and `style.css`. The page has six sections in order: nav, hero, about, tech stack, projects, contact, footer.

**Tech stack cards** use a CSS 3D flip — front shows the SVG logo from `images/tech/`, back shows a description. The SVG filenames match the keys in the original `site/_data/tech_stack.yml` (python.svg, django.svg, etc.).

**Project cards** are fixed-height (`380px`) with `object-fit: cover`. To add a project: add an `<article class="project-card">` block in the projects grid and drop the image in `images/projects/`.

**Contact form** posts to Formspree — update the `action` attribute on the `<form>` with your Formspree endpoint.

## Deployment

GitHub Pages serves `index.html` from the root of `master` automatically. No CI, no build. Push to `master` → live in ~30 seconds.
