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

`WCAGLevel[c$1, c$2]` gives the WCAG conformance level of the color pair `c$1`, `c$2` as `"AAA"`, `"AA"`, or `"Fail"`.

## Details & Options

For normal text the thresholds are 4.5 (AA) and 7 (AAA). With `"LargeText" -> True` they relax to 3 (AA) and 4.5 (AAA).

## Basic Examples

Black on white passes at the highest level:

```wl
WCAGLevel[Black, White]
```
<!-- => "AAA" -->

## Scope

Mid grey on white fails for normal text:

```wl
WCAGLevel[Gray, White]
```
<!-- => "Fail" -->

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
<!-- => <|Black -> "AAA", GrayLevel[0.3] -> "AAA", Gray -> "Fail", LightGray -> "Fail"|> -->

## Properties and Relations

The level is just the `WCAGContrastRatio` bucketed at the WCAG thresholds; a ratio
of 5.74 lands in the AA band (4.5 to 7):

```wl
{WCAGContrastRatio[GrayLevel[0.4], White], WCAGLevel[GrayLevel[0.4], White]}
```
<!-- => {5.74184, "AA"} -->

## Possible Issues

Light grey text on white looks legible but fails even AA:

```wl
WCAGLevel[LightGray, White]
```
<!-- => "Fail" -->

## Neat Examples

Levels for a few foreground greys on a white background:

```wl
Table[GrayLevel[g] -> WCAGLevel[GrayLevel[g], White], {g, 0, 0.6, 0.2}]
```
<!-- => {GrayLevel[0.] -> "AAA", GrayLevel[0.2] -> "AAA", GrayLevel[0.4] -> "AA", GrayLevel[0.6] -> "Fail"} -->
