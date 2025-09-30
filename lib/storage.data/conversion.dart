part of "_.dart";

extension number__integer__conversion__byte__array__extension //
    on INT {
  BS1__array //
      cast__byte__array(
    final number__size size,
  ) {
    return convert__byte__array__endian__little(
      size.size,
    );
  }
}

extension byte__array__conversion__number__integer__extension //
    on BS1__array {
  INT //
      cast__number__integer(
    final number__size size,
  ) {
    return convert__INT__endian__little(
      size.size,
    );
  }
}
