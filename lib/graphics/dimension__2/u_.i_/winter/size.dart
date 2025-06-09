part of "_.dart";

void app__size__set() {}

NEMR get page__padding__left => //
    (size__pixel__padding__horizontal + base__screen__padding__permanent().left);

NEMR get page__padding__right => //
    (size__pixel__padding__horizontal + base__screen__padding__permanent().right);

NEMR get size__pixel__padding__horizontal => 8.px();
NEMR get size__pixel__padding__horizontal__double => 16.px();

NEMR get size__pixel__padding__vertical => 8.px();
NEMR get size__pixel__padding__vertical__double => 16.px();

Radius _radius(
  final NEMR value__base,
  final NIMR nest_ing__depth,
) =>
    Radius.circular(((nest_ing__depth > 0) //
            ? (value__base - (((value__base / 2) / 2) * nest_ing__depth))
            : value__base)
        .px());

Radius radius__full([
  final NIMR nest_ing__depth = 0,
]) =>
    _radius(16, nest_ing__depth);

Radius radius__half([
  final NIMR nest_ing__depth = 0,
]) =>
    _radius(8, nest_ing__depth);

SizedBox get gui__base__widget__separat_or__vertical => //
    SizedBox(height: size__pixel__padding__vertical);

SizedBox get gui__base__widget__separat_or__horizontal => //
    SizedBox(width: size__pixel__padding__horizontal);
