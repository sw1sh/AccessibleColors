---
Template: TechNote
Name: DesigningAccessibleColorSchemes
Title: Designing Accessible Color Schemes
Context: Wolfram`AccessibleColors`
Paclet: Wolfram/AccessibleColors
URI: Wolfram/AccessibleColors/tutorial/DesigningAccessibleColorSchemes
Keywords: [accessibility, WCAG, contrast, color, tutorial]
RelatedGuides: [AccessibleColors]
---

Color choices that look fine to one reader can be illegible to another. The Web
Content Accessibility Guidelines (WCAG) make legibility measurable through a
*contrast ratio* between a foreground and a background color. AccessibleColors
brings that measure to the Wolfram Language and builds a few practical tools on
top of it. This tech note walks through a typical workflow: measure contrast,
read off a conformance level, pick legible text, and repair a color that falls
short.

## Measuring Contrast

`WCAGContrastRatio` returns a number from 1 (the two colors are identical) to 21
(black on white). It depends only on relative luminance, so it is symmetric in
its two arguments.

```wl
WCAGContrastRatio[Black, White]
```

A mid grey on white is far weaker:

```wl
WCAGContrastRatio[Gray, White]
```

## Reading Conformance Levels

Raw ratios are easier to act on as WCAG levels. `WCAGLevel` buckets a pair into
`"AAA"`, `"AA"`, or `"Fail"` using the 4.5 and 7 thresholds for normal text:

```wl
AssociationMap[WCAGLevel[#, White] &, {Black, GrayLevel[0.3], Gray, LightGray}]
```

Large text is held to looser thresholds, which the `"LargeText"` option selects:

```wl
{WCAGLevel[Gray, White], WCAGLevel[Gray, White, "LargeText" -> True]}
```

## Choosing Legible Text

Given a background, `AccessibleTextColor` returns whichever of black or white
contrasts with it more strongly, so labels stay readable on any swatch:

```wl
Row[Table[Framed[Style["Ag", AccessibleTextColor[bg], 18], Background -> bg, FrameMargins -> 8], {bg, {LightBlue, Darker[Red], Yellow, RGBColor[0.1, 0.1, 0.4]}}]]
```

## Repairing a Color

When a chosen color is too weak, `AdjustForContrast` nudges it toward black or
white until it just clears the target ratio (AA by default), leaving the hue as
intact as it can:

```wl
before = Gray;
after = AdjustForContrast[before, White];
{after, WCAGContrastRatio[after, White], WCAGLevel[after, White]}
```

Asking for the stricter AAA threshold pushes it further:

```wl
WCAGContrastRatio[AdjustForContrast[Gray, White, "Target" -> 7], White]
```

Together these four functions cover the everyday accessibility loop: measure,
grade, choose, and repair.
