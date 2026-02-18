part of "_.dart";

typedef ARRAY<element___type> = List<element___type>;

ARRAY<element___type> //
ARRAY__filled<element___type>(
  final INT count,
  final element___type value,
) {
  return ARRAY<element___type>.filled(
    count,
    value,
    growable: FALSE,
  );
}

ARRAY<element___type> //
ARRAY__generated<element___type>(
  final INT count,
  final element___type Function(INT i) generate,
) {
  return ARRAY<element___type>.generate(
    count,
    generate,
    growable: FALSE,
  );
}

ARRAY<element___type> //
ARRAY__empty<element___type>() {
  return ARRAY<element___type>.empty(
    growable: FALSE,
  );
}

extension array__array__merge_ing<element___type> //
    on ARRAY<ARRAY<element___type>> {
  ARRAY<element___type> merge() {
    var elements__count = 0;

    this.iterate__backwards(
      (final e, _) {
        elements__count += e.elements__count;

        return TRUE;
      },
    );

    elements__count.representation__text().print("elements__count");

    var //
    element__offset = 0,
        array__offset = 0;

    final result = ARRAY__generated(
      elements__count,
      (var element__id) {
        "$element__id   $element__offset   $array__offset".print();

        element__id -= element__offset;

        final array = element(
          array__offset,
        );

        final result = array[element__id];

        if /*F*/ ((element__id += 1) == array.elements__count) {
          element__offset += array.elements__count;
          array__offset += 1;
        }

        return result;
      },
    );

    return result;
  }

  void merge__test() {
    ([
      [],
      [3, 2, 1],
      [6, 5, 4],
      [9, 8, 7],
      [0],
      [],
    ]..representation__text().print("un_merge_ed")).merge().representation__text().print("merge_ed");
  }
}

INT array__reverse__element__id(
  final INT element__id,
  final INT elements__count,
) => ((elements__count - 1) - element__id);

class array__elements__separated__generation__meta___compo {
  const array__elements__separated__generation__meta___compo({
    required final INT elements__count,
  }) : elements__count__adjusted = ((elements__count * 2 /* for ".elements__separation"s */ ) - 1 /* to exclude the ".elements__separation" after the last-element */ );

  final INT elements__count__adjusted;

  INT? element__id({
    required final INT element__id__adjusted,
  }) {
    if (element__id__adjusted.isOdd) {
      return NIL;
    }

    return (element__id__adjusted ~/ 2);
  }
}

