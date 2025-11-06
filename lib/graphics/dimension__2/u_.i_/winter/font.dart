part of "_.dart";

const INT //
    font__family__interface__title = 0,
    font__family__interface__sub_title = (1 + font__family__interface__title),
    font__family__interface__text = (1 + font__family__interface__sub_title),
    font__family__material__title = (1 + font__family__interface__text),
    font__family__material__sub_title = (1 + font__family__material__title),
    font__family__material__text = (1 + font__family__material__sub_title),
    font__family__material__code = (1 + font__family__material__text),
    font__family__material__italic = (1 + font__family__material__code),
    font__count = (1 + font__family__material__italic);

const //
    font__family__default = "Roboto",
    font__family__default__mono = "monospace";

final font__families = array<string>.filled(
  font__count,
  font__family__default,
  growable: FALSE,
);

APPROX get font__size__tiny => 12.px();
APPROX get font__size__small => 14.px();
APPROX get font__size__default => 16.px();
APPROX get font__size__large => 18.px();
APPROX get font__size__huge => 20.px();
