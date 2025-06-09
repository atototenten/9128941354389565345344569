part of "../_.dart";

class base__accumulation__linked /*
singly linked (forward ref.ing) list */ //
    <element__type extends Object?> //
    implements
        base__dispose___protocol {
  base__accumulation__linked() //
      : element__first__raw = NIL,
        element__last__raw = NIL,
        elements__count__raw = 0;

  base__accumulation__linked__element<element__type>? //
      element__first__raw,
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

  base__accumulation__linked__element<element__type>? element__first() {
    return element__first__raw;
  }

  base__accumulation__linked__element<element__type>? element__last() {
    return element__last__raw;
  }

  void add__beginning /* add to front (prepend) */ (
    final element__type value,
  ) {
    final only__ok = empty__ok();

    element__first__raw = base__accumulation__linked__element<element__type>(
      value,
      next__raw: element__first__raw,
    );

    if /*F*/ (only__ok) {
      element__last__raw = element__first__raw;
    }

    elements__count__raw += 1;
  }

  void add__ending /* add to rear (append) */ (
    final element__type value,
  ) {
    final element = base__accumulation__linked__element<element__type>(
      value,
      next__raw: NIL,
    );

    if /*F*/ (empty__ok()) /*
`element` is first and only */
    {
      element__first__raw = element;
    } else {
      element__last__raw!.next__raw = element;
    }

    element__last__raw = element;

    elements__count__raw += 1;
  }

  void remove__first() {
    if (empty__ok()) {
      return;
    }

    element__first__raw = element__first__raw?.next__raw;

    elements__count__raw -= 1;

    if (empty__ok()) {
      element__last__raw = NIL;
    }
  }

  /*void remove__last();*/ /*
not impl.ed ,due to being in-efficient for the data-struct.
if necessary ,prefer using `base__accumulation__chained` ,or the non-lazy default accumulation */

  void iterate(
    final BOOL Function(base__accumulation__linked__element<element__type> element) element__handle,
  ) {
    var element = element__first__raw;

    while (element != null) {
      final iterate__ok = element__handle(
        element,
      );

      if (iterate__ok.not) {
        break;
      }

      element = element.next__raw;
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
    also in `base__accumulation__chained` */
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
    element__first__raw = NIL;
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

class base__accumulation__linked__element //
    <element__type extends Object?> {
  base__accumulation__linked__element(
    this.value, {
    required this.next__raw,
  });

  final element__type value;

  base__accumulation__linked__element<element__type>? next__raw;
}

void base__accumulation__linked__test() {
  final accumulation = base__accumulation__linked<NIMR>();

  void accumulation__print(
    final string__raw title,
  ) {
    title.print();
    "accumulation".print();

    base__printing__indent();

    accumulation
      ..elements__count__raw.text__representation().print("..elements__count")
      ..convert__array().join(" ").text__representation().print("..elements")
      ..element__first__raw?.value.text__representation().print("..element__first")
      ..element__last__raw?.value.text__representation().print("..element__last");

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
