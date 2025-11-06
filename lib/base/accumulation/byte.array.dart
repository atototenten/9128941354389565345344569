part of "../_.dart";

extension base__byte__array__accumulation__linear__extension //
    on base__accumulation__linear__base<byte__array> {
  byte__array convert__byte__array() {
    var bytes__count = 0;

    iterate(
      (final id, final e) {
        bytes__count += e.bytes__count;

        return TRUE;
      },
    );

    final result = byte__array(
      bytes__count,
    );

    copy__byte__array(
      result,
    );

    return result;
  }

  void copy__byte__array(
    final byte__array bytes,
  ) {
    var bytes__offset = 0;

    iterate(
      (final id, final e) {
        bytes__offset = base__copy(
          bytes,
          e,
          dest__offset: bytes__offset,
        ).dest__offset__new;

        return TRUE;
      },
    );
  }
}

class base__byte__array__accumulation /*
[byte-]arrays can be added
  ,by first adding the elements-count
    ,then the elements */ //
    implements
        base__dispose___protocol {
  base__byte__array__accumulation();

  final accumulation___raw = base__accumulation__linear__basic<byte__array>();

  var bytes__count___raw = 0;

  INT bytes__count() {
    return bytes__count___raw;
  }

  INT byte__next__offset() {
    return bytes__count___raw;
  }

  void flush() {
    accumulation___raw.flush();
    bytes__count___raw = 0;
  }

  void shrink() {
    accumulation___raw.shrink();
  }

  void add(
    final byte__array bytes,
  ) {
    accumulation___raw.add__ending(
      bytes,
    );

    bytes__count___raw += bytes.bytes__count;
  }

  void add__byte(
    final BS1 b,
  ) {
    accumulation___raw.add__ending(
      b.INT__1__convert__byte__array(),
    );

    bytes__count___raw += 1;
  }

  void add__INT__fixed(
    final INT value,
    final INT value__size,
  ) {
    accumulation___raw.add__ending(
      value.convert__byte__array__endian__little(
        value__size,
      ),
    );

    bytes__count___raw += value__size;
  }

  void add__INT(
    final INT value,
  ) =>
      add(
        value.convert__bytes(),
      );

  void add__INT__fixed__nilable(
    final INT? value,
    final INT value__size,
  ) =>
      ((value != null) //
          ? add__INT__fixed(
              (value + 1),
              value__size,
            )
          : add__byte(0));

  void add__INT__nilable(
    final INT? value,
  ) =>
      ((value != null) //
          ? add__INT(
              (value + 1),
            )
          : add__byte(0));

  void add__INT__NEG__fixed(
    final INT__NEG value,
    final INT value__size,
  ) =>
      add__INT__fixed(
        value,
        value__size,
      );

  void add__INT__NEG(
    final INT__NEG value,
  ) =>
      add__INT(
        value,
      );

  byte__array convert__byte__array({
    byte__array? bytes,
  }) {
    bytes ??= byte__array(
      bytes__count___raw,
    );

    accumulation___raw.copy__byte__array(
      bytes,
    );

    return bytes;
  }

  /* string convert__str([final BOOL b_verbose = FALSE]) {
    INT //
        counter = 0,
        byteOffset = 0;

    final buffer = StringBuffer();

    ls.iterate__basic(
      (final byte__array bytes) {
        final INT byteCount = bytes.length;

        buffer
          ..write("id: ")
          ..write(counter += 1)
          ..write(", offset: ")
          ..write(byteOffset)
          ..write(", count: ")
          ..write(byteCount);

        if (b_verbose) {
          buffer
            ..write(", bytes: ")
            ..write(bytes);
        }

        byteOffset += byteCount;
      },
    );

    return buffer.toString();
  } */

  @override
  void dispose() {
    accumulation___raw.dispose();
  }
}
