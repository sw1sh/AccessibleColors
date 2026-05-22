---
Template: Symbol
Name: WCAGLevel
Context: Wolfram`AccessibleColors`
Paclet: Wolfram/AccessibleColors
URI: Wolfram/AccessibleColors/ref/WCAGLevel
Keywords: [WCAG, conformance, accessibility, contrast, color]
SeeAlso: [WCAGContrastRatio, AdjustForContrast, AccessibleTextColor]
RelatedGuides: [AccessibleColors]
---

## Usage

`WCAGLevel[c$1, c$2]` gives the WCAG conformance level of the color pair `c$1`, `c$2` as `"AAA"` or `"AA"`, or `Missing["BelowThreshold", ...]` if the pair does not reach AA.

## Details & Options

For normal text the thresholds are 4.5 (AA) and 7 (AAA). With `"LargeText" -> True` they relax to 3 (AA) and 4.5 (AAA). When the contrast ratio is below the AA threshold the result is a `Missing["BelowThreshold", <|"Ratio" -> r, "Minimum" -> aa|>]` whose reason carries the actual ratio and the threshold it missed.

## Basic Examples

Black on white passes at the highest level:

```wl
WCAGLevel[Black, White]
```
<!-- => "AAA" -->

## Scope

Mid grey on white falls short for normal text, so the level is `Missing` with the
ratio and threshold it missed:

```wl
WCAGLevel[Gray, White]
```
<!-- => Missing["BelowThreshold", <|"Ratio" -> 3.97665, "Minimum" -> 4.5|>] -->

## Options

`WCAGLevel` takes one option that selects the conformance thresholds:

| Option | Default | AA / AAA thresholds |
|---|---|---|
| `"LargeText"` | `False` | 4.5 / 7 for normal text, 3 / 4.5 for large text |

The same pair passes AA once it is treated as large text:

```wl
WCAGLevel[Gray, White, "LargeText" -> True]
```
<!-- => "AA" -->

## Applications

Grade a set of foreground greys against a white background at a glance:

```wl
AssociationMap[WCAGLevel[#, White] &, {Black, GrayLevel[0.3], Gray, LightGray}]
```
<!-- => <|Black -> "AAA", GrayLevel[0.3] -> "AAA", Gray -> Missing["BelowThreshold", <|"Ratio" -> 3.97665, "Minimum" -> 4.5|>], LightGray -> Missing["BelowThreshold", <|"Ratio" -> 1.41496, "Minimum" -> 4.5|>]|> -->

## Properties and Relations

The level is just the `WCAGContrastRatio` bucketed at the WCAG thresholds; a ratio
of 5.74 lands in the AA band (4.5 to 7):

```wl
{WCAGContrastRatio[GrayLevel[0.4], White], WCAGLevel[GrayLevel[0.4], White]}
```
<!-- => {5.74184, "AA"} -->

## Possible Issues

Light grey text on white looks legible but does not reach AA, so `WCAGLevel`
returns `Missing` rather than a level:

```wl
WCAGLevel[LightGray, White]
```
<!-- => Missing["BelowThreshold", <|"Ratio" -> 1.41496, "Minimum" -> 4.5|>] -->

## Neat Examples

Levels for a few foreground greys on a white background:

```wl
Table[GrayLevel[g] -> WCAGLevel[GrayLevel[g], White], {g, 0, 0.6, 0.2}]
```
<!-- => {GrayLevel[0.] -> "AAA", GrayLevel[0.2] -> "AAA", GrayLevel[0.4] -> "AA", GrayLevel[0.6] -> Missing["BelowThreshold", <|"Ratio" -> 2.84903, "Minimum" -> 4.5|>]} -->
