---
Template: Symbol
Name: AdjustForContrast
Context: Wolfram`AccessibleColors`
Paclet: Wolfram/AccessibleColors
URI: Wolfram/AccessibleColors/ref/AdjustForContrast
Description: AdjustForContrast[fg, bg] nudges a foreground color until it meets a target contrast against a background.
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

## Scope

The resulting pair meets the requested ratio:

```wl
WCAGContrastRatio[AdjustForContrast[Gray, White], White]
```

## Options

Ask for the stricter AAA threshold:

```wl
WCAGContrastRatio[AdjustForContrast[RGBColor[0.4, 0.5, 0.9], White, "Target" -> 7], White]
```

## Neat Examples

Before and after, as swatches on white:

```wl
With[{fg = RGBColor[0.6, 0.6, 0.2]}, Row[{Framed["before", Background -> White, BaseStyle -> {fg}, FrameMargins -> 8], Framed["after", Background -> White, BaseStyle -> {AdjustForContrast[fg, White]}, FrameMargins -> 8]}]]
```
