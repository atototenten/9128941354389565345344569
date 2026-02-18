part of "../_.dart";

class accumulation__conservative__iteration__meta /*
allows iterating an accumulation of arrays
  beginning from the first-array ,to last array ,but not further (which is non-existent ,hence in-valid state)
persisted(in compo.) unit for iteration is array
  but iteration assoc.ed members support array-element and element as unit
usage
  last-iteration checked through `.elements__remaining__ok`
  current-iteration(including current-array)'s meta-data accessed through `.iteration__current__meta`
  iterated through `.iterate__forward`
growth style
  only the accum.'s elements (arrays) are copied ,and not arrays' elements
  added array's length is doubled from the previous/last
  the first array's elements-count is 1 doubled ,`array__first__elements__count__doubling__initial` times
element-access style
  element-position calc.ion is partially(just the accum. ,not the arrays) iterative(with a single branch) */ {
  static const //
  array__first__elements__count__doubling__initial__default = 2;

  static INT //
  array__elements__count__ideal___raw({
    required final INT array__id,
    required final INT array__first__elements__count__doubling__initial,
  }) {
    return (1 << (array__id + array__first__elements__count__doubling__initial));
  }

  static INT //
  array__first__elements__count__ideal({
    required final INT array__first__elements__count__doubling__initial,
  }) {
    return array__elements__count__ideal___raw(
      array__id: 0,
      array__first__elements__count__doubling__initial: array__first__elements__count__doubling__initial,
    );
  }

  accumulation__conservative__iteration__meta({
    required final INT elements__count /*
can be zero */,
    this.array__first__elements__count__doubling__initial = array__first__elements__count__doubling__initial__default,
  }) : _array__current__id = 0,
       _elements__offset = 0,
       _elements__count__remaining = elements__count;

  final INT //
  array__first__elements__count__doubling__initial;

  INT //
  _elements__count__remaining /*
from `.elements__offset`
  hence including the current array's elements */,
      _elements__offset,
      _array__current__id;

  BOOL //
  elements__remaining__ok___raw({
    required final INT array__current__elements__count__ideal,
  }) {
    return (_elements__count__remaining >= array__current__elements__count__ideal);
  }

  BOOL //
  elements__remaining___ok() {
    return elements__remaining__ok___raw(
      array__current__elements__count__ideal: array__current__elements__count__ideal___raw(),
    );
  }

  INT //
  elements__remaining__count /*
excluding the current-array's elements */ () {
    final //
    array__current__elements__count__ideal = array__current__elements__count__ideal___raw(),
        iteration__current__last___ok = iteration__current__last__ok___raw(
          array__current__elements__count__ideal: array__current__elements__count__ideal,
        );

    if /*F*/ (iteration__current__last___ok) {
      return 0;
    }

    return (_elements__count__remaining - array__current__elements__count__ideal);
  }

  INT //
  _array__current__elements__count /*
needed only for the last iteration
  other(non-last) iterations {can and should} use {ideal elements-count}
    which has {one less branch} and {less calc.ions}
      hence more efficient */ () {
    final //
    array__current__elements__count__ideal = array__current__elements__count__ideal___raw(),
        iteration__current__last___ok = iteration__current__last__ok___raw(
          array__current__elements__count__ideal: array__current__elements__count__ideal,
        );

    if /*F*/ (iteration__current__last___ok) {
      return _elements__count__remaining;
    }

    return array__current__elements__count__ideal;
  }

  INT //
  array__current__elements__count__ideal___raw() {
    return array__elements__count__ideal___raw(
      array__id: _array__current__id,
      array__first__elements__count__doubling__initial: array__first__elements__count__doubling__initial,
    );
  }

  INT //
  array__previous__elements__count__ideal___raw() {
    if (iteration__current__first___ok()) {
      throw "in-valid call : `iteration__current__first__ok`";
    }

    final array__previous__id = (_array__current__id - 1);

    return array__elements__count__ideal___raw(
      array__id: array__previous__id,
      array__first__elements__count__doubling__initial: array__first__elements__count__doubling__initial,
    );
  }

  BOOL //
  iteration__current__last__ok___raw({
    required final INT array__current__elements__count__ideal,
  }) {
    return (_elements__count__remaining < array__current__elements__count__ideal);
  }

  BOOL //
  iteration__current__first___ok() {
    if (_elements__offset == 0) {
      if (_array__current__id != 0) {
        throw "exception : `(array__current__id != 0)`($_array__current__id != 0)";
      }

      return TRUE;
    }

    return FALSE;
  }

  ({
    INT elements__offset,
    ({
      INT id,
      INT elements__count,
    })
    array,
  }) //
  iteration__current__meta() {
    return (
      elements__offset: _elements__offset,
      array: (
        id: _array__current__id,
        elements__count: _array__current__elements__count(),
      ),
    );
  }

  void iterate__forward___raw({
    required final INT array__current__elements__count__ideal,
  }) {
    {
      final iteration__current__last__ok_1 = iteration__current__last__ok___raw(
        array__current__elements__count__ideal: array__current__elements__count__ideal,
      );

      if (iteration__current__last__ok_1) {
        throw "in-valid call : `(iteration__current__last___ok & elements__remaining__not)`";
      }
    }

    _elements__offset += array__current__elements__count__ideal;
    _elements__count__remaining -= array__current__elements__count__ideal;

    _array__current__id += 1;
  }

  void iterate__forward /*
to next-array in the accum. */ () {
    iterate__forward___raw(
      array__current__elements__count__ideal: array__current__elements__count__ideal___raw(),
    );
  }

  INT /*array__current__elements__count__ideal*/ iterate__backward___raw() {
    {
      final iteration__current__first__ok_1 = iteration__current__first___ok();

      if (iteration__current__first__ok_1) {
        throw "in-valid call : `iteration__current__first__ok`";
      }
    }

    _array__current__id -= 1;

    final array__current__elements__count__ideal = array__current__elements__count__ideal___raw() /*
the {current array's id.} is previous
  to the one at proc.-call beginning
  hence can never be last
    so {ideal elements-count} is usable */;

    _elements__offset -= array__current__elements__count__ideal;
    _elements__count__remaining += array__current__elements__count__ideal;

    return array__current__elements__count__ideal;
  }

  void iterate__backward /*
to previous-array in the accum. */ () {
    iterate__backward___raw();
  }

  void iteration__set__initial /*
re-set */ () {
    if (iteration__current__first___ok()) {
      throw "in-valid call : `iteration__current__first__ok`";
    }

    _elements__count__remaining += _elements__offset;

    _elements__offset = 0;

    _array__current__id = 0;
  }

  void elements__remaining__ensure___raw() {
    final elements__remaining__ok_1 = elements__remaining___ok();

    if (elements__remaining__ok_1.NOT) {
      throw "exception : `elements__remaining__not`";
    }
  }

  INT /*array__elements__offset*/ //
  iterate__forward__until /*
forward-iterate until the element is present in the current-array */ (
    INT element__id,
  ) {
    element__id -= _elements__offset;

    if (element__id >= _elements__count__remaining) {
      throw "in-valid call : `(element__id >= (elements__count__remaining + elements__offset))`(${element__id + _elements__offset} >= ($_elements__count__remaining + $_elements__offset))";
    }

    {
      final array__current__elements__count = _array__current__elements__count();

      if (element__id < array__current__elements__count) /*
last-array ,hence no-where to forward */ {
        throw "in-valid call : `(element__id < array__current__elements__count)`(${element__id + _elements__offset} < $array__current__elements__count)";
      }
    }

    while (true) {
      final array__current__elements__count__ideal = array__current__elements__count__ideal___raw();

      if (element__id < array__current__elements__count__ideal) /*
current array is either last ,or the needed one */ {
        break;
      }

      element__id -= array__current__elements__count__ideal;

      elements__remaining__ensure___raw();

      iterate__forward___raw(
        array__current__elements__count__ideal: array__current__elements__count__ideal,
      );
    }

    return element__id;
  }

  INT /*array__elements__offset*/ //
  iterate__backward__until /*
backward-iterating equivalent of `.iterate__forward__until`
  although control-flow is asymmetric ,due to being based on beginning/offset */ (
    INT element__id,
  ) {
    if (element__id >= _elements__offset) {
      throw "in-valid call : `(element__id >= .elements__offset)`($element__id >= $_elements__offset)";
    }

    while (true) {
      final array__current__elements__count__ideal = iterate__backward___raw();

      element__id -= array__current__elements__count__ideal /*
for reason to not use `array__current__elements__count__raw`
  refer to the comment ,after the usage of `array__current__elements__count__ideal__raw` in `iterate__backward` */;

      if (element__id < _elements__offset) {
        break;
      }
    }

    return element__id;
  }

  void iterate__auto /*
iterate for `count` number of elements ,beginning with `offset`
declarative approach */ ({
    required final INT? count,
    final INT offset = 0,
    required final BOOL /*iterate___ok*/ Function(
      INT elements__offset,
      INT array__id,
      INT array__elements__count,
      INT array__elements__offset,
    )
    array__handle,
  }) {
    if (((count != null) //
            ? (count + offset)
            : offset) /*end*/ >
        (_elements__count__remaining + _elements__offset)) {
      throw "in-valid call : `((count + offset) > (.elements__count__remaining + .elements__offset))`((${count ?? Null__value__text} + $offset) >= ($_elements__count__remaining + $_elements__offset))";
    }

    INT //
    iteration__count,
        array__elements__offset;

    if /*F*/ (offset == 0) {
      if /*F*/ (_elements__offset != 0) {
        iteration__set__initial();
      }

      iteration__count = (count ?? _elements__count__remaining);

      array__elements__offset = 0;
    } else if /*F*/ (offset < _elements__offset) {
      iteration__count = (count ?? (_elements__count__remaining + (_elements__offset - offset)));

      array__elements__offset = iterate__backward__until(
        offset,
      );
    } else if /*F*/ (offset == _elements__offset) {
      iteration__count = (count ?? _elements__count__remaining);

      array__elements__offset = 0;
    } else /*if (offset > elements__offset___raw)*/ {
      iteration__count = (count ?? (_elements__count__remaining - (offset - _elements__offset)));

      final elements__count = ((iteration__count + offset) - _elements__offset);
      if (elements__count > _elements__count__remaining) {
        throw "in-valid call : `(elements__count\\$elements__count\\ > elements__count__remaining\\$_elements__count__remaining\\)`";
      }

      final array__current__elements__count = _array__current__elements__count();

      if (offset < array__current__elements__count) {
        array__elements__offset = (offset - _elements__offset);
      } else {
        array__elements__offset = iterate__forward__until(
          offset,
        );
      }
    }

    if /*F*/ ((iteration__count == 0) || //
        (iteration__count == 1)) {
      final iterate___ok = array__handle(
        _elements__offset,
        _array__current__id,
        iteration__count,
        array__elements__offset,
      );

      if (iterate___ok && //
          (iteration__count != 0)) {
        final array__current__elements__count = _array__current__elements__count();

        if ((iteration__count + array__elements__offset) == array__current__elements__count) {
          elements__remaining__ensure___raw();

          iterate__forward();
        } /* iteration leading to the next array */
      }

      return;
    }

    while (true) {
      final //
      array__current__elements__count = _array__current__elements__count(),
          array__last___ok = (iteration__count <= array__current__elements__count),
          array__elements__count =
              (array__last___ok /*F*/ //
              ? iteration__count
              : (array__current__elements__count - array__elements__offset));

      final iterate___ok = array__handle(
        _elements__offset,
        _array__current__id,
        array__elements__count,
        array__elements__offset,
      );

      if /*F*/ (iterate___ok.NOT || //
          array__last___ok) {
        break;
      }

      iteration__count -= (array__current__elements__count - array__elements__offset);

      if /*F*/ (iteration__count == 0) {
        break;
      }

      if /*F*/ (array__elements__offset != 0) {
        array__elements__offset = 0;
      }

      elements__remaining__ensure___raw();

      iterate__forward();
    }
  }

  void iterate__auto__granular({
    required final INT? count,
    final INT offset = 0,
    required final BOOL /*iterate___ok*/ Function(
      INT accumulation__element__id /* `(array__element__id + accumulation__elements__offset)` */,
      INT array__offset /*array__element__id*/,
    )
    element__handle,
  }) {
    iterate__auto(
      count: count,
      offset: offset,
      array__handle:
          (
            final elements__offset,
            final array__id,
            final array__elements__count,
            final array__elements__offset,
          ) {
            var iterate___ok = TRUE;

            ITERATE__forwards(
              array__elements__count,
              offset: array__elements__offset,
              (final element__id) {
                iterate___ok = element__handle(
                  (element__id + elements__offset),
                  element__id,
                );

                return iterate___ok;
              },
            );

            return iterate___ok;
          },
    );
  }

  representation__text___compo //
  representation__text() {
    return compo__representation__text(
      name: "accumulation__conservative__iteration__meta",
      members: {
        "elements__count__remaining": _elements__count__remaining.representation__text(),
        "elements__offset": _elements__offset.representation__text(),
        "array__current__id": _array__current__id.representation__text(),
      },
    );
  }
}

