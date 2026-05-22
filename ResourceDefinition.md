---
Template: Paclet
ResourceType: Paclet
Name: AccessibleColors
Context: Wolfram`AccessibleColors`
Paclet: Wolfram/AccessibleColors
Description: WCAG color-contrast and accessibility utilities for the Wolfram Language.
ContributedBy: Nikolay Murzin
Keywords: [accessibility, WCAG, contrast, color, a11y]
Links: ["https://www.w3.org/WAI/WCAG21/"]
---

## Details & Options

AccessibleColors builds on the Wolfram Language color primitives and adds the WCAG accessibility layer: contrast ratios, conformance levels, and contrast-driven color choices.

## Usage

The package provides `WCAGContrastRatio`, `WCAGLevel`, `AccessibleTextColor`, and `AdjustForContrast`.

## Basic Examples

Check a color pair, then repair it so it passes WCAG AA:

```wl
{WCAGLevel[Gray, White], WCAGLevel[AdjustForContrast[Gray, White], White]}
```

Pick legible text for a background:

```wl
AccessibleTextColor[RGBColor[0.1, 0.1, 0.4]]
```
