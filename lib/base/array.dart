part of "_.dart";

typedef array<element__type> = List<element__type>;

array<element__type> array__new__copy<element__type>(
  final array<element__type> arr_, {
  final NIMR offset = 0,
  final NIMR? count,
}) =>
    arr_.sublist(
      offset,
      ((count ?? arr_.elements__count) + offset),
    );

array<element__type> array__new__filled<element__type>(
  final NIMR count,
  final element__type value,
) =>
    array<element__type>.filled(
      count,
      value,
      growable: NO,
    );

array<element__type> array__new__generated<element__type>(
  final NIMR count,
  final element__type Function(NIMR i) generate,
) =>
    array<element__type>.generate(
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
) =>
    array__new__filled<element__type>(
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

    elements__count.text__representation().print("elements__count");

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
      empty__array
    ]..text__representation().print("un_merge_ed"))
        .merge()
        .text__representation()
        .print("merge_ed");
  }
}

NIMR array__reverse__element__id(
  final NIMR element__id,
  final NIMR elements__count,
) =>
    ((elements__count - 1) - element__id);

BS1__array NI__array__convert__BS1__array(
  final array<NIMR> arr,
) {
  arr.iterate__reverse__basic(
    (final i, final value) {
      if /*F*/ (value > NI1__max) {
        throw "$value(`array[$i]`) exceeds the limits of `by`";
      }
    },
  );

  return BS1__array.fromList(
    arr,
  );
}

extension array__extension<element__type> on array<element__type> {
  NIMR get elements__count => //
      length;

  NIMR get count => //
      length;

  BOOL empty__ok() => //
      (this.elements__count == 0);

  BOOL empty__not() => //
      (this.elements__count != 0);

  array<element__type>? empty__not__else__nil() => //
      (empty__not() ? this : NIL);

  element__type element__last() => //
      this[this.elements__count - 1];

  void iterate(
    final BOOL Function(NIMR element__id, element__type element) operate, {
    final NIMR? count,
    final NIMR offset = 0,
  }) =>
      base__iterate(
        (count ?? (this.elements__count - offset)),
        offset: offset,
        (final element__id) => //
            operate(element__id, this[element__id]),
      );

  void iterate__basic(
    final void Function(NIMR element__id, element__type element) operate, {
    final NIMR? count,
    final NIMR offset = 0,
  }) =>
      base__iterate__basic(
        (count ?? (this.elements__count - offset)),
        (final element__id) => //
            operate(element__id, this[element__id]),
        offset: offset,
      );

