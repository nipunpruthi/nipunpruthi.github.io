# Resume Template & Guidelines

## 📄 Resume Structure Overview

The resume page (`/content/resume.md`) uses an interactive, collapsible design that provides detailed professional information in an organized, accessible format.

## 🎯 Design Principles

### Visual Hierarchy
1. **Contact Section** - Top-level contact information and PDF download
2. **Education** - Academic background (positioned above experience)
3. **Professional Experience** - Detailed work history with company branding
4. **Skills & Certifications** - Technical competencies and achievements

### Interactive Elements
- **Collapsible Sections**: Using HTML `<details>` and `<summary>` tags
- **Company Branding**: Icons and styled company names
- **Right-aligned Locations**: Geographic information positioned consistently
- **Technology Tags**: Styled code blocks for technical skills

## 📝 Section Templates

### Contact Section Template
```markdown
# Contact

**📧 Contact**: [email@domain.com](mailto:email@domain.com) | **📱 LinkedIn**: [/in/username](https://linkedin.com/in/username) | **💻 GitHub**: [/username](https://github.com/username)

**📄 [Download PDF Resume](mailto:email@domain.com?subject=Resume%20Request)** | **🌐 [View Full Portfolio](/projects)**
```

### Education Section Template
```markdown
## 🎓 Education

<details>
<summary style="display: flex; justify-content: space-between; align-items: center;">
<span><img src="/images/institution-icon.jpeg" alt="Institution" width="20" height="20" style="display:inline-block; vertical-align:middle; margin-right:8px;"> <strong>Degree Title</strong> - Institution Name (Year-Year)</span>
<span style="font-size: 0.9em; color: var(--secondary);">📍 Location, Country</span>
</summary>

### 🎯 Key Details (if needed)
- Academic achievements
- Relevant coursework
- Projects or thesis work

</details>
```

### Professional Experience Template
```markdown
## 👨‍💻 Professional Experience

<details>
<summary style="display: flex; justify-content: space-between; align-items: center;">
<span><img src="/images/company-icon.png" alt="Company" width="20" height="20" style="display:inline-block; vertical-align:middle; margin-right:8px;"> <strong>Job Title</strong> - <em>company.com</em> (Start Date - End Date)</span>
<span style="font-size: 0.9em; color: var(--secondary);">📍 City, Country (Remote/Hybrid)</span>
</summary>

### 🎯 Key Responsibilities
- Primary responsibility with specific focus
- Technical leadership or development tasks
- Collaboration and team management aspects
- Infrastructure or architecture contributions

### 🏆 Key Achievements
- **Quantified Impact**: Specific metrics and business outcomes
- **Technical Excellence**: Performance improvements and optimizations
- **Team Leadership**: Management and mentoring accomplishments
- **Cost Optimization**: Financial impact and efficiency gains

### 💻 Technologies Used
`Tech1` `Tech2` `Tech3` `Tech4` `Tech5` `Tech6` `Tech7` `Tech8`

</details>
```

## 🎨 Styling Guidelines

### Company Icons
- **Size**: 20x20 pixels
- **Format**: PNG or JPEG
- **Location**: `/static/images/company-icon.png`
- **Alt Text**: Company name
- **Styling**: `display:inline-block; vertical-align:middle; margin-right:8px;`

### Summary Layout
```css
display: flex; 
justify-content: space-between; 
align-items: center;
```

### Location Styling
```css
font-size: 0.9em; 
color: var(--secondary);
```

### Technology Tags
- Use backticks for inline code: `Technology`
- Styled via CSS in `resume-wide.css`
- Blue background with white text
- Rounded corners and subtle shadow

## 📋 Content Guidelines

### Professional Experience Format
1. **Job Title** - Use exact official title
2. **Company Name** - Format as `company.com` in italics, no hyperlinks
3. **Duration** - Format as `(Month Year - Month Year)` or `(Month Year - Present)`
4. **Location** - Include city, country, and work mode (Remote/Hybrid/On-site)

### Achievement Writing
- **Start with impact**: Use quantifiable metrics when possible
- **Use action verbs**: Built, optimized, led, implemented, delivered
- **Include scale**: Number of users, team size, cost savings, performance gains
- **Be specific**: Mention technologies, timeframes, and business outcomes

### Technology Selection
- **Prioritize relevance**: Most important technologies for the role
- **Limit quantity**: 6-8 technologies per role maximum
- **Use official names**: Exact technology names and capitalizations

## 🔧 Technical Implementation

### HTML Details Structure
```html
<details>
<summary style="display: flex; justify-content: space-between; align-items: center;">
<span><img src="/images/icon.png" alt="Alt text" width="20" height="20" style="display:inline-block; vertical-align:middle; margin-right:8px;"> <strong>Title</strong> - <em>subtitle</em> (dates)</span>
<span style="font-size: 0.9em; color: var(--secondary);">📍 Location</span>
</summary>

Content goes here...

</details>
```

### CSS Dependencies
- Requires `assets/css/extended/resume-wide.css`
- Uses Hugo's `markup.goldmark.renderer.unsafe: true` configuration
- Responsive design with mobile-specific adjustments

## 🚨 Common Issues & Solutions

### Hugo Shortcode Problems
- **Problem**: `{{< collapse >}}` shortcode errors
- **Solution**: Use native HTML `<details>` and `<summary>` tags instead

### Raw HTML Warnings
- **Problem**: `Raw HTML omitted` warnings
- **Solution**: Enable `unsafe: true` in Hugo's goldmark renderer configuration

### Icon Alignment Issues
- **Problem**: Icons not aligned with text
- **Solution**: Use `display:inline-block; vertical-align:middle;` styling

### Mobile Responsiveness
- **Problem**: Layout breaks on small screens
- **Solution**: Implement CSS media queries in `resume-wide.css`

## 📊 Maintenance Checklist

### Regular Updates
- [ ] Update current role end date (if applicable)
- [ ] Add new technologies and certifications
- [ ] Refresh achievement metrics and impact data
- [ ] Update contact information and links
- [ ] Verify all company icons are loading correctly

### Quality Assurance
- [ ] Test collapsible sections functionality
- [ ] Verify responsive design on multiple screen sizes
- [ ] Check technology tag styling consistency
- [ ] Validate HTML structure and accessibility
- [ ] Ensure consistent date formatting across all entries

---

*This template ensures consistency and professionalism across resume updates while maintaining the interactive, modern design that sets this portfolio apart.*
