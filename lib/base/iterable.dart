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
    final elements__separated__generation = base__array__elements__separated__generation__meta___compo(
      elements__count: count,
    );

    for (
      var element__id__adjusted = 0; //
      element__id__adjusted < elements__separated__generation.elements__count__adjusted; //
      element__id__adjusted += 1
    ) {
      final element__id = elements__separated__generation.element__id(
        element__id__adjusted: element__id__adjusted,
      );
      if (element__id == null) {
        yield separation;

        continue;
      }

      yield element(element__id);
    }
  }();
}

Iterable<element___type> base__elements__generate__definitive /*
- usage : {
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
}
- testing : {
base__elements__generate__definitive(
  elements__count: 5,
  separation__leading__and__elements: 111,
  separation__elements: 999,
  leading: 123,
  element: (final element__id, final first___ok, final last___ok) {
    if (first___ok) {
      return 456;
    }
    if (last___ok) {
      return 789;
    }
    return element__id;
  },
) /*= [123, 111, 456, 999, 1, 999, 2, 999, 3, 999, 789]*/
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
  final separation__leading__and__elements_1 = (separation__leading__and__elements ?? separation__elements);

  return switch (elements__count) {
    0 => [
      leading,
      separation__leading__and__elements_1,
    ],
    1 => [
      leading,
      separation__leading__and__elements_1,
      element(0, TRUE, TRUE),
    ],
    2 => [
      leading,
      separation__leading__and__elements_1,
      element(0, TRUE, FALSE),
      separation__elements,
      element(1, FALSE, TRUE),
    ],
    _ /* 3+ */ => [
      leading,
      separation__leading__and__elements_1,
      element(0, TRUE, FALSE),
      ...() sync* {
        final elements__count_1 = (elements__count - 2 /* adjusting for the {first ,and last} elements ,which are handled separately */ );

        for (var i = 0; i < elements__count_1; i += 1) {
          yield separation__elements;

          yield element((i + 1 /* to offset the first-element */ ), FALSE, FALSE);
        }
      }(),
      separation__elements,
      element((elements__count - 1), FALSE, TRUE),
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

  ARRAY<element___type> //
  convert__array() {
    return toList(growable: FALSE);
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