void accumulation__conservative__iteration__meta__test /*
guide: `
[0][1]
[2][3][4][5]
[6][7][8][9] [10][11][12][13]` */ () {
  {
    const name = "default";

    [
      (
        elements__count: 0,
        result: (
          elements__count__remaining: 0,
          elements__offset: 0,
          array__current__id: 0,
        ),
      ),
      (
        elements__count: 1,
        result: (
          elements__count__remaining: 1,
          elements__offset: 0,
          array__current__id: 0,
        ),
      ),
    ].iterate__forwards(
      (final e, final i) {
        "tests__$name[$i] : (elements__count :${e.elements__count})".print();

        final iteration__meta = accumulation__conservative__iteration__meta(
          elements__count: e.elements__count,
        );

        if ((iteration__meta._elements__count__remaining != e.result.elements__count__remaining) || //
            (iteration__meta._elements__offset != e.result.elements__offset) || //
            (iteration__meta._array__current__id != e.result.array__current__id)) {
          throw "tests__$name[$i] failed";
        }

        return TRUE;
      },
    );

    "tests__$name OK".print();
    print__blank();
  }

  {
    const name = "doubling";

    [
      (
        doubling: INT__4__width,
        result: (
          array__first__elements__count__ideal: INT__4__limit,
        ),
      ),
      (
        doubling: 0,
        result: (
          array__first__elements__count__ideal: 1,
        ),
      ),
    ].iterate__forwards(
      (final e, final i) {
        "tests__$name[$i] : (doubling :${e.doubling})".print();

        final iteration__meta = accumulation__conservative__iteration__meta(
          array__first__elements__count__doubling__initial: e.doubling,
          elements__count: 0,
        );

        if (iteration__meta.array__current__elements__count__ideal___raw() != e.result.array__first__elements__count__ideal) {
          throw "tests__$name[$i] failed";
        }

        return TRUE;
      },
    );

    "tests__$name OK".print();
    print__blank();
  }

  {
    const name = "iteration__forward";

    [
      (
        elements__count: 0,
        iteration__offset: 0,
        result: NIL,
      ),
      //
      (
        elements__count: 1,
        iteration__offset: 0,
        result: /*(
          elements__count__remaining: 1,
          elements__offset: 0,
          array__current__id: 0,
        )*/
            NIL,
      ),
      (
        elements__count: 1,
        iteration__offset: 1,
        result: NIL,
      ),
      //
      (
        elements__count: 5,
        iteration__offset: 0,
        result: /*(
          elements__count__remaining: 5,
          elements__offset: 0,
          array__current__id: 0,
        )*/
            NIL,
      ),
      (
        elements__count: 5,
        iteration__offset: 1,
        result: /*(
          elements__count__remaining: 5,
          elements__offset: 0,
          array__current__id: 0,
        )*/
            NIL,
      ),
      (
        elements__count: 5,
        iteration__offset: 2,
        result: /*(
          elements__count__remaining: 5,
          elements__offset: 0,
          array__current__id: 0,
        )*/
            NIL,
      ),
      (
        elements__count: 5,
        iteration__offset: 3,
        result: /*(
          elements__count__remaining: 5,
          elements__offset: 0,
          array__current__id: 0,
        )*/
            NIL,
      ),
      (
        elements__count: 5,
        iteration__offset: 4,
        result: (
          elements__count__remaining: 1,
          elements__offset: 4,
          array__current__id: 1,
        ),
      ),
      (
        elements__count: 5,
        iteration__offset: 5,
        result: NIL,
      ),
    ].iterate__forwards(
      (final e, final i) {
        "tests__$name[$i] : (elements__count :${e.elements__count} ,iteration__offset :${e.iteration__offset})".print();

        final //
        iteration__meta = accumulation__conservative__iteration__meta(
              elements__count: e.elements__count,
            ),
            result = e.result;

        var failed___ok = FALSE;

        try {
          iteration__meta.iterate__forward__until(
            e.iteration__offset,
          );
        } catch (_) {
          if (result != null) {
            rethrow;
          }

          failed___ok = TRUE;
        }

        if (result == null) {
          if (failed___ok.NOT) {
            throw "tests__$name[$i] should have failed";
          }
        } else if ((iteration__meta._elements__count__remaining != result.elements__count__remaining) || //
            (iteration__meta._elements__offset != result.elements__offset) || //
            (iteration__meta._array__current__id != result.array__current__id)) {
          throw "tests__$name[$i] failed";
        }

        return TRUE;
      },
    );

    "tests__$name OK".print();
    print__blank();
  }

  {
    const name = "iteration__backward";

    [
      (
        elements__count: 5,
        begin: 4,
        end: 0,
        result: (
          elements__count__remaining: 5,
          elements__offset: 0,
          array__current__id: 0,
        ),
      ),
      //
      (
        elements__count: 12,
        begin: 11,
        end: 0,
        result: (
          elements__count__remaining: 12,
          elements__offset: 0,
          array__current__id: 0,
        ),
      ),
      (
        elements__count: 12,
        begin: 11,
        end: 1,
        result: (
          elements__count__remaining: 12,
          elements__offset: 0,
          array__current__id: 0,
        ),
      ),
      (
        elements__count: 12,
        begin: 11,
        end: 3,
        result: (
          elements__count__remaining: 12,
          elements__offset: 0,
          array__current__id: 0,
        ),
      ),
      //
      (
        elements__count: 13,
        begin: 12,
        end: 5,
        result: (
          elements__count__remaining: 9,
          elements__offset: 4,
          array__current__id: 1,
        ),
      ),
    ].iterate__forwards(
      (final e, final i) {
        "tests__$name[$i] : (elements__count :${e.elements__count} ,begin :${e.begin} ,end :${e.end})".print();

        final iteration__meta = accumulation__conservative__iteration__meta(
          elements__count: e.elements__count,
        );

        iteration__meta.iterate__forward__until(
          e.begin,
        );

        iteration__meta.iterate__backward__until(
          e.end,
        );

        final result = e.result;

        if ((iteration__meta._elements__count__remaining != result.elements__count__remaining) || //
            (iteration__meta._elements__offset != result.elements__offset) || //
            (iteration__meta._array__current__id != result.array__current__id)) {
          throw "tests__$name[$i] failed";
        }

        return TRUE;
      },
    );

    "tests__$name OK".print();
    print__blank();
  }

  {
    const name = "iteration__auto";

    [
      (
        elements__count: 13,
        iteration__range: (
          count: 12,
          offset: 1,
        ),
      ),
      (
        elements__count: 13,
        iteration__range: (
          count: 5,
          offset: 1,
        ),
      ),
      (
        elements__count: 13,
        iteration__range: (
          count: 6,
          offset: 1,
        ),
      ),
      (
        elements__count: 13,
        iteration__range: (
          count: 2,
          offset: 0,
        ),
      ),
      (
        elements__count: 13,
        iteration__range: (
          count: 5,
          offset: 0,
        ),
      ),
      (
        elements__count: 13,
        iteration__range: (
          count: 1,
          offset: 1,
        ),
      ),
      (
        elements__count: 13,
        iteration__range: (
          count: 0,
          offset: 2,
        ),
      ),
    ].iterate__forwards(
      (final e, final i) {
        final range = e.iteration__range;

        "tests__$name[$i] : (elements__count :${e.elements__count} ,offset :${range.offset} ,count :${range.count})".print();

        final iteration__meta = accumulation__conservative__iteration__meta(
          elements__count: e.elements__count,
        );

        var count = range.count;

        iteration__meta.iterate__auto__granular(
          count: range.count,
          offset: range.offset,
          element__handle: (final accumulation__element__id, final array__offset) {
            count -= 1;

            return TRUE;
          },
        );

        if (count != 0) {
          throw "tests__$name[$i] failed";
        }

        return TRUE;
      },
    );

    "tests__$name OK".print();
    print__blank();
  }
}
