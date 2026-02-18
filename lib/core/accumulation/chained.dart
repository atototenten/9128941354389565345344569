part of "../_.dart";

class accumulation__chained /*
singly chained (backward ref.ing) list */ //
<element___type extends Object?> //
    implements dispose___protocol {
  accumulation__chained() //
    : _element__last = NIL,
      _elements__count = 0;

  accumulation__chained__element<element___type>? //
  _element__last;

  INT //
  _elements__count;

  INT elements__count() {
    return _elements__count;
  }

  BOOL empty___ok() {
    return (elements__count() == 0);
  }

  accumulation__chained__element<element___type>? element__last() {
    return _element__last;
  }

  void add__ending(
    final element___type value,
  ) {
    _element__last = accumulation__chained__element(
      value,
      previous: _element__last,
    );

    _elements__count += 1;
  }

  void remove__last() {
    final element__last_1 = _element__last;

    if (element__last_1 == null) {
      return NIL;
    }

    _element__last = element__last_1._previous;

    _elements__count -= 1;
  }

  void iterate(
    final BOOL Function(accumulation__chained__element<element___type> element) element__handle,
  ) {
    var element = _element__last;

    while (element != null) {
      final iterate___ok = element__handle(
        element,
      );

      if (iterate___ok.NOT) {
        break;
      }

      element = element._previous;
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
    also in `accumulation__linked` */ () {
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

class accumulation__chained__element //
<element___type extends Object?> {
  accumulation__chained__element(
    this.value, {
    required final accumulation__chained__element<element___type>? previous,
  }) : _previous = previous;

  final element___type value;

  accumulation__chained__element<element___type>? _previous;
}
