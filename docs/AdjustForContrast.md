---
Template: Symbol
Name: AdjustForContrast
Context: Wolfram`AccessibleColors`
Paclet: Wolfram/AccessibleColors
URI: Wolfram/AccessibleColors/ref/AdjustForContrast
Keywords: [accessibility, contrast, color, WCAG, adjust]
SeeAlso: [WCAGContrastRatio, WCAGLevel, AccessibleTextColor]
RelatedGuides: [AccessibleColors]
---

## Usage

`AdjustForContrast[fg, bg]` darkens or lightens the foreground color `fg` until it reaches the target WCAG contrast ratio against the background `bg`, returning the adjusted color.

## Details & Options

`"Target"` sets the required ratio (default 4.5, the WCAG AA threshold for normal text). The color is blended toward black or white, whichever increases contrast, by a binary search; if even the extreme cannot reach the target it is returned.

## Basic Examples

Mid grey on white does not pass AA, so it is darkened until it does:

```wl
AdjustForContrast[Gray, White]
```
<!-- => GrayLevel[0.465319] -->

## Scope

The resulting pair meets the requested ratio:

```wl
WCAGContrastRatio[AdjustForContrast[Gray, White], White]
```
<!-- => 4.5 -->

## Options

Ask for the stricter AAA threshold:

```wl
WCAGContrastRatio[AdjustForContrast[RGBColor[0.4, 0.5, 0.9], White, "Target" -> 7], White]
```
<!-- => 7. -->

## Applications

Repair a whole palette so every color clears AA against white:

```wl
WCAGLevel[#, White] & /@ (AdjustForContrast[#, White] & /@ {RGBColor[0.6, 0.6, 0.2], RGBColor[0.4, 0.7, 0.4]})
```
<!-- => {"AA", "AA"} -->

## Properties and Relations

The adjusted color is exactly strong enough to pass the requested level, which
`WCAGLevel` confirms:

```wl
With[{fg = AdjustForContrast[GrayLevel[0.5], White]}, {fg, WCAGLevel[fg, White]}]
```
<!-- => {GrayLevel[0.465319], "AA"} -->

## Possible Issues

When the target cannot be met even at the extreme (here black on grey tops out
near 5.3), the most extreme color is returned rather than failing:

```wl
{AdjustForContrast[Gray, Gray, "Target" -> 7], WCAGContrastRatio[AdjustForContrast[Gray, Gray, "Target" -> 7], Gray]}
```
<!-- => {GrayLevel[0], 5.28082} -->

## Neat Examples

Before and after, as swatches on white:

```wl
With[{fg = RGBColor[0.6, 0.6, 0.2]}, Row[{Framed["before", Background -> White, BaseStyle -> {fg}, FrameMargins -> 8], Framed["after", Background -> White, BaseStyle -> {AdjustForContrast[fg, White]}, FrameMargins -> 8]}]]
```
<!-- => two framed labels on white: "before" in the faint original olive, "after" in a darkened olive that meets AA -->
