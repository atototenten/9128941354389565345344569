part of "../../_.dart";

typedef NIR /* general/generic */ = int;
typedef NI1R = NIR;
typedef NI2R = NIR;
typedef NI4R = NIR;
typedef NI8R = NIR;
typedef NIMR /* max */ = NI8R;
typedef NINR /* native word */ = NIMR;

const //
    NI1__size = BS1__size,
    NI1__width = (NI1__size * BS1__width),
    NI1__limit = (1 << NI1__width),
    NI1__max = (NI1__limit - 1),
//
    NI2__size = (2 * NI1__size),
    NI2__width = (NI2__size * BS1__width),
    NI2__limit = (1 << NI2__width),
    NI2__max = (NI2__limit - 1),
//
    NI3__size = (NI2__size + NI1__size),
    NI3__width = (NI3__size * BS1__width),
    NI3__limit = (1 << NI3__width),
    NI3__max = (NI3__limit - 1),
//
    NI4__size = (2 * NI2__size),
    NI4__width = (NI4__size * BS1__width),
    NI4__limit = (1 << NI4__width),
    NI4__max = (NI4__limit - 1),
//
    NI6__size = (NI4__size + NI2__size),
    NI6__width = (NI6__size * BS1__width),
    NI6__limit = (1 << NI6__width),
    NI6__max = (NI6__limit - 1),
//
    NI8__size = (2 * NI4__size),
    NI8__width = (NI8__size * BS1__width),
//
    NI12__size = (NI8__size + NI4__size),
    NI12__width = (NI12__size * BS1__width),
//
    NI16__size = (2 * NI8__size),
    NI16__width = (NI16__size * BS1__width),
//
    NI24__size = (NI16__size + NI8__size),
    NI24__width = (NI24__size * BS1__width),
//
    NI32__size = (2 * NI16__size),
    NI32__width = (NI32__size * BS1__width),
//
    NIM__size = NI8__size,
//
    NI__base__16__digits__count = 2 /*
each digit contains 4 bits of info.
  ,hence 2 digits are required to store 1 byte */
    ,
    NI__base__2__digits__count = BS1__width,
//
    NI8__width__radix__16 = (NI8__size * NI__base__16__digits__count),
    NI8__width__radix__2 = (NI8__size * NI__base__2__digits__count);

const //
    NI01__limit = (1 << 1),
    NI04__width = 4,
    NI04__limit = (1 << NI04__width),
    NI04__max = (NI04__limit - 1),
    NI07__size = NI1__size,
    NI07__limit = (1 << TC__width),
    NI014__limit = (1 << (2 * TC__width)),
    NI021__limit = (1 << (3 * TC__width));

final //
    NI8__limit = (BigInt.from(1) << NI8__width),
    NI8__max = (NI8__limit - BigInt.from(1));

NIMR NI__base__16__digits__count__convert__size(
  final NIMR digits__count,
) =>
    NI__base__binary__multiple__digits__count__convert__size(
      digits__count,
      NI__base__16__digits__count,
    );

NIMR NI__base__2__digits__count__convert__size(
  final NIMR digits__count /*bits__count*/,
) =>
    NI__base__binary__multiple__digits__count__convert__size(
      digits__count,
      NI__base__2__digits__count,
    );

NIMR NI__base__binary__multiple__digits__count__convert__size(
  final NIMR digits__count,
  final NIMR base__binary__multiple__digits__count,
) /*{
  return (digits__count.toDouble() / base__binary__multiple__digits__count).ceil();
}*/
{
  if (digits__count == 0) {
    throw "in-valid digits:count ,cannot be zero";
  }

  return (1 + ((digits__count - 1) ~/ base__binary__multiple__digits__count));
}

NIMR NI__max(
  final NIMR size,
) {
  final shift__count = ((NIM__size - size) * BS1__width);

  return (((~0 << shift__count) >>> shift__count));
}

NIMR NI__max__basic({
  required final NIMR width,
}) {
  return ((1 << width) - 1);
}

BOOL base__NI__aligned__ok(final NIMR value, final NIMR size) => //
    ((value & (size - 1)) == 0);

NIMR NI__aligned__alignment__count(final NIMR value, final NIMR shift__count) => //
    (value >> shift__count);

NIMR NI__aligned__basic(final NIMR value, final NIMR shift__count) => //
    (NI__aligned__alignment__count(
          value,
          shift__count,
        ) <<
        shift__count) /*
  equal to `(value & ~(size - 1))`, and `(value & (~0 << shift__count))`
    but, slightly more efficient
      because of the number of operations, 3 vs, just 2 */
    ;