  void iterate__reverse(
    final BOOL Function(NIMR element__id, element__type element) operate, {
    final NIMR? count,
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
    final void Function(NIMR element__id, element__type element) operate, {
    final NIMR? count,
  }) =>
      base__iterate__reverse__basic(
        (count ?? this.elements__count),
        (final element__id) => //
            operate(element__id, this[element__id]),
      );

  element__type element(
    final NIMR element__id,
  ) =>
      this[element__id];

  void fill(
    final element__type value, {
    NIMR? count,
    NIMR offset = 0,
  }) {
    count = ((count == null) //
        ? (elements__count - offset)
        : (count + offset));

    while (offset < count) {
      this[offset++] = value;
    }
  }

  NIMR? /*
un-equal element's id, if any */
      un_equal__element__id(
    final array<element__type> other, {
    final NIMR? count,
    final NIMR offset = 0,
  }) {
    NIMR? result;

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

  BOOL equal__ok(
    final array<element__type> other,
  ) {
    if (elements__count != other.elements__count) {
      return NO;
    }

    return (un_equal__element__id(other) == NIL);
  }

  NIMR? /*
`id` if present ,otherwise NIL */
      search__simple(
    final BOOL Function(element__type) element__equal__ok, {
    final BOOL reverse__ok = NO,
  }) {
    NIMR? result;

    BOOL operate(
      final NIMR element__id,
      final element__type element,
    ) {
      if (element__equal__ok(element).not) {
        return OK;
      }

      result = element__id;

      return NO;
    }

    (reverse__ok //
        ? iterate__reverse
        : iterate)(operate);

    return result;
  }

  NIMR? search(
    final element__type value,
    final BOOL Function(
      element__type element,
      element__type value,
    ) element__equal__ok, {
    final BOOL reverse__ok = NO,
  }) =>
      search__simple(
        (final e) => element__equal__ok(e, value),
        reverse__ok: reverse__ok,
      );

  NIMR? /*element__id_*/ search__segment(
    final array<element__type> segment,
  ) {
    NIMR? segment__element__id;

    iterate(
      (final i, final e) {
        if (segment__element__id != NIL) {
          final $segment__element__id = (segment__element__id = (1 + segment__element__id!));
          if /*F*/ (($segment__element__id == segment.elements__count) /*
whole `segment` has been iterated ,and was not un-equal to `this[(i-segment__element__id)..segment.elements__count]` */ //
                  ||
                  (i == (elements__count - 1)) /*
`e` is the last element ,of `this` */
              ) /*
whole `segment` has been iterated ,and was not un-equal to `this[(i-segment__element__id)..segment.elements__count]` */
          {
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
      final result = e.input.search__segment(e.segment) //
        ..text__representation().print("${e.input}.search__segment(${e.segment})");
      if (result != e.result) {
        throw "un-expected result :($result ~= ${e.result})";
      }
    });
  }

  BOOL search__segment__begin(
    final array<element__type> segment,
  ) /*
equality is not considered prefix 
  ,like `abc` is prefixed to `abcxyz` ,but neither `abcxyz` ,nor `xyzabc`
more run-time efficient ,than `search__segment` */
  {
    if ((elements__count > segment.elements__count).not) /*
`segment` can prefix `this` ,only if ,`segment`'s length is less than `this` */
    {
      return NO;
    } else if (first != segment.first) {
      return NO;
    }

    var prefix_ed__ok = OK;

    segment.iterate__reverse(
      (final i, final e) {
        if (e == this[i]) {
          return OK;
        } else {
          prefix_ed__ok = NO;
          return NO;
        }
      },
    );

    return prefix_ed__ok;
  }

  void search__segment__begin__test() {
    [
      (input: [0, 1, 2, 3], segment: [0, 1], result: OK),
      (input: [0, 1, 2, 3], segment: [1, 2], result: NO),
      (input: [0, 1, 2, 3], segment: [0, 1, 2, 3], result: NO),
      (input: [0, 1, 2], segment: [0, 1, 2, 3], result: NO),
    ].iterate__basic((final _, final e) {
      final result = e.input.search__segment__begin(e.segment) //
        ..text__representation().print("${e.input}.search__segment__begin(${e.segment})");
      if (result != e.result) {
        throw "un-expected result :($result ~= ${e.result})";
      }
    });
  }

  array<element__type> search__multiple /*
join */
      <element__other__type>(
    final array<element__other__type> other,
    final base__value__equal__ok__function__format<element__type, element__other__type> element__equal__ok,
  ) {
    final accumulation = base__accumulation__linear__basic<element__type>();

    iterate__basic(
      (final _, final element) {
        var equal__ok = NO;

        other.iterate__reverse(
          (final _, final element__other) {
            final equal__ok_1 = element__equal__ok(
              element,
              element__other,
            );

            if (equal__ok_1.not) {
              return OK;
            }

            equal__ok = OK;

            return NO;
          },
        );

        if (equal__ok) {
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

  BOOL present__ok(
    final BOOL Function(element__type) element__equal__ok,
  ) =>
      (search__simple(
            element__equal__ok,
            reverse__ok: OK,
          ) !=
          null);

  BOOL contains__not(
    final BOOL Function(element__type) element__equal__ok,
  ) =>
      (search__simple(
            element__equal__ok,
            reverse__ok: OK,
          ) ==
          null);

  void element__remove(
    final NIMR element__id,
  ) {
    removeAt(
      element__id,
    );
  }

  BOOL remove(
    final BOOL Function(element__type) element__equal__ok,
  ) {
    final element__id = search__simple(
      element__equal__ok,
      reverse__ok: OK,
    );

    if (element__id == null) {
      return NO;
    }

    element__remove(
      element__id,
    );

    return OK;
  }

  array<element__new__type> //
      convert<element__new__type>(
    final element__new__type Function(element__type) operate,
  ) {
    return map(
      operate,
    ).toList(
      growable: NO,
    );
  }

  array<element__new__type> //
      convert__definitive<element__new__type>(
    final element__new__type Function(NIMR, element__type) operate,
  ) {
    var i = 0;

    return convert(
      (final e) => operate(i++, e),
    );
  }
}

extension element__type__array__report__definitive__extension<element__type> //
    on array<element__type> {
  string__raw //
      convert__text__concise__definitive(
    final NIMR elements__count,
    final NIMR element__id,
  ) {
    string__raw element(
      final NISMR id__diff_,
    ) {
      return this[element__id + id__diff_].text__representation().value;
    }

    return ("$element__id: $static__indicate__short_en_ing " + //
        (((element__id - 4) > 0) ? " ,${element(-4)}" : empty__text) +
        (((element__id - 3) > 0) ? " ,${element(-3)}" : empty__text) +
        (((element__id - 2) > 0) ? " ,${element(-2)}" : empty__text) +
        (((element__id - 1) > 0) ? " ,${element(-1)}" : empty__text) + //
        "   ,${element(0)}  " + //
        (((element__id + 1) < elements__count) ? " ,${element(1)}" : empty__text) +
        (((element__id + 2) < elements__count) ? " ,${element(2)}" : empty__text) +
        (((element__id + 3) < elements__count) ? " ,${element(3)}" : empty__text) +
        (((element__id + 4) < elements__count) ? " ,${element(4)}" : empty__text) + //
        static__indicate__short_en_ing);
  }
}
