part of "../_.dart";

class base__array__array__accumulation__linear__basic //
<
  element__type extends Object? /*
not nil-able due to dart-lang.'s deficiency
  ,of not allowing dynamic-checking for generic-type's nil-ability */
> //
    implements base__dispose___protocol {
  base__array__array__accumulation__linear__basic();

  final accumulation___raw = base__accumulation__linear__basic<array<element__type>>();
  var elements__count___raw = 0;

  NI elements__count() {
    return elements__count___raw;
  }

  void flush() {
    accumulation___raw.flush();
    elements__count___raw = 0;
  }

  void shrink() {
    accumulation___raw.shrink();
  }

  void add__ending(
    final array<element__type> elements,
  ) {
    accumulation___raw.add__ending(
      elements,
    );

    elements__count___raw += elements.elements__count;
  }

  array<element__type> convert__array() {
    final result = array__new__filled<element__type?>(
      elements__count___raw,
      NIL,
    );

    {
      var offset = 0;

      accumulation___raw.iterate(
        (final id, final e) {
          offset = base__copy(
            result,
            e,
            dest__offset: offset,
          ).dest__offset__new;

          return OK;
        },
      );
    }

    return array__new__generated(
      elements__count___raw,
      (final i) => result[i]!,
    );
  }

  @override
  void dispose() {
    accumulation___raw.dispose();
  }
}

