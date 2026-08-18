---
name: Nexus Event System
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
  on-surface-variant: '#434655'
  inverse-surface: '#2d3133'
  inverse-on-surface: '#eff1f3'
  outline: '#737686'
  outline-variant: '#c3c6d7'
  surface-tint: '#0053db'
  primary: '#004ac6'
  on-primary: '#ffffff'
  primary-container: '#2563eb'
  on-primary-container: '#eeefff'
  inverse-primary: '#b4c5ff'
  secondary: '#505f76'
  on-secondary: '#ffffff'
  secondary-container: '#d0e1fb'
  on-secondary-container: '#54647a'
  tertiary: '#4d556b'
  on-tertiary: '#ffffff'
  tertiary-container: '#656d84'
  on-tertiary-container: '#eef0ff'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#dbe1ff'
  primary-fixed-dim: '#b4c5ff'
  on-primary-fixed: '#00174b'
  on-primary-fixed-variant: '#003ea8'
  secondary-fixed: '#d3e4fe'
  secondary-fixed-dim: '#b7c8e1'
  on-secondary-fixed: '#0b1c30'
  on-secondary-fixed-variant: '#38485d'
  tertiary-fixed: '#dae2fd'
  tertiary-fixed-dim: '#bec6e0'
  on-tertiary-fixed: '#131b2e'
  on-tertiary-fixed-variant: '#3f465c'
  background: '#f7f9fb'
  on-background: '#191c1e'
  surface-variant: '#e0e3e5'
typography:
  display-lg:
    fontFamily: Inter
    fontSize: 48px
    fontWeight: '700'
    lineHeight: 56px
    letterSpacing: -0.02em
  headline-lg:
    fontFamily: Inter
    fontSize: 32px
    fontWeight: '700'
    lineHeight: 40px
    letterSpacing: -0.01em
  headline-lg-mobile:
    fontFamily: Inter
    fontSize: 24px
    fontWeight: '700'
    lineHeight: 32px
  headline-md:
    fontFamily: Inter
    fontSize: 24px
    fontWeight: '600'
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
    fontWeight: '600'
    lineHeight: 20px
    letterSpacing: 0.01em
  label-sm:
    fontFamily: Inter
    fontSize: 12px
    fontWeight: '500'
    lineHeight: 16px
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  base: 4px
  container-max: 1280px
  gutter: 24px
  margin-mobile: 16px
  margin-desktop: 32px
  stack-sm: 8px
  stack-md: 16px
  stack-lg: 24px
---

## Brand & Style

The design system is anchored in a **Corporate / Modern** aesthetic, prioritizing clarity, efficiency, and reliability for professional event management. The visual language is intentionally restrained to allow event imagery and data to take center stage. 

The style utilizes a "Surface-First" approach: clean white containers set against soft slate backgrounds to create a clear sense of order. Motion should be functional and subtle, using standard easing for transitions between states to maintain a sense of professional stability. The target audience—event organizers and professional attendees—should perceive the interface as an expert tool that reduces cognitive load through systematic alignment and generous white space.

## Colors

The palette is built on a foundation of "True Blue" and "Slate" tones to evoke trust and precision.

- **Primary:** Use `#2563eb` for all primary actions, active states, and high-level branding.
- **Neutrals:** The background scale transitions from `#f8fafc` (Page Background) to `#ffffff` (Component Surfaces). Text uses a range of Slates from `#0f172a` for headings to `#64748b` for secondary body text.
- **Semantic:** 
    - **Success:** Soft green backgrounds with high-contrast forest green text for "Confirmed" states.
    - **Warning/Pending:** Amber tones for "Action Required" or "Pending" statuses.
    - **Error:** Clean red for "Cancelled" states or critical validation errors.

## Typography

The typography system uses **Inter** exclusively to ensure a systematic, utilitarian feel. 

- **Hierarchy:** Use `display-lg` and `headline-lg` for dashboard overviews and event titles. `body-md` is the standard for all readable content.
- **Labels:** Use `label-md` for buttons and navigation items to ensure high legibility at smaller sizes through increased font weight.
- **Mobile Scaling:** On devices smaller than 768px, all headlines larger than 32px must drop to their defined mobile equivalents to prevent awkward line breaks in event titles.

## Layout & Spacing

This design system employs a **12-column fluid grid** for desktop and tablet, and a **single-column fluid layout** for mobile.

- **Grid Logic:** Use a 24px gutter between columns. Content should be centered within a 1280px max-width container on desktop.
- **Spacing Rhythm:** All spacing must be a multiple of the 4px base unit. 
    - Use `stack-md` (16px) for internal component padding (e.g., inside a card).
    - Use `stack-lg` (24px) for vertical spacing between distinct sections or cards in a list.
- **Responsive Behavior:** On mobile, margins reduce to 16px. Cards should stack vertically, and the top navigation bar should collapse into a simplified mobile header with a hamburger menu for profile and secondary links.

## Elevation & Depth

The design system uses **Tonal Layers** combined with **Ambient Shadows** to define hierarchy.

- **Level 0 (Base):** Background color `#f8fafc`. No shadow.
- **Level 1 (Cards/Inputs):** White surface `#ffffff`. 1px border in `#e2e8f0` (Slate-200) and a very soft shadow: `0 1px 3px 0 rgba(0, 0, 0, 0.05)`.
- **Level 2 (Dropdowns/Modals):** White surface. Border in `#e2e8f0` and a medium diffused shadow: `0 10px 15px -3px rgba(0, 0, 0, 0.1)`.

Avoid using heavy shadows or dark borders; depth should feel "airy" and light.

## Shapes

The shape language is consistently **Rounded (8px)** to strike a balance between professional geometry and modern approachability.

- **Components:** Buttons, input fields, and cards all share the `rounded-md` (8px) corner radius.
- **Badges:** Status badges use the `rounded-full` (pill) property to distinguish them from interactive buttons.
- **Selection:** Active states for navigation or list items use a 4px "indicator bar" or a rounded background highlight.

## Components

### Buttons
- **Primary:** Filled `#2563eb` with white text. 8px radius.
- **Secondary:** Outlined with `#e2e8f0` border and `#475569` text.
- **Sizing:** Standard height 40px; Large (for CTAs) 48px.

### Input Fields
- **Default:** 1px `#e2e8f0` border, white background.
- **Focus:** 2px border in `#2563eb` with a soft blue outer glow.
- **Labeling:** Labels sit 8px above the input field in `label-md` style using Slate-700.

### Cards
- **Structure:** White background, 1px border, Level 1 shadow.
- **Hover:** On clickable event cards, transition the shadow to Level 2 and slightly darken the border.

### Navigation
- **Top Bar:** Fixed at 64px height. White background with a bottom border in `#f1f5f9`. 
- **User Profile:** Circular avatar (32px) on the far right, triggering a Level 2 elevation dropdown menu.

### Status Badges
- **Pill Shape:** Height 24px, 12px horizontal padding.
- **Confirmed:** Light green background (10% opacity of success color), dark green text.
- **Pending:** Light amber background, dark amber text.
- **Cancelled:** Light red background, dark red text.