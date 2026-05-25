---
Template: Symbol
Name: WCAGContrastRatio
Context: Wolfram`AccessibleColors`
Paclet: Wolfram/AccessibleColors
URI: Wolfram/AccessibleColors/ref/WCAGContrastRatio
Keywords: [contrast, WCAG, accessibility, luminance, color]
SeeAlso: [WCAGLevel, AccessibleTextColor, AdjustForContrast]
RelatedGuides: [AccessibleColors]
---

## Usage

<code>[`WCAGContrastRatio`]()[$c_1$, $c_2$]</code> gives the WCAG 2.x contrast ratio between colors $c_1$ and $c_2$, a number from 1 (no contrast) to 21 (black on white).

## Details & Options

- The ratio uses WCAG relative luminance: each sRGB channel is linearized, weighted by 0.2126, 0.7152, and 0.0722, and the ratio is (L1 + 0.05) / (L2 + 0.05).
- It is symmetric in its arguments, so the order of the two colors never matters.
- Any color expression [`ColorConvert`]() understands is accepted.

## Basic Examples

Black on white is the maximum possible contrast:

```wl
WCAGContrastRatio[Black, White]
```
<!-- => 21. -->

## Scope

Any color expression that `ColorConvert` understands is accepted:

```wl
WCAGContrastRatio[RGBColor[0.2, 0.2, 0.7], White]
```
<!-- => 9.28716 -->

## Applications

Rank candidate foreground colors by their contrast against a white background:

```wl
AssociationMap[WCAGContrastRatio[#, White] &, {Black, Blue, Red, Gray}]
```
<!-- => <|Black -> 21., Blue -> 8.59247, Red -> 3.99848, Gray -> 3.97665|> -->

## Properties and Relations

A color compared with itself always has the minimum ratio of 1:

```wl
WCAGContrastRatio[Blue, Blue]
```
<!-- => 1. -->

---

The ratio is symmetric, so the order of the two colors never matters:

```wl
WCAGContrastRatio[White, Black] == WCAGContrastRatio[Black, White]
```
<!-- => True -->

## Possible Issues

Because the ratio depends only on luminance, two vivid but equally light hues can
contrast poorly despite looking very different:

```wl
WCAGContrastRatio[Hue[0.1], Hue[0.4]]
```
<!-- => 1.57984 (close to the no-contrast floor of 1) -->

## Neat Examples

Contrast of a saturated hue against white, swept around the color wheel:

```wl
Table[Round[WCAGContrastRatio[Hue[h], White], 0.01], {h, 0, 0.8, 0.2}]
```
<!-- => {4., 1.18, 1.36, 4.83, 4.19} -->