/*class base__accumulation__linear__basic__fast<element__type extends Object> /*
`accumulation` with element-removal capability 
  ,at the cost of ,element-access efficiency (due to additional in-direct-ion ,per element) ,and in-efficient iteration
    ,still more efficient than linked-list-ing */ //
    implements
        base__dispose___protocol {
  base__accumulation__linear__basic__fast({
    final NI capacity__initial__multiplier = 0,
  })  : _elements = array__new__filled(
          ((capacity__initial__multiplier != 0) //
              ? (accumulation__capacity__default << capacity__initial__multiplier)
              : accumulation__capacity__default),
          null,
        ),
        _elements__count = 0,
        _element__last__id = 0;

  array<element__type?> _elements;

  NI //
      _elements__count,
      _element__last__id /*
for quick `add:element` */
      ;

  void shrink() {
    if (empty___ok()) {
      _elements /*.clear()*/ = array__new__filled(
        accumulation__capacity__default,
        null,
      );

      _elements__count = 0;
      _element__last__id = 0;
    } else {
      final iteration = base__accumulation__linear__basic__fast__iteration(this);

      _elements = array__new__generated(
        _elements__count,
        (final _) => iteration.element()! /*
will be non-NIL ,because `list_.elements__count` is expected to be correct */
        ,
      ) /*
`convert__arr` can also be used */
          ;

      _element__last__id = _elements__count;
    }
  }

  BOOL present___ok(
    final element__type element,
  ) {
    var result = NO;

    _elements.iterate(
      (final _, final e) {
        if (e == element) {
          result = OK;
          return NO;
        }

        return OK;
      },
    );

    return result;
  }

  void remove /*
memory-usage is not reduced */
      (
    final element__type element,
    final base__value__equality__function__format<element__type,element__type> element__equal___ok /*base__value__same__ok*/,
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
    final void Function(element__type element) operate, {
    final NI? count /*
must not be more than `list_.elements__count` */
    ,
  }) {
    final iteration = base__accumulation__linear__basic__fast__iteration(this);

    base__iterate__basic(
      (count ?? _elements__count),
      (final _) => //
          operate(
        iteration.element()!,
      ),
    );
  }

  array<element__type> convert__array() {
    var offset = 0;

    return array__new__generated(
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

  element__type first() {
    return element(0);
  }

  element__type element(
    NI element__id,
  ) /*
more efficient ,than `convert:array` 
  ,but only for a few element-access ,not full iteration 
    ,otherwise `iteration` should be preferred */
  {
    element__type? result;

    _elements.iterate(
      (final _, final e) {
        if (e == null) {
          return OK;
        }

        if (element__id == 0) {
          result = e;

          return NO;
        }

        element__id -= 1;

        return OK;
      },
    );

    if (result == null) {
      throw "$element__id(`element:id`) not present";
    }

    return result!;
  }

  base__accumulation__linear__basic__fast__iteration iteration() /*
more efficient ,than `element` 
  ,for multiple element-access ,but the iteration can only be first-to-last */
  {
    return base__accumulation__linear__basic__fast__iteration(
      this,
    );
  }

  @override
  void dispose() {
    flush();
    shrink();
  }
}

class base__accumulation__linear__basic__fast__iteration /*:forward*/ <element__type extends Object> /*
`flush` must be called ,after calling `_accumulation::accumulation:remove:element` */ //
    implements
        base__dispose___protocol {
  base__accumulation__linear__basic__fast__iteration(
    _accumulation,
  ) : _element__id = 0;

  final base__accumulation__linear__basic__fast<element__type> _accumulation;

  NI _element__id;

  element__type? element /*:next*/ () {
    element__type? result;

    _accumulation._elements.iterate(
      (final element__id, final element) {
        if /*F*/ (element != null) {
          result = element;
          _element__id = (1 + element__id);

          return false;
        }

        return true;
      },
      offset: _element__id,
    );

    return result;
  }

  element__type? iterate() => //
      element();

  void flush() {
    _element__id = 0;
  }

  @override
  void dispose() {
    flush();
  }
}

extension base__accumulation__linear__basic__fast__test__extension //
    on base__accumulation__linear__basic__fast<string> {
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

void base__accumulation__linear__definitive__test() {
  final accum = base__accumulation__linear__definitive<string>();

  NI accum__element__first__id() {
    return 0;
  }

  NI accum__element__middle__id() {
    return (accum.elements__count() ~/ 2);
  }

  NI accum__element__last__id() {
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
      final NI element__id,
    ) {
      final element = accum.element(element__id);

      accum.present___ok(element, base__value__equal___ok<string>).representation__text().print("\"${element}\" present in ${name} ?");
    }

    accum__presence__print(accum__element__first__id());
    accum__presence__print(accum__element__middle__id());
    accum__presence__print(accum__element__last__id());
  }

  {
    void accum__removal__print(
      final NI element__id,
    ) {
      final element = accum.element(element__id);

      accum.remove___raw(element__id);

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

extension array__convert__accumulation__linear__definitive__extension //
<element__type extends Object?> //
    on array<element__type> {
  base__accumulation__linear__definitive<element__type> //
  convert__accumulation__linear() {
    final result = base__accumulation__linear__definitive<element__type>(
      capacity__initial: elements__count,
    );

    iterate__basic(
      (final _, final element) {
        result.add__ending(
          element,
        );
      },
    );

    return result;
  }
}

class base__accumulation__linear__definitive /*
required because element-removal can in-validate element-ids
  and generation-id would rarely be useful
    due to generation-change being the whole point ,of an accum. */ //
<element__type extends Object?> //
    extends base__accumulation__linear__base<element__type> {
  base__accumulation__linear__definitive({
    super.capacity__initial,
  });

  void remove__last /*
memory-usage is not reduced */ () {
    elements__count___raw -= 1;
  }

  void remove___raw /*
individual element
raw due to being in-efficient ,due to copying */ (final NI element__id) {
    element__id__ensure__valid___raw(
      element__id,
    );

    /*base__iterate__basic(
      (elements__count___raw - (element__id - 1) /* converting offset to count */ ),
      (final i) {
        elements___raw[element__id] = elements___raw[1 + element__id];
      },
      offset: element__id,
    )*/
    base__iterate__until__basic(
      elements__count___raw,
      (final i) {
        elements___raw[i - 1] = elements___raw[i];
      },
      offset: (1 + element__id),
    );

    elements__count___raw -= 1;
  }
}

extension array__convert__accumulation__linear__basic__extension //
<element__type extends Object?> //
    on array<element__type> {
  base__accumulation__linear__basic<element__type> //
  convert__accumulation__linear() {
    final result = base__accumulation__linear__basic<element__type>(
      capacity__initial: elements__count,
    );

    iterate__basic(
      (final _, final element) {
        result.add__ending(
          element,
        );
      },
    );

    return result;
  }
}

class base__accumulation__linear__basic //
<element__type extends Object?> //
    extends base__accumulation__linear__base<element__type> {
  base__accumulation__linear__basic({
    super.capacity__initial,
  });

  @override
  NI add__ending(
    final element__type element,
  ) {
    final element__id = elements__count();

    super.add__ending(
      element,
    );

    return element__id;
  }
}

abstract class base__accumulation__linear__base //
<element__type extends Object?> /*
very efficient (both space, and time) ,than linked-list
  ,because
    no storage of un-essential members ,like ref.s to next and/or previous, elements
    effective usage of processor's memory caching
    keep very-low overhead ,in the mgmt. of mem.-alloc.ion[s] ,per element
    very-simple impl.ion */ //
    implements base__dispose___protocol {
  static const //
  capacity__initial__default = 4;

  base__accumulation__linear__base({
    final NI capacity__initial = capacity__initial__default,
  }) : elements___raw = array__new__filled(
         capacity__initial,
         base__value__optional__absent__compo(),
       ),
       elements__count___raw = 0;

  array<base__value__optional___union<element__type>> elements___raw;

  NI elements__count___raw;

  NI elements__count() {
    return elements__count___raw;
  }

  BOOL empty___ok() {
    return (elements__count___raw == 0);
  }

  BOOL empty__not() {
    return (elements__count___raw != 0);
  }

  BOOL present___ok(
    final element__type element,
    final base__value__equality__function__format<element__type, element__type> element__equal___ok,
  ) {
    final v = search(
      element,
      element__equal___ok,
    );

    return (v != null);
  }

  NI /*element__id*/ ? search(
    final element__type element,
    final base__value__equality__function__format<element__type, element__type> element__equal___ok,
  ) {
    NI? result = NIL;

    iterate(
      (final id, final e) {
        final equal___ok = element__equal___ok(
          element,
          e,
        );

        if (equal___ok.not) {
          return OK;
        }

        result = id;

        return NO;
      },
    );

    return result;
  }

  NI /*element__id*/ ? search__definitive(
    final base__value__equality__function__closure__format<element__type> equal___ok,
  ) {
    NI? result = NIL;

    iterate(
      (final id, final e) {
        final equal___ok_1 = equal___ok(e);

        if (equal___ok_1.not) {
          return OK;
        }

        result = id;

        return NO;
      },
    );

    return result;
  }

  void add__ending(
    final element__type element,
  ) {
    if /*F*/ (elements__count___raw == elements___raw.elements__count) {
      if (elements__count___raw == 0) {
        elements___raw = array__new__filled(
          capacity__initial__default,
          base__value__optional__absent__compo(),
        );
      } else {
        final elements__old = elements___raw;

        elements___raw = array__new__filled(
          (2 * elements__count___raw /*capacity*/ ),
          base__value__optional__absent__compo(),
        );

        base__copy(
          elements___raw,
          elements__old,
          count: elements__count___raw,
        );
      }
    }

    elements___raw[elements__count___raw] = base__value__optional__present__compo(element);

    elements__count___raw += 1;
  }

  element__type element(
    final NI element__id,
  ) {
    element__id__ensure__valid___raw(
      element__id,
    );

    return (elements___raw[element__id] as base__value__optional__present__compo<element__type>).value;
  }

  void element__assign(
    final NI element__id,
    final element__type value,
  ) {
    element__id__ensure__valid___raw(
      element__id,
    );

    elements___raw[element__id] = base__value__optional__present__compo(value);
  }

  element__type //
  element__first() {
    return (elements___raw.first as base__value__optional__present__compo<element__type>).value;
  }

  void element__first__assign(
    final element__type value,
  ) {
    elements___raw.first = base__value__optional__present__compo(value);
  }

  NI //
  element__last__id() {
    return (elements__count___raw - 1);
  }

  element__type //
  element__last() {
    return (elements___raw[element__last__id()] as base__value__optional__present__compo<element__type>).value;
  }

  void element__last__assign(
    final element__type value,
  ) {
    elements___raw[element__last__id()] = base__value__optional__present__compo(value);
  }

  void iterate(
    final BOOL Function(
      NI element__id,
      element__type element,
    )
    element__handle, {
    NI? count /*
must not be more than `elements__count` */,
  }) {
    if (count != null) {
      element__id__ensure__valid___raw(
        count,
      );
    } else {
      count = elements__count___raw;
    }

    try {
      elements___raw.iterate(
        (final i, final e) {
          final iterate___ok = element__handle(
            i,
            (e as base__value__optional__present__compo<element__type>).value,
          );

          return iterate___ok;
        },
        count: count,
      );
    } catch (_) {}
  }

  void element__id__ensure__valid___raw(final NI element__id) {
    if (element__id >= elements__count___raw) {
      throw "element__$element__id is not present in the accumulation (not existent)";
    }
  }

  array<element__type> convert__array() {
    if (empty___ok()) {
      return array__new__empty();
    }

    return array__new__generated(
      elements__count___raw,
      (final i) => (elements___raw[i] as base__value__optional__present__compo<element__type>).value,
    );
  }

  void flush() /*
size/memory/space is not reduced
  but, merely the data, is flush-ed */ {
    elements___raw.fill(
      base__value__optional__absent__compo(),
    );

    elements__count___raw = 0;
  }

  void shrink() /*
size reduction, is not exponent-ional
  hence disturbs the growth formula
    so use, only if required */ {
    if (empty___ok()) {
      elements___raw = array__new__empty();

      elements__count___raw = 0;
    } else {
      elements___raw = array__new__generated(
        elements__count___raw,
        (final i) => elements___raw[i],
      );
    }
  }

  @override
  void dispose() {
    flush();

    shrink();
  }
}
