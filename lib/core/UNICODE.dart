part of "_.dart";

const //
CHAR__UNICODE__max = 0x10ffff /* 1114111, 0b100001111111111111111 */,
    CHAR__UNICODE__limit = (CHAR__UNICODE__max + 1),
    CHAR__UNICODE__per__byte__max /*
  bytes needed, for storing "CHAR__UNICODE__max" */ =
        3;

typedef CHAR__UNICODE = INT;

typedef CHAR__UNICODE__BASIC = CHAR__ASCII;

typedef STRING__UNICODE = BS4__array;

extension STRING__UNICODE___extension //
    on STRING__UNICODE {
  string convert__STRING__UNICODE() {
    return string.fromCharCodes(this);
  }
}

extension STRING__UNICODE__conversion___extension //
    on string {
  STRING__UNICODE convert__STRING__UNICODE() {
    return STRING__UNICODE.fromList(this.runes.convert__array());
  }
}

INT CHAR__UNICODE__bytes__count(final CHAR__UNICODE wc) => //
    ((wc < INT__07__limit) //
    ? CHAR__size
    : ((wc < INT__014__limit) //
          ? 2
          : ((wc < INT__021__limit) //
                ? 3
                : throw "`TCW` MUST be `<u21__limit`")));

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
  final ARRAY<CHAR__UNICODE> ws,
) {
  final sink = byte__array__accumulation___compo();

  ws.iterate(
    (_, final e) {
      sink.add__INT(e);

      return TRUE;
    },
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
      = TRUE;

  iterate__basic(
    bytes__count,
    (final i) {
      final wc = bytes[iter];

      if ((wc < CHAR__ASCII__limit) || (ascii___ok = FALSE)) {
        if (ascii___ok || (ascii___ok = TRUE).NOT) //
          result[iter] = CHAR__encrypt(wc);
      }
    },
    ((chars__count__prefixed__size !=  null) //
        ? chars__count__prefixed__size
        : INT__bytes__convert(bytes).count),
  );

  return result;
}*/

STRING__UNICODE wstr__bytes__convert(
  final byte__array bytes,
) {
  /*if (bytes.empty___ok) //
    return STRING__UNICODE(0);*/

  final //
  bytes_ = bytes___compo(
        bytes,
      ),
      sink = accumulation__linear__basic___compo<CHAR__UNICODE>();

  while (bytes_.iterate___ok) {
    sink.add__ending(
      bytes_.read__INT().value,
    );
  }

  final result = STRING__UNICODE.fromList(
    sink.convert__array(),
  );

  sink.dispose();

  return result;
}
