---
Template: Symbol
Name: WCAGContrastRatio
Context: Wolfram`AccessibleColors`
Paclet: Wolfram/AccessibleColors
URI: Wolfram/AccessibleColors/ref/WCAGContrastRatio
Description: WCAGContrastRatio[c1, c2] gives the WCAG 2.x contrast ratio between two colors.
Keywords: [contrast, WCAG, accessibility, luminance, color]
SeeAlso: [WCAGLevel, AccessibleTextColor, AdjustForContrast]
RelatedGuides: [AccessibleColors]
---

## Usage

gives the WCAG 2.x contrast ratio between colors `c1` and `c2`, a number from 1 (no contrast) to 21 (black on white).

## Details & Options

The ratio uses WCAG relative luminance: each sRGB channel is linearized, weighted by 0.2126, 0.7152, 0.0722, and the ratio is (L1 + 0.05) / (L2 + 0.05). It is symmetric in its arguments.

## Basic Examples

Black on white is the maximum possible contrast:

```wl
WCAGContrastRatio[Black, White]
```

## Scope

Any color expression that `ColorConvert` understands is accepted:

```wl
WCAGContrastRatio[RGBColor[0.2, 0.2, 0.7], White]
```

## Possible Issues

The ratio is symmetric, so argument order does not change the result:

```wl
{WCAGContrastRatio[Gray, White], WCAGContrastRatio[White, Gray]}
```

## Neat Examples

Contrast of a saturated hue against white, swept around the color wheel:

```wl
Table[Round[WCAGContrastRatio[Hue[h], White], 0.01], {h, 0, 0.8, 0.2}]
```
