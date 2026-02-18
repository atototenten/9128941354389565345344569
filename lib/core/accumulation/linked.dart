part of "../_.dart";

class accumulation__linked___compo /*
singly linked (forward ref.ing) list */ //
<element___type extends Object?> //
    implements dispose___protocol {
  accumulation__linked___compo() //
    : _element__first = NIL,
      _element__last = NIL,
      _elements__count = 0;

  accumulation__linked__element<element___type>? //
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

  accumulation__linked__element<element___type>? element__first() {
    return _element__first;
  }

  accumulation__linked__element<element___type>? element__last() {
    return _element__last;
  }

  void add__beginning /* add to front (prepend) */ (
    final element___type value,
  ) {
    final only___ok = empty___ok();

    _element__first = accumulation__linked__element<element___type>(
      value,
      next: _element__first,
    );

    if /*F*/ (only___ok) {
      _element__last = _element__first;
    }

    _elements__count += 1;
  }

  void add__ending /* add to rear (append) */ (
    final element___type value,
  ) {
    final element = accumulation__linked__element<element___type>(
      value,
      next: NIL,
    );

    if /*F*/ (empty___ok()) /*
`element` is first and only */ {
      _element__first = element;
    } else {
      _element__last!._next = element;
    }

    _element__last = element;

    _elements__count += 1;
  }

  void remove__first() {
    if (empty___ok()) {
      return;
    }

    _element__first = _element__first?._next;

    _elements__count -= 1;

    if (empty___ok()) {
      _element__last = NIL;
    }
  }

  /*void remove__last();*/ /*
not impl.ed ,due to being in-efficient for the data-struct.
if necessary ,prefer using `accumulation__chained` ,or the non-lazy default accumulation */

  void iterate(
    final BOOL Function(accumulation__linked__element<element___type> element) element__handle,
  ) {
    var element = _element__first;

    while (element != null) {
      final iterate___ok = element__handle(
        element,
      );

      if (iterate___ok.NOT) {
        break;
      }

      element = element._next;
    }
  }

  BOOL present___ok(
    final element___type element,
    final value__equality___procedure__format<element___type, element___type> equal___ok,
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
  eliminate intermediate conversion to `accumulation__linear__basic___compo`
    also in `accumulation__chained` */ () {
    if (empty___ok()) {
      return ARRAY__empty();
    }

    final accumulation = accumulation__linear__basic___compo<element___type>(
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

class accumulation__linked__element //
<element___type extends Object?> {
  accumulation__linked__element(
    this.value, {
    required final accumulation__linked__element<element___type>? next,
  }) : _next = next;

  final element___type value;

  accumulation__linked__element<element___type>? _next;
}

void accumulation__linked__test() {
  final accumulation = accumulation__linked___compo<INT>();

  void accumulation__print(
    final string title,
  ) {
    title.print();
    "accumulation".print();

    printing__indent();

    accumulation
      .._elements__count.representation__text().print("..elements__count")
      ..convert__array().join(" ").representation__text().print("..elements")
      .._element__first?.value.representation__text().print("..element__first")
      .._element__last?.value.representation__text().print("..element__last");

    printing__indent__de();

    print__blank();
  }

  accumulation__print("begin");

  ITERATE__backwards(
    4,
    (final i) {
      accumulation.add__beginning(i);
      accumulation__print("add__beginning : $i");

      return TRUE;
    },
  );

  ITERATE__forwards(
    4,
    (final i) {
      accumulation.add__ending(i);
      accumulation__print("add__ending : $i");

      return TRUE;
    },
    offset: 4,
  );

  ITERATE__backwards(
    accumulation.elements__count(),
    (final i) {
      accumulation.remove__first();
      accumulation__print("removal");

      return TRUE;
    },
  );

  accumulation__print("end");
}
