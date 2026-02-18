part of "../_.dart";

class array__array__accumulation__linear__basic___compo //
<
  element___type extends Object? /*
not nil-able due to dart-lang.'s deficiency
  ,of not allowing dynamic-checking for generic-type's nil-ability */
> //
    implements dispose___protocol {
  array__array__accumulation__linear__basic___compo();

  final _accumulation = accumulation__linear__basic___compo<ARRAY<element___type>>();
  var _elements__count = 0;

  INT elements__count() {
    return _elements__count;
  }

  void flush() {
    _accumulation.flush();
    _elements__count = 0;
  }

  void shrink() {
    _accumulation.shrink();
  }

  void add__ending(
    final ARRAY<element___type> elements,
  ) {
    _accumulation.add__ending(
      elements,
    );

    _elements__count += elements.elements__count;
  }

  ARRAY<element___type> convert__array() {
    final result = ARRAY__filled<element___type?>(
      _elements__count,
      NIL,
    );

    {
      var offset = 0;

      _accumulation.iterate(
        (final id, final e) {
          offset = copy(
            result,
            e,
            dest__offset: offset,
          ).dest__offset__new;

          return TRUE;
        },
      );
    }

    return ARRAY__generated(
      _elements__count,
      (final i) => result[i]!,
    );
  }

  @override
  void dispose() {
    _accumulation.dispose();
  }
}

/*class accumulation__linear__basic__fast___compo<element___type extends Object> /*
`accumulation` with element-removal capability
  ,at the cost of ,element-access efficiency (due to additional in-direct-ion ,per element) ,and in-efficient iteration
    ,still more efficient than linked-list-ing */ //
    implements
        dispose___protocol {
  accumulation__linear__basic__fast___compo({
    final INT capacity__initial__multiplier = 0,
  })  : _elements = ARRAY__filled(
          ((capacity__initial__multiplier != 0) //
              ? (accumulation__capacity__default << capacity__initial__multiplier)
              : accumulation__capacity__default),
          null,
        ),
        _elements__count = 0,
        _element__last__id = 0;

  ARRAY<element___type?> _elements;

  INT //
      _elements__count,
      _element__last__id /*
for quick `add:element` */
      ;

  void shrink() {
    if (empty___ok()) {
      _elements /*.clear()*/ = ARRAY__filled(
        accumulation__capacity__default,
        null,
      );

      _elements__count = 0;
      _element__last__id = 0;
    } else {
      final iteration = accumulation__linear__basic__fast__iteration___compo(this);

      _elements = ARRAY__generated(
        _elements__count,
        (_) => iteration.element()! /*
will be non-NIL ,because `list_.elements__count` is expected to be correct */
        ,
      ) /*
`convert__arr` can also be used */
          ;

      _element__last__id = _elements__count;
    }
  }

  BOOL present___ok(
    final element___type element,
  ) {
    var result = FALSE;

    _elements.iterate(
      (_, final e) {
        if (e == element) {
          result = TRUE;
          return FALSE;
        }

        return TRUE;
      },
    );

    return result;
  }

  void remove /*
memory-usage is not reduced */
      (
    final element___type element,
    final value__equality___procedure__format<element___type, element___type> element__equal___ok,
  ) {
    final //
        elements = _elements,
        element__id = elements.search__simple(
          (final element_) => //
              ((element_ != null) && //
                  element__equal___ok(element, element_)),
        ) /*
`list:iterate` can also be used */
        ;

    if (element__id != null) /* `element` is NOT present, in `elements` */ {
      elements[element__id] = NIL;
      _elements__count -= 1;
    }
  }

  void iterate__basic(
    final void Function(element___type element) operate, {
    final INT? count /*
must not be more than `list_.elements__count` */
    ,
  }) {
    final iteration = accumulation__linear__basic__fast__iteration___compo(this);

    iterate__basic(
      (count ?? _elements__count),
      (_) => //
          operate(
        iteration.element()!,
      ),
    );
  }

  ARRAY<element___type> convert__array() {
    var offset = 0;

    return ARRAY__generated(
      _elements__count,
      (final i) {
        var result = _elements[i + offset];

        while (result == null) {
          result = _elements[i + (offset += 1)] /*
checks not needed ,because `list_.elements__count` is expected to be correct */
              ;
        }

        return result;
      },
    ) /*
`list:iterate` can also be used */
        ;
  }

  element___type first() {
    return element(0);
  }

  element___type element(
    INT element__id,
  ) /*
more efficient ,than `convert:array`
  ,but only for a few element-access ,not full iteration
    ,otherwise `iteration` should be preferred */
  {
    element___type? result;

    _elements.iterate(
      (_, final e) {
        if (e == null) {
          return TRUE;
        }

        if (element__id == 0) {
          result = e;

          return FALSE;
        }

        element__id -= 1;

        return TRUE;
      },
    );

    if (result == null) {
      throw "$element__id(`element:id`) not present";
    }

    return result!;
  }

  accumulation__linear__basic__fast__iteration___compo iteration() /*
more efficient ,than `element`
  ,for multiple element-access ,but the iteration can only be first-to-last */
  {
    return accumulation__linear__basic__fast__iteration___compo(
      this,
    );
  }

  @override
  void dispose() {
    flush();
    shrink();
  }
}

