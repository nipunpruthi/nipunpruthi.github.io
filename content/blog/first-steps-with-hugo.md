---
title: "First steps with Hugo"
date: 2025-01-15
draft: false
tags: ["hugo", "static-sites", "tools"]
---

Hugo is a fast static site generator. Here are a few things that make it pleasant to use.

You write content in Markdown and keep structure in templates. The `hugo server` live reload is quick, and building a full site takes a second or two even for hundreds of pages. That makes it a good fit for blogs, docs, and personal sites.

<!--more-->

Config lives in `hugo.toml` or `config.toml`. You define menus, taxonomies like tags, and custom params there. Content goes under `content/` with front matter at the top of each file.

Sections (e.g. `content/blog/`) get their own list and single layouts when you add `layouts/section/blog.html` and `layouts/blog/single.html`. Use partials for the header and footer so you don’t repeat yourself.

If you’re hosting on GitHub Pages, a small workflow can build with Hugo and push the `public/` output to the `gh-pages` branch. No need to commit generated files.
