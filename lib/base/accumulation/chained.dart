part of "../_.dart";

class base__accumulation__chained /*
singly chained (backward ref.ing) list */ //
    <element__type extends Object?> //
    implements
        base__dispose___protocol {
  base__accumulation__chained() //
      : element__last___raw = NIL,
        elements__count___raw = 0;

  base__accumulation__chained__element<element__type>? //
      element__last___raw;

  INT //
      elements__count___raw;

  INT elements__count() {
    return elements__count___raw;
  }

  BOOL empty___ok() {
    return (elements__count() == 0);
  }

  BOOL empty__not() {
    return (elements__count() != 0);
  }

  base__accumulation__chained__element<element__type>? element__last() {
    return element__last___raw;
  }

  void add__ending(
    final element__type value,
  ) {
    element__last___raw = base__accumulation__chained__element(
      value,
      previous___raw: element__last___raw,
    );

    elements__count___raw += 1;
  }

  void remove__last() {
    final element__last_1 = element__last___raw;

    if (element__last_1 == null) {
      return NIL;
    }

    element__last___raw = element__last_1.previous___raw;

    elements__count___raw -= 1;
  }

  void iterate(
    final BOOL Function(base__accumulation__chained__element<element__type> element) element__handle,
  ) {
    var element = element__last___raw;

    while (element != null) {
      final iterate___ok = element__handle(
        element,
      );

      if (iterate___ok.NOT) {
        break;
      }

      element = element.previous___raw;
    }
  }

  BOOL present___ok(
    final element__type element,
    final base__value__equality__function__format<element__type,element__type> equal___ok,
  ) {
    var present___ok = FALSE;

    iterate(
      (final element_1) {
        final equal__ok_1 = equal___ok(
          element,
          element_1.value,
        );

        if (equal__ok_1.NOT) {
          return TRUE;
        }

        present___ok = TRUE;

        return FALSE;
      },
    );

    return present___ok;
  }

  ARRAY<element__type> convert__array /*
TASK
  eliminate intermediate conversion to `base__accumulation__linear__basic`
    also in `base__accumulation__linked` */
      () {
    if (empty___ok()) {
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

        return TRUE;
      },
    );

    final result = accumulation.convert__array();

    accumulation.dispose();

    return result;
  }

  void flush() {
    element__last___raw = NIL;
    elements__count___raw = 0;
  }

  @override
  void dispose() {
    if (empty___ok()) {
      return;
    }

    flush();
  }
}

class base__accumulation__chained__element //
    <element__type extends Object?> {
  base__accumulation__chained__element(
    this.value, {
    required this.previous___raw,
  });

  final element__type value;

  base__accumulation__chained__element<element__type>? previous___raw;
}