class accumulation__linear__basic__fast__iteration___compo /*:forward*/ <element___type extends Object> /*
`flush` must be called ,after calling `_accumulation::accumulation:remove:element` */ //
    implements
        dispose___protocol {
  accumulation__linear__basic__fast__iteration___compo(
    _accumulation,
  ) : _element__id = 0;

  final accumulation__linear__basic__fast___compo<element___type> _accumulation;

  INT _element__id;

  element___type? element /*:next*/ () {
    element___type? result;

    _accumulation._elements.iterate(
      (final element__id, final element) {
        if /*F*/ (element != null) {
          result = element;
          _element__id = (1 + element__id);

          return FALSE;
        }

        return true;
      },
      offset: _element__id,
    );

    return result;
  }

  element___type? iterate() => //
      element();

  void flush() {
    _element__id = 0;
  }

  @override
  void dispose() {
    flush();
  }
}

extension accumulation__linear__basic__fast___compo__test__extension //
    on accumulation__linear__basic__fast___compo<string> {
  void test() {
    void report() {
      _elements.representation__text().print("elements(${elements__count()})");
    }

    report();

    add("first");
    report();

    add("second");
    add("third");
    add("fourth");
    add("fifth");
    report();

    BOOL text__equal___ok(final string a, final string b) => (a == b);

    remove__element("second", text__equal___ok);
    report();
    remove__element("second", text__equal___ok);
    report();
    remove__element("sixth", text__equal___ok);
    report();

    convert__array().representation__text().print("convert:array");
    report();

    add("6th");
    add("7th");
    add("8th");
    add("9th");
    add("10th");
    report();

    convert__array().representation__text().print("convert:array");
    report();

    iterate__basic((final element) {
      element.representation__text().print("element");
    });
    report();

    shrink();
    report();

    flush();
    report();

    shrink();
    report();
  }
}*/

void accumulation__linear__advanced___compo__test() {
  final accum = accumulation__linear__advanced___compo<string>();

  INT accum__element__first__id() {
    return 0;
  }

  INT accum__element__middle__id() {
    return (accum.elements__count() ~/ 2);
  }

  INT accum__element__last__id() {
    return (accum.elements__count() - 1);
  }

  void accum__print(
    final string title,
  ) {
    accum //
        .convert__array()
        .representation__text()
        .print(title);
  }

  const name = "accum.";

  accum__print("blank ${name}");

  {
    const count = 10;

    for (var i = 0; i < count; i += 1) {
      accum.add__ending(i.toString());
    }

    accum__print("${name} with ${count} elements");
  }

  {
    void accum__presence__print(
      final INT element__id,
    ) {
      final element = accum.element(element__id);

      accum.present___ok(element, value__equal___ok<string>).representation__text().print("\"${element}\" present in ${name} ?");
    }

    accum__presence__print(accum__element__first__id());
    accum__presence__print(accum__element__middle__id());
    accum__presence__print(accum__element__last__id());
  }

  {
    void accum__removal__print(
      final INT element__id,
    ) {
      final element = accum.element(element__id);

      accum.remove(element__id);

      accum__print("${name} without \"${element}\"");
    }

    accum__removal__print(accum__element__first__id());
    accum__removal__print(accum__element__middle__id());
    accum__removal__print(accum__element__last__id());
  }

  /*accum.shrink();
  report();

  accum.flush();
  report();

  accum.shrink();
  report();*/
}

