part of "_.dart";

typedef string__raw = String;

/*
  conclusions, from `test__search__de_limiter` function are:
    `{{0}, `
      `{192, 193}, `
      `{245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255}}`
      charCodes can be used as de-limiter(or separator), in the encoded texts
    all the 256(possible single-byte) byte values, were en-countered, 
      by 3078013 as `byteCounter`, and 243 as `charCode`, 
      but the last encountered `charCode` was 244(at `byteCounter` 169856)
    the `byteCount` of the `encodedBytes` was 4388733 */

byte__array text__convert__utf_8__bytes(final string__raw s) => //
    (const convert.Utf8Encoder()).convert(s);

NIMR? /*id_*/ text__search /*
forked ,from `array__search` */
    (
  final string__raw text_,
  final string__raw segment /*
sub-string to search */
  , {
  final NIMR? offset /*
by-default 0 ,if `reverse:OK` is `NOT OK` ,else `char:last:id` */
  ,
  final BOOL reverse__ok = NO,
}) {
  if ((offset != null) && (offset < text_.chars__count).not) {
    throw RangeError.range(
      offset,
      0,
      text_.chars__count,
    );
  }

  final NIMR result;

  if /*F*/ (reverse__ok) {
    result = text_.lastIndexOf(
      segment,
      offset,
    );
  } else {
    result = text_.indexOf(
      segment,
      (offset ?? 0),
    );
  }

  if (result < 0) {
    return NIL;
  }

  return result;
}

BOOL text__numbers__ok(
  final string__raw s,
) {
  for (final c in s.codeUnits) {
    if ((c < 48) || (c > 57)) {
      return NO;
    }
  }
  return OK;
}

string__raw utf_8__bytes__convert__text(final byte__array bytes) => //
    (const convert.Utf8Decoder()).convert(bytes);

NIMR /*(char:bytes:count -1)*/ utf_8__bytes__char__bytes__count__remain_ing(
  final BS1 b /*char:bytes:first*/,
) {
  if (b < 128 /*1000_0000*/) {
    return 0;
  } else if (b < 192 /*1100_0000*/) {
    throw "BAD encod-ing" /*
source :`http://stackoverflow.com/questions/26070766/utf-8-how-does-only-0-127-store-into-a-single-byte/26073762#26073762` */
        ;
  } else if (b < 224 /*1110_0000*/) {
    return 1;
  } else if (b < 240 /*1111_0000*/) {
    return 2;
  } else if (b < 248 /*1111_1000*/) {
    return 3;
  } else {
    throw "utf-8's limit has exceeded";
  }
}

final value__asyn<string__raw> Function(Stream<byte__array>) utf_8__Stream__byte__array__convert__text = //
    (const convert.Utf8Codec()).decodeStream;

final value__asyn<string__raw> Function(Stream<array<NI1R>>) utf_8__byte__array__Stream__convert__text = //
    (const convert.Utf8Codec()).decodeStream;

extension text__extension on string__raw {
  NIMR get chars__count => //
      length;

  BOOL empty__ok() => //
      isEmpty;

  BOOL empty__not() => //
      isNotEmpty;

  string__raw? empty__not__else__null() {
    if (empty__ok()) {
      return NIL;
    }

    return this;
  }

  void print__raw() /*
should never be needed(only wanted)
  prefer `::print` */
  {
    base__print__handle(
      this,
    );
  }

  void print([
    final string__raw? label,
  ]) {
    base__print__labeled(
      this,
      NIL,
      label,
    );
  }
}

extension text__convert__text__representation__extension on string__raw {
  base__text__representation //
      text__representation() {
    return base__text__representation(
      "\"${toString()}\"",
    );
  }
}
