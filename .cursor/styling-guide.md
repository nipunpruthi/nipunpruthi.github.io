# Styling Guide & CSS Architecture

## 🎨 Design Philosophy

The portfolio website follows a **clean, professional, and modern** design approach that prioritizes **readability**, **accessibility**, and **responsive user experience** while maintaining **visual consistency** across all sections.

## 🏗️ CSS Architecture

### File Structure
```
assets/css/extended/
└── resume-wide.css    # Custom overrides for PaperMod theme
```

### Theme Integration
- **Base Theme**: PaperMod provides foundational styling
- **Custom Extensions**: Override and extend through `assets/css/extended/`
- **Automatic Loading**: Hugo automatically includes extended CSS files
- **Priority**: Custom CSS takes precedence over theme defaults

## 🎯 Core Design Principles

### 1. Mobile-First Responsive Design
```css
/* Mobile default styles */
.main {
    max-width: 95% !important;
    padding: 1rem;
}

/* Desktop enhancements */
@media (min-width: 768px) {
    .main {
        padding: 2rem;
    }
}
```

### 2. Visual Hierarchy
- **Typography**: Clear heading hierarchy (H1 → H6)
- **Spacing**: Consistent margins and padding
- **Color Contrast**: Accessible color combinations
- **Interactive Elements**: Clear hover and focus states

### 3. Brand Consistency
- **Color Palette**: Neutral grays with accent blues
- **Typography**: System fonts for performance and readability
- **Iconography**: Consistent sizing and alignment
- **Layout**: Uniform spacing and proportions

## 🎨 Color Scheme

### Theme Variables (PaperMod)
```css
:root {
    --primary: #1e1e1e;           /* Main text color */
    --secondary: #666666;         /* Secondary text */
    --tertiary: #999999;          /* Muted text */
    --content: #ffffff;           /* Content background */
    --hljs-bg: #f5f5f5;          /* Code block background */
}

/* Dark mode variants automatically handled by PaperMod */
```

### Custom Color Extensions
```css
/* Technology tags */
code {
    background-color: #007acc !important;  /* Professional blue */
    color: white !important;
    border: 1px solid #005a99;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

/* Interactive elements */
details summary:hover {
    background-color: #f8f9fa;
    border-color: #007acc;
}
```

## 📱 Responsive Design Patterns

### Breakpoint Strategy
```css
/* Mobile: < 768px (default) */
/* Tablet: 768px - 1023px */
@media (min-width: 768px) and (max-width: 1023px) {
    /* Tablet-specific styles */
}

/* Desktop: ≥ 1024px */
@media (min-width: 1024px) {
    /* Desktop enhancements */
}
```

### Layout Adaptations
```css
/* Mobile: Stack elements vertically */
.resume-summary {
    flex-direction: column;
    align-items: flex-start;
}

/* Desktop: Horizontal layout with space-between */
@media (min-width: 768px) {
    .resume-summary {
        flex-direction: row;
        justify-content: space-between;
        align-items: center;
    }
}
```

## 🔧 Component Styling

### 1. Interactive Resume Sections
```css
/* Collapsible containers */
details {
    border: 1px solid #e0e0e0;
    border-radius: 8px;
    margin-bottom: 1rem;
    overflow: hidden;
    background-color: #fafafa;
}

/* Section headers */
summary {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 1rem;
    cursor: pointer;
    background-color: #f8f9fa;
    border-bottom: 1px solid #e0e0e0;
    transition: all 0.2s ease;
}

/* Hover effects */
summary:hover {
    background-color: #f0f0f0;
    border-color: #007acc;
}

/* Content area */
details[open] {
    background-color: white;
}

details div {
    padding: 1rem;
}
```

### 2. Technology Tags
```css
code {
    background-color: #007acc !important;
    color: white !important;
    padding: 4px 8px !important;
    border-radius: 4px !important;
    border: 1px solid #005a99 !important;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1) !important;
    font-weight: 500 !important;
    font-size: 0.85em !important;
    margin: 2px !important;
    display: inline-block !important;
}
```

### 3. Icon Alignment
```css
/* Company and institution icons */
summary img {
    display: inline-block !important;
    vertical-align: middle !important;
    margin-right: 8px !important;
}
```

### 4. Location Information
```css
/* Right-aligned location text */
.location-info {
    font-size: 0.9em;
    color: var(--secondary);
    text-align: right;
}
```

## 📐 Layout Specifications

### Container Widths
```css
/* Resume page: Full-width layout */
.resume-page .main {
    max-width: 95% !important;
}

/* Standard pages: Constrained width */
.main {
    max-width: 750px;
    margin: 0 auto;
}

/* Remove content width restrictions */
.post-content {
    max-width: none !important;
}
```

