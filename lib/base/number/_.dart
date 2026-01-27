part of "../_.dart";

BOOL //
num__range__contains //
<value__type extends num>(
  final value__type value,
  final value__type beginning,
  final value__type ending,
) {
  return ((value < beginning) || //
          (value > ending))
      .NOT;
}
