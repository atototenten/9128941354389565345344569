part of "_.dart";

typedef array<element__type> = List<element__type>;

array<element__type> array__new__copy<element__type>(
  final array<element__type> arr_, {
  final INT offset = 0,
  final INT? count,
}) => arr_.sublist(
  offset,
  ((count ?? arr_.elements__count) + offset),
);

array<element__type> array__new__filled<element__type>(
  final INT count,
  final element__type value,
) => array<element__type>.filled(
  count,
  value,
  growable: NO,
);

array<element__type> array__new__generated<element__type>(
  final INT count,
  final element__type Function(INT i) generate,
) => array<element__type>.generate(
  count,
  generate,
  growable: NO,
);

array<element__type> //
array__new__empty<element__type>() => //
array__new__generated<element__type>(
  0,
  (final _) => throw Exception(),
);

array<element__type> array__new__element__single<element__type>(
  final element__type value,
) => array__new__filled<element__type>(
  1,
  value,
);

extension array__array__merge_ing<element__type> //
    on array<array<element__type>> {
  array<element__type> merge() {
    var elements__count = 0;

    iterate__reverse__basic(
      (final _, final e) {
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
      [3, 2, 1],
      [6, 5, 4],
      [9, 8, 7],
      [0],
      empty__array,
    ]..representation__text().print("un_merge_ed")).merge().representation__text().print("merge_ed");
  }
}

INT array__reverse__element__id(
  final INT element__id,
  final INT elements__count,
) => ((elements__count - 1) - element__id);

BS1__array INT__array__convert__BS1__array(
  final array<INT> arr,
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

extension array__extension<element___type> on array<element___type> {
  INT get elements__count => //
      length;

  INT get count => //
      length;

  BOOL empty___ok() => //
      (this.elements__count == 0);

  BOOL empty__not() => //
      (this.elements__count != 0);

  array<element___type>? empty__not__else__nil() => //
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
    final array<element___type> other, {
    final INT? count,
    final INT offset = 0,
  }) {
    INT? result;

    base__iterate(
      (count ?? this.elements__count),
      offset: offset,
      (final element__id) {
        if (this[element__id] == other[element__id]) {
          return OK;
        }

        result = element__id;

        return NO;
      },
    );

    return result;
  }

  BOOL equal___ok(
    final array<element___type> other,
  ) {
    if (elements__count != other.elements__count) {
      return NO;
    }

    return (un_equal__element__id(other) == NIL);
  }

  INT? /*
`id` if present ,otherwise NIL */
  search__simple(
    final BOOL Function(element___type) element__equal___ok, {
    final BOOL reverse___ok = NO,
  }) {
    INT? result;

    BOOL operate(
      final INT element__id,
      final element___type element,
    ) {
      if (element__equal___ok(element).not) {
        return OK;
      }

      result = element__id;

      return NO;
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
    final BOOL reverse___ok = NO,
  }) => search__simple(
    (final e) => element__equal___ok(e, value),
    reverse___ok: reverse___ok,
  );

  INT? /*element__id_*/ search__segment(
    final array<element___type> segment,
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
            return NO;
          }

          if /*T*/ (e != segment[$segment__element__id]) {
            segment__element__id = NIL;
          }

          return OK;
        }

        if (e == segment.first) {
          segment__element__id = 0;
        }

        return OK;
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
    ].iterate__basic((final _, final e) {
      final result =
          e.input.search__segment(e.segment) //
            ..representation__text().print("${e.input}.search__segment(${e.segment})");
      if (result != e.result) {
        throw "un-expected result :($result ~= ${e.result})";
      }
    });
  }

  BOOL search__segment__begin(
    final array<element___type> segment,
  ) /*
equality is not considered prefix 
  ,like `abc` is prefixed to `abcxyz` ,but neither `abcxyz` ,nor `xyzabc`
more run-time efficient ,than `search__segment` */ {
    if ((elements__count > segment.elements__count).not) /*
`segment` can prefix `this` ,only if ,`segment`'s length is less than `this` */ {
      return NO;
    } else if (first != segment.first) {
      return NO;
    }

    var prefix_ed___ok = OK;

    segment.iterate__reverse(
      (final i, final e) {
        if (e == this[i]) {
          return OK;
        } else {
          prefix_ed___ok = NO;
          return NO;
        }
      },
    );

    return prefix_ed___ok;
  }

  void search__segment__begin__test() {
    [
      (input: [0, 1, 2, 3], segment: [0, 1], result: OK),
      (input: [0, 1, 2, 3], segment: [1, 2], result: NO),
      (input: [0, 1, 2, 3], segment: [0, 1, 2, 3], result: NO),
      (input: [0, 1, 2], segment: [0, 1, 2, 3], result: NO),
    ].iterate__basic((final _, final e) {
      final result =
          e.input.search__segment__begin(e.segment) //
            ..representation__text().print("${e.input}.search__segment__begin(${e.segment})");
      if (result != e.result) {
        throw "un-expected result :($result ~= ${e.result})";
      }
    });
  }

  array<element___type> search__multiple /*
join */ <element__other__type>(
    final array<element__other__type> other,
    final base__value__equality__function__format<element___type, element__other__type> element__equal___ok,
  ) {
    final accumulation = base__accumulation__linear__basic<element___type>();

    iterate__basic(
      (final _, final element) {
        var equal___ok = NO;

        other.iterate__reverse(
          (final _, final element__other) {
            final equal__ok_1 = element__equal___ok(
              element,
              element__other,
            );

            if (equal__ok_1.not) {
              return OK;
            }

            equal___ok = OK;

            return NO;
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
        reverse___ok: OK,
      ) !=
      null);

  BOOL contains__not(
    final BOOL Function(element___type) element__equal___ok,
  ) =>
      (search__simple(
        element__equal___ok,
        reverse___ok: OK,
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
      reverse___ok: OK,
    );

    if (element__id == null) {
      return NO;
    }

    element__remove(
      element__id,
    );

    return OK;
  }

  Iterable<element__new___type> //
  convert__definitive<element__new___type>(
    final element__new___type Function(INT, element___type) operate,
  ) {
    var i = 0;

    return this.convert(
      (final e) {
        final v = operate(i, e);

        i += 1;

        return v;
      },
    );
  }

  Iterable<element___type> //
  select__definitive //
  (final BOOL Function(INT, element___type) operate) {
    var i = 0;

    return where(
      (final e) {
        final v = operate(i, e);

        i += 1;

        return v;
      },
    );
  }
}

extension element__type__array__report__definitive__extension<element__type> //
    on array<element__type> {
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
        (((element__id - 4) > 0) ? " ,${element(-4)}" : empty__string) +
        (((element__id - 3) > 0) ? " ,${element(-3)}" : empty__string) +
        (((element__id - 2) > 0) ? " ,${element(-2)}" : empty__string) +
        (((element__id - 1) > 0) ? " ,${element(-1)}" : empty__string) + //
        "   ,${element(0)}  " + //
        (((element__id + 1) < elements__count) ? " ,${element(1)}" : empty__string) +
        (((element__id + 2) < elements__count) ? " ,${element(2)}" : empty__string) +
        (((element__id + 3) < elements__count) ? " ,${element(3)}" : empty__string) +
        (((element__id + 4) < elements__count) ? " ,${element(4)}" : empty__string) + //
        static__indicate__short_en_ing);
  }
}
