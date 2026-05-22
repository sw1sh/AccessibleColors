(* ::Package:: *)

(* AccessibleColors - WCAG color-contrast utilities for the Wolfram Language.
   Builds on the built-in color primitives (ColorConvert, Blend) to supply the
   accessibility layer the Wolfram Language does not ship: WCAG 2.x contrast
   ratios, conformance levels, and contrast-driven color choices. *)

BeginPackage["Wolfram`AccessibleColors`"]

WCAGContrastRatio::usage = "WCAGContrastRatio[c1, c2] gives the WCAG 2.x contrast ratio between two colors, from 1 to 21."
WCAGLevel::usage = "WCAGLevel[c1, c2] gives the WCAG conformance level of a color pair as \"AAA\" or \"AA\", or Missing[\"BelowThreshold\", ...] if the pair does not reach AA."
AccessibleTextColor::usage = "AccessibleTextColor[bg] gives the most legible text color for a background."
AdjustForContrast::usage = "AdjustForContrast[fg, bg] nudges a foreground color until it meets a target contrast against a background."

Begin["`Private`"]

(* WCAG relative luminance: linearize each sRGB channel, then weight. *)
relativeLuminance[color_?ColorQ] := Block[{rgb, linear},
    rgb = List @@ ColorConvert[color, "RGB"][[1 ;; 3]];
    linear = Map[If[# <= 0.03928, #/12.92, ((# + 0.055)/1.055)^2.4] &, rgb];
    {0.2126, 0.7152, 0.0722} . linear
]

WCAGContrastRatio[c1_?ColorQ, c2_?ColorQ] := Block[{l1 = relativeLuminance[c1], l2 = relativeLuminance[c2]},
    (Max[l1, l2] + 0.05) / (Min[l1, l2] + 0.05)
]

Options[WCAGLevel] = {"LargeText" -> False}

WCAGLevel[c1_?ColorQ, c2_?ColorQ, opts : OptionsPattern[]] := Block[{
    ratio = WCAGContrastRatio[c1, c2],
    aa, aaa
},
    {aa, aaa} = If[TrueQ[OptionValue["LargeText"]], {3., 4.5}, {4.5, 7.}];
    Which[
        ratio >= aaa, "AAA",
        ratio >= aa, "AA",
        True, Missing["BelowThreshold", <|"Ratio" -> ratio, "Minimum" -> aa|>]
    ]
]

Options[AccessibleTextColor] = {"Candidates" -> {Black, White}}

AccessibleTextColor[background_?ColorQ, opts : OptionsPattern[]] :=
    First @ MaximalBy[OptionValue["Candidates"], WCAGContrastRatio[background, #] &]

Options[AdjustForContrast] = {"Target" -> 4.5}

AdjustForContrast[foreground_?ColorQ, background_?ColorQ, opts : OptionsPattern[]] := Block[{
    target = OptionValue["Target"],
    toward, lo = 0., hi = 1., mid, candidate
},
    If[ WCAGContrastRatio[foreground, background] >= target,
        Return[foreground]
    ];
    toward = If[relativeLuminance[background] > 0.18, Black, White];
    If[ WCAGContrastRatio[toward, background] < target,
        Return[toward]
    ];
    Do[
        mid = (lo + hi) / 2;
        candidate = Blend[{foreground, toward}, mid];
        If[ WCAGContrastRatio[candidate, background] >= target, hi = mid, lo = mid ],
        {24}
    ];
    Blend[{foreground, toward}, hi]
]

End[]

EndPackage[]
