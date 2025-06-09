part of "_.dart";

/*
  TASK:
    long:
      bring the whole unicode coverage into `latin__basic`-style encoding,
        because excluding chinese-japanese-korean, and other east-asian scripts, from unicode;
          brings the code-point counter to <16k */

typedef str = BS1__array;

final //
    empty__str = empty__byte__array;

str text__ascii__convert__str(
  final string__raw s,
) {
  if (s.empty__ok()) {
    return empty__str;
  }

  final //
      chars__count = s.chars__count,
      result = str(
        chars__count,
      );

  base__iterate__reverse__basic(
    chars__count,
    (final char__id) {
      result[char__id] = TC__ascii__convert__ch(
        s.codeUnitAt(
          char__id,
        ),
      );
    },
  );

  return result;
}

string__raw str__convert__text(
  final str s,
) {
  if (s.empty__ok()) {
    return empty__text;
  }

  final //
      count = s.elements__count,
      result = str(
        count,
      );

  base__iterate__reverse__basic(
    count,
    (final char__id) {
      result[char__id] = TC__convert__ch__ascii(
        s[char__id],
      );
    },
  );

  return string__raw.fromCharCodes(
    result,
  );
}
