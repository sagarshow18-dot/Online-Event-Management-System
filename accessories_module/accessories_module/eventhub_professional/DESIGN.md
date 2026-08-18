---
name: EventHub Professional
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
  on-surface-variant: '#45464d'
  inverse-surface: '#213145'
  inverse-on-surface: '#eaf1ff'
  outline: '#76777d'
  outline-variant: '#c6c6cd'
  surface-tint: '#565e74'
  primary: '#000000'
  on-primary: '#ffffff'
  primary-container: '#131b2e'
  on-primary-container: '#7c839b'
  inverse-primary: '#bec6e0'
  secondary: '#712ae2'
  on-secondary: '#ffffff'
  secondary-container: '#8a4cfc'
  on-secondary-container: '#fffbff'
  tertiary: '#000000'
  on-tertiary: '#ffffff'
  tertiary-container: '#002113'
  on-tertiary-container: '#009668'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#dae2fd'
  primary-fixed-dim: '#bec6e0'
  on-primary-fixed: '#131b2e'
  on-primary-fixed-variant: '#3f465c'
  secondary-fixed: '#eaddff'
  secondary-fixed-dim: '#d2bbff'
  on-secondary-fixed: '#25005a'
  on-secondary-fixed-variant: '#5a00c6'
  tertiary-fixed: '#6ffbbe'
  tertiary-fixed-dim: '#4edea3'
  on-tertiary-fixed: '#002113'
  on-tertiary-fixed-variant: '#005236'
  background: '#f8f9ff'
  on-background: '#0b1c30'
  surface-variant: '#d3e4fe'
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
    fontWeight: '500'
    lineHeight: 20px
    letterSpacing: 0.05em
  code-sm:
    fontFamily: JetBrains Mono
    fontSize: 13px
    fontWeight: '400'
    lineHeight: 18px
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  unit: 4px
  gutter: 24px
  margin-page: 40px
  margin-mobile: 16px
  container-max: 1440px
  stack-xs: 4px
  stack-sm: 8px
  stack-md: 16px
  stack-lg: 24px
---

## Brand & Style
The design system is anchored in the **Corporate / Modern** aesthetic, prioritizing clarity, organization, and a sense of institutional reliability. It is designed for professional event coordinators who manage complex logistics and high-volume inventories. 

The emotional response should be one of "controlled efficiency"—users should feel that the interface is an expert tool that reduces cognitive load. This is achieved through a structured grid, consistent card-based containers, and a high-functioning utilitarian interface that avoids unnecessary decorative flourishes.

## Colors
The palette utilizes a "Deep Slate" primary color to establish authority and professional grounding. 
- **Primary (#0F172A):** Used for navigation, headings, and high-level UI framing.
- **Secondary (#7C3AED):** A royal purple used for primary actions, selection states, and brand highlights.
- **Tertiary (#10B981):** An emerald green reserved for "In Stock" statuses, success confirmations, and financial growth indicators.
- **Surface Colors:** Use light gray backgrounds (#F8FAFC) to differentiate the canvas from white (#FFFFFF) component cards.

## Typography
This design system leverages **Inter** for its exceptional legibility in data-dense environments. 
- **Scale:** A tight typographic scale ensures that even complex inventory lists remain readable.
- **Weights:** Use SemiBold (600) for section headers and Medium (500) for interactive labels.
- **Mono Integration:** For SKU numbers and inventory IDs, use a monospaced font at a smaller scale to distinguish identifiers from descriptive text.

## Layout & Spacing
The layout follows a **Fluid Grid** model with strict adherence to an 8px base unit. 
- **Desktop:** 12-column grid with 24px gutters. Content is primarily housed in white cards that span 3, 4, 6, or 12 columns depending on information density.
- **Tablet:** 8-column grid with 20px gutters. Sidebars collapse into a drawer.
- **Mobile:** 4-column grid with 16px margins. Cards stack vertically.
- **Inventory Grids:** Use a repeatable 1:1 or 4:3 aspect ratio for equipment thumbnails within the grid system.

## Elevation & Depth
Hierarchy is conveyed through **Tonal Layers** and **Ambient Shadows**. 
- **Level 0 (Background):** #F8FAFC (Flat).
- **Level 1 (Cards/Tables):** White surface with a 1px border (#E2E8F0) and a subtle, large-radius shadow (Y: 4px, Blur: 6px, Opacity: 0.05, Color: #0F172A).
- **Level 2 (Hover/Active):** Slightly deeper shadow (Y: 10px, Blur: 15px, Opacity: 0.08) to indicate interactivity.
- **Level 3 (Modals/Popovers):** High-contrast depth with a 20% backdrop dimming to focus user attention on forms.

## Shapes
The shape language is "Rounded" to soften the professional aesthetic and make the tool feel modern and accessible. 
- **Base Components:** Buttons and input fields use a 0.5rem (8px) radius.
- **Containers:** Large inventory cards and data tables use a 1rem (16px) radius to clearly define boundaries.
- **Status Indicators:** Use pill-shaped (full radius) tags for "Low Stock" or "Reserved" labels.

## Components
- **Data Tables:** High-density rows with 1px bottom borders. The header row should use a subtle gray fill (#F1F5F9) and uppercase labels. Include "Sticky" first columns for SKU IDs.
- **Inventory Cards:** Images should be top-aligned with a subtle inner border. The bottom section contains the item name, available quantity (using Tertiary green), and a secondary action button.
- **Buttons:** 
  - *Primary:* Solid Secondary Purple with white text.
  - *Secondary:* White background with 1px Primary Slate border.
- **Input Fields:** 1px border (#CBD5E1) that transitions to Secondary Purple on focus. Labels are positioned consistently above the input.
- **Status Chips:** Use a background tint of the status color (e.g., 10% opacity Emerald Green) with high-contrast text for high scannability in lists.
- **Quantity Pickers:** A specific component for inventory management involving "plus/minus" controls flanking a central numeric input, designed for rapid adjustments.