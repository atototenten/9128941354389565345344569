part of "../_.dart";

extension base__byte__array__accumulation__linear__extension //
    on base__accumulation__linear__base<byte__array> {
  byte__array convert__byte__array() {
    var bytes__count = 0;

    iterate(
      (final id, final e) {
        bytes__count += e.bytes__count;

        return OK;
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

        return OK;
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

  final accumulation__raw = base__accumulation__linear__basic<byte__array>();

  var bytes__count__raw = 0;

  NIMR bytes__count() {
    return bytes__count__raw;
  }

  NIMR byte__next__offset() {
    return bytes__count__raw;
  }

  void flush() {
    accumulation__raw.flush();
    bytes__count__raw = 0;
  }

  void shrink() {
    accumulation__raw.shrink();
  }

  void add(
    final byte__array bytes,
  ) {
    accumulation__raw.add__ending(
      bytes,
    );

    bytes__count__raw += bytes.bytes__count;
  }

  void add__byte(
    final BS1 b,
  ) {
    accumulation__raw.add__ending(
      b.NI1__convert__byte__array(),
    );

    bytes__count__raw += 1;
  }

  void add__NI__fixed(
    final NIMR value,
    final NIMR value__size,
  ) {
    accumulation__raw.add__ending(
      value.convert__byte__array__endian__little(
        value__size,
      ),
    );

    bytes__count__raw += value__size;
  }

  void add__NI(
    final NIMR value,
  ) =>
      add(
        value.convert__bytes(),
      );

  void add__NI__fixed__nilable(
    final NIMR? value,
    final NIMR value__size,
  ) =>
      ((value != null) //
          ? add__NI__fixed(
              (value + 1),
              value__size,
            )
          : add__byte(0));

  void add__NI__nilable(
    final NIMR? value,
  ) =>
      ((value != null) //
          ? add__NI(
              (value + 1),
            )
          : add__byte(0));

  void add__NIS__fixed(
    final NISMR value,
    final NIMR value__size,
  ) =>
      add__NI__fixed(
        value,
        value__size,
      );

  void add__NIS(
    final NISMR value,
  ) =>
      add__NI(
        value,
      );

  byte__array convert__byte__array({
    byte__array? bytes,
  }) {
    bytes ??= byte__array(
      bytes__count__raw,
    );

    accumulation__raw.copy__byte__array(
      bytes,
    );

    return bytes;
  }

  /* string__raw convert__str([final BOOL b_verbose = NO]) {
    NIMR //
        counter = 0,
        byteOffset = 0;

    final buffer = StringBuffer();

    ls.iterate__basic(
      (final byte__array bytes) {
        final NIMR byteCount = bytes.length;

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
    accumulation__raw.dispose();
  }
}