extension array__convert__accumulation__linear__advanced___compo__extension //
<element___type extends Object?> //
    on ARRAY<element___type> {
  accumulation__linear__advanced___compo<element___type> //
  convert__accumulation__linear() {
    final result = accumulation__linear__advanced___compo<element___type>(
      capacity__initial: elements__count,
    );

    this.iterate__forwards(
      (final e, _) {
        result.add__ending(e);

        return TRUE;
      },
    );

    return result;
  }
}

class accumulation__linear__advanced___compo /*
required because element-removal can in-validate element-ids
  and generation-id would rarely be useful
    due to generation-change being the whole point ,of an accum. */ //
<element___type extends Object?> //
    extends accumulation__linear___compo__base<element___type> {
  accumulation__linear__advanced___compo({
    super.capacity__initial,
  });

  void remove__last /*
memory-usage is not reduced */ () {
    if (_elements__count == 0) {
      throw Exception("no element ,to remove");
    }

    _elements__reduce__once();
  }

  void remove /*
- in-efficient ,due to copying */ (final INT element__id) {
    element__id__ensure__valid___raw(element__id);

    for (var i = (1 + element__id); i < _elements__count; i += 1) {
      _elements[i - 1] = _elements[i];
    }

    _elements__reduce__once();
  }

  void _elements__reduce__once() {
    _elements__count -= 1;

    _elements[_elements__count] = value__optional__absent__compo(); /*
    allowing garbage-memory collection
      hence preventing memory-leak */
  }
}

extension array__convert__accumulation__linear__basic___compo__extension //
<element___type extends Object?> //
    on ARRAY<element___type> {
  accumulation__linear__basic___compo<element___type> //
  convert__accumulation__linear() {
    final result = accumulation__linear__basic___compo<element___type>(
      capacity__initial: elements__count,
    );

    this.iterate__forwards(
      (final e, _) {
        result.add__ending(e);

        return TRUE;
      },
    );

    return result;
  }
}

class accumulation__linear__basic___compo //
<element___type extends Object?> //
    extends accumulation__linear___compo__base<element___type> {
  accumulation__linear__basic___compo({
    super.capacity__initial,
  });

  @override
  INT add__ending(
    final element___type element,
  ) {
    final element__id = elements__count();

    super.add__ending(
      element,
    );

    return element__id;
  }
}

