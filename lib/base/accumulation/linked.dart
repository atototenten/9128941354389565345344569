part of "../_.dart";

class base__accumulation__linked /*
singly linked (forward ref.ing) list */ //
    <element__type extends Object?> //
    implements
        base__dispose___protocol {
  base__accumulation__linked() //
      : element__first___raw = NIL,
        element__last___raw = NIL,
        elements__count___raw = 0;

  base__accumulation__linked__element<element__type>? //
      element__first___raw,
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

  base__accumulation__linked__element<element__type>? element__first() {
    return element__first___raw;
  }

  base__accumulation__linked__element<element__type>? element__last() {
    return element__last___raw;
  }

  void add__beginning /* add to front (prepend) */ (
    final element__type value,
  ) {
    final only___ok = empty___ok();

    element__first___raw = base__accumulation__linked__element<element__type>(
      value,
      next___raw: element__first___raw,
    );

    if /*F*/ (only___ok) {
      element__last___raw = element__first___raw;
    }

    elements__count___raw += 1;
  }

  void add__ending /* add to rear (append) */ (
    final element__type value,
  ) {
    final element = base__accumulation__linked__element<element__type>(
      value,
      next___raw: NIL,
    );

    if /*F*/ (empty___ok()) /*
`element` is first and only */
    {
      element__first___raw = element;
    } else {
      element__last___raw!.next___raw = element;
    }

    element__last___raw = element;

    elements__count___raw += 1;
  }

  void remove__first() {
    if (empty___ok()) {
      return;
    }

    element__first___raw = element__first___raw?.next___raw;

    elements__count___raw -= 1;

    if (empty___ok()) {
      element__last___raw = NIL;
    }
  }

  /*void remove__last();*/ /*
not impl.ed ,due to being in-efficient for the data-struct.
if necessary ,prefer using `base__accumulation__chained` ,or the non-lazy default accumulation */

  void iterate(
    final BOOL Function(base__accumulation__linked__element<element__type> element) element__handle,
  ) {
    var element = element__first___raw;

    while (element != null) {
      final iterate___ok = element__handle(
        element,
      );

      if (iterate___ok.not) {
        break;
      }

      element = element.next___raw;
    }
  }

  BOOL present___ok(
    final element__type element,
    final base__value__equality__function__format<element__type,element__type> equal___ok,
  ) {
    var present___ok = NO;

    iterate(
      (final element_1) {
        final equal__ok_1 = equal___ok(
          element,
          element_1.value,
        );

        if (equal__ok_1.not) {
          return OK;
        }

        present___ok = OK;

        return NO;
      },
    );

    return present___ok;
  }

  array<element__type> convert__array /*
TASK
  eliminate intermediate conversion to `base__accumulation__linear__basic`
    also in `base__accumulation__chained` */
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

        return OK;
      },
    );

    final result = accumulation.convert__array();

    accumulation.dispose();

    return result;
  }

  void flush() {
    element__first___raw = NIL;
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

class base__accumulation__linked__element //
    <element__type extends Object?> {
  base__accumulation__linked__element(
    this.value, {
    required this.next___raw,
  });

  final element__type value;

  base__accumulation__linked__element<element__type>? next___raw;
}

void base__accumulation__linked__test() {
  final accumulation = base__accumulation__linked<INT>();

  void accumulation__print(
    final string title,
  ) {
    title.print();
    "accumulation".print();

    base__printing__indent();

    accumulation
      ..elements__count___raw.representation__text().print("..elements__count")
      ..convert__array().join(" ").representation__text().print("..elements")
      ..element__first___raw?.value.representation__text().print("..element__first")
      ..element__last___raw?.value.representation__text().print("..element__last");

    base__printing__indent__de();

    base__print__blank();
  }

  accumulation__print("begin");

  base__iterate__reverse__basic(
    4,
    (final i) {
      accumulation.add__beginning(i);
      accumulation__print("add__beginning : $i");
    },
  );

  base__iterate__basic(
    4,
    (final i) {
      accumulation.add__ending(i);
      accumulation__print("add__ending : $i");
    },
    offset: 4,
  );

  base__iterate__reverse__basic(
    accumulation.elements__count(),
    (final i) {
      accumulation.remove__first();
      accumulation__print("removal");
    },
  );

  accumulation__print("end");
}
