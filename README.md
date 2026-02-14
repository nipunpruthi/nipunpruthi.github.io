# Nipun Pruthi – Personal site

Hugo-based personal site for [nipunpruthi.github.io](https://nipunpruthi.github.io/), with blog, experience timeline, about page, papershelf, and photos. Deploys to GitHub Pages.

## Prerequisites

- [Hugo](https://gohugo.io/installation/) (extended not required)

```bash
# macOS
brew install hugo
```

## Commands

| Command | Description |
|--------|-------------|
| `hugo` | Build site into `public/` |
| `hugo server` | Run dev server at http://localhost:1313 |
| `hugo server -D` | Include draft posts |
| `hugo new blog/my-post.md` | Create a new blog post |

## Project structure

```
├── archetypes/       # Default front matter for new content
├── content/          # All editable content (markdown)
│   ├── _index.md     # Home page content
│   ├── about/        # About me
│   ├── blog/         # Blog posts
│   ├── experience/   # Experience section index
│   ├── papershelf/   # Papers
│   └── photos/       # Photos
├── data/             # Structured data (e.g. experience.yaml)
├── layouts/          # HTML templates (partials, section layouts)
├── static/           # Images, CSS, JS (served as-is)
│   ├── css/
│   └── img/          # Put images here (e.g. profile photo)
├── hugo.toml         # Site config, menu, params
└── public/           # Generated output (gitignored)
```

## Content guide

### Profile image (About page)

Put the image in `static/img/` (e.g. `static/img/me.jpg`). Then in `content/about/_index.md` set in the front matter:

```yaml
image: img/me.jpg
```

Path is relative to `static/`.

### Landing page greeting and tagline

Edit `hugo.toml` under `[params]`:

- `greeting` – e.g. "Hey, I am Nipun"
- `tagline` – e.g. "software engineering. always building."

You can override these per-page in `content/_index.md` front matter.

### Experience timeline

Edit `data/experience.yaml`. Each entry has:

- `role` – Job title
- `company` – Company name
- `start` / `end` – Years (use `"Present"` for current role)
- `description` – Short line or paragraph

Order in the file is display order (top = most recent).

### Blog posts

- Posts live in `content/blog/` as Markdown files. Sample posts are included; replace or add your own.
- New post: `hugo new blog/your-slug.md`
- Front matter: `title`, `date`, `draft: false`, `tags: [tag1, tag2]`
- Use `<!--more-->` in the body to set where the summary stops on the list page.

## Deployment (GitHub Pages)

1. Push the repo to GitHub.
2. In repo **Settings → Pages**: set source to **GitHub Actions**.
3. On push to `main`, the workflow in `.github/workflows/hugo.yml` builds Hugo and deploys to GitHub Pages.

No need to commit `public/`; the workflow builds it.

## Local development

```bash
git clone https://github.com/nipunpruthi/nipunpruthi.github.io.git
cd nipunpruthi.github.io
hugo server
```

Open http://localhost:1313 and use the nav to check About, Experience, Blog, etc.

## License

Use and adapt as you like.
