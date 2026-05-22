---
Template: Symbol
Name: WCAGLevel
Context: Wolfram`AccessibleColors`
Paclet: Wolfram/AccessibleColors
URI: Wolfram/AccessibleColors/ref/WCAGLevel
Description: WCAGLevel[c1, c2] gives the WCAG conformance level of a color pair.
Keywords: [WCAG, conformance, accessibility, contrast, color]
SeeAlso: [WCAGContrastRatio, AdjustForContrast, AccessibleTextColor]
RelatedGuides: [AccessibleColors]
---

## Usage

`WCAGLevel[c1, c2]` gives the WCAG conformance level of the color pair `c1`, `c2` as `"AAA"`, `"AA"`, or `"Fail"`.

## Details & Options

For normal text the thresholds are 4.5 (AA) and 7 (AAA). With `"LargeText" -> True` they relax to 3 (AA) and 4.5 (AAA).

## Basic Examples

Black on white passes at the highest level:

```wl
WCAGLevel[Black, White]
```

## Scope

Mid grey on white fails for normal text:

```wl
WCAGLevel[Gray, White]
```

## Options

The same pair passes AA once it is treated as large text:

```wl
WCAGLevel[Gray, White, "LargeText" -> True]
```

## Neat Examples

Levels for a few foreground greys on a white background:

```wl
Table[GrayLevel[g] -> WCAGLevel[GrayLevel[g], White], {g, 0, 0.6, 0.2}]
```
