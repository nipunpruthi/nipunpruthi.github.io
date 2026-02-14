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

### Landing page (home)

The home page shows: **greeting + photo + what I do**, **about me** (from `content/_index.md` body), **experience timeline**, **education**, and **social links**.

- **Greeting, tagline, photo**: In `hugo.toml` under `[params]`: `greeting`, `tagline`, `profile_image` (e.g. `img/me.jpg`; path relative to `static/`). Optional `what_i_do` overrides the line under the greeting (otherwise `tagline` is used). Override any of these in `content/_index.md` front matter.
- **About me**: Edit the body of `content/_index.md` (markdown).
- **Experience**: Still driven by `data/experience.yaml`; the timeline is rendered on the home page. The standalone `/experience/` page remains for direct links; it is no longer in the main nav.
- **Education**: Edit `data/education.yaml`. Each entry: `degree`, `institution`, `start`, `end`, optional `description`. Order = display order (top = most recent).
- **Social links**: In `hugo.toml` under `[params.social]` set `linkedin`, `instagram`, `twitter`, `github`, `youtube` (full URLs). Leave a key empty to hide that link.

### Experience data (used on home and /experience/)

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

### Tags (filter by tag)

- Tag taxonomy is defined in `hugo.toml` (`tag = "tags"`). Add `tags: [a, b]` in post front matter.
- **Blog list** shows a “Filter by tag” strip: **All**, each tag, and **All tags →** (links to `/tags/`).
- **All tags page**: `/tags/` lists every tag with post count; each tag links to `/tags/tag-name/`.
- **Single-tag page**: `/tags/tag-name/` lists only posts with that tag. Tag links on each post also go to the matching tag page.

### Blog search

- **Client-side search** on `/blog/` and `/tags/...`: a “Search posts” input filters the visible list by title, summary, and tags. No server or index; each post has a `data-search` attribute and a small script shows or hides items as you type. “No posts match your search” appears when nothing matches.

### Papershelf

- **Intro**: Edit `content/papershelf/_index.md` to describe what kinds of papers you read (systems, algorithms, etc.).
- **List**: Edit `data/papershelf.yaml`. Each entry: `title`, `authors`, `source` (e.g. journal or “Book”), `year`, `url` (optional, link to PDF or page), `comment` (your take).
- **Hide the Papershelf tab**: In `hugo.toml`, set `show_papershelf = false` under `[params]`. The page stays at `/papershelf/` but the nav link is hidden. Set to `true` when you want it in the menu.

### Photos (recommended approach)

- **One gallery page** at `/photos/`: grid of images; add **tags** (e.g. place name, “landscape”, “street”) so you can filter. Keeps everything in one place and still lets you browse by theme or location.
- **Optional later**: **Separate pages per place** (e.g. `/photos/paris/`) as subsections with a short intro and a grid for that set—good for trips or themed sets. Can be added when you want dedicated pages for a place or series.
- **Recommendation**: Start with a single gallery + tags; add place/series pages only if you want standalone stories for specific sets.

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
