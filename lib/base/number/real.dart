part of "../_.dart";

class number__real__fixed_point__raw {
  static const //
      point__default = 8;

  const number__real__fixed_point__raw(
    this.value, {
    this.point = point__default,
  });

  number__real__fixed_point__raw.NEMR__convert(
    final NEMR value, {
    this.point = point__default,
  }) : value = (value / point).truncate();

  final NIMR point;
  final NISMR value;

  NEMR convert__NE /*
1 -> 0.125
2 -> 0.25
3 -> 0.375
4 -> 0.5
5 -> 0.625
6 -> 0.75
7 -> 0.875
8 -> 1.0
9 -> 1.125 */
      () {
    return (value.toDouble() / point);
  }
}
