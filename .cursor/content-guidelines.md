# Content Guidelines & Standards

## 📝 Content Creation Philosophy

All content should reflect **professionalism**, **technical expertise**, and **personal authenticity** while maintaining consistency across the portfolio website.

## 📁 Content Structure

### Directory Organization
```
content/
├── _index.md           # Homepage content
├── about.md           # Personal background
├── resume.md          # Professional experience
├── projects.md        # Technical projects showcase
├── contact.md         # Contact information
├── search.md          # Search functionality
├── archives.md        # Blog archives
└── posts/             # Blog content
    ├── technical/     # Programming, tools, industry
    └── random/        # Personal thoughts, lifestyle
```

## 🎯 Content Categories

### 1. Technical Blog Posts
**Purpose**: Demonstrate technical expertise and thought leadership

**Topics Include**:
- Programming tutorials and best practices
- Technology deep-dives and comparisons
- Software architecture and system design
- Industry trends and tool reviews
- Open source contributions and learnings

**Content Standards**:
- **Depth over breadth**: Provide actionable insights
- **Code examples**: Include practical implementations
- **Real-world context**: Connect to actual project experience
- **SEO optimization**: Use relevant technical keywords

### 2. Random Blog Posts
**Purpose**: Show personality and interests beyond programming

**Topics Include**:
- Personal development and career insights
- Travel experiences and cultural observations
- Hobbies and creative projects
- Industry events and networking experiences
- Life lessons and philosophical thoughts

**Content Standards**:
- **Authentic voice**: Maintain personal but professional tone
- **Relatable content**: Connect with fellow professionals
- **Visual elements**: Include personal photos when appropriate
- **Engagement focus**: Encourage comments and discussion

## ✍️ Writing Standards

### Tone & Voice
- **Professional yet approachable**: Knowledgeable without being condescending
- **Conversational**: Write as if explaining to a colleague
- **Confident**: Assert expertise while remaining humble
- **Clear and concise**: Avoid unnecessary jargon or verbose explanations

### Technical Writing Guidelines
```markdown
# Use clear headings hierarchy
## Main sections use H2
### Subsections use H3

# Code blocks with language specification
```go
func main() {
    fmt.Println("Hello, World!")
}
```

# Inline code for `variables` and `functions`

# Lists for better readability
- First point with specific detail
- Second point with actionable insight
- Third point with relevant example
```

### Content Length Guidelines
- **Blog Posts**: 800-2000 words for technical, 500-1200 for random
- **Project Descriptions**: 200-400 words per project
- **About Page**: 300-500 words total
- **Resume Sections**: Bullet points, 1-2 lines each

## 🖼️ Visual Content Standards

### Image Requirements
- **Format**: JPEG for photos, PNG for graphics with transparency
- **Size**: Maximum 1200px width for blog covers
- **Quality**: High resolution but optimized for web (< 500KB)
- **Alt Text**: Descriptive and accessible for screen readers

### Image Naming Convention
```
static/images/
├── profile.jpg                    # Profile photo
├── {post-slug}-cover.jpg         # Blog post covers
├── {project-name}-demo.jpg       # Project screenshots
├── {company-name}-icon.png       # Company logos
└── {institution-name}-icon.jpeg  # Education logos
```

### Cover Image Guidelines
- **Aspect Ratio**: 16:9 for optimal display
- **Content**: Relevant to article topic
- **Branding**: Maintain visual consistency
- **Source**: Use original photos or properly licensed images

## 📊 SEO & Metadata

### Frontmatter Template
```yaml
---
title: "Descriptive, Search-Friendly Title"
date: 2024-01-01T00:00:00Z
draft: false
description: "Compelling 150-character summary for search results"
tags: ["golang", "backend", "api-design"]
categories: ["technical"]  # or "random"
cover:
    image: "/images/post-cover.jpg"
    alt: "Descriptive alt text for accessibility"
weight: 1  # Optional: for ordering
---
```

### SEO Best Practices
- **Title Tags**: Include primary keyword and be under 60 characters
- **Meta Descriptions**: Compelling summary under 160 characters
- **Headers**: Use H1 for title, H2-H6 for content hierarchy
- **Internal Links**: Link to relevant portfolio pages and blog posts
- **Keywords**: Natural integration without keyword stuffing

## 🔗 Content Linking Strategy

### Internal Link Patterns
- **Resume → Projects**: Link to specific project implementations
- **Blog Posts → Resume**: Reference professional experience
- **About → Contact**: Guide readers to next action
- **Technical Posts → Technical Posts**: Create content clusters

### External Link Guidelines
- **Professional Links**: LinkedIn, GitHub, company websites
- **Technical References**: Official documentation, reputable sources
- **Attribution**: Proper credit for images, quotes, and references
- **Link Text**: Descriptive anchor text, avoid "click here"

## 📱 Content Accessibility

### Writing Accessibility
- **Clear Language**: Write at 8th-grade reading level
- **Short Paragraphs**: 2-3 sentences maximum
- **Bullet Points**: Break up dense information
- **Headings**: Logical hierarchy for screen readers

### Technical Accessibility
- **Alt Text**: Descriptive image descriptions
- **Code Examples**: Include explanatory comments
- **Color Contrast**: Ensure readable color combinations
- **Mobile-First**: Content readable on all device sizes

## 🚀 Content Optimization

### Performance Considerations
- **Image Optimization**: Compress images before upload
- **Content Length**: Balance depth with loading speed
- **External Resources**: Minimize third-party embeds
- **Code Blocks**: Use syntax highlighting judiciously

### User Experience
- **Scannable Content**: Use subheadings and bullet points
- **Visual Breaks**: Include images and code blocks strategically
- **Call-to-Actions**: Guide readers to next steps
- **Related Content**: Suggest similar posts or projects

## 📋 Content Review Checklist

### Pre-Publication Review
- [ ] Grammar and spelling checked
- [ ] Technical accuracy verified
- [ ] Links tested and functional
- [ ] Images optimized and accessible
- [ ] SEO metadata complete
- [ ] Mobile responsiveness confirmed
- [ ] Brand consistency maintained

### Post-Publication Maintenance
- [ ] Monitor for broken links
- [ ] Update outdated technical information
- [ ] Refresh project screenshots
- [ ] Review and respond to comments
- [ ] Track performance metrics
- [ ] Update related content links

## 🎨 Brand Voice Examples

### Technical Post Example
> "When building scalable APIs in Go, proper error handling isn't just good practice—it's essential for maintaining system reliability. In this post, I'll walk through the error handling patterns I've implemented across production systems at ixigo and Flipkart, handling millions of requests daily."

### Random Post Example
> "Coffee shops have become my unofficial office spaces over the years. There's something about the ambient noise and caffeine-fueled energy that sparks creativity. Today, while debugging a particularly stubborn race condition, I realized that the parallel processing happening around me mirrored the concurrency issues I was solving."

## 📈 Content Performance Tracking

### Key Metrics
- **Engagement**: Time on page, bounce rate, social shares
- **SEO Performance**: Search rankings, organic traffic
- **Professional Impact**: LinkedIn views, contact form submissions
- **Technical Authority**: Developer community engagement

### Content Iteration
- **Regular Updates**: Keep technical content current
- **Seasonal Refresh**: Update project showcases and resume
- **Trend Alignment**: Write about emerging technologies
- **Community Feedback**: Incorporate reader suggestions and questions

---

*These guidelines ensure that all content contributes to building a strong professional brand while providing genuine value to readers and potential collaborators.*
