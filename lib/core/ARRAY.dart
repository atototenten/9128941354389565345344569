part of "_.dart";

typedef ARRAY<element___type> = List<element___type>;

ARRAY<element___type> array__new__copy<element___type>(
  final ARRAY<element___type> arr_, {
  final INT offset = 0,
  final INT? count,
}) => arr_.sublist(
  offset,
  ((count ?? arr_.elements__count) + offset),
);

ARRAY<element___type> array__new__filled<element___type>(
  final INT count,
  final element___type value,
) => ARRAY<element___type>.filled(
  count,
  value,
  growable: FALSE,
);

ARRAY<element___type> array__new__generated<element___type>(
  final INT count,
  final element___type Function(INT i) generate,
) => ARRAY<element___type>.generate(
  count,
  generate,
  growable: FALSE,
);

ARRAY<element___type> //
array__new__empty<element___type>() => //
array__new__generated<element___type>(
  0,
  (_) => throw Exception(),
);

ARRAY<element___type> array__new__element__single<element___type>(
  final element___type value,
) => array__new__filled<element___type>(
  1,
  value,
);

extension array__array__merge_ing<element___type> //
    on ARRAY<ARRAY<element___type>> {
  ARRAY<element___type> merge() {
    var elements__count = 0;

    iterate__reverse__basic(
      (_, final e) {
        elements__count += e.elements__count;
      },
    );

    elements__count.representation__text().print("elements__count");

    var //
    element__offset = 0,
        array__offset = 0;

    final result = array__new__generated(
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

class base__array__elements__separated__generation__meta___compo {
  const base__array__elements__separated__generation__meta___compo({
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

BS1__array INT__array__convert__BS1__array(
  final ARRAY<INT> arr,
) {
  arr.iterate__reverse__basic(
    (final i, final value) {
      if /*F*/ (value > INT__1__max) {
        throw "$value(`array[$i]`) exceeds the limits of `by`";
      }
    },
  );

  return BS1__array.fromList(
    arr,
  );
}

extension ARRAY___extension<element___type> //
    on ARRAY<element___type> {
  INT get elements__count => //
      length;

  INT get count => //
      length;

  BOOL empty___ok() => //
      (this.elements__count == 0);

  BOOL empty__not() => //
      (this.elements__count != 0);

  ARRAY<element___type>? empty__not__else__nil() => //
      (empty__not() ? this : NIL);

  element___type element__last() => //
      this[this.elements__count - 1];

  void iterate(
    final BOOL Function(INT element__id, element___type element) operate, {
    final INT? count,
    final INT offset = 0,
  }) => base__iterate(
    (count ?? (this.elements__count - offset)),
    offset: offset,
    (final element__id) => //
        operate(element__id, this[element__id]),
  );

  void iterate__basic(
    final void Function(INT element__id, element___type element) operate, {
    final INT? count,
    final INT offset = 0,
  }) => base__iterate__basic(
    (count ?? (this.elements__count - offset)),
    (final element__id) => //
        operate(element__id, this[element__id]),
    offset: offset,
  );

  void iterate__reverse(
    final BOOL Function(INT element__id, element___type element) operate, {
    final INT? count,
  }) {
    base__iterate__reverse(
      (count ?? this.elements__count),
      (final element__id) {
        return operate(
          element__id,
          this[element__id],
        );
      },
    );
  }

  void iterate__reverse__basic(
    final void Function(INT element__id, element___type element) operate, {
    final INT? count,
  }) => base__iterate__reverse__basic(
    (count ?? this.elements__count),
    (final element__id) => //
        operate(element__id, this[element__id]),
  );

  element___type element(
    final INT element__id,
  ) => this[element__id];

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

    base__iterate(
      (count ?? this.elements__count),
      offset: offset,
      (final element__id) {
        if (this[element__id] == other[element__id]) {
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
    final BOOL reverse___ok = FALSE,
  }) {
    INT? result;

    BOOL operate(
      final INT element__id,
      final element___type element,
    ) {
      if (element__equal___ok(element).NOT) {
        return TRUE;
      }

      result = element__id;

      return FALSE;
    }

    (reverse___ok //
        ? iterate__reverse
        : iterate)(operate);

    return result;
  }

  INT? search(
    final element___type value,
    final BOOL Function(
      element___type element,
      element___type value,
    )
    element__equal___ok, {
    final BOOL reverse___ok = FALSE,
  }) => search__simple(
    (final e) => element__equal___ok(e, value),
    reverse___ok: reverse___ok,
  );

  INT? /*element__id_*/ search__segment(
    final ARRAY<element___type> segment,
  ) {
    INT? segment__element__id;

    iterate(
      (final i, final e) {
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
    ].iterate__basic((_, final e) {
      final result =
          e.input.search__segment(e.segment) //
            ..representation__text().print("${e.input}.search__segment(${e.segment})");
      if (result != e.result) {
        throw "un-expected result :($result ~= ${e.result})";
      }
    });
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

    segment.iterate__reverse(
      (final i, final e) {
        if (e == this[i]) {
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
    ].iterate__basic((_, final e) {
      final result =
          e.input.search__segment__begin(e.segment) //
            ..representation__text().print("${e.input}.search__segment__begin(${e.segment})");
      if (result != e.result) {
        throw "un-expected result :($result ~= ${e.result})";
      }
    });
  }

  ARRAY<element___type> search__multiple /*
join */ <element__other__type>(
    final ARRAY<element__other__type> other,
    final base__value__equality__function__format<element___type, element__other__type> element__equal___ok,
  ) {
    final accumulation = base__accumulation__linear__basic<element___type>();

    iterate__basic(
      (_, final element) {
        var equal___ok = FALSE;

        other.iterate__reverse(
          (_, final element__other) {
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
          accumulation.add__ending(
            element,
          );
        }
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
        reverse___ok: TRUE,
      ) !=
      null);

  BOOL contains__not(
    final BOOL Function(element___type) element__equal___ok,
  ) =>
      (search__simple(
        element__equal___ok,
        reverse___ok: TRUE,
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
      reverse___ok: TRUE,
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
      return this[element__id + id__diff_].representation__text().value;
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
