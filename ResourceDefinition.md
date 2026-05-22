---
Template: Paclet
ResourceType: Paclet
Name: Wolfram/AccessibleColors
Context: Wolfram`AccessibleColors`
Paclet: Wolfram/AccessibleColors
Description: WCAG color-contrast and accessibility utilities for the Wolfram Language
ContributedBy: Nikolay Murzin
Keywords: [accessibility, WCAG, contrast, color, a11y]
SourceControlURL: https://github.com/sw1sh/AccessibleColors
Links: ["[WCAG 2.1 contrast guidance](https://www.w3.org/WAI/WCAG21/Understanding/contrast-minimum.html)"]
---

## Details & Options

AccessibleColors builds on the Wolfram Language color primitives and adds the WCAG accessibility layer: contrast ratios, conformance levels, and contrast-driven color choices.

## Usage

The package provides `WCAGContrastRatio`, `WCAGLevel`, `AccessibleTextColor`, and `AdjustForContrast`.

## Basic Examples

Check a color pair, then repair it so it passes WCAG AA:

```wl
{WCAGLevel[Gray, White], WCAGLevel[AdjustForContrast[Gray, White], White]}
```
<!-- => {"Fail", "AA"} -->

Pick legible text for a background:

```wl
AccessibleTextColor[RGBColor[0.1, 0.1, 0.4]]
```
<!-- => GrayLevel[1] (white) -->

## Scope

Grade an arbitrary color pair by its raw ratio and its conformance level:

```wl
{WCAGContrastRatio[Gray, White], WCAGLevel[Gray, White]}
```
<!-- => {3.97665, "Fail"} -->

## Applications

Choose a legible label color across a whole palette at once:

```wl
AssociationMap[AccessibleTextColor, {Orange, Darker[Blue], Yellow, Purple}]
```
<!-- => <|Orange -> GrayLevel[0], Darker[Blue] -> GrayLevel[1], Yellow -> GrayLevel[0], Purple -> GrayLevel[1]|> -->

## Hero Image

A row of swatches, each labeled in the text color `AccessibleTextColor` picks for
it, annotated with the resulting `WCAGContrastRatio`:

```wl
With[{bgs = {RGBColor[0.1, 0.12, 0.38], RGBColor[0.8, 0.22, 0.3], RGBColor[0.96, 0.76, 0.12], RGBColor[0., 0.47, 0.42], GrayLevel[0.5]},
      panel = Function[bg,
         Framed[
           Column[{
              Style["Aa", AccessibleTextColor[bg], 44, Bold, FontFamily -> "Source Sans Pro"],
              Style["WCAG " <> ToString[NumberForm[WCAGContrastRatio[AccessibleTextColor[bg], bg], {3, 1}]], AccessibleTextColor[bg], 12, FontFamily -> "Source Sans Pro"]},
            Alignment -> Center, Spacings -> 0.7],
           Background -> bg, FrameMargins -> 16, FrameStyle -> None, RoundingRadius -> 12, ImageSize -> {128, 128}]]},
 ImageResize[
  Rasterize[
   Framed[
    Column[{
       Style["AccessibleColors", 30, Bold, GrayLevel[0.15], FontFamily -> "Source Sans Pro"],
       Style["WCAG contrast and accessible color choices", 13, GrayLevel[0.45], FontFamily -> "Source Sans Pro"],
       Spacer[12],
       Row[panel /@ bgs[[;; 3]], Spacer[12]],
       Row[panel /@ bgs[[4 ;;]], Spacer[12]]},
      Alignment -> Center, Spacings -> 1.0],
    Background -> GrayLevel[0.98], FrameMargins -> 30, FrameStyle -> GrayLevel[0.9], RoundingRadius -> 16],
   ImageResolution -> 144, Background -> None],
  {Automatic, 500}]]
```
