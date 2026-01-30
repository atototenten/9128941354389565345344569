part of "_.dart";

gui__base__widget gui__base__box__text__widget(
  final TextSpan text__segment, {
  final TextAlign text__align = TextAlign.start,
  final TextOverflow text__overflow = TextOverflow.clip,
  final INT? lines__max,
}) {
  return RichText(
    text: text__segment,
    textAlign: text__align,
    textDirection: TextDirection.ltr,
    overflow: text__overflow,
    maxLines: lines__max,
    locale: base__app__locale,
  );
}

TextSpan gui__base__box__text__segment(
  final string value, {
  final TextStyle? style,
}) {
  return TextSpan(
    text: value,
    style: style,
  );
}

TextSpan gui__base__box__text__segments(
  final ARRAY<InlineSpan> value, {
  final TextStyle? style,
}) {
  return TextSpan(
    children: value,
    style: style,
  );
}

TextStyle base__text__style({
  required final APPROX font__size,
  required final Color? font__color,
  final FontWeight? font__weight,
  final FontStyle? font__style,
  final Paint? ground__fore,
  final ARRAY<FontFeature>? font__features,
  final TextDecoration? decoration,
  required final string? font__family,
  required final ARRAY<string>? font__family__default,
  final string? package,
  final TextOverflow text__overflow = TextOverflow.clip,
}) {
  return TextStyle(
    inherit: FALSE,
    color: font__color,
    fontSize: font__size,
    fontWeight: font__weight,
    fontStyle: font__style,
    textBaseline: TextBaseline.alphabetic,
    foreground: ground__fore,
    fontFeatures: font__features,
    decoration: decoration,
    fontFamily: font__family,
    fontFamilyFallback: font__family__default,
    package: package,
    overflow: text__overflow,
  );
}

Paint base__text__ground__fore__contrast__high() /*
for `base__text__style.ground__fore`
  source: `http://github.com/flutter/flutter/issues/139411#issue-2021829533` */
{
  return (Paint()
    ..blendMode = BlendMode.difference
    ..color = base__color__white);
}

ARRAY<string>? base__text__font__family__default() {
  return Typography.material2021().black.bodyMedium?.fontFamilyFallback /*
copied from `Theme.of(context).textTheme.bodyMedium`'s src. */
      ;
}
