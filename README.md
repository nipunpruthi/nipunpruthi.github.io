# Personal Portfolio Website

A modern, clean personal brand website built with Hugo and the PaperMod theme.

## Features

- 🎨 Clean, professional design with PaperMod theme
- 📱 Fully responsive and mobile-friendly
- 🌙 Dark/Light theme toggle
- 🔍 Built-in search functionality
- 📝 Blog with technical and random categories
- 💼 Dedicated sections for About, Projects, and Contact
- ⚡ Fast loading and SEO optimized

## Structure

```
├── content/
│   ├── about.md          # About page
│   ├── projects.md       # Projects showcase
│   ├── contact.md        # Contact information
│   ├── search.md         # Search page
│   ├── archives.md       # Blog archives
│   ├── _index.md         # Homepage content
│   └── posts/            # Blog posts
│       ├── my-first-tech-post.md    # Technical: Go APIs
│       ├── docker-optimization.md   # Technical: Docker
│       ├── coffee-and-code.md       # Random: Life balance
│       └── weekend-projects.md      # Random: Side projects
├── static/
│   └── images/           # Static images
├── config.yaml           # Site configuration
└── archetypes/
    └── default.md        # Template for new posts
```

## Getting Started

### Prerequisites
- Hugo (extended version) v0.146.0 or later
- Git

### Local Development

1. **Clone and setup**:
   ```bash
   git clone [your-repo-url]
   cd my-portfolio
   git submodule update --init --recursive
   ```

2. **Run locally**:
   ```bash
   hugo server
   ```
   Visit `http://localhost:1313`

3. **Run with drafts**:
   ```bash
   hugo server --buildDrafts
   ```

### Creating Content

#### New Blog Post
```bash
hugo new posts/my-new-post.md
```

#### Technical Post Template
```yaml
---
title: "Your Technical Post Title"
date: 2024-XX-XX
tags: ["Technology", "Programming"]
categories: ["technical"]
draft: false
description: "Brief description of your post"
---
```

#### Random Post Template
```yaml
---
title: "Your Random Post Title"
date: 2024-XX-XX
tags: ["Life", "Thoughts"]
categories: ["random"]
draft: false
description: "Brief description of your post"
---
```

## Customization

### Personal Information
Update the following in `config.yaml`:

```yaml
params:
  profileMode:
    title: "Your Name"
    subtitle: "Your Title"
    imageUrl: "images/your-profile.jpg"
  
  socialIcons:
    - name: github
      url: "https://github.com/yourusername"
    - name: linkedin
      url: "https://linkedin.com/in/yourusername"
    - name: email
      url: "mailto:your.email@example.com"
```

### Site Metadata
```yaml
baseURL: 'https://your-domain.com'
title: 'Your Name - Software Engineer'
```

### Adding Images
1. Place images in `static/images/`
2. Reference in posts: `![Alt text](/images/your-image.jpg)`
3. For cover images: Update the `cover` section in post front matter

## Deployment

### Build for Production
```bash
hugo --minify
```

The built site will be in the `public/` directory.

### Deployment Options
- **GitHub Pages**: Push to GitHub and enable Pages
- **Netlify**: Connect your repo for automatic deployment
- **Vercel**: Import your repo for instant deployment
- **Traditional hosting**: Upload `public/` folder contents

## Content Guidelines

### Technical Posts
- Include code examples with syntax highlighting
- Add relevant tags for discoverability
- Use clear headings and structure
- Include practical examples

### Random Posts
- Share personal insights and experiences
- Keep it authentic and engaging
- Can be about anything - life, hobbies, thoughts

## SEO and Performance

The site is optimized for:
- ✅ Fast loading times
- ✅ Mobile responsiveness
- ✅ Search engine optimization
- ✅ Social media sharing
- ✅ Clean URLs
- ✅ Sitemap generation

## Support

For Hugo and PaperMod documentation:
- [Hugo Documentation](https://gohugo.io/documentation/)
- [PaperMod Wiki](https://github.com/adityatelange/hugo-PaperMod/wiki)

---

## Next Steps

1. **Personalize content**: Update all placeholder content with your information
2. **Add profile image**: Add your photo to `static/images/profile.jpg`
3. **Update social links**: Add your actual social media URLs
4. **Customize domain**: Update `baseURL` in config
5. **Write your first post**: Share your journey or a technical insight
6. **Deploy**: Choose a hosting platform and go live!

Happy blogging! 🚀
