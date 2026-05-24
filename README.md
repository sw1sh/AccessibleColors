# AccessibleColors

WCAG color-contrast and accessibility utilities for the Wolfram Language. The
Wolfram Language ships rich color machinery (`ColorConvert`, `Blend`, ...) but
no WCAG accessibility layer; this paclet adds it.

| Function | Purpose |
|---|---|
| `WCAGContrastRatio[c1, c2]` | WCAG 2.x contrast ratio, 1 to 21 |
| `WCAGLevel[c1, c2]` | conformance level: `"AAA"`, `"AA"`, or `"Fail"` |
| `AccessibleTextColor[bg]` | most legible text color for a background |
| `AdjustForContrast[fg, bg]` | nudge a color until it meets a target ratio |

```wl
PacletDirectoryLoad["/path/to/AccessibleColors"];
Needs["Wolfram`AccessibleColors`"]

WCAGContrastRatio[Black, White]        (* 21. *)
WCAGLevel[Gray, White]                 (* "Fail" *)
AccessibleTextColor[RGBColor[.1,.1,.4]] (* white *)
```

## Documentation is authored in markdown

This paclet is the reference example for
[MarkdownToNotebook](https://github.com/sw1sh/MarkdownToNotebook): its documentation is
written as plain markdown in [`docs/`](docs/) (one file per page, with
frontmatter for metadata and fenced `wl` cells for examples) and compiled into
the standard paclet layout under `Documentation/English/` by
[`build.wls`](build.wls). Authors never edit notebook cell styles by hand.

```
docs/AccessibleColors.md      ->  Documentation/English/Guides/AccessibleColors.nb
docs/WCAGContrastRatio.md     ->  Documentation/English/ReferencePages/Symbols/WCAGContrastRatio.nb
docs/WCAGLevel.md             ->  .../Symbols/WCAGLevel.nb
docs/AccessibleTextColor.md   ->  .../Symbols/AccessibleTextColor.nb
docs/AdjustForContrast.md     ->  .../Symbols/AdjustForContrast.nb
ResourceDefinition.md         ->  ResourceDefinition.nb  (Paclet Repository submission)
```

Build everything (notebooks are git-ignored; evaluation outputs are cached
separately under `build/cache/`):

```
wolframscript -f build.wls
```

`MarkdownToNotebook` reads a file path, a raw markdown string, or a URL, so the
pages here can be built straight from GitHub without cloning:

```wl
MarkdownToNotebook[
  "https://raw.githubusercontent.com/sw1sh/AccessibleColors/main/docs/Symbols/WCAGContrastRatio.md"
]
```

## License

MIT.
