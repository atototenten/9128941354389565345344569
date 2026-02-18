part of "../../_.dart";

typedef INT /* general/generic */ = int;

typedef INT__BIG__NATIVE = INT;

const //
    INT__1__size = BS1__size,
    INT__1__width = (INT__1__size * BS1__width),
    INT__1__limit = (1 << INT__1__width),
    INT__1__max = (INT__1__limit - 1),
//
    INT__2__size = (2 * INT__1__size),
    INT__2__width = (INT__2__size * BS1__width),
    INT__2__limit = (1 << INT__2__width),
    INT__2__max = (INT__2__limit - 1),
//
    INT__3__size = (INT__2__size + INT__1__size),
    INT__3__width = (INT__3__size * BS1__width),
    INT__3__limit = (1 << INT__3__width),
    INT__3__max = (INT__3__limit - 1),
//
    INT__4__size = (2 * INT__2__size),
    INT__4__width = (INT__4__size * BS1__width),
    INT__4__limit = (1 << INT__4__width),
    INT__4__max = (INT__4__limit - 1),
//
    INT__6__size = (INT__4__size + INT__2__size),
    INT__6__width = (INT__6__size * BS1__width),
    INT__6__limit = (1 << INT__6__width),
    INT__6__max = (INT__6__limit - 1),
//
    INT__8__size = (2 * INT__4__size),
    INT__8__width = (INT__8__size * BS1__width),
//
    INT__12__size = (INT__8__size + INT__4__size),
    INT__12__width = (INT__12__size * BS1__width),
//
    INT__16__size = (2 * INT__8__size),
    INT__16__width = (INT__16__size * BS1__width),
//
    INT__24__size = (INT__16__size + INT__8__size),
    INT__24__width = (INT__24__size * BS1__width),
//
    INT__32__size = (2 * INT__16__size),
    INT__32__width = (INT__32__size * BS1__width),
//
    NIM__size = INT__8__size,
//
    INT__base__16__digits__count = 2 /*
each digit contains 4 bits of info.
  ,hence 2 digits are required to store 1 byte */
    ,
    INT__base__2__digits__count = BS1__width,
//
    INT__8__width__radix__16 = (INT__8__size * INT__base__16__digits__count),
    INT__8__width__radix__2 = (INT__8__size * INT__base__2__digits__count);

const //
    INT__01__limit = (1 << 1),
    INT__04__width = 4,
    INT__04__limit = (1 << INT__04__width),
    INT__04__max = (INT__04__limit - 1),
    INT__07__size = INT__1__size,
    INT__07__limit = (1 << CHAR__width),
    INT__014__limit = (1 << (2 * CHAR__width)),
    INT__021__limit = (1 << (3 * CHAR__width));

final //
    INT__8__limit = (BigInt.from(1) << INT__8__width),
    INT__8__max = (INT__8__limit - BigInt.from(1));

INT INT__base__16__digits__count__convert__size(
  final INT digits__count,
) =>
    INT__base__binary__multiple__digits__count__convert__size(
      digits__count,
       INT__base__16__digits__count,
    );

INT INT__base__2__digits__count__convert__size(
  final INT digits__count /*bits__count*/,
) =>
    INT__base__binary__multiple__digits__count__convert__size(
      digits__count,
       INT__base__2__digits__count,
    );

INT INT__base__binary__multiple__digits__count__convert__size(
  final INT digits__count,
  final INT binary__multiple__digits__count,
) /*{
  return (digits__count.toDouble() / binary__multiple__digits__count).ceil();
}*/
{
  if (digits__count == 0) {
    throw "in-valid digits:count ,cannot be zero";
  }

  return (1 + ((digits__count - 1) ~/ binary__multiple__digits__count));
}

INT INT__max(
  final INT size,
) {
  final shift__count = ((NIM__size - size) * BS1__width);

  return (((~0 << shift__count) >>> shift__count));
}

INT INT__max__basic({
  required final INT width,
}) {
  return ((1 << width) - 1);
}

BOOL INT__aligned___ok(final INT value, final INT size) => //
    ((value & (size - 1)) == 0);

INT INT__aligned__alignment__count(final INT value, final INT shift__count) => //
    (value >> shift__count);

INT INT__aligned__basic(final INT value, final INT shift__count) => //
    (INT__aligned__alignment__count(
          value,
          shift__count,
        ) <<
        shift__count) /*
  equal to `(value & ~(size - 1))`, and `(value & (~0 << shift__count))`
    but, slightly more efficient
      because of the number of operations, 3 vs, just 2 */
    ;

({
  INT value__aligned,
  INT remainder__un_aligned /* `` */,
/* `uu get value => (remainder__un_aligned + value__aligned);` */
}) INT__aligned(
  final INT value,
  final INT alignment__size,
  final INT alignment__shift__count,
) {
  /*if (value < block__size__shift.size) {
    return (
      value__aligned: 0,
      remainder__un_aligned: value,
    ); /* output of `_INT__aligned` */

    return (
      value__aligned: block__size__shift.size,
      remainder__un_aligned: -(block__size__shift.size - value),
    ); /* informative, but not intended */
  }*/

  if (INT__aligned___ok(value, alignment__size)) //
    return (
      value__aligned: value,
      remainder__un_aligned: 0,
    );

  final value__aligned = INT__aligned__basic(
    value,
    alignment__shift__count,
  );

  return (
    value__aligned: value__aligned,
    remainder__un_aligned: (value - value__aligned),
  );
}

