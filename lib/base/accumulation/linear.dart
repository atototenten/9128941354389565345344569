part of "../_.dart";

/*class base__accumulation__linear__basic__fast<element__type extends Object> /*
`accumulation` with element-removal capability 
  ,at the cost of ,element-access efficiency (due to additional in-direct-ion ,per element) ,and in-efficient iteration
    ,still more efficient than linked-list-ing */ //
    implements
        base__dispose___protocol {
  base__accumulation__linear__basic__fast({
    final NIMR capacity__initial__multiplier = 0,
  })  : _elements = array__new__filled(
          ((capacity__initial__multiplier != 0) //
              ? (accumulation__capacity__default << capacity__initial__multiplier)
              : accumulation__capacity__default),
          null,
        ),
        _elements__count = 0,
        _element__last__id = 0;

  array<element__type?> _elements;

  NIMR //
      _elements__count,
      _element__last__id /*
for quick `add:element` */
      ;

  void shrink() {
    if (empty__ok()) {
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

  BOOL present__ok(
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
    final base__value__equal__ok__function__format<element__type,element__type> element__equal__ok /*base__value__same__ok*/,
  ) {
    final //
        elements = _elements,
        element__id = elements.search__simple(
          (final element_) => //
              ((element_ != null) && //
                  element__equal__ok(element, element_)),
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
    final NIMR? count /*
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
    NIMR element__id,
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

  NIMR _element__id;

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
    on base__accumulation__linear__basic__fast<string__raw> {
  void test() {
    void report() {
      _elements.text__representation().print("elements(${elements__count()})");
    }

    report();

    add("first");
    report();

    add("second");
    add("third");
    add("fourth");
    add("fifth");
    report();

    BOOL text__equal__ok(final string__raw a, final string__raw b) => (a == b);

    remove__element("second", text__equal__ok);
    report();
    remove__element("second", text__equal__ok);
    report();
    remove__element("sixth", text__equal__ok);
    report();

    convert__array().text__representation().print("convert:array");
    report();

    add("6th");
    add("7th");
    add("8th");
    add("9th");
    add("10th");
    report();

    convert__array().text__representation().print("convert:array");
    report();

    iterate__basic((final element) {
      element.text__representation().print("element");
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

class base__accumulation__linear__basic //
<element__type extends Object?> //
    extends base__accumulation__linear__base<element__type> {
  base__accumulation__linear__basic({
    super.capacity__initial,
  });

  @override
  NIMR add__ending(
    final element__type element,
  ) {
    final element__id = elements__count();

    super.add__ending(
      element,
    );

    return element__id;
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
    elements__count__raw -= 1;
  }

  void remove__raw /*
individual element
raw due to being in-efficient ,due to copying */ (
    final NIMR element__id,
  ) {
    element__id__ensure__valid__raw(
      element__id,
    );

    base__iterate__basic(
      (elements__count__raw - (element__id - 1) /* converting offset to count */ ),
      (final i) {
        elements__raw[element__id] = elements__raw[1 + element__id];
      },
      offset: element__id,
    );

    elements__count__raw -= 1;
  }
}

extension array__convert__accumulation__linear__basic__extension<element__type> //
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
    final NIMR capacity__initial = capacity__initial__default,
  }) : elements__raw = array__new__filled(
         capacity__initial,
         NIL,
       ),
       elements__count__raw = 0;

  array<
    ({element__type value}) /*
wrapped to allow nill-able `element__type` */ ?
  >
  elements__raw;

  NIMR elements__count__raw;

  NIMR elements__count() {
    return elements__count__raw;
  }

  BOOL empty__ok() {
    return (elements__count__raw == 0);
  }

  BOOL empty__not() {
    return (elements__count__raw != 0);
  }

  BOOL present__ok(
    final element__type element,
    final base__value__equal__ok__function__format<element__type, element__type> element__equal__ok,
  ) {
    var result = NO;

    iterate(
      (final id, final e) {
        final equal__ok = element__equal__ok(
          element,
          e,
        );

        if (equal__ok.not) {
          return OK;
        }

        result = OK;

        return NO;
      },
    );

    return result;
  }

  void add__ending(
    final element__type element,
  ) {
    if /*F*/ (elements__count__raw == elements__raw.elements__count) {
      if (elements__count__raw == 0) {
        elements__raw = array__new__filled(
          capacity__initial__default,
          NIL,
        );
      } else {
        final elements__old = elements__raw;

        elements__raw = array__new__filled(
          (2 * elements__count__raw /*capacity*/ ),
          NIL,
        );

        base__copy(
          elements__raw,
          elements__old,
          count: elements__count__raw,
        );
      }
    }

    elements__raw[elements__count__raw] = (value: element);

    elements__count__raw += 1;
  }

  element__type element(
    final NIMR element__id,
  ) {
    element__id__ensure__valid__raw(
      element__id,
    );

    return elements__raw[element__id]!.value;
  }

  void element__assign(
    final NIMR element__id,
    final element__type value,
  ) {
    element__id__ensure__valid__raw(
      element__id,
    );

    elements__raw[element__id] = (value: value);
  }

  element__type //
  element__first() {
    return elements__raw.first!.value;
  }

  void element__first__assign(
    final element__type value,
  ) {
    elements__raw.first = (value: value);
  }

  NIMR //
  element__last__id() {
    return (elements__count__raw - 1);
  }

  element__type //
  element__last() {
    return elements__raw[element__last__id()]!.value;
  }

  void element__last__assign(
    final element__type value,
  ) {
    elements__raw[element__last__id()] = (value: value);
  }

  void iterate(
    final BOOL Function(
      NIMR element__id,
      element__type element,
    )
    element__handle, {
    NIMR? count /*
must not be more than `elements__count` */,
  }) {
    if (count != null) {
      element__id__ensure__valid__raw(
        count,
      );
    } else {
      count = elements__count__raw;
    }

    try {
      elements__raw.iterate(
        (final i, final e) {
          final iterate__ok = element__handle(
            i,
            e! /* FIX : error */ .value,
          );

          return iterate__ok;
        },
        count: count,
      );
    } catch (_) {}
  }

  void element__id__ensure__valid__raw(
    final NIMR element__id,
  ) {
    if (element__id >= elements__count__raw) {
      throw "element__$element__id is not present in the accumulation (not existent)";
    }
  }

  array<element__type> convert__array() {
    if (empty__ok()) {
      return array__new__empty();
    }

    return array__new__generated(
      elements__count__raw,
      (final i) => elements__raw[i]!.value,
    );
  }

  void flush() /*
size/memory/space is not reduced
  but, merely the data, is flush-ed */ {
    elements__raw.fill(
      NIL,
    );

    elements__count__raw = 0;
  }

  void shrink() /*
size reduction, is not exponent-ional
  hence disturbs the growth formula
    so use, only if required */ {
    if (empty__ok()) {
      elements__raw = array__new__empty();

      elements__count__raw = 0;
    } else {
      elements__raw = array__new__generated(
        elements__count__raw,
        (final i) => elements__raw[i],
      );
    }
  }

  @override
  void dispose() {
    flush();

    shrink();
  }
}

extension array__convert__accumulation__linear__definitive__extension<element__type> //
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

class base__array__array__accumulation__linear__basic //
<
  element__type extends Object /*
not nil-able due to dart-lang.'s deficiency
  ,of not allowing dynamic-checking for generic-type's nil-ability */
> //
    implements base__dispose___protocol {
  base__array__array__accumulation__linear__basic();

  final accumulation__raw = base__accumulation__linear__basic<array<element__type>>();
  var elements__count__raw = 0;

  NIMR elements__count() {
    return elements__count__raw;
  }

  void flush() {
    accumulation__raw.flush();
    elements__count__raw = 0;
  }

  void shrink() {
    accumulation__raw.shrink();
  }

  void add__ending(
    final array<element__type> elements,
  ) {
    accumulation__raw.add__ending(
      elements,
    );

    elements__count__raw += elements.elements__count;
  }

  array<element__type> convert__array() {
    final result = array__new__filled<element__type?>(
      elements__count__raw,
      NIL,
    );

    {
      var offset = 0;

      accumulation__raw.iterate(
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
      elements__count__raw,
      (final i) => result[i]!,
    );
  }

  @override
  void dispose() {
    accumulation__raw.dispose();
  }
}

void base__accumulation__linear__definitive__test() {
  final accumulation = base__accumulation__linear__definitive<NIMR>();

  void report() {
    accumulation
        .elements__raw //
        .convert((final e) => (e?.value.text__representation() ?? Null__value__text))
        .text__representation()
        .print("elements(.count=${accumulation.elements__count()})");
  }

  report();

  accumulation.add__ending(1);
  report();

  accumulation.add__ending(2);
  accumulation.add__ending(3);
  accumulation.add__ending(4);
  accumulation.add__ending(5);
  report();

  accumulation.present__ok(2, base__value__equal__ok).text__representation().print("present__ok(2)");
  report();
  accumulation.present__ok(2, base__value__equal__ok).text__representation().print("present__ok(2)");
  report();
  accumulation.present__ok(6, base__value__equal__ok).text__representation().print("present__ok(6)");
  report();

  accumulation.convert__array().text__representation().print("convert:array");
  report();

  accumulation.add__ending(7);
  accumulation.add__ending(8);
  report();

  accumulation.convert__array().text__representation().print("convert:array");
  report();

  accumulation.shrink();
  report();

  accumulation.flush();
  report();

  accumulation.shrink();
  report();
}
