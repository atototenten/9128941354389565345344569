part of "../_.dart";

class base__number__real__fixed_point___raw {
  static const //
      point__default = 8;

  const base__number__real__fixed_point___raw(
    this.value, {
    this.point = point__default,
  });

  base__number__real__fixed_point___raw.APPROX__convert(
    final APPROX value, {
    this.point = point__default,
  }) : value = (value / point).truncate();

  final INT point;
  final INT__NEG value;

  APPROX convert__APPROX /*
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
