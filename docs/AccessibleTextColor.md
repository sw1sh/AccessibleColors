---
Template: Symbol
Name: AccessibleTextColor
Context: Wolfram`AccessibleColors`
Paclet: Wolfram/AccessibleColors
URI: Wolfram/AccessibleColors/ref/AccessibleTextColor
Description: AccessibleTextColor[bg] gives the most legible text color for a background.
Keywords: [accessibility, text, contrast, color, WCAG]
SeeAlso: [WCAGContrastRatio, WCAGLevel, AdjustForContrast]
RelatedGuides: [AccessibleColors]
---

## Usage

gives the text color (black or white by default) with the highest WCAG contrast against the background `bg`.

## Details & Options

`"Candidates"` sets the colors to choose from; the one with the greatest `WCAGContrastRatio` against `bg` is returned.

## Basic Examples

Dark text reads best on a light background:

```wl
AccessibleTextColor[LightBlue]
```

## Scope

White text wins on a dark background:

```wl
AccessibleTextColor[RGBColor[0.1, 0.1, 0.4]]
```

## Options

Restrict the choice to a custom palette:

```wl
AccessibleTextColor[Orange, "Candidates" -> {Red, Blue, White, Black}]
```

## Neat Examples

Swatches showing the chosen text color on each background:

```wl
Row[Table[Framed[Style["Ag", AccessibleTextColor[bg], 18], Background -> bg, FrameMargins -> 8], {bg, {LightBlue, Darker[Red], Yellow, RGBColor[0.1, 0.1, 0.4]}}]]
```
