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

The package centers on `WCAGContrastRatio` and the helpers built on it: `WCAGLevel` reports conformance, `AccessibleTextColor` picks legible text for a background, and `AdjustForContrast` repairs a color pair to meet a target ratio.