abstract class accumulation__linear___compo__base //
<element___type extends Object?> /*
very efficient (both space, and time) ,than linked-list
  ,because
    no storage of un-essential members ,like ref.s to next and/or previous, elements
    effective usage of processor's memory caching
    keep very-low overhead ,in the mgmt. of mem.-alloc.ion[s] ,per element
    very-simple impl.ion */ //
    implements dispose___protocol {
  static const //
  capacity__initial__default = 4;

  accumulation__linear___compo__base({
    final INT capacity__initial = capacity__initial__default,
  }) : _elements = ARRAY__filled(
         capacity__initial,
         value__optional__absent__compo(),
       ),
       _elements__count = 0;

  ARRAY<value__optional___union<element___type>> _elements;

  INT _elements__count;

  INT elements__count() {
    return _elements__count;
  }

  BOOL empty___ok() {
    return (_elements__count == 0);
  }

  BOOL present___ok(
    final element___type element,
    final value__equality___procedure__format<element___type, element___type> element__equal___ok,
  ) {
    final v = search(
      element,
      element__equal___ok,
    );

    return (v != null);
  }

  INT /*element__id*/ ? search(
    final element___type element,
    final value__equality___procedure__format<element___type, element___type> element__equal___ok,
  ) {
    INT? result = NIL;

    iterate(
      (final id, final e) {
        final equal___ok = element__equal___ok(
          element,
          e,
        );

        if (equal___ok.NOT) {
          return TRUE;
        }

        result = id;

        return FALSE;
      },
    );

    return result;
  }

  INT /*element__id*/ ? search__definitive(
    final value__equality__function__closure__format<element___type> equal___ok,
  ) {
    INT? result = NIL;

    iterate(
      (final id, final e) {
        final equal___ok_1 = equal___ok(e);

        if (equal___ok_1.NOT) {
          return TRUE;
        }

        result = id;

        return FALSE;
      },
    );

    return result;
  }

  void add__ending(
    final element___type element,
  ) {
    if /*F*/ (_elements__count == _elements.elements__count) {
      if (_elements__count == 0) {
        _elements = ARRAY__filled(
          capacity__initial__default,
          value__optional__absent__compo(),
        );
      } else {
        final elements__old = _elements;

        _elements = ARRAY__filled(
          (2 * _elements__count /*capacity*/ ),
          value__optional__absent__compo(),
        );

        copy(
          _elements,
          elements__old,
          count: _elements__count,
        );
      }
    }

    _elements[_elements__count] = value__optional__present__compo(element);

    _elements__count += 1;
  }

  element___type element(
    final INT element__id,
  ) {
    element__id__ensure__valid___raw(element__id);

    return (_elements[element__id] as value__optional__present__compo<element___type>).value;
  }

  void element__assign(
    final INT element__id,
    final element___type value,
  ) {
    element__id__ensure__valid___raw(element__id);

    _elements[element__id] = value__optional__present__compo(value);
  }

  element___type //
  element__first() {
    return (_elements.first as value__optional__present__compo<element___type>).value;
  }

  void element__first__assign(
    final element___type value,
  ) {
    _elements.first = value__optional__present__compo(value);
  }

  INT //
  element__last__id() {
    return (_elements__count - 1);
  }

  element___type //
  element__last() {
    return (_elements[element__last__id()] as value__optional__present__compo<element___type>).value;
  }

  void element__last__assign(
    final element___type value,
  ) {
    _elements[element__last__id()] = value__optional__present__compo(value);
  }

  void iterate(
    final BOOL Function(
      INT element__id,
      element___type element,
    )
    element__handle, {
    INT? count /*
must not be more than `elements__count` */,
  }) {
    if (count != null) {
      element__id__ensure__valid___raw(count - 1);
    } else {
      count = _elements__count;
    }

    _elements.iterate__forwards(
      iteration__count: count,
      (final e, final i) {
        final iterate___ok = element__handle(
          i,
          (e as value__optional__present__compo<element___type>).value,
        );

        return iterate___ok;
      },
    );
  }

  void element__id__ensure__valid___raw(final INT element__id) {
    if (element__id >= _elements__count) {
      throw "element__$element__id is not present in the accumulation (not existent)";
    }
  }

  ARRAY<element___type> convert__array() {
    if (empty___ok()) {
      return ARRAY__empty();
    }

    return ARRAY__generated(
      _elements__count,
      (final i) => (_elements[i] as value__optional__present__compo<element___type>).value,
    );
  }

  void flush() /*
size/memory/space is not reduced
  but, merely the data, is flush-ed */ {
    _elements.fill(
      value__optional__absent__compo(),
    );

    _elements__count = 0;
  }

  void shrink() /*
size reduction, is not exponent-ional
  hence disturbs the growth formula
    so use, only if required */ {
    if (empty___ok()) {
      _elements = ARRAY__empty();

      _elements__count = 0;
    } else {
      _elements = ARRAY__generated(
        _elements__count,
        (final i) => _elements[i],
      );
    }
  }

  @override
  void dispose() {
    flush();

    shrink();
  }
}
