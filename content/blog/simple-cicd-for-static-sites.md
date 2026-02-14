---
title: "Simple CI/CD for static sites"
date: 2025-01-08
draft: false
tags: ["ci-cd", "github-actions", "github-pages"]
---

For a static site on GitHub Pages, you can avoid committing build artifacts and let CI do the work.

A single GitHub Actions workflow can checkout the repo, install Hugo, run `hugo --minify`, and deploy the contents of `public/` to the Pages branch. The `GITHUB_TOKEN` is enough for push access when the workflow is in the same repo.

<!--more-->

Keep the source in `main`: content, layouts, and config. The workflow runs on push to `main`, builds the site, and updates the deployment branch. That keeps history clean and prevents merge conflicts from generated files.

Add a step to fail the job if `hugo` returns a non-zero exit code so broken content or templates don’t get deployed. Optionally cache the Hugo binary to speed up runs.

Same idea works for other static generators (Jekyll, Eleventy, etc.): build in the runner, then deploy the output directory.
