---
Template: Guide
Name: AccessibleColors
Title: AccessibleColors
Context: Wolfram`AccessibleColors`
Paclet: Wolfram/AccessibleColors
URI: Wolfram/AccessibleColors/guide/AccessibleColors
Description: WCAG color-contrast and accessibility utilities for the Wolfram Language.
Keywords: [accessibility, WCAG, contrast, color, a11y]
RelatedGuides: [Color, ColorSchemes, Accessibility]
Links: ["[WCAG 2.1 contrast guidance](https://www.w3.org/WAI/WCAG21/Understanding/contrast-minimum.html)"]
---

## Abstract

AccessibleColors adds the WCAG accessibility layer the Wolfram Language does not ship: contrast ratios, conformance levels, and contrast-driven color choices. It builds on the built-in color primitives (`ColorConvert`, `Blend`) and works with any color the language understands, including named color `Entity` values, the curated `StandardRed`, `StandardBlue`, ... palette, and `LightDarkSwitched` colors for light/dark adaptive interfaces. It is the contrast-checking companion to the broader [Accessibility](paclet:guide/Accessibility) features.

## Functions

- `WCAGContrastRatio` the WCAG 2.x contrast ratio between two colors, from 1 to 21
- `WCAGLevel` the conformance level (`"AAA"` or `"AA"`, else `Missing`) of a color pair
- `AccessibleTextColor` the most legible text color for a given background
- `AdjustForContrast` nudges a foreground color until it meets a target contrast
