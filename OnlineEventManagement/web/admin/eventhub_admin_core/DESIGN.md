---
name: EventHub Admin Core
colors:
  surface: '#f7f9fb'
  surface-dim: '#d8dadc'
  surface-bright: '#f7f9fb'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f2f4f6'
  surface-container: '#eceef0'
  surface-container-high: '#e6e8ea'
  surface-container-highest: '#e0e3e5'
  on-surface: '#191c1e'
  on-surface-variant: '#45464d'
  inverse-surface: '#2d3133'
  inverse-on-surface: '#eff1f3'
  outline: '#76777d'
  outline-variant: '#c6c6cd'
  surface-tint: '#565e74'
  primary: '#000000'
  on-primary: '#ffffff'
  primary-container: '#131b2e'
  on-primary-container: '#7c839b'
  inverse-primary: '#bec6e0'
  secondary: '#515f74'
  on-secondary: '#ffffff'
  secondary-container: '#d5e3fd'
  on-secondary-container: '#57657b'
  tertiary: '#000000'
  on-tertiary: '#ffffff'
  tertiary-container: '#001e2c'
  on-tertiary-container: '#008ebf'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#dae2fd'
  primary-fixed-dim: '#bec6e0'
  on-primary-fixed: '#131b2e'
  on-primary-fixed-variant: '#3f465c'
  secondary-fixed: '#d5e3fd'
  secondary-fixed-dim: '#b9c7e0'
  on-secondary-fixed: '#0d1c2f'
  on-secondary-fixed-variant: '#3a485c'
  tertiary-fixed: '#c4e7ff'
  tertiary-fixed-dim: '#7bd0ff'
  on-tertiary-fixed: '#001e2c'
  on-tertiary-fixed-variant: '#004c69'
  background: '#f7f9fb'
  on-background: '#191c1e'
  surface-variant: '#e0e3e5'
typography:
  display-lg:
    fontFamily: Hanken Grotesk
    fontSize: 48px
    fontWeight: '700'
    lineHeight: 56px
    letterSpacing: -0.02em
  headline-lg:
    fontFamily: Hanken Grotesk
    fontSize: 32px
    fontWeight: '600'
    lineHeight: 40px
    letterSpacing: -0.01em
  headline-lg-mobile:
    fontFamily: Hanken Grotesk
    fontSize: 24px
    fontWeight: '600'
    lineHeight: 32px
  title-md:
    fontFamily: Hanken Grotesk
    fontSize: 20px
    fontWeight: '600'
    lineHeight: 28px
  body-md:
    fontFamily: Inter
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
  body-sm:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: '400'
    lineHeight: 20px
  label-caps:
    fontFamily: Inter
    fontSize: 12px
    fontWeight: '600'
    lineHeight: 16px
    letterSpacing: 0.05em
  data-mono:
    fontFamily: JetBrains Mono
    fontSize: 13px
    fontWeight: '400'
    lineHeight: 18px
rounded:
  sm: 0.125rem
  DEFAULT: 0.25rem
  md: 0.375rem
  lg: 0.5rem
  xl: 0.75rem
  full: 9999px
spacing:
  base: 4px
  xs: 4px
  sm: 8px
  md: 16px
  lg: 24px
  xl: 40px
  gutter: 24px
  margin-mobile: 16px
  margin-desktop: 32px
---

## Brand & Style

The design system is engineered for high-stakes enterprise management, prioritizing clarity, security, and administrative efficiency. The brand personality is authoritative yet unobtrusive, acting as a reliable tool rather than a distraction. 

The aesthetic follows a **Corporate / Modern** direction with a focus on **Minimalism** to handle data density. It utilizes a structured hierarchy, ample whitespace in navigation, and high-precision UI elements to evoke a sense of professional control. The emotional response should be one of "systematic calm"—ensuring administrators feel organized even when managing complex, high-traffic events.

## Colors

The palette is anchored by "Midnight Slate" (Primary) to establish a foundation of security and depth. 

- **Primary (#0F172A):** Used for sidebar navigation, primary headings, and high-emphasis interaction states.
- **Secondary (#334155):** Reserved for supporting UI elements, icons, and secondary text.
- **Tertiary (#38BDF8):** An accent blue used sparingly for focus states, active indicators, and primary action buttons to provide a modern "tech" lift.
- **Neutrals:** A range of cool grays (from #F8FAFC to #94A3B8) manages background layering and border definitions.
- **Status Colors:** High-saturation tokens for Success, Warning, and Error are used strictly for system feedback and data visualization to ensure immediate cognitive recognition.

## Typography

Typography is optimized for legibility in data-dense environments. 

- **Headlines:** Uses a contemporary Grotesk for a sharp, professional look in dashboard headers.
- **Body:** The standard for all administrative inputs and reading, selected for its exceptional performance at small sizes.
- **Data/Mono:** Used specifically for IDs, timestamps, and numerical data within tables to ensure characters align vertically for quick scanning.
- **Scale:** On mobile devices, headline sizes shift down to maintain a tight information density without excessive scrolling.

## Layout & Spacing

This design system utilizes a **Fixed Grid** model for desktop to ensure data visualizations maintain their intended aspect ratios, and a **Fluid Grid** for mobile views.

- **Desktop (1440px+):** 12-column grid, 24px gutters, with a fixed sidebar width of 280px.
- **Tablet (768px - 1439px):** 8-column grid, 16px gutters. Sidebar collapses into an icon-only rail or hamburger menu.
- **Mobile (<767px):** 4-column fluid grid, 16px margins.
- **Rhythm:** All spacing is derived from a 4px baseline. Components like table cells and input fields use 'sm' (8px) for internal padding to maximize data density.

## Elevation & Depth

To maintain a "secure and grounded" feel, the system avoids dramatic shadows in favor of **Tonal Layers** and **Low-contrast Outlines**.

- **Surface Levels:** The primary background uses the neutral base. "Container" surfaces (cards, table headers) use a pure white background.
- **Borders:** Elements are separated by 1px strokes in a light gray (#E2E8F0). This creates a "blueprint" feel that is precise and architectural.
- **Interactive Depth:** Only high-priority floating elements (modals, dropdowns) utilize a soft, ambient shadow (10% opacity, 12px blur, 4px Y-offset) to indicate they sit above the workspace.

## Shapes

The shape language is **Soft** but disciplined. 

- **Standard Radius:** 4px (0.25rem) for buttons, input fields, and small UI components. This provides a modern look without sacrificing the professional "grid" aesthetic.
- **Container Radius:** 8px (0.5rem) for dashboard cards and modal containers to subtly distinguish them from the background.
- **Search/Filters:** Use 4px radius to maintain a consistent rectangular block feel across all form elements.

## Components

- **Buttons:** Primary buttons use the Primary Slate color with white text. Secondary buttons use a subtle gray border with Tertiary blue text for interaction cues.
- **Input Fields:** Use a 1px border. On focus, the border transitions to Tertiary blue with a 2px outer glow.
- **Data Tables:** These are the core of the system. Use "Zebra striping" with the lightest neutral color for row readability. Row height should be compact (40px-48px).
- **Status Chips:** Small, pill-shaped indicators with low-opacity background tints (10-15%) of the status color and full-opacity text for the label.
- **Cards:** Used for dashboard metrics. They should be border-only (no shadow) to keep the interface flat and fast-loading.
- **Breadcrumbs:** Essential for deep administrative nesting, styled in the Label-Caps typography at 12px.