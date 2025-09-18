part of "_.dart";

typedef string__wide = BS4__array;

const //
unicode__ch__max = 0x10ffff /* 1114111, 0b100001111111111111111 */,
    unicode__ch__limit = (unicode__ch__max + 1),
    unicode__ch__size = TCW__size,
    unicode__ch__per__byte__max /*
  bytes needed, for storing `ch__unicode__max` */ =
        TCW__size;

INT TCW__bytes__count(final TCW wc) => //
    ((wc < NI07__limit) //
    ? TC__size
    : ((wc < NI014__limit) //
          ? 2
          : ((wc < NI021__limit) //
                ? 3
                : throw "`TCW` MUST be `<u21__limit`")));

string__wide text__unicode__convert__string__wide(
  final string s, [
  final INT? chars__count__initial /*
  usually `NI2__max` */,
]) {
  final runes = Runes /* Dart's rune, is, Unicode's code-point */ (s).iterator;

  var //
  chars__count = (chars__count__initial ?? s.chars__count),
      /*array<TCW>*/ chars_ = BS4__array(
        chars__count,
      ),
      char__id = 0;

  while (runes.moveNext()) {
    if (chars__count == char__id) {
      final //
      chars__1 = chars_,
          chars__count_1 = chars__count;

      base__copy(
        (chars_ = BS4__array(chars__count *= 2)),
        chars__1,
        count: chars__count_1,
      );

      //chars_.mem_:free()
    }

    final wc = runes.current;

    chars_[char__id++] =
        ((wc < TC__limit) //
        ? TC__ascii__convert__ch(wc)
        : wc);
  }

  final result = string__wide(char__id);

  base__copy(
    result,
    chars_,
    count: char__id,
  );

  //chars_.mem_:free()

  return result;
}

TCW char__unicode__convert__TCW(
  final string char,
) {
  final runes = Runes(char).iterator;

  if (runes.moveNext().not) {
    throw "empty text";
  }

  final wc = runes.current;

  return ((wc < TC__limit) //
      ? TC__ascii__convert__ch(wc)
      : wc);
}

/*
  code-point is separated, into parts of 7 bit, each
    hence a code-point(which has 21 bits of data) can take at-most 3 bytes, after encoding
      the first bit of each byte(not code-point) indicates, that the current byte has more data (bits), of the code-point, or is last
        1 if code-point(original, before encoding) has more data (hence next byte, belongs to the current TCW),
        0 if is the last byte
      the last 7 bits of the code-point, are contained in the first byte, while the first 7, go in last byte,
        hence reversed, but this is irrelevant, after decoding

  example:
    1 0000 1111 1111 1111 1111 (largest unicode code-point), becomes
      1 1111111  1 1111111  0 1000011
      ^          ^          ^
      numbers highlighted with the caret are indicators,
        rest are actual data, of the code-point

  /*conclusions, after the execution of `DelimiterTester::testUnicode` function are:
    NO charCode can be used as de-limiter(or separator), in the enCoded texts,
      ONLY the prePended size can be used to separate these texts
      but, the ONLY charCode containing 0(or `NIL`, or `'\0'`) is 128, 
        because 128 requires the 8th bit,
          hence needs 2 bytes after enCoding,
          the second byte is 129, while the first byte is the culprit 0,
    all the 256(possible single-byte) byte values, were en-countered, by 32384 as byteCounter
    the `byteCount` of the `encodedBytes` was 3325823, 
      excluding the prePended size
      compared to 4388733, of `Utf8::enCode`*/ */ /* *** outdated info *** */
byte__array wstr__convert__bytes(
  final array<TCW> ws,
) {
  final sink = base__byte__array__accumulation();

  ws.iterate__basic(
    (final _, final wc) => //
    sink.add__INT(
      wc,
    ),
  );

  final result = sink.convert__byte__array();

  sink.flush();

  return result;
}

/*BS1__array wstr__bytes__convert__encrypted /*__iterate*/ (
  final BS1__array bytes, [
  final INT? chars__count__prefixed__size,
]) {
  final //
      bytes__count = bytes.count,
      result = BS1__array(bytes__count);

  BOOL ascii___ok /*
  char is standalone, or single-byte (ascii, not unicode)
    hence needs encryption */
      = OK;

  base__iterate__basic(
    bytes__count,
    (final i) {
      final wc = bytes[iter];

      if ((wc < TC__ascii__limit) || (ascii___ok = NO)) {
        if (ascii___ok || (ascii___ok = OK).not) //
          result[iter] = TC__encrypt(wc);
      }
    },
    ((chars__count__prefixed__size !=  null) //
        ? chars__count__prefixed__size
        : NI__bytes__convert(bytes).count),
  );

  return result;
}*/

string__wide wstr__bytes__convert(
  final byte__array bytes,
) {
  /*if (bytes.empty___ok) //
    return string__wide(0);*/

  final //
  bytes_ = bytes___compo(
        bytes,
      ),
      sink = base__accumulation__linear__basic<TCW>();

  while (bytes_.iterate___ok) {
    sink.add__ending(
      bytes_.read__INT().value,
    );
  }

  final result = string__wide.fromList(
    sink.convert__array(),
  );

  sink.dispose();

  return result;
}

string wstr__convert__text(
  final string__wide ws,
) {
  if /*F*/ (ws.empty___ok()) {
    return empty__string;
  }

  final //
  count = ws.elements__count,
      ws__copy = BS4__array(
        count,
      );

  base__iterate__reverse__basic(count, (final wide_char__id) {
    final wc = ws[wide_char__id];
    ws__copy[wide_char__id] =
        ((wc < TC__limit) //
        ? TC__convert__ch__ascii(wc)
        : wc);
  });

  final result = string.fromCharCodes(
    ws__copy,
  );

  //ws__copy.mem_:free()

  return result;
}