extension ARRAY___extension<element___type> //
    on ARRAY<element___type> {
  INT get elements__count => //
      length;

  BOOL empty___ok() => //
      (this.elements__count == 0);

  element___type element__last() => //
      element(this.elements__count - 1);

  element___type element(
    final INT element__id,
  ) => this[element__id];

  ARRAY<element___type> //
  copy() {
    return /*segment(
      offset: 0,
      count: elements__count,
    )*/ convert__array();
  }

  ARRAY<element___type> //
  segment({
    required final INT offset,
    required final INT count,
  }) {
    return sublist(
      offset,
      (count + offset),
    );
  }

  void iterate__forwards(
    final BOOL /*continue___ok*/ Function(element___type, INT) operate, {
    final INT? iteration__count,
    final INT offset = 0,
  }) {
    ITERATE__forwards(
      (iteration__count ?? elements__count),
      (i) => operate(element(i), i),
      offset: offset,
    );
  }

  void iterate__backwards(
    final BOOL /*continue___ok*/ Function(element___type, INT) operate,
  ) {
    ITERATE__backwards(
      elements__count,
      (i) => operate(element(i), i),
    );
  }

  void fill(
    final element___type value, {
    INT? count,
    INT offset = 0,
  }) {
    count =
        ((count == null) //
        ? (elements__count - offset)
        : (count + offset));

    while (offset < count) {
      this[offset++] = value;
    }
  }

  INT? /*
un-equal element's id, if any */
  un_equal__element__id(
    final ARRAY<element___type> other, {
    final INT? count,
    final INT offset = 0,
  }) {
    INT? result;

    ITERATE__forwards(
      (count ?? this.elements__count),
      offset: offset,
      (final element__id) {
        if (element(element__id) == other.element(element__id)) {
          return TRUE;
        }

        result = element__id;

        return FALSE;
      },
    );

    return result;
  }

  BOOL equal___ok(final ARRAY<element___type> other) {
    if (elements__count != other.elements__count) {
      return FALSE;
    }

    return (un_equal__element__id(other) == NIL);
  }

  INT? /*
`id` if present ,otherwise NIL */
  search__simple(
    final BOOL Function(element___type) element__equal___ok, {
    final BOOL backwards___ok = FALSE,
  }) {
    INT? result;

    BOOL operate(
      final element___type element,
      final INT element__id,
    ) {
      if (element__equal___ok(element).NOT) {
        return TRUE;
      }

      result = element__id;

      return FALSE;
    }

    (backwards___ok //
        ? iterate__backwards
        : iterate__forwards)(operate);

    return result;
  }

  INT? search(
    final element___type value,
    final BOOL Function(
      element___type element,
      element___type value,
    )
    element__equal___ok, {
    final BOOL backwards___ok = FALSE,
  }) {
    return search__simple(
      (final e) => element__equal___ok(e, value),
      backwards___ok: backwards___ok,
    );
  }

  INT? /*element__id_*/ search__segment(
    final ARRAY<element___type> segment,
  ) {
    INT? segment__element__id;

    iterate__forwards(
      (final e, final i) {
        if (segment__element__id != NIL) {
          final $segment__element__id = (segment__element__id = (1 + segment__element__id!));
          if /*F*/ (($segment__element__id == segment.elements__count) /*
whole `segment` has been iterated ,and was not un-equal to `this[(i-segment__element__id)..segment.elements__count]` */ || //
              (i == (elements__count - 1)) /*
`e` is the last element ,of `this` */ ) /*
whole `segment` has been iterated ,and was not un-equal to `this[(i-segment__element__id)..segment.elements__count]` */ {
            segment__element__id = (i - $segment__element__id) /* result */;
            return FALSE;
          }

          if /*T*/ (e != segment[$segment__element__id]) {
            segment__element__id = NIL;
          }

          return TRUE;
        }

        if (e == segment.first) {
          segment__element__id = 0;
        }

        return TRUE;
      },
    );

    return segment__element__id;
  }

  void search__segment__test() {
    [
      (input: [0, 1, 2, 3], segment: [0], result: 0),
      (input: [0, 1, 2, 3], segment: [0, 1], result: 0),
      (input: [0, 1, 2, 3], segment: [1], result: 1),
      (input: [0, 1, 2, 3], segment: [1, 2], result: 1),
      (input: [0, 1, 2, 3], segment: [1, 2, 3], result: 1),
      (input: [0, 1, 2, 3], segment: [1, 3], result: NIL),
    ].iterate__forwards(
      (final e, _) {
        final result =
            e.input.search__segment(e.segment) //
              ..representation__text().print("${e.input}.search__segment(${e.segment})");
        if (result != e.result) {
          throw "un-expected result :($result ~= ${e.result})";
        }

        return TRUE;
      },
    );
  }

  BOOL search__segment__begin(
    final ARRAY<element___type> segment,
  ) /*
equality is not considered prefix
  ,like `abc` is prefixed to `abcxyz` ,but neither `abcxyz` ,nor `xyzabc`
more run-time efficient ,than `search__segment` */ {
    if ((elements__count > segment.elements__count).NOT) /*
`segment` can prefix `this` ,only if ,`segment`'s length is less than `this` */ {
      return FALSE;
    } else if (first != segment.first) {
      return FALSE;
    }

    var prefix_ed___ok = TRUE;

    segment.iterate__backwards(
      (final e, final i) {
        if (e == element(i)) {
          return TRUE;
        } else {
          prefix_ed___ok = FALSE;
          return FALSE;
        }
      },
    );

    return prefix_ed___ok;
  }

  void search__segment__begin__test() {
    [
      (input: [0, 1, 2, 3], segment: [0, 1], result: TRUE),
      (input: [0, 1, 2, 3], segment: [1, 2], result: FALSE),
      (input: [0, 1, 2, 3], segment: [0, 1, 2, 3], result: FALSE),
      (input: [0, 1, 2], segment: [0, 1, 2, 3], result: FALSE),
    ].iterate__forwards((final e, _) {
      final result =
          e.input.search__segment__begin(e.segment) //
            ..representation__text().print("${e.input}.search__segment__begin(${e.segment})");
      if (result != e.result) {
        throw "un-expected result :($result ~= ${e.result})";
      }

      return TRUE;
    });
  }

  ARRAY<element___type> search__multiple /*
join */ <element__other__type>(
    final ARRAY<element__other__type> other,
    final value__equality___procedure__format<element___type, element__other__type> element__equal___ok,
  ) {
    final accumulation = accumulation__linear__basic___compo<element___type>();

    this.iterate__forwards(
      (final element, _) {
        var equal___ok = FALSE;

        other.iterate__backwards(
          (final element__other, _) {
            final equal__ok_1 = element__equal___ok(
              element,
              element__other,
            );

            if (equal__ok_1.NOT) {
              return TRUE;
            }

            equal___ok = TRUE;

            return FALSE;
          },
        );

        if (equal___ok) {
          accumulation.add__ending(element);
        }

        return TRUE;
      },
    );

    final result = accumulation.convert__array();

    accumulation.dispose();

    return result;
  }

  BOOL present___ok(
    final BOOL Function(element___type) element__equal___ok,
  ) =>
      (search__simple(
        element__equal___ok,
        backwards___ok: TRUE,
      ) !=
      null);

  BOOL contains__not(
    final BOOL Function(element___type) element__equal___ok,
  ) =>
      (search__simple(
        element__equal___ok,
        backwards___ok: TRUE,
      ) ==
      null);

  void element__remove(
    final INT element__id,
  ) {
    removeAt(
      element__id,
    );
  }

  BOOL remove(
    final BOOL Function(element___type) element__equal___ok,
  ) {
    final element__id = search__simple(
      element__equal___ok,
      backwards___ok: TRUE,
    );

    if (element__id == null) {
      return FALSE;
    }

    element__remove(
      element__id,
    );

    return TRUE;
  }

  VENDING<ARRAY<element___type>> split /*
  - example
    - input : ARRAY(1 ,2 ,3 ,0 ,4 ,5 ,6 ,0 ,7 ,8 ,9)..split((e) { RETURN (e = 0) })
      output : ARRAY(ARRAY(1 ,2 ,3) ,ARRAY(4 ,5 ,6) ,ARRAY(7 ,8 ,9)) */ (
    final BOOL Function(element___type) split___ok,
  ) sync* {
    var offset = 0;

    while (offset < this.length) {
      var offset_1 = offset;

      while (offset_1 < this.length) {
        final e = element(offset_1);

        if (split___ok(e)) {
          break;
        }

        offset_1 += 1;
      }

      final result = this.sublist(offset, offset_1);

      offset = offset_1;

      yield result;
    }
  }
}

extension element___type__array__report__definitive__extension<element___type> //
    on ARRAY<element___type> {
  string //
  convert__text__concise__definitive(
    final INT elements__count,
    final INT element__id,
  ) {
    string element(
      final INT__NEG id__diff_,
    ) {
      return element(element__id + id__diff_).representation__text().value;
    }

    return ("$element__id: $static__indicate__short_en_ing " + //
        (((element__id - 4) > 0) ? " ,${element(-4)}" : empty___string) +
        (((element__id - 3) > 0) ? " ,${element(-3)}" : empty___string) +
        (((element__id - 2) > 0) ? " ,${element(-2)}" : empty___string) +
        (((element__id - 1) > 0) ? " ,${element(-1)}" : empty___string) + //
        "   ,${element(0)}  " + //
        (((element__id + 1) < elements__count) ? " ,${element(1)}" : empty___string) +
        (((element__id + 2) < elements__count) ? " ,${element(2)}" : empty___string) +
        (((element__id + 3) < elements__count) ? " ,${element(3)}" : empty___string) +
        (((element__id + 4) < elements__count) ? " ,${element(4)}" : empty___string) + //
        static__indicate__short_en_ing);
  }
}
