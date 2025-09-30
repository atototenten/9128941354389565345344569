part of "_.dart";

/*
  primitive (type): fixed size value, like INT, INT__8
  object: allocated value, of struct, like of `struct { INT id; };`

`ARRAY<BS1>`/`byte__array` vs "bytes"
  former :raw representation of an object(or primitive)
  latter :not raw, but encoded(or serialized)

  encode
    bytes, of primitives
    or in other words, primitives need to be encoded
  serialize
    bytes, of objects
    or in other words, primitives need to be serialized */

typedef byte__array = BS1__array; /*
similar to `ByteData`
  which is a view on `Uint8List` */

final byte__array //
    empty__byte__array = byte__array(0),
    empty__bytes = empty__byte__array;

byte__array byte__array__new__generated(
  final INT count,
  final INT Function(INT i) generate,
) {
  final result = byte__array(count);

  base__iterate__basic(
      count,
      (final i) => //
          (result[i] = generate(i)));

  return result;
}

BOOL byte__array__blank___ok(
  final byte__array bys, {
  final INT? count,
}) /*
  `byte__array__b__clear_ed`
  test: ```
      final bys = [0,0,0,0,0,0,0,0];
      byte__array__blank___ok(byte__array.fromList(bys+([0,0]..representation__text().print("count")))).representation__text().print("blank?");
      byte__array__blank___ok(byte__array.fromList(bys+([1,1]..representation__text().print("count")))).representation__text().print("blank?");
      byte__array__blank___ok(byte__array.fromList(bys+([0,1]..representation__text().print("count")))).representation__text().print("blank?");
      byte__array__blank___ok(byte__array.fromList(bys+([1,0]..representation__text().print("count")))).representation__text().print("blank?");
``` */
{
  var blank___ok = OK;

  bys.iterate(
    (final _, final element) {
      if (element == 0) {
        return OK;
      }

      blank___ok = NO;
      return NO;
    },
    count: (count ?? bys.bytes__count),
  );

  return blank___ok;
}

byte__array byte__array__blank(
  final INT count,
) {
  final result = byte__array(count);

  byte__array__fill(
    result,
    count: count,
  );

  return result;
}

byte__array byte__array__create /* actually init, not create */ (
  final array<INT> bytes, {
  INT? count,
  final INT result__offset = 0,
}) {
  final result = byte__array(count ??= bytes.elements__count);

  base__copy(
    result,
    bytes,
    dest__offset: result__offset,
    count: count,
  );

  return result;
}

byte__array byte__array__array__catinate(
  final array<byte__array> a,
) {
  final INT byteArrayCount = a.length;

  INT //
      i = 0,
      totalByteCount = 0;

  while (i < byteArrayCount) {
    totalByteCount += a[i++].bytes__count;
  }

  final result = byte__array(totalByteCount);

  i = 0;
  INT byteOffset = 0;
  while (i < byteArrayCount) {
    byteOffset = base__copy(
      result /*.buffer.asUint8List(byteOffset)*/,
      a[i++],
      dest__offset: byteOffset,
    ).dest__offset__new;
  }

  return result;
}

class bytes___compo {
  bytes___compo(
    this.bytes, [
    this.bytes__offset = 0,
  ]);

  final byte__array bytes;

  INT bytes__offset;

  BOOL get iterate___ok => //
      (bytes__offset < bytes.bytes__count);

  byte__array bytes__view__full() => //
      bytes.view(
        bytes__offset,
      );

  INT read__INT__fixed(
    final INT size,
  ) {
    final value = bytes
        .view(
          bytes__offset,
        )
        .convert__INT__endian__little(
          size,
        );

    bytes__offset += size;

    return value;
  }

  INT? read__INT__fixed__nilable(
    final INT size,
  ) {
    final value = read__INT__fixed(
      size,
    );

    return ((value != 0) //
        ? (value - 1)
        : NIL);
  }

  INT__NEG read__INT__NEG__fixed(
    final INT size,
  ) =>
      read__INT__NEG__fixed(
        size,
      );