typedef INT__bytes__convert__result___compo = ({
  INT value,
  INT count /* not `value__size`, but actually `bytes__count` */
});

INT__bytes__convert__result___compo INT__bytes__convert(
  final byte__array bytes,
)
/*
  although `PrefixVarint` could be 1/3rd times faster, in de-cod-ing, but
    its NOT parallel-able
      because its un-determin-able, which byte contains the bit-sequence info
        while each byte of `uu:bytes` contains the status(of remaining data)
          so the `bytes` can be broken into multiple pars and de-cod-ed independently, then joined, to form complete result
    if only a few value(s), need to be de-cod-ed, then there is not-much benefit, of leaving the simplicity of `INT__bytes__convert`
  TASK
    consider moving to `BOOL iterate(TCW)` accepting,
      instead of `return`ing `INT__bytes__convert__result__compo` */
{
  var //
      value = 0,
      iter = 1,
      shift__count = 0,
      bytes__iter = 0;

  while (true) {
    final b = bytes[bytes__iter++];

    value |= (b & 127) << shift__count;

    if ((b & 128) == 0) //
      break;

    iter += 1;
    shift__count += CHAR__width;
  }

  return (
    value: value,
    count: iter,
  );
} /*
  reverse of `INT__convert__BS1__array(`, also refer, for more info
  similar to, {a|the} historical version of `BS1__array__convert__text(`
    but automated(looped)
      and uses `shift__count`, instead of directly modifying `value`

  forked from `https://en.wikipedia.org/wiki/LEB128#Decode_unsigned_integer`
  original:
```
result = 0;
shift = 0;
while (true) {
  byte = next byte in input;
  result |= (low-order 7 bits of byte) << shift;
  if (high-order bit of byte == 0)
    break;
  shift += 7;
}
``` */

extension INT__extension on INT {
  BOOL even___ok /*
copied from `~/bin/dart-sdk/lib/_internal/wasm/lib/int.dart`::`_BoxedInt`::`isEven` */
      () {
    return ((this & 1) == 0);
  }

  byte__array INT__1__convert__byte__array() {
    final result = byte__array(1);

    result.first = this;

    return result;
  }

  byte__array convert__byte__array__endian__little(
    final INT size,
  ) /*
`size` must equal `value.size`
  else illegal-access error
    due to `(value != 0)` being the test-condition ,instead of `size` */
  {
    var value = this;

    final result = byte__array(size);

    var i = 0;

    while (value != /*>*/ 0) {
      result[i++] = (value & 255);
      value >>= BS1__width;
    }

    return result;
  }

  byte__array convert__byte__array__endian__big(
    final INT size,
  ) {
    var value = this;

    final bytes = byte__array(size);

    var i = size;

    do {
      bytes[i -= 1] = (value & 255);
      value >>= BS1__width;
    } while (size > 0);

    /*while (i-- > 0) {
      bytes[size] = (value & 255);
      value >>= BS1__width;
    }*/ /* equal result as above loop */

    return bytes;
  }

  byte__array convert__bytes
/*
allows encoding integer, of any size (variable-size)

originally created for `text__convert__BS1__array(`(to encode Unicode code-points),
  which had the {en|de}coding process hard-coded, not looped
    because code-points were found to be hard-limited to 3 bytes, to ensure utf-8 compatibility
discovered independently from "LEB128"
  author did not know about any encoding, other than utf-8; prior to the discovery
    especially NOT LEB128; about which, the author got to know while reading about web-assembly(or wasm)
      ..."integers are encoded using the LEB128 variable-length integer encoding"...(https://webassembly.github.io/spec/core/binary/values.html#integers)

..."Protocol Buffers (Protobuf) uses the same encoding"...(https://en.wikipedia.org/wiki/LEB128#Related_encodings)

function.implementation.initial :June 27, 2023

forked from `https://en.wikipedia.org/wiki/LEB128#Encode_unsigned_integer`
original :```
do {
  byte = low-order 7 bits of value;
  value >>= 7;
  if (value != 0) /* more bytes to come */
    set high-order bit of byte;
  emit byte;
} while (value != 0);
``` */
      () {
    var value = this;

    final INT size;
    {
      var i = 0;
      while ((value < (1 << ((i += 1) * CHAR__width))).NOT);

      size = i;
    }

    final bytes = byte__array(size);

    var i = 0;

    do {
      bytes[i] = (value & 127 /* (1 << BITS_PER_SEGMENT) */);

      if ((value >>= CHAR__width) != 0) /* more data left */ //
        bytes[i] |= 128;

      i += 1;
    } while (value != 0);

    return bytes;
  }
}

class number__integer__nilable {
  static INT value__convert__nilable___raw(
    final INT value,
  ) {
    return (1 + value);
  }

  static INT value__nilable__convert___raw(
    final INT value,
  ) {
    return (value - 1);
  }

  number__integer__nilable.nil() //
      : _value = 0;

  number__integer__nilable(
    final INT value,
  ) : _value = value__convert__nilable___raw(
          value,
        );

  INT _value;

  BOOL nil___ok() {
    return (_value == 0);
  }

  INT value() {
    if (nil___ok()) {
      throw "`(value = NIL)`";
    }

    return value__nilable__convert___raw(
      _value,
    );
  }

  void assign__nil() {
    _value = 0;
  }

  void assign(
    final INT value,
  ) {
    _value = value__convert__nilable___raw(
      value,
    );
  }
}
