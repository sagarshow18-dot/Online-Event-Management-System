---
name: EventHub Systematic
colors:
  surface: '#f8f9ff'
  surface-dim: '#cbdbf5'
  surface-bright: '#f8f9ff'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#eff4ff'
  surface-container: '#e5eeff'
  surface-container-high: '#dce9ff'
  surface-container-highest: '#d3e4fe'
  on-surface: '#0b1c30'
  on-surface-variant: '#464652'
  inverse-surface: '#213145'
  inverse-on-surface: '#eaf1ff'
  outline: '#777683'
  outline-variant: '#c7c5d4'
  surface-tint: '#4f54b4'
  primary: '#15157d'
  on-primary: '#ffffff'
  primary-container: '#2e3192'
  on-primary-container: '#9da1ff'
  inverse-primary: '#c0c1ff'
  secondary: '#00658d'
  on-secondary: '#ffffff'
  secondary-container: '#2fbcff'
  on-secondary-container: '#004867'
  tertiary: '#24292c'
  on-tertiary: '#ffffff'
  tertiary-container: '#3a3f42'
  on-tertiary-container: '#a6aaae'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#e1e0ff'
  primary-fixed-dim: '#c0c1ff'
  on-primary-fixed: '#04006d'
  on-primary-fixed-variant: '#373a9b'
  secondary-fixed: '#c6e7ff'
  secondary-fixed-dim: '#83cfff'
  on-secondary-fixed: '#001e2e'
  on-secondary-fixed-variant: '#004c6c'
  tertiary-fixed: '#dfe3e7'
  tertiary-fixed-dim: '#c3c7cb'
  on-tertiary-fixed: '#171c1f'
  on-tertiary-fixed-variant: '#43474b'
  background: '#f8f9ff'
  on-background: '#0b1c30'
  surface-variant: '#d3e4fe'
typography:
  display-lg:
    fontFamily: Inter
    fontSize: 36px
    fontWeight: '700'
    lineHeight: 44px
    letterSpacing: -0.02em
  display-lg-mobile:
    fontFamily: Inter
    fontSize: 28px
    fontWeight: '700'
    lineHeight: 34px
    letterSpacing: -0.02em
  headline-md:
    fontFamily: Inter
    fontSize: 24px
    fontWeight: '600'
    lineHeight: 32px
    letterSpacing: -0.01em
  title-sm:
    fontFamily: Inter
    fontSize: 18px
    fontWeight: '600'
    lineHeight: 24px
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
  code:
    fontFamily: Inter
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
  base: 8px
  xs: 4px
  sm: 8px
  md: 16px
  lg: 24px
  xl: 32px
  gutter: 24px
  margin-mobile: 16px
  container-max: 1280px
---

## Brand & Style

The design system is engineered for high-stakes event logistics, prioritizing reliability, efficiency, and clarity. The aesthetic follows a **Corporate / Modern** style, leaning into a structured, systematic approach that reduces cognitive load for event planners managing complex data.

The UI utilizes a "Data-First" philosophy, where visual flourishes are minimized in favor of high-contrast information density and functional clarity. The emotional response should be one of professional confidence—providing the user with a sense of absolute control over their event operations. Whitespace is used strategically to separate distinct logical blocks rather than just for decoration.

## Colors

The palette is anchored by **Deep Indigo**, which establishes authority and stability. **Vibrant Cyan** serves as the functional accent, used exclusively for primary actions, progress indicators, and active states to guide the user's eye.

- **Primary (#2E3192):** Navigation headers, primary brand moments, and high-level structural elements.
- **Secondary (#00ADEF):** Call-to-action buttons, active toggle states, and interactive icons.
- **Backgrounds:** The interface uses a tiered gray system. The base page background is `#F8FAFC`, while containers and cards use `#FFFFFF` to create subtle depth.
- **Success/Warning/Error:** Standard utility colors should be desaturated to maintain the professional tone (Success: `#10B981`, Warning: `#F59E0B`, Error: `#EF4444`).

## Typography

The design system exclusively utilizes **Inter** for its exceptional legibility in data-heavy environments. The typeface’s tall x-height and neutral character ensure that large tables and complex forms remains readable at smaller sizes.

Scale headlines aggressively for dashboard overviews, but maintain a strict hierarchy for inner content. Use the `label-caps` style for table headers and section overlines to differentiate metadata from user-generated content. All body text should default to `body-md` for general reading and `body-sm` for dense data views.

## Layout & Spacing

This design system is built on a **strict 8px linear grid**. All dimensions, padding, and margins must be multiples of 8 (with the exception of 4px for tight component internal spacing).

- **Grid Model:** A 12-column fluid grid is used for the main content area.
- **Sidebar:** A fixed-width left navigation (240px) is standard for the desktop experience.
- **Margins:** 24px horizontal margins on desktop, scaling down to 16px on mobile devices.
- **Sectioning:** Vertical rhythm should be maintained with 32px (xl) spacing between major card components and 16px (md) spacing between elements within a card.

## Elevation & Depth

Hierarchy is established through **Tonal Layering** supplemented by extremely soft, functional shadows. 

1. **Level 0 (Base):** `#F8FAFC` — Used for the main application canvas.
2. **Level 1 (Card):** `#FFFFFF` — Used for the primary content containers. Requires a 1px border of `#E2E8F0` and a soft shadow (0px 1px 3px rgba(0,0,0,0.1)).
3. **Level 2 (Dropdowns/Modals):** `#FFFFFF` — Used for floating elements. These require a more pronounced shadow (0px 10px 15px -3px rgba(0,0,0,0.1)) to indicate focus.

Avoid heavy blurs or vibrant shadows; the depth should feel mechanical and architectural.

## Shapes

The design system uses a **Soft (0.25rem)** rounding strategy. This provides a modern, approachable feel while maintaining a professional "edge" that aligns with enterprise software. 

- **Components (Buttons, Inputs):** 4px (0.25rem) corner radius.
- **Containers (Cards, Modals):** 8px (0.5rem) corner radius.
- **Interactive States:** Highlighting an active row in a table should use a 4px radius on the background fill.

## Components

### Buttons
- **Primary:** Background `#00ADEF`, text `#FFFFFF`. 4px radius. 
- **Secondary:** Background transparent, border 1px `#E2E8F0`, text `#2E3192`.
- **Ghost:** No background or border, text `#64748B`. Used for secondary actions in lists.

### Data Tables
Tables are the core of the event manager. Use a 48px row height for standard views. Headers use the `label-caps` typography style with a subtle `#F1F5F9` background. Borders should be horizontal-only (`#F1F5F9`) to emphasize the row-scanning direction.

### Form Fields
Inputs use a white background with a 1px border (`#E2E8F0`). On focus, the border shifts to the secondary color (`#00ADEF`) with a 2px soft outer glow. Labels are always positioned above the field in `body-sm` bold.

### Dashboard Cards
Cards display key metrics (e.g., "Total Registrations"). Use a 24px icon in the top right corner, tinted in the secondary color at 10% opacity for the icon background.

### Chips/Tags
Used for "Status" (e.g., "Confirmed", "Waitlist"). Use a light tint of the status color for the background and a high-contrast dark version for the text. Radius: 2px (minimalist) or 100px (pill) depending on density.