  INT__bytes__convert__result___compo read__INT() {
    final result = INT__bytes__convert(
      bytes.view(
        bytes__offset,
      ),
    );

    bytes__offset += result.count;

    return result;
  }

  INT__NEG__bytes__convert__result___compo read__INT__NEG() => //
      read__INT__NEG();

  ({
    INT? value,
    INT count,
  }) read__INT__nilable() {
    final result = read__INT();

    return (
      value: ((result.value != 0) //
          ? (result.value - 1)
          : NIL),
      count: result.count,
    );
  }

  BS1 read__byte__idempotent() => //
      bytes[bytes__offset];

  BS1 read__byte() => //
      bytes[bytes__offset++];

  byte__array read__view__partial(
    final INT count,
  ) {
    final offset = bytes__offset;

    bytes__offset += count;

    return bytes.view__partial(
      offset,
      count,
    );
  }

  byte__array? read__view__partial__auto__nilable([
    final INT? count__size,
  ]) {
    final count = ((count__size != null) //
        ? read__INT__fixed(
            count__size,
          )
        : read__INT().value);

    return ((count != 0)
        ? read__view__partial(
            count,
          )
        : NIL);
  }

  byte__array read__view__partial__auto([
    final INT? count__size,
  ]) =>
      (read__view__partial__auto__nilable(
            count__size,
          ) ??
          empty__byte__array);

  byte__array? read__view__partial__auto__definitive__nilable /*
`:view` including the `bytes:count` ,as well as `bytes` */
      () {
    final //
        bytes__offset_ = bytes__offset,
        count = INT__bytes__convert(
          bytes.view(
            bytes__offset_,
          ),
        ),
        count_ = count.value;

    if (count_ == 0) {
      bytes__offset += count.count;
      return NIL;
    }

    final count__ = (count_ + count.count);

    bytes__offset += count__;

    return bytes.view__partial(
      bytes__offset_,
      count__,
    );
  }

  byte__array read__view__partial__auto__definitive() => //
      (read__view__partial__auto__definitive__nilable() ?? empty__byte__array);

  /*byte__array read__view__partial__till(
    final by b,
  ) /*
  result is, previous to, 1st occurance
    while, offset__new is, next to, instead of previous
      hence the index, of occurance, is ignored */
  {
    byte__array result = empty__byte__array;

    array__iterate(
      bytes,
      (final element__id, final element) {
        if (element != b) {
          return OK;
        }

        final count = (element__id - bytes__offset);
        if (count != 0) {
          final offset = bytes__offset;

          bytes__offset += (count + 1);

          result = bytes.view__partial(
            offset,
            count,
          );
        }

        return NO;
      },
      offset: bytes__offset,
    );

    return result;
  }*/
}

void byte__array__fill(
  final byte__array dest, {
  final INT? count,
  final BS1 value = 0,
}) =>
    dest.fill(
      value,
      count: count,
    );

extension byte__array__extension on byte__array {
  INT get bytes__count => //
      lengthInBytes;

  byte__array view__partial(
    final INT offset,
    final INT count,
  ) {
    return buffer.asUint8List(
      (offset + offsetInBytes),
      count,
    );
  }

  byte__array view(
    final INT offset,
  ) {
    return view__partial(
      offset,
      (bytes__count - offset),
    );
  }

  byte__array separate(
    final INT offset,
    final INT count,
  ) {
    return /*sublist(offset,(count+offset),)*/ byte__array__create(
      view__partial(
        offset,
        count,
      ),
      count: count,
    );
  }

  INT convert__INT__endian__little(
    final INT value__size,
  ) {
    var //
        result = 0,
        offset = 0;

    do {
      result |= (this[offset] << (offset * BS1__width));
    } while ((offset += 1) < value__size);

    /*while (bytes__offset < value__size) {
    result |= (bytes[bytes__offset] << (bytes__offset++ * BS1__width));
  }*/ /* equal result as above loop */

    return result;
  }

  INT convert__INT__endian__big(
    final INT value__size,
  ) {
    var //
        result = 0,
        offset = 0;

    do {
      result <<= BS1__width;
      result |= this[offset];
    } while ((offset += 1) < value__size);

    return result;
  }
}
