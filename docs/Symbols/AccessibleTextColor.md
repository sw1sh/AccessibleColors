---
Template: Symbol
Name: AccessibleTextColor
Context: Wolfram`AccessibleColors`
Paclet: Wolfram/AccessibleColors
URI: Wolfram/AccessibleColors/ref/AccessibleTextColor
Keywords: [accessibility, text, contrast, color, WCAG, light-dark]
SeeAlso: [WCAGContrastRatio, WCAGLevel, AdjustForContrast, LightDarkSwitched, LightDarkAutoColorRules, StandardRed]
RelatedGuides: [AccessibleColors]
---

## Usage

<code>[AccessibleTextColor]()[*bg*]</code> gives the text color (black or white by default) with the highest WCAG contrast against the background *bg*.

## Details & Options

- `"Candidates"` sets the colors to choose from; the one with the greatest [WCAGContrastRatio]() against *bg* is returned (black and white by default).
- It accepts any color [ColorConvert]() understands, including the curated [StandardRed](), [StandardBlue](), ... palette designed for consistent appearance.
- For light/dark adaptive interfaces, wrap a pair of choices in [LightDarkSwitched]() (or supply [LightDarkAutoColorRules]()) so the text adapts to the active UI mode.
- See the [Accessibility](paclet:guide/Accessibility) guide for the broader Wolfram Language accessibility features.

## Basic Examples

Dark text reads best on a light background:

```wl
AccessibleTextColor[LightBlue]
```
<!-- => GrayLevel[0] (black) -->

## Scope

White text wins on a dark background:

```wl
AccessibleTextColor[RGBColor[0.1, 0.1, 0.4]]
```
<!-- => GrayLevel[1] (white) -->

## Options

Restrict the choice to a custom palette:

```wl
AccessibleTextColor[Orange, "Candidates" -> {Red, Blue, White, Black}]
```
<!-- => GrayLevel[0] (black) -->

## Applications

Pick a legible label color for each swatch in a palette:

```wl
Association[# -> AccessibleTextColor[#] & /@ {LightBlue, Darker[Green], Yellow, Purple}]
```
<!-- => <|LightBlue -> GrayLevel[0], Darker[Green] -> GrayLevel[0], Yellow -> GrayLevel[0], Purple -> GrayLevel[1]|> -->

---

The same works for the built-in `Standard*` palette, so labels on those colors stay legible:

```wl
AssociationMap[AccessibleTextColor, {StandardRed, StandardGreen, StandardBlue, StandardYellow}]
```
<!-- => each maps to GrayLevel[0] (black) -->

## Properties and Relations

The returned color is the candidate with the greatest `WCAGContrastRatio` against
the background, so the resulting pair scores as high as possible:

```wl
With[{bg = Orange}, {AccessibleTextColor[bg], WCAGContrastRatio[AccessibleTextColor[bg], bg], WCAGLevel[AccessibleTextColor[bg], bg]}]
```
<!-- => {GrayLevel[0], 8.31364, "AAA"} -->

## Possible Issues

On a mid-tone background even the best of black or white gives only moderate
contrast, so a single text color may not reach AAA:

```wl
{AccessibleTextColor[GrayLevel[0.5]], WCAGContrastRatio[AccessibleTextColor[GrayLevel[0.5]], GrayLevel[0.5]]}
```
<!-- => {GrayLevel[0], 5.28082} -->

## Neat Examples

Swatches showing the chosen text color on each background:

```wl
Row[Table[Framed[Style["Ag", AccessibleTextColor[bg], 18], Background -> bg, FrameMargins -> 8], {bg, {LightBlue, Darker[Red], Yellow, RGBColor[0.1, 0.1, 0.4]}}]]
```
<!-- => a row of four swatches: "Ag" in black on the light blue and yellow grounds, in white on the dark red and navy grounds -->

---

Make a light/dark adaptive text color with `LightDarkSwitched` - black on the
light-mode (white) background, white on the dark-mode (black) one:

```wl
LightDarkSwitched[AccessibleTextColor[White], AccessibleTextColor[Black]]
```
<!-- => LightDarkSwitched[GrayLevel[0], GrayLevel[1]] -->

---

Track the accessible text color live as the background is dragged:

```wl
DynamicModule[{bg = LightBlue}, Column[{Framed[Dynamic[Style["Sample", AccessibleTextColor[bg], 20]], Background -> Dynamic[bg], FrameMargins -> 16], ColorSlider[Dynamic[bg]]}], SaveDefinitions -> True]
```
<!-- => an interactive panel whose "Sample" text flips between black and white as the color slider moves -->
