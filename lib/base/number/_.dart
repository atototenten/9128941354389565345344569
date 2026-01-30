part of "../_.dart";

BOOL //
num__range__contains //
<value___type extends num>(
  final value___type value,
  final value___type beginning,
  final value___type ending,
) {
  return ((value < beginning) || //
          (value > ending))
      .NOT;
}