### Spacing System
```css
/* Consistent spacing scale */
--spacing-xs: 0.25rem;    /* 4px */
--spacing-sm: 0.5rem;     /* 8px */
--spacing-md: 1rem;       /* 16px */
--spacing-lg: 1.5rem;     /* 24px */
--spacing-xl: 2rem;       /* 32px */
--spacing-xxl: 3rem;      /* 48px */
```

## 🎭 Interactive Elements

### Hover States
```css
/* Buttons and links */
a:hover {
    color: #007acc;
    text-decoration: underline;
}

/* Card-like elements */
.card:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    transition: all 0.2s ease;
}
```

### Focus States (Accessibility)
```css
summary:focus {
    outline: 2px solid #007acc;
    outline-offset: 2px;
}

/* Skip link for keyboard navigation */
.skip-link {
    position: absolute;
    top: -40px;
    left: 6px;
    background: #007acc;
    color: white;
    padding: 8px;
    text-decoration: none;
    transition: top 0.3s;
}

.skip-link:focus {
    top: 6px;
}
```

## 📱 Mobile Optimization

### Touch-Friendly Design
```css
/* Minimum touch target size */
summary {
    min-height: 44px;  /* iOS guideline */
    padding: 1rem;
}

/* Prevent text selection on interactive elements */
summary {
    -webkit-user-select: none;
    -moz-user-select: none;
    user-select: none;
}
```

### Text Readability
```css
/* Optimal line height for reading */
body {
    line-height: 1.6;
}

/* Prevent text from being too wide on large screens */
p, li {
    max-width: 65ch;  /* Optimal reading width */
}
```

## 🔍 SEO & Performance

### CSS Performance
```css
/* Use efficient selectors */
.specific-class { }           /* Good */
div.class > ul li a { }      /* Avoid: too complex */

/* Minimize repaint/reflow */
.optimized {
    will-change: transform;   /* For animations */
    transform: translateZ(0); /* Hardware acceleration */
}
```

### Critical CSS Strategy
- **Inline Critical CSS**: Above-the-fold styles
- **Defer Non-Critical**: Load extended styles asynchronously
- **Minimize Bundle**: Remove unused PaperMod styles if possible

## 🛠️ Development Tools

### CSS Validation
```bash
# CSS linting with stylelint
npm install -g stylelint stylelint-config-standard
stylelint "assets/css/**/*.css"
```

### Browser Testing
- **Chrome DevTools**: Performance and accessibility audits
- **Firefox Developer Tools**: CSS Grid and Flexbox debugging
- **Safari Web Inspector**: iOS-specific testing
- **Cross-browser Testing**: BrowserStack or similar

## 🚨 Common Styling Issues

### Issue 1: Specificity Conflicts
```css
/* Problem: Theme styles overriding custom styles */
.theme-class { color: blue; }

/* Solution: Increase specificity or use !important */
.main .custom-class { color: red !important; }
```

### Issue 2: Mobile Layout Breaking
```css
/* Problem: Fixed widths breaking mobile layout */
.problematic {
    width: 800px;  /* Bad: doesn't scale */
}

/* Solution: Use relative units and max-width */
.responsive {
    width: 100%;
    max-width: 800px;
}
```

### Issue 3: Icon Misalignment
```css
/* Problem: Icons not aligned with text */
img {
    vertical-align: top;  /* Bad: inconsistent alignment */
}

/* Solution: Consistent vertical alignment */
img {
    vertical-align: middle;
    display: inline-block;
}
```

## 📊 Maintenance Guidelines

### Regular CSS Audits
- **Unused Styles**: Remove deprecated CSS rules
- **Performance**: Optimize for Core Web Vitals
- **Accessibility**: Test with screen readers
- **Browser Compatibility**: Verify cross-browser support

### CSS Documentation
```css
/**
 * Resume page layout overrides
 * 
 * Provides full-width layout for resume page while maintaining
 * responsive design and accessibility features.
 * 
 * @author Nipun Pruthi
 * @since 2024-01-01
 */
.resume-page .main {
    /* Implementation details */
}
```

## 🎨 Future Enhancements

### Planned Improvements
- **Dark Mode Enhancements**: Custom dark theme colors
- **Animation Library**: Subtle micro-interactions
- **CSS Grid**: Advanced layout capabilities
- **Custom Properties**: More extensive CSS variables

### Design System Evolution
- **Component Library**: Reusable UI components
- **Token System**: Design tokens for consistency
- **Accessibility Features**: Enhanced ARIA support
- **Performance Metrics**: Continuous monitoring and optimization

---

*This styling guide ensures consistent, professional, and accessible design across the entire portfolio website while providing clear guidelines for future development and maintenance.*
