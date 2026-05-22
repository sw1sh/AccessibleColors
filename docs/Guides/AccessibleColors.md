---
Template: Guide
Name: AccessibleColors
Title: AccessibleColors
Context: Wolfram`AccessibleColors`
Paclet: Wolfram/AccessibleColors
URI: Wolfram/AccessibleColors/guide/AccessibleColors
Description: WCAG color-contrast and accessibility utilities for the Wolfram Language.
Keywords: [accessibility, WCAG, contrast, color, a11y]
RelatedGuides: [Color, ColorSchemes]
Links: ["https://www.w3.org/WAI/WCAG21/Understanding/contrast-minimum.html"]
---

## Abstract

AccessibleColors adds the WCAG accessibility layer the Wolfram Language does not ship: contrast ratios, conformance levels, and contrast-driven color choices, all built on the built-in color primitives.

## Functions

- `WCAGContrastRatio` the WCAG 2.x contrast ratio between two colors, from 1 to 21
- `WCAGLevel` the conformance level (`"AAA"`, `"AA"` or `"Fail"`) of a color pair
- `AccessibleTextColor` the most legible text color for a given background
- `AdjustForContrast` nudges a foreground color until it meets a target contrast
