---
name: EventHub Systematic
colors:
  surface: '#faf9fd'
  surface-dim: '#dbd9dd'
  surface-bright: '#faf9fd'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f4f3f7'
  surface-container: '#efedf1'
  surface-container-high: '#e9e7eb'
  surface-container-highest: '#e3e2e6'
  on-surface: '#1a1b1e'
  on-surface-variant: '#414754'
  inverse-surface: '#2f3033'
  inverse-on-surface: '#f1f0f4'
  outline: '#727785'
  outline-variant: '#c1c6d6'
  surface-tint: '#005bc0'
  primary: '#005bbf'
  on-primary: '#ffffff'
  primary-container: '#1a73e8'
  on-primary-container: '#ffffff'
  inverse-primary: '#adc7ff'
  secondary: '#5b5f64'
  on-secondary: '#ffffff'
  secondary-container: '#dde0e6'
  on-secondary-container: '#5f6368'
  tertiary: '#006d2c'
  on-tertiary: '#ffffff'
  tertiary-container: '#008939'
  on-tertiary-container: '#ffffff'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#d8e2ff'
  primary-fixed-dim: '#adc7ff'
  on-primary-fixed: '#001a41'
  on-primary-fixed-variant: '#004493'
  secondary-fixed: '#dfe3e8'
  secondary-fixed-dim: '#c3c7cc'
  on-secondary-fixed: '#181c20'
  on-secondary-fixed-variant: '#43474c'
  tertiary-fixed: '#89fa9b'
  tertiary-fixed-dim: '#6ddd81'
  on-tertiary-fixed: '#002108'
  on-tertiary-fixed-variant: '#005320'
  background: '#faf9fd'
  on-background: '#1a1b1e'
  surface-variant: '#e3e2e6'
typography:
  display-lg:
    fontFamily: Inter
    fontSize: 44px
    fontWeight: '700'
    lineHeight: 52px
    letterSpacing: -0.02em
  headline-lg:
    fontFamily: Inter
    fontSize: 32px
    fontWeight: '600'
    lineHeight: 40px
    letterSpacing: -0.01em
  headline-lg-mobile:
    fontFamily: Inter
    fontSize: 24px
    fontWeight: '600'
    lineHeight: 32px
  headline-md:
    fontFamily: Inter
    fontSize: 24px
    fontWeight: '500'
    lineHeight: 32px
  body-lg:
    fontFamily: Inter
    fontSize: 18px
    fontWeight: '400'
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
  label-md:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: '500'
    lineHeight: 16px
    letterSpacing: 0.01em
  label-sm:
    fontFamily: Inter
    fontSize: 12px
    fontWeight: '500'
    lineHeight: 16px
    letterSpacing: 0.04em
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  unit: 4px
  container-max: 1280px
  gutter: 24px
  margin-mobile: 16px
  margin-desktop: 32px
  stack-sm: 8px
  stack-md: 16px
  stack-lg: 32px
---

## Brand & Style
The design system is rooted in **Corporate Modernism**, prioritizing clarity, utility, and effortless navigation. It is designed for event organizers and attendees who require a high-efficiency tool that feels dependable and invisible.

The aesthetic follows a "Content-First" philosophy:
- **Minimalism:** Use generous whitespace to reduce cognitive load during complex event planning tasks.
- **Precision:** Every element serves a functional purpose; decorative flourishes are avoided in favor of structural clarity.
- **Intentionality:** Color is used sparingly to direct attention, while layout density is managed to keep the interface feeling spacious yet professional.

## Colors
The palette is dominated by a clean white background to maximize readability. **Primary Blue (#1a73e8)** is reserved for primary actions, active states, and critical branding moments. 

**Neutral Tones:** 
- Use `#202124` for high-emphasis text and headers.
- Use `#5f6368` for secondary information and icons.
- Surface levels are defined by `#f8f9fa` to create subtle contrast against the white background without adding visual weight.

## Typography
This design system utilizes **Inter** for its exceptional legibility and modern geometric construction. The type scale relies on weight and size to create a clear hierarchy.

- **Headlines:** Use Semi-Bold (600) for page titles to ensure they anchor the layout.
- **Body Text:** Use Regular (400) for all long-form content. 
- **Interactive Elements:** Labels and button text should use Medium (500) weight to distinguish them from static text.
- **Data Densitiy:** For data-heavy event dashboards, prefer `body-sm` to maintain a compact, professional view.

## Layout & Spacing
The layout adheres to a **12-column fluid grid** for desktop, transitioning to a **4-column grid** for mobile devices. 

- **Grid Logic:** Use a 24px gutter to provide ample "breathing room" between content blocks.
- **Vertical Rhythm:** Spacing is strictly based on a 4px baseline. Components should be separated by increments of 8px or 16px to maintain consistency.
- **Alignment:** Content should be left-aligned in most cases to reflect the systematic, professional nature of the tool.

## Elevation & Depth
Depth is conveyed through **Low-Contrast Outlines** and **Ambient Shadows**. This design system avoids heavy shadows to maintain a flat, modern aesthetic.

- **Level 0 (Base):** The main background (`#ffffff`).
- **Level 1 (Subtle):** Elements like search bars or inactive cards use a 1px border (`#dadce0`).
- **Level 2 (Active/Raised):** Floating elements, such as dropdowns or hovered event cards, utilize a dual-layered shadow:
  - `0 1px 2px rgba(60,64,67, 0.3)`
  - `0 1px 3px 1px rgba(60,64,67, 0.15)`
- **Interaction:** Upon hover, cards should transition from Level 1 (border only) to Level 2 (shadow) to provide tactile feedback.

## Shapes
The shape language is "Soft-Modern," using an **8px (0.5rem)** standard radius for most UI components.

- **Standard (8px):** Buttons, Input fields, and Cards.
- **Large (16px):** Modal containers and Role-selection cards.
- **Full (Pill):** Used exclusively for Status Chips (e.g., "Confirmed", "Draft") to differentiate them from actionable buttons.

## Components
### Header & Navigation
- **Header:** 64px height, white background with a subtle bottom border (`#dadce0`). 
- **CTA:** The "Create Event" button should be the only Primary-filled button in the header to ensure visual prominence.

### Event Cards
- **Structure:** Aspect ratio of 16:9 for images. 
- **Typography:** Event title in `headline-md`, date and location in `body-sm` with `secondary-text` color.
- **Interaction:** Subtle lift effect (shadow) on hover.

### Form Fields & Inputs
- **Inputs:** 48px height, 8px radius, 1px border (`#dadce0`).
- **Labels:** Always visible above the input field in `label-md` weight.
- **Search Bar:** Incorporate a 20px leading icon (Search) and a 1px border. Background should be white or `#f8f9fa` depending on the container.

### Role-Selection Cards
- **Design:** Larger 16px radius cards. Include a centered 48px icon, `headline-md` title, and a brief description.
- **State:** Use a 2px Primary Blue border to indicate selection.

### Buttons
- **Primary:** Filled Primary Blue with white text.
- **Secondary:** Outlined with Primary Blue border and text.
- **Ghost:** No border, Primary Blue or Secondary Text color; used for less critical actions like "Cancel."