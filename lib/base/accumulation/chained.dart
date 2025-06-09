part of "../_.dart";

class base__accumulation__chained /*
singly chained (backward ref.ing) list */ //
    <element__type extends Object?> //
    implements
        base__dispose___protocol {
  base__accumulation__chained() //
      : element__last__raw = NIL,
        elements__count__raw = 0;

  base__accumulation__chained__element<element__type>? //
      element__last__raw;

  NIMR //
      elements__count__raw;

  NIMR elements__count() {
    return elements__count__raw;
  }

  BOOL empty__ok() {
    return (elements__count() == 0);
  }

  BOOL empty__not() {
    return (elements__count() != 0);
  }

  base__accumulation__chained__element<element__type>? element__last() {
    return element__last__raw;
  }

  void add__ending(
    final element__type value,
  ) {
    element__last__raw = base__accumulation__chained__element(
      value,
      previous__raw: element__last__raw,
    );

    elements__count__raw += 1;
  }

  void remove__last() {
    final element__last_1 = element__last__raw;

    if (element__last_1 == null) {
      return NIL;
    }

    element__last__raw = element__last_1.previous__raw;

    elements__count__raw -= 1;
  }

  void iterate(
    final BOOL Function(base__accumulation__chained__element<element__type> element) element__handle,
  ) {
    var element = element__last__raw;

    while (element != null) {
      final iterate__ok = element__handle(
        element,
      );

      if (iterate__ok.not) {
        break;
      }

      element = element.previous__raw;
    }
  }

  BOOL present__ok(
    final element__type element,
    final base__value__equal__ok__function__format<element__type,element__type> equal__ok,
  ) {
    var present__ok = NO;

    iterate(
      (final element_1) {
        final equal__ok_1 = equal__ok(
          element,
          element_1.value,
        );

        if (equal__ok_1.not) {
          return OK;
        }

        present__ok = OK;

        return NO;
      },
    );

    return present__ok;
  }

  array<element__type> convert__array /*
TASK
  eliminate intermediate conversion to `base__accumulation__linear__basic`
    also in `base__accumulation__linked` */
      () {
    if (empty__ok()) {
      return array__new__empty();
    }

    final accumulation = base__accumulation__linear__basic<element__type>(
      capacity__initial: elements__count(),
    );

    iterate(
      (final e) {
        accumulation.add__ending(
          e.value,
        );

        return OK;
      },
    );

    final result = accumulation.convert__array();

    accumulation.dispose();

    return result;
  }

  void flush() {
    element__last__raw = NIL;
    elements__count__raw = 0;
  }

  @override
  void dispose() {
    if (empty__ok()) {
      return;
    }

    flush();
  }
}

class base__accumulation__chained__element //
    <element__type extends Object?> {
  base__accumulation__chained__element(
    this.value, {
    required this.previous__raw,
  });

  final element__type value;

  base__accumulation__chained__element<element__type>? previous__raw;
}
