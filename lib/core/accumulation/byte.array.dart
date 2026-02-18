part of "../_.dart";

extension byte__array__accumulation__linear__extension //
    on accumulation__linear___compo__base<byte__array> {
  byte__array convert__byte__array() {
    var bytes__count = 0;

    this.iterate(
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

    this.iterate(
      (final id, final e) {
        bytes__offset = copy(
          bytes,
          e,
          dest__offset: bytes__offset,
        ).dest__offset__new;

        return TRUE;
      },
    );
  }
}

class byte__array__accumulation___compo /*
[byte-]arrays can be added
  ,by first adding the elements-count
    ,then the elements */ //
    implements
        dispose___protocol {
  byte__array__accumulation___compo();

  final _accumulation = accumulation__linear__basic___compo<byte__array>();

  var _bytes__count = 0;

  INT bytes__count() {
    return _bytes__count;
  }

  INT byte__next__offset() {
    return _bytes__count;
  }

  void flush() {
    _accumulation.flush();
    _bytes__count = 0;
  }

  void shrink() {
    _accumulation.shrink();
  }

  void add(
    final byte__array bytes,
  ) {
    _accumulation.add__ending(
      bytes,
    );

    _bytes__count += bytes.bytes__count;
  }

  void add__byte(
    final BS1 b,
  ) {
    _accumulation.add__ending(
      b.INT__1__convert__byte__array(),
    );

    _bytes__count += 1;
  }

  void add__INT__fixed(
    final INT value,
    final INT value__size,
  ) {
    _accumulation.add__ending(
      value.convert__byte__array__endian__little(
        value__size,
      ),
    );

    _bytes__count += value__size;
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
      _bytes__count,
    );

    _accumulation.copy__byte__array(
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
    _accumulation.dispose();
  }
}
