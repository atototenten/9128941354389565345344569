part of "../_.dart";

class base__accumulation__linked___compo /*
singly linked (forward ref.ing) list */ //
    <element___type extends Object?> //
    implements
        base__dispose___protocol {
  base__accumulation__linked___compo() //
      : _element__first = NIL,
        _element__last = NIL,
        _elements__count = 0;

  base__accumulation__linked__element<element___type>? //
      _element__first,
      _element__last;

  INT //
      _elements__count;

  INT elements__count() {
    return _elements__count;
  }

  BOOL empty___ok() {
    return (elements__count() == 0);
  }

  base__accumulation__linked__element<element___type>? element__first() {
    return _element__first;
  }

  base__accumulation__linked__element<element___type>? element__last() {
    return _element__last;
  }

  void add__beginning /* add to front (prepend) */ (
    final element___type value,
  ) {
    final only___ok = empty___ok();

    _element__first = base__accumulation__linked__element<element___type>(
      value,
      next___raw: _element__first,
    );

    if /*F*/ (only___ok) {
      _element__last = _element__first;
    }

    _elements__count += 1;
  }

  void add__ending /* add to rear (append) */ (
    final element___type value,
  ) {
    final element = base__accumulation__linked__element<element___type>(
      value,
      next___raw: NIL,
    );

    if /*F*/ (empty___ok()) /*
`element` is first and only */
    {
      _element__first = element;
    } else {
      _element__last!.next___raw = element;
    }

    _element__last = element;

    _elements__count += 1;
  }

  void remove__first() {
    if (empty___ok()) {
      return;
    }

    _element__first = _element__first?.next___raw;

    _elements__count -= 1;

    if (empty___ok()) {
      _element__last = NIL;
    }
  }

  /*void remove__last();*/ /*
not impl.ed ,due to being in-efficient for the data-struct.
if necessary ,prefer using `base__accumulation__chained` ,or the non-lazy default accumulation */

  void iterate(
    final BOOL Function(base__accumulation__linked__element<element___type> element) element__handle,
  ) {
    var element = _element__first;

    while (element != null) {
      final iterate___ok = element__handle(
        element,
      );

      if (iterate___ok.NOT) {
        break;
      }

      element = element.next___raw;
    }
  }

  BOOL present___ok(
    final element___type element,
    final base__value__equality__function__format<element___type, element___type> equal___ok,
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

  ARRAY<element___type> convert__array /*
TASK
  eliminate intermediate conversion to `base__accumulation__linear__basic`
    also in `base__accumulation__chained` */
      () {
    if (empty___ok()) {
      return array__new__empty();
    }

    final accumulation = base__accumulation__linear__basic<element___type>(
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
    _element__first = NIL;
    _element__last = NIL;

    _elements__count = 0;
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
    <element___type extends Object?> {
  base__accumulation__linked__element(
    this.value, {
    required this.next___raw,
  });

  final element___type value;

  base__accumulation__linked__element<element___type>? next___raw;
}

void base__accumulation__linked__test() {
  final accumulation = base__accumulation__linked___compo<INT>();

  void accumulation__print(
    final string title,
  ) {
    title.print();
    "accumulation".print();

    base__printing__indent();

    accumulation
      .._elements__count.representation__text().print("..elements__count")
      ..convert__array().join(" ").representation__text().print("..elements")
      .._element__first?.value.representation__text().print("..element__first")
      .._element__last?.value.representation__text().print("..element__last");

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
