# Hugo Configuration & PaperMod Theme Guide

## 🚀 Hugo Setup Overview

This project uses **Hugo** static site generator with the **PaperMod theme**, configured through `config.yaml` for optimal performance, SEO, and user experience.

## 📁 Configuration Structure

### Primary Configuration File
- **Location**: `/config.yaml`
- **Format**: YAML (consolidated from TOML for consistency)
- **Scope**: Site-wide settings, theme parameters, and menu structure

### Theme Integration
- **Theme**: PaperMod (Git submodule)
- **Location**: `/themes/PaperMod/`
- **Documentation**: [PaperMod Official Docs](https://github.com/adityatelange/hugo-PaperMod)

## ⚙️ Key Configuration Sections

### 1. Basic Site Settings
```yaml
baseURL: "https://nipunpruthi.github.io/my-portfolio"
languageCode: "en-us"
title: "Nipun Pruthi - Software Engineer"
theme: "PaperMod"
```

### 2. PaperMod Parameters
```yaml
params:
  env: production
  title: "Nipun Pruthi"
  description: "Software Engineer | Backend Developer | Go & JavaScript Expert"
  keywords: ["software engineer", "backend developer", "golang", "javascript"]
  author: "Nipun Pruthi"
  
  # Profile Mode Configuration
  profileMode:
    enabled: true
    title: "Nipun Pruthi"
    subtitle: "Software Engineer"
    imageUrl: "/images/profile.jpg"
    imageWidth: 120
    imageHeight: 120
    imageTitle: "Nipun Pruthi"
    buttons:
      - name: About
        url: /about
      - name: Resume
        url: /resume
      - name: Projects
        url: /projects
      - name: Blog
        url: /posts
      - name: Contact
        url: /contact
```

### 3. Menu Configuration
```yaml
menu:
  main:
    - identifier: about
      name: About
      url: /about/
      weight: 10
    - identifier: resume
      name: Resume
      url: /resume/
      weight: 20
    - identifier: projects
      name: Projects
      url: /projects/
      weight: 30
    - identifier: blog
      name: Blog
      url: /posts/
      weight: 40
    - identifier: technical
      name: Technical
      parent: blog
      url: /categories/technical/
      weight: 41
    - identifier: random
      name: Random
      parent: blog
      url: /categories/random/
      weight: 42
    - identifier: contact
      name: Contact
      url: /contact/
      weight: 50
```

### 4. Content Rendering Configuration
```yaml
markup:
  goldmark:
    renderer:
      unsafe: true  # Required for HTML in markdown (resume collapsible sections)
  highlight:
    style: github
    lineNos: true
    codeFences: true
```

## 🎨 Theme Customization

### Assets Structure
```
assets/
└── css/
    └── extended/
        └── resume-wide.css  # Custom CSS overrides
```

### Custom CSS Integration
- **Automatic Loading**: PaperMod automatically loads files from `assets/css/extended/`
- **Override Priority**: Custom CSS takes precedence over theme defaults
- **Responsive Design**: Mobile-first approach with media queries

### Static Assets
```
static/
├── images/
│   ├── profile.jpg          # Profile photo
│   ├── company-icons/       # Company logos
│   ├── project-covers/      # Project thumbnails
│   └── blog-covers/         # Blog post covers
├── favicon.ico
├── favicon-16x16.png
├── favicon-32x32.png
└── apple-touch-icon.png
```

## 📝 Content Configuration

### Archetype Template
- **Location**: `/archetypes/default.md`
- **Format**: YAML frontmatter
- **Purpose**: Template for new content files

### Page Types
1. **Single Pages**: About, Resume, Projects, Contact
2. **List Pages**: Blog posts, Archives, Search
3. **Taxonomy Pages**: Categories (Technical/Random), Tags

### Frontmatter Standards
```yaml
---
title: "Page Title"
date: 2024-01-01T00:00:00Z
draft: false
description: "SEO description"
tags: ["tag1", "tag2"]
categories: ["technical"]  # or "random"
cover:
    image: "/images/cover.jpg"
    alt: "Cover image description"
showToc: false  # For pages like resume
hidemeta: false
---
```

## 🔧 Development Workflow

### Local Development
```bash
# Start development server
hugo server --buildDrafts --bind 0.0.0.0

# Build for production
hugo --minify

# Clean build artifacts
rm -rf public/ resources/ .hugo_build.lock
```

### Git Integration
```bash
# Add PaperMod as submodule
git submodule add https://github.com/adityatelange/hugo-PaperMod.git themes/PaperMod

# Update theme
git submodule update --remote --merge
```

## 🎯 SEO & Performance

### SEO Configuration
```yaml
params:
  # Social media integration
  socialIcons:
    - name: github
      url: "https://github.com/nipunpruthi"
    - name: linkedin
      url: "https://linkedin.com/in/nipunpruthi"
    - name: email
      url: "mailto:nipruthi@gmail.com"

  # Search functionality
  fuseOpts:
    isCaseSensitive: false
    shouldSort: true
    location: 0
    distance: 1000
    threshold: 0.4
```

### Performance Features
- **Fast Loading**: Minimized CSS and JavaScript
- **Image Optimization**: Proper sizing and lazy loading
- **Caching**: Static file generation for optimal performance
- **Mobile-First**: Responsive design with touch-friendly interfaces

## 🚨 Common Configuration Issues

### Issue 1: Raw HTML in Markdown
- **Error**: `Raw HTML omitted`
- **Solution**: Set `markup.goldmark.renderer.unsafe: true`

### Issue 2: Theme Not Loading
- **Error**: Theme files not found
- **Solution**: Ensure PaperMod is properly added as Git submodule

### Issue 3: Menu Not Displaying
- **Error**: Navigation menu missing
- **Solution**: Verify `menu.main` configuration and weight values

### Issue 4: Profile Image Not Showing
- **Error**: Profile photo not loading
- **Solution**: Check image path in `static/images/` and `profileMode.imageUrl`

## 📊 Configuration Validation

### Pre-deployment Checklist
- [ ] `baseURL` points to correct domain
- [ ] All menu links are functional
- [ ] Profile image loads correctly
- [ ] Social media links are accurate
- [ ] SEO metadata is complete
- [ ] Custom CSS is loading properly
- [ ] Search functionality works
- [ ] Mobile responsiveness verified

### Testing Commands
```bash
# Validate configuration
hugo config

# Check for broken links
hugo server --navigateToChanged

# Validate HTML output
hugo --minify && htmlproofer public/
```

## 🔄 Maintenance & Updates

### Regular Tasks
- **Theme Updates**: Check for PaperMod updates monthly
- **Hugo Updates**: Update Hugo binary as needed
- **Content Refresh**: Keep blog posts and project information current
- **Performance Monitoring**: Monitor site speed and SEO metrics

### Backup Strategy
- **Configuration**: Version controlled in Git
- **Content**: Markdown files tracked in repository
- **Assets**: Static files included in version control
- **Theme**: Submodule ensures reproducible builds

---

*This configuration provides a solid foundation for a professional portfolio website with excellent performance, SEO optimization, and maintainable structure.*