({
  NIMR value__aligned,
  NIMR remainder__un_aligned /* `` */,
/* `uu get value => (remainder__un_aligned + value__aligned);` */
}) NI__aligned(
  final NIMR value,
  final NIMR alignment__size,
  final NIMR alignment__shift__count,
) {
  /*if (value < block__size__shift.size) {
    return (
      value__aligned: 0,
      remainder__un_aligned: value,
    ); /* output of `_NI__aligned` */

    return (
      value__aligned: block__size__shift.size,
      remainder__un_aligned: -(block__size__shift.size - value),
    ); /* informative, but not intended */
  }*/

  if (base__NI__aligned__ok(value, alignment__size)) //
    return (
      value__aligned: value,
      remainder__un_aligned: 0,
    );

  final value__aligned = NI__aligned__basic(
    value,
    alignment__shift__count,
  );

  return (
    value__aligned: value__aligned,
    remainder__un_aligned: (value - value__aligned),
  );
}

typedef NI__bytes__convert__result___compo = ({
  NIMR value,
  NIMR count /* not `value__size`, but actually `bytes__count` */
});

NI__bytes__convert__result___compo NI__bytes__convert(
  final byte__array bytes,
)
/*
  although `PrefixVarint` could be 1/3rd times faster, in de-cod-ing, but
    its NOT parallel-able
      because its un-determin-able, which byte contains the bit-sequence info
        while each byte of `uu:bytes` contains the status(of remaining data)
          so the `bytes` can be brOKen into multiple pars and de-cod-ed independently, then joined, to form complete result
    if only a few value(s), need to be de-cod-ed, then there is not-much benefit, of leaving the simplicity of `NI__bytes__convert`
  TASK
    consider moving to `bool iterate(TCW)` accepting,
      instead of `return`ing `NI__bytes__convert__result__compo` */
{
  var //
      value = 0,
      iter = 1,
      shift__count = 0,
      bytes__iter = 0;

  while (OK) {
    final b = bytes[bytes__iter++];

    value |= (b & 127) << shift__count;

    if ((b & 128) == 0) //
      break;

    iter += 1;
    shift__count += TC__width;
  }

  return (
    value: value,
    count: iter,
  );
} /*
  reverse of `NI__convert__BS1__array(`, also refer, for more info
  similar to, {a|the} historical version of `BS1__array__convert__text(`
    but automated(looped)
      and uses `shift__count`, instead of directly modifying `value`

  forked from `https://en.wikipedia.org/wiki/LEB128#Decode_unsigned_integer`
  original:
```
result = 0;
shift = 0;
while (OK) {
  byte = next byte in input;
  result |= (low-order 7 bits of byte) << shift;
  if (high-order bit of byte == 0)
    break;
  shift += 7;
}
``` */

extension NI__extension on NIR {
  BOOL NI__even__ok /*
copied from `~/bin/dart-sdk/lib/_internal/wasm/lib/int.dart`::`_BoxedInt`::`isEven` */
      () {
    return ((this & 1) == 0);
  }

  byte__array NI1__convert__byte__array() {
    final result = byte__array(1);

    result.first = this;

    return result;
  }

  byte__array convert__byte__array__endian__little(
    final NIMR size,
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
    final NIMR size,
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

    final NIMR size;
    {
      var i = 0;
      while ((value < (1 << ((i += 1) * TC__width))).not);

      size = i;
    }

    final bytes = byte__array(size);

    var i = 0;

    do {
      bytes[i] = (value & 127 /* (1 << BITS_PER_SEGMENT) */);

      if ((value >>= TC__width) != 0) /* more data left */ //
        bytes[i] |= 128;

      i += 1;
    } while (value != 0);

    return bytes;
  }
}

class number__integer__nilable {
  static NIMR value__convert__nilable__raw(
    final NIMR value,
  ) {
    return (1 + value);
  }

  static NIMR value__nilable__convert__raw(
    final NIMR value,
  ) {
    return (value - 1);
  }

  number__integer__nilable.nil() //
      : value__raw = 0;

  number__integer__nilable(
    final NIMR value,
  ) : value__raw = value__convert__nilable__raw(
          value,
        );

  NIMR value__raw;

  BOOL nil__ok() {
    return (value__raw == 0);
  }

  NIMR value() {
    if (nil__ok()) {
      throw "`(value = NIL)`";
    }

    return value__nilable__convert__raw(
      value__raw,
    );
  }

  void assign__nil() {
    value__raw = 0;
  }

  void assign(
    final NIMR value,
  ) {
    value__raw = value__convert__nilable__raw(
      value,
    );
  }
}
