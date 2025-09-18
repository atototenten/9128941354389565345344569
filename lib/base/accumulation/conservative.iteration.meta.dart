part of "../_.dart";

class base__accumulation__conservative__iteration__meta /*
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
  element-position calc.ion is partially(just the accum. ,not the arrays) iterative(with a single branch) */
{
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

  base__accumulation__conservative__iteration__meta({
    required final INT elements__count /*
can be zero */
    ,
    this.array__first__elements__count__doubling__initial = array__first__elements__count__doubling__initial__default,
  })  : array__current__id___raw = 0,
        elements__offset___raw = 0,
        elements__count__remaining___raw = elements__count;

  final INT //
      array__first__elements__count__doubling__initial;

  INT //
      elements__count__remaining___raw /*
from `.elements__offset`
  hence including the current array's elements */
      ,
      elements__offset___raw,
      array__current__id___raw;

  BOOL //
      elements__remaining__ok___raw({
    required final INT array__current__elements__count__ideal,
  }) {
    return (elements__count__remaining___raw >= array__current__elements__count__ideal);
  }

  BOOL //
      elements__remaining___ok() {
    return elements__remaining__ok___raw(
      array__current__elements__count__ideal: array__current__elements__count__ideal___raw(),
    );
  }

  INT //
      elements__remaining__count /*
excluding the current-array's elements */
      () {
    final //
        array__current__elements__count__ideal = array__current__elements__count__ideal___raw(),
        iteration__current__last___ok = iteration__current__last__ok___raw(
          array__current__elements__count__ideal: array__current__elements__count__ideal,
        );

    if /*F*/ (iteration__current__last___ok) {
      return 0;
    }

    return (elements__count__remaining___raw - array__current__elements__count__ideal);
  }

  INT //
      array__current__elements__count___raw /*
needed only for the last iteration
  other(non-last) iterations {can and should} use {ideal elements-count}
    which has {one less branch} and {less calc.ions}
      hence more efficient */
      () {
    final //
        array__current__elements__count__ideal = array__current__elements__count__ideal___raw(),
        iteration__current__last___ok = iteration__current__last__ok___raw(
          array__current__elements__count__ideal: array__current__elements__count__ideal,
        );

    if /*F*/ (iteration__current__last___ok) {
      return elements__count__remaining___raw;
    }

    return array__current__elements__count__ideal;
  }

  INT //
      array__current__elements__count__ideal___raw() {
    return array__elements__count__ideal___raw(
      array__id: array__current__id___raw,
      array__first__elements__count__doubling__initial: array__first__elements__count__doubling__initial,
    );
  }

  INT //
      array__previous__elements__count__ideal___raw() {
    if (iteration__current__first___ok()) {
      throw "in-valid call : `iteration__current__first__ok`";
    }

    final array__previous__id = (array__current__id___raw - 1);

    return array__elements__count__ideal___raw(
      array__id: array__previous__id,
      array__first__elements__count__doubling__initial: array__first__elements__count__doubling__initial,
    );
  }

  BOOL //
      iteration__current__last__ok___raw({
    required final INT array__current__elements__count__ideal,
  }) {
    return (elements__count__remaining___raw < array__current__elements__count__ideal);
  }

  BOOL //
      iteration__current__first___ok() {
    if (elements__offset___raw == 0) {
      if (array__current__id___raw != 0) {
        throw "exception : `(array__current__id___raw != 0)`($array__current__id___raw != 0)";
      }

      return OK;
    }

    return NO;
  }

  ({
    INT elements__offset,
    ({
      INT id,
      INT elements__count,
    }) array,
  }) //
      iteration__current__meta() {
    return (
      elements__offset: elements__offset___raw,
      array: (
        id: array__current__id___raw,
        elements__count: array__current__elements__count___raw(),
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

    elements__offset___raw += array__current__elements__count__ideal;
    elements__count__remaining___raw -= array__current__elements__count__ideal;

    array__current__id___raw += 1;
  }

  void iterate__forward /*
to next-array in the accum. */
      () {
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

    array__current__id___raw -= 1;

    final array__current__elements__count__ideal = array__current__elements__count__ideal___raw() /*
the {current array's id.} is previous
  to the one at proc.-call beginning
  hence can never be last
    so {ideal elements-count} is usable */
        ;

    elements__offset___raw -= array__current__elements__count__ideal;
    elements__count__remaining___raw += array__current__elements__count__ideal;

    return array__current__elements__count__ideal;
  }

  void iterate__backward /*
to previous-array in the accum. */
      () {
    iterate__backward___raw();
  }

  void iteration__set__initial /*
re-set */
      () {
    if (iteration__current__first___ok()) {
      throw "in-valid call : `iteration__current__first__ok`";
    }

    elements__count__remaining___raw += elements__offset___raw;

    elements__offset___raw = 0;

    array__current__id___raw = 0;
  }

  void elements__remaining__ensure___raw() {
    final elements__remaining__ok_1 = elements__remaining___ok();

    if (elements__remaining__ok_1.not) {
      throw "exception : `elements__remaining__not`";
    }
  }

  INT /*array__elements__offset*/ //
      iterate__forward__until /*
forward-iterate until the element is present in the current-array */
      (
    INT element__id,
  ) {
    element__id -= elements__offset___raw;

    if (element__id >= elements__count__remaining___raw) {
      throw "in-valid call : `(element__id >= (elements__count__remaining___raw + elements__offset___raw))`(${element__id + elements__offset___raw} >= ($elements__count__remaining___raw + $elements__offset___raw))";
    }

    {
      final array__current__elements__count = array__current__elements__count___raw();

      if (element__id < array__current__elements__count) /*
last-array ,hence no-where to forward */
      {
        throw "in-valid call : `(element__id < array__current__elements__count)`(${element__id + elements__offset___raw} < $array__current__elements__count)";
      }
    }

    while (OK) {
      final array__current__elements__count__ideal = array__current__elements__count__ideal___raw();

      if (element__id < array__current__elements__count__ideal) /*
current array is either last ,or the needed one */
      {
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
  although control-flow is asymmetric ,due to being based on beginning/offset */
      (
    INT element__id,
  ) {
    if (element__id >= elements__offset___raw) {
      throw "in-valid call : `(element__id >= .elements__offset)`($element__id >= $elements__offset___raw)";
    }

    while (OK) {
      final array__current__elements__count__ideal = iterate__backward___raw();

      element__id -= array__current__elements__count__ideal /*
for reason to not use `array__current__elements__count__raw`
  refer to the comment ,after the usage of `array__current__elements__count__ideal__raw` in `iterate__backward` */
          ;

      if (element__id < elements__offset___raw) {
        break;
      }
    }

    return element__id;
  }

  void iterate__auto /*
iterate for `count` number of elements ,beginning with `offset`
declarative approach */
      ({
    required final INT? count,
    final INT offset = 0,
    required final BOOL /*iterate___ok*/ Function(
      INT elements__offset,
      INT array__id,
      INT array__elements__count,
      INT array__elements__offset,
    ) array__handle,
  }) {
    if (((count != null) //
            ? (count + offset)
            : offset) /*end*/ >
        (elements__count__remaining___raw + elements__offset___raw)) {
      throw "in-valid call : `((count + offset) > (.elements__count__remaining + .elements__offset))`((${count ?? Null__value__text} + $offset) >= ($elements__count__remaining___raw + $elements__offset___raw))";
    }

    INT //
        iteration__count,
        array__elements__offset;

    if /*F*/ (offset == 0) {
      if /*F*/ (elements__offset___raw != 0) {
        iteration__set__initial();
      }

      iteration__count = (count ?? elements__count__remaining___raw);

      array__elements__offset = 0;
    } else if /*F*/ (offset < elements__offset___raw) {
      iteration__count = (count ?? (elements__count__remaining___raw + (elements__offset___raw - offset)));

      array__elements__offset = iterate__backward__until(
        offset,
      );
    } else if /*F*/ (offset == elements__offset___raw) {
      iteration__count = (count ?? elements__count__remaining___raw);

      array__elements__offset = 0;
    } else /*if (offset > elements__offset___raw)*/ {
      iteration__count = (count ?? (elements__count__remaining___raw - (offset - elements__offset___raw)));

      final elements__count = ((iteration__count + offset) - elements__offset___raw);
      if (elements__count > elements__count__remaining___raw) {
        throw "in-valid call : `(elements__count\\$elements__count\\ > elements__count__remaining\\$elements__count__remaining___raw\\)`";
      }

      final array__current__elements__count = array__current__elements__count___raw();

      if (offset < array__current__elements__count) {
        array__elements__offset = (offset - elements__offset___raw);
      } else {
        array__elements__offset = iterate__forward__until(
          offset,
        );
      }
    }

    if /*F*/ ((iteration__count == 0) || //
        (iteration__count == 1)) {
      final iterate___ok = array__handle(
        elements__offset___raw,
        array__current__id___raw,
        iteration__count,
        array__elements__offset,
      );

      if (iterate___ok && //
          (iteration__count != 0)) {
        final array__current__elements__count = array__current__elements__count___raw();

        if ((iteration__count + array__elements__offset) == array__current__elements__count) {
          elements__remaining__ensure___raw();

          iterate__forward();
        } /* iteration leading to the next array */
      }

      return;
    }

    while (OK) {
      final //
          array__current__elements__count = array__current__elements__count___raw(),
          array__last___ok = (iteration__count <= array__current__elements__count),
          array__elements__count = (array__last___ok /*F*/ //
              ? iteration__count
              : (array__current__elements__count - array__elements__offset));

      final iterate___ok = array__handle(
        elements__offset___raw,
        array__current__id___raw,
        array__elements__count,
        array__elements__offset,
      );

      if /*F*/ (iterate___ok.not || //
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
    ) element__handle,
  }) {
    iterate__auto(
      count: count,
      offset: offset,
      array__handle: (
        final elements__offset,
        final array__id,
        final array__elements__count,
        final array__elements__offset,
      ) {
        var iterate___ok = OK;

        base__iterate(
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

  base__representation__text //
      representation__text() {
    return base__compo__representation__text(
      name: "base__accumulation__conservative__iteration__meta",
      members: {
        "elements__count__remaining": elements__count__remaining___raw.representation__text(),
        "elements__offset": elements__offset___raw.representation__text(),
        "array__current__id": array__current__id___raw.representation__text(),
      },
    );
  }
}

void base__accumulation__conservative__iteration__meta__test /*
guide: `
[0][1]
[2][3][4][5]
[6][7][8][9] [10][11][12][13]` */
    () {
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
    ].iterate__basic(
      (final i, final e) {
        "tests__$name[$i] : (elements__count :${e.elements__count})".print();

        final iteration__meta = base__accumulation__conservative__iteration__meta(
          elements__count: e.elements__count,
        );

        if ((iteration__meta.elements__count__remaining___raw != e.result.elements__count__remaining) || //
            (iteration__meta.elements__offset___raw != e.result.elements__offset) || //
            (iteration__meta.array__current__id___raw != e.result.array__current__id)) {
          throw "tests__$name[$i] failed";
        }
      },
    );

    "tests__$name OK".print();
    base__print__blank();
  }

  {
    const name = "doubling";

    [
      (
        doubling: NI4__width,
        result: (array__first__elements__count__ideal: NI4__limit,),
      ),
      (
        doubling: 0,
        result: (array__first__elements__count__ideal: 1,),
      ),
    ].iterate__basic(
      (final i, final e) {
        "tests__$name[$i] : (doubling :${e.doubling})".print();

        final iteration__meta = base__accumulation__conservative__iteration__meta(
          array__first__elements__count__doubling__initial: e.doubling,
          elements__count: 0,
        );

        if (iteration__meta.array__current__elements__count__ideal___raw() != e.result.array__first__elements__count__ideal) {
          throw "tests__$name[$i] failed";
        }
      },
    );

    "tests__$name OK".print();
    base__print__blank();
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
    ].iterate__basic(
      (final i, final e) {
        "tests__$name[$i] : (elements__count :${e.elements__count} ,iteration__offset :${e.iteration__offset})".print();

        final //
            iteration__meta = base__accumulation__conservative__iteration__meta(
              elements__count: e.elements__count,
            ),
            result = e.result;

        var failed___ok = NO;

        try {
          iteration__meta.iterate__forward__until(
            e.iteration__offset,
          );
        } catch (_) {
          if (result != null) {
            rethrow;
          }

          failed___ok = OK;
        }

        if (result == null) {
          if (failed___ok.not) {
            throw "tests__$name[$i] should have failed";
          }
        } else if ((iteration__meta.elements__count__remaining___raw != result.elements__count__remaining) || //
            (iteration__meta.elements__offset___raw != result.elements__offset) || //
            (iteration__meta.array__current__id___raw != result.array__current__id)) {
          throw "tests__$name[$i] failed";
        }
      },
    );

    "tests__$name OK".print();
    base__print__blank();
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
    ].iterate__basic(
      (final i, final e) {
        "tests__$name[$i] : (elements__count :${e.elements__count} ,begin :${e.begin} ,end :${e.end})".print();

        final iteration__meta = base__accumulation__conservative__iteration__meta(
          elements__count: e.elements__count,
        );

        iteration__meta.iterate__forward__until(
          e.begin,
        );

        iteration__meta.iterate__backward__until(
          e.end,
        );

        final result = e.result;

        if ((iteration__meta.elements__count__remaining___raw != result.elements__count__remaining) || //
            (iteration__meta.elements__offset___raw != result.elements__offset) || //
            (iteration__meta.array__current__id___raw != result.array__current__id)) {
          throw "tests__$name[$i] failed";
        }
      },
    );

    "tests__$name OK".print();
    base__print__blank();
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
    ].iterate__basic(
      (final i, final e) {
        final range = e.iteration__range;

        "tests__$name[$i] : (elements__count :${e.elements__count} ,offset :${range.offset} ,count :${range.count})".print();

        final iteration__meta = base__accumulation__conservative__iteration__meta(
          elements__count: e.elements__count,
        );

        var count = range.count;

        iteration__meta.iterate__auto__granular(
          count: range.count,
          offset: range.offset,
          element__handle: (final accumulation__element__id, final array__offset) {
            count -= 1;

            return OK;
          },
        );

        if (count != 0) {
          throw "tests__$name[$i] failed";
        }
      },
    );

    "tests__$name OK".print();
    base__print__blank();
  }
}
