part of "_.dart";

Iterable<element___type> base__elements__generate<element___type>(
  final INT count /*
excluding "separation"s */,
  final element___type separation,
  final element___type Function(INT element__id) element,
) {
  if (count == 0) {
    return Iterable.empty();
  }

  return () sync* {
    final iterations__count = ((count * 2) - 1);
    for (var i = 0; i < iterations__count; i += 1) {
      if (i.isOdd) {
        yield separation;

        continue;
      }

      yield element(i ~/ 2);
    }
  }();
}

Iterable<element___type> base__elements__generate__definitive /*
usage : {
  const //
      radius__outer = 16.0,
      radius__inner = 8.0;

  if (first___ok && last___ok) {
    return BorderRadius.all(Radius.circular(12));
  }

  if (first___ok) {
    return BorderRadius.vertical(
      top: Radius.circular(radius__outer),
      bottom: Radius.circular(radius__inner),
    );
  }

  if (last___ok) {
    return BorderRadius.vertical(
      top: Radius.circular(radius__inner),
      bottom: Radius.circular(radius__outer),
    );
  }

  return BorderRadius.all(Radius.circular(radius__inner));
} */ <element___type>({
  required final INT elements__count /*
excluding {".title" ,".separation__title__and__element" ,and ".elements__separation"} */,
  final element___type? separation__leading__and__elements,
  required final element___type separation__elements,
  required final element___type leading,
  required final element___type Function(INT element__id, BOOL first___ok, BOOL last___ok) element /*
first/last elements do not have separate generation proc.s
  because an element can be both {first and last} ,if its the only element */,
}) {
  return switch (elements__count) {
    0 => [
      leading,
      (separation__leading__and__elements ?? separation__elements),
    ],
    1 => [
      leading,
      (separation__leading__and__elements ?? separation__elements),
      element(0, OK, OK),
    ],
    2 => [
      leading,
      (separation__leading__and__elements ?? separation__elements),
      element(0, OK, NO),
      separation__elements,
      element(1, NO, OK),
    ],
    _ /* 3+ */ => [
      leading,
      (separation__leading__and__elements ?? separation__elements),
      element(0, OK, NO),
      separation__elements,
      ...() sync* {
        final elements__count_1 = (((elements__count - 2 /* because the first/last elements are handled separately */ ) * 2 /* for ".elements__separation"s */ ) - 1 /* to exclude the ".elements__separation" after the last-element */ );

        for (var i = 0; i < elements__count_1; i += 1) {
          if (i.isOdd) {
            yield separation__elements;

            continue;
          }

          yield element(((i ~/ 2) + 1 /* to offset the first-element */ ), NO, NO);
        }
      }(),
      separation__elements,
      element((elements__count - 1), NO, OK),
    ],
  };
}

extension Iterable___extension<element___type> //
    on Iterable<element___type> {
  Iterable<element__new__type> //
  convert<element__new__type> //
  (final element__new__type Function(element___type) operate) {
    return map<element__new__type>(operate);
  }

  array<element___type> //
  convert__array() {
    return toList(growable: NO);
  }

  Iterable<element___type> //
  select //
  (final BOOL Function(element___type) operate) {
    return where(operate);
  }

  BOOL empty___ok() {
    return isEmpty;
  }
}
