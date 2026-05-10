# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Commands

```bash
# Install Ruby gems
npm run jekyll:install

# Start the full dev server (Jekyll on :6060 + Bookshop browser on :6086)
npm run start

# Build Bookshop hosted JS (run before deploying)
npm run bookshop-hosted

# Run only the Bookshop component browser
npm run bookshop-dev

# Run only Jekyll
npm run jekyll
```

## Architecture

This is a **Jekyll + Bookshop** portfolio site deployed on CloudCannon.

### Key directories

- `site/` — Jekyll source. Served by `bundle exec jekyll serve --source site`.
- `site/collections/` — All content: `_pages/`, `_posts/`, `_projects/`, `_testimonials/`.
- `site/_data/` — YAML data files for nav, footer, social links, tech stack, author info.
- `site/_layouts/` — Base HTML layouts (`default`, `post`, `project`, `tag_page`).
- `site/_includes/` — Partials (header, footer, head, etc.).
- `component-library/components/` — Bookshop components, each in its own directory.

### Bookshop component system

Each component under `component-library/components/<name>/` contains three files:

| File | Purpose |
|---|---|
| `<name>.bookshop.yml` | Schema/blueprint defining props; drives CloudCannon CMS editing UI |
| `<name>.jekyll.html` | Liquid template rendered by Jekyll |
| `<name>.scss` | Component styles |

Pages (e.g. `site/collections/_pages/index.html`) compose components via `content_blocks` using `_bookshop_name` keys in their front matter. Jekyll renders these through the `jekyll-bookshop` plugin.

### Adding a project

Create a Markdown file in `site/collections/_projects/` following this front matter schema (see `site/schemas/project.md`):

```yaml
title: ""
subtitle: ""
description: ""
image: "/images/projects/<filename>.jpg"
technologies: []
github_url: ""
demo_url: ""
```

Project images go in `site/images/projects/`.

### Routing

- Pages: `/:title/` (from `collections/_pages/`)
- Projects: `/project/:slug` (from `collections/_projects/`)
- Posts: `/blog/:slug` (from `collections/_posts/`)
- Tags: `/tag/:title`

### CloudCannon integration

`cloudcannon.config.yml` configures the CMS. The `.cloudcannon/prebuild` runs `npm install`; `.cloudcannon/postbuild` runs `@bookshop/generate` to wire up Bookshop live editing. Changes to `cloudcannon.config.yml` affect what editors see in the CMS UI.
