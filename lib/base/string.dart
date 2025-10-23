part of "_.dart";

typedef string = String;

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

byte__array string__convert__utf_8__bytes(final string s) => //
    (const convert.Utf8Encoder()).convert(s);

INT? /*id_*/ text__search /*
forked ,from `array__search` */
    (
  final string text_,
  final string segment /*
sub-string to search */
  , {
  final INT? offset /*
by-default 0 ,if `reverse:OK` is `NOT OK` ,else `char:last:id` */
  ,
  final BOOL reverse___ok = NO,
}) {
  if ((offset != null) && (offset < text_.chars__count).not) {
    throw RangeError.range(
      offset,
      0,
      text_.chars__count,
    );
  }

  final INT result;

  if /*F*/ (reverse___ok) {
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

BOOL text__numbers___ok(
  final string s,
) {
  for (final c in s.codeUnits) {
    if ((c < 48) || (c > 57)) {
      return NO;
    }
  }
  return OK;
}

string utf_8__bytes__convert__string(final byte__array bytes) => //
    (const convert.Utf8Decoder()).convert(bytes);

INT /*(char:bytes:count -1)*/ utf_8__bytes__char__bytes__count__remain_ing(
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

final value__asyn<string> Function(Stream<byte__array>) utf_8__Stream__byte__array__convert__text = //
    (const convert.Utf8Codec()).decodeStream;

final value__asyn<string> Function(Stream<array<INT>>) utf_8__byte__array__Stream__convert__text = //
    (const convert.Utf8Codec()).decodeStream;

extension text__extension on string {
  INT get chars__count => //
      length;

  BOOL empty___ok() => //
      isEmpty;

  BOOL empty__not() => //
      isNotEmpty;

  void print___raw() /*
should never be needed(only wanted)
  prefer `::print` */
  {
    base__print__handle(
      this,
    );
  }

  void print([
    final string? label,
  ]) {
    base__print__labeled(
      this,
      NIL,
      label,
    );
  }
}

extension text__convert__representation__text__extension on string {
  base__representation__text //
      representation__text() {
    return base__representation__text(
      "\"${toString()}\"",
    );
  }
}
