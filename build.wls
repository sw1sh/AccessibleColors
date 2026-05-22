#!/usr/bin/env wolframscript
(* Build the AccessibleColors paclet documentation from the structured markdown
   in docs/, writing each notebook into the standard paclet layout under
   Documentation/English/. Example outputs are cached with the built-in
   persistence framework. Also builds the paclet-repository submission notebook
   (ResourceDefinition). *)

print[args___] := WriteString["stdout", StringJoin[ToString /@ {args}], "\n"]

pacletDir = DirectoryName[$InputFileName]
Get[FileNameJoin[{pacletDir, "..", "..", "MarkdownToNotebook.wl"}]]

(* load the paclet so example cells resolve its symbols during evaluation *)
PacletDirectoryLoad[pacletDir]
Needs["Wolfram`AccessibleColors`"]

subdir["Symbol"] = {"Documentation", "English", "ReferencePages", "Symbols"}
subdir["Guide"] = {"Documentation", "English", "Guides"}
subdir["TechNote"] = {"Documentation", "English", "Tutorials"}

buildDoc[srcFile_String] := Block[{info, tmpl, name, dir, out},
    info = MarkdownToNotebook[srcFile, "Association"];
    tmpl = info["Template"];
    name = info["Metadata"]["Name"];
    dir = FileNameJoin[Prepend[subdir[tmpl], pacletDir]];
    Quiet @ CreateDirectory[dir, CreateIntermediateDirectories -> True];
    out = FileNameJoin[{dir, name <> ".nb"}];
    MarkdownToNotebook[srcFile, out];
    print["  ", FileNameTake[srcFile], " -> Documentation/English/", Last[subdir[tmpl]], "/", name, ".nb"]
]

print["building AccessibleColors documentation"]
Scan[buildDoc, Sort @ FileNames["*.md", FileNameJoin[{pacletDir, "docs"}], Infinity]]

(* paclet-repository submission notebook at the paclet root *)
rd = FileNameJoin[{pacletDir, "ResourceDefinition.md"}]
If[ FileExistsQ[rd],
    MarkdownToNotebook[rd, FileNameJoin[{pacletDir, "ResourceDefinition.nb"}]];
    print["  ResourceDefinition.md -> ResourceDefinition.nb"]
]

print["done"]
