import "package:base/base/_.dart";
import "package:base/storage.data.basic/_.dart";

final //
    base__storage__data__basic__simple__column__meta___raw = base__storage__data__basic__table__column__meta(
      NIL,
      base__storage__data__basic__table__column__data__type.byte__array,
    ),
    base__storage__data__basic__simple__columns__meta___raw = array__new__element__single(
      base__storage__data__basic__simple__column__meta___raw,
    );

class base__storage__data__basic__simple__meta //
    <table__cell__meta__type extends base__storage__data__basic__simple__cell___protocol> //
    extends base__storage__data__basic__simple__meta__base<base__storage__data__basic__accessing__meta, table__cell__meta__type> {
  static value__asyn<base__storage__data__basic__simple__meta<table__cell__meta__type>?> //
      asyn<table__cell__meta__type extends base__storage__data__basic__simple__cell___protocol>({
    required final base__storage__data__basic__meta storage,
    required final base__storage__data__basic__table__id storage__table__id,
  }) async {
    final storage__accessing__meta__asyn = storage.accessing__meta__asyn();

    if (storage__accessing__meta__asyn == null) {
      return NIL;
    }

    final storage__accessing__meta = await storage__accessing__meta__asyn;

    return base__storage__data__basic__simple__meta<table__cell__meta__type>.raw(
      storage__accessing__meta___raw: storage__accessing__meta,
      storage__table__id___raw: storage__table__id,
    );
  }

  const base__storage__data__basic__simple__meta.raw({
    required final base__storage__data__basic__accessing__meta storage__accessing__meta___raw,
    required final base__storage__data__basic__table__id storage__table__id___raw,
  }) : super.raw(
          storage__accessing__meta___raw: storage__accessing__meta___raw,
          storage__table__id___raw: storage__table__id___raw,
        );
}

abstract class base__storage__data__basic__simple__meta__base //
    <
        storage__accessing__meta__type extends base__storage__data__basic__accessing__meta__base, //
        table__cell__meta__type extends base__storage__data__basic__simple__cell___protocol> /*
based on `base__storage__data__basic__meta` */
{
  const base__storage__data__basic__simple__meta__base.raw({
    required this.storage__accessing__meta___raw,
    required this.storage__table__id___raw,
  });

  final storage__accessing__meta__type storage__accessing__meta___raw;
  final base__storage__data__basic__table__id storage__table__id___raw;

  value__asyn<byte__array> cell___raw(
    final table__cell__meta__type cell__meta,
  ) async {
    final row = await storage__accessing__meta___raw.table__row__asyn(
      table__id: storage__table__id___raw,
      table__row__id: cell__meta.row__id(),
      result__columns__meta: base__storage__data__basic__simple__columns__meta___raw,
    );

    return (row!.first as byte__array);
  }

  value__asyn<byte__array?> cell(
    final table__cell__meta__type cell__meta,
  ) async {
    final result = await cell___raw(
      cell__meta,
    );

    if (result.empty___ok()) {
      return NIL;
    }

    return result;
  }

  value__asyn<byte__array?> cell__byte__array(
    final table__cell__meta__type cell__meta,
  ) async {
    final result = await cell(
      cell__meta,
    );

    return result;
  }

  value__asyn<NI?> cell__NI(
    final table__cell__meta__type cell__meta,
  ) async {
    final result = await cell(
      cell__meta,
    );

    return result.convert__if(
      (final bytes) {
        return NI__bytes__convert(
          bytes,
        ).value;
      },
    );
  }

  value__asyn<BOOL?> cell__BOOL(
    final table__cell__meta__type cell__meta,
  ) async {
    final result = await cell__NI(
      cell__meta,
    );

    return result.convert__if(
      (final value) {
        return (value != 0);
      },
    );
  }

  value__asyn<NIS?> cell__NIS(
    final table__cell__meta__type cell__meta,
  ) async {
    final result = await cell(
      cell__meta,
    );

    return result.convert__if(
      (final bytes) {
        final result = NI__bytes__convert(
          bytes.view(1),
        ).value;

        if (bytes.first != 0) {
          return -result;
        }

        return result;
      },
    );
  }

  value__asyn<string?> cell__text(
    final table__cell__meta__type cell__meta,
  ) async {
    final result = await cell(
      cell__meta,
    );

    return result.convert__if(
      utf_8__bytes__convert__text,
    );
  }

  value__asyn<NFP?> cell__NE(
    final table__cell__meta__type cell__meta,
  ) async {
    final result = await cell__text(
      cell__meta,
    );

    return result.convert__if(
      NFP.parse,
    );
  }
}

class base__storage__data__basic__simple__mutating__meta /*
empty {`byte__array` and `text`} are equal to nil/absence */ //
    <table__cell__meta__type extends base__storage__data__basic__simple__cell___protocol> //
    extends base__storage__data__basic__simple__meta__base<base__storage__data__basic__accessing__mutating__meta, table__cell__meta__type> {
  static value__asyn<base__storage__data__basic__simple__mutating__meta<table__cell__meta__type>?> //
      asyn<table__cell__meta__type extends base__storage__data__basic__simple__cell___protocol>({
    required final base__storage__data__basic__meta storage,
    required final base__storage__data__basic__table__id storage__table__id,
  }) async {
    final storage__accessing__meta__asyn = storage.accessing__mutating__meta__asyn();

    if (storage__accessing__meta__asyn == null) {
      return NIL;
    }

    final storage__accessing__meta = await storage__accessing__meta__asyn;

    return base__storage__data__basic__simple__mutating__meta<table__cell__meta__type>.raw(
      storage__accessing__meta___raw: storage__accessing__meta,
      storage__table__id___raw: storage__table__id,
    );
  }

  static value__asyn<void> cells__count__update({
    required final base__storage__data__basic__accessing__mutating__meta storage__accessing__meta,
    required final base__storage__data__basic__table__id storage__table__id,
    required final NI cells__count /*
can be increased ,freely
  except during online (any connection open to storage)
  but decreasing leads to space wastage/leakage */
    ,
  }) async {
    final rows__count = await storage__accessing__meta.table__rows__count__asyn(
      table__id: storage__table__id,
    );

    if (cells__count <= rows__count) {
      return;
    }

    await storage__accessing__meta.table__rows__add__asyn(
      table__id: storage__table__id,
      columns__meta: base__storage__data__basic__simple__columns__meta___raw,
      rows: array__new__filled(
        (cells__count - rows__count),
        array__new__element__single(
          empty__byte__array,
        ),
      ),
    );

    await storage__accessing__meta.complete__asyn();
  }

  base__storage__data__basic__simple__mutating__meta.raw({
    required final base__storage__data__basic__accessing__mutating__meta storage__accessing__meta___raw,
    required final base__storage__data__basic__table__id storage__table__id___raw,
  }) : super.raw(
          storage__accessing__meta___raw: storage__accessing__meta___raw,
          storage__table__id___raw: storage__table__id___raw,
        );

  value__asyn<void> cell__assign(
    final table__cell__meta__type cell__meta,
    final byte__array value,
  ) async {
    await storage__accessing__meta___raw.table__row__cells__assign__asyn(
      table__id: storage__table__id___raw,
      table__row__id: cell__meta.row__id(),
      columns: array__new__element__single(
        base__storage__data__basic__table__column(
          base__storage__data__basic__simple__column__meta___raw,
          value,
        ),
      ),
    );
  }

  value__asyn<void> cell__assign__nil(
    final table__cell__meta__type cell__meta,
  ) async {
    await cell__assign(
      cell__meta,
      empty__byte__array,
    );
  }

  value__asyn<void> cell__assign__BOOL(
    final table__cell__meta__type cell__meta,
    final BOOL value,
  ) async {
    await cell__assign__NI(
      cell__meta,
      (value ? 1 : 0),
    );
  }

  value__asyn<void> cell__assign__NI(
    final table__cell__meta__type cell__meta,
    final NI value,
  ) async {
    await cell__assign(
      cell__meta,
      value.convert__bytes(),
    );
  }

  value__asyn<void> cell__assign__NIS(
    final table__cell__meta__type cell__meta,
    final NIS value,
  ) async {
    final //
        negative___ok = value.isNegative,
        bytes = (negative___ok //
                ? -value
                : value)
            .convert__bytes(),
        data = byte__array(
          (1 + bytes.bytes__count),
        );

    data.first = (negative___ok ? 1 : 0);

    base__copy(
      data,
      bytes,
      dest__offset: 1,
    );

    await cell__assign(
      cell__meta,
      data,
    );
  }

  value__asyn<void> cell__assign__NE(
    final table__cell__meta__type cell__meta,
    final NFP value,
  ) async {
    await cell__assign__text(
      cell__meta,
      value.toString(),
    );
  }

  value__asyn<void> cell__assign__byte__array(
    final table__cell__meta__type cell__meta,
    final byte__array value,
  ) async {
    await cell__assign(
      cell__meta,
      value,
    );
  }

  value__asyn<void> cell__assign__text(
    final table__cell__meta__type cell__meta,
    final string value,
  ) async {
    if /*F*/ (value.empty___ok()) {
      await cell__assign__nil(
        cell__meta,
      );
    } else {
      await cell__assign(
        cell__meta,
        text__convert__utf_8__bytes(
          value,
        ),
      );
    }
  }

  value__asyn<void> cells__assign__default /*
should be avoided ,unless necessary
  due to being a simple in-efficient iterating impl. */
      ({
    required final array<table__cell__meta__type> cells__meta,
    required final BOOL? value__BOOL,
    required final NI? value__NI,
    required final NIS? value__NIS,
    required final NFP? value__NE,
    required final byte__array? value__byte__array,
    required final string? value__text,
  }) async {
    await base__iterate__basic__asyn(
      cells__meta.elements__count,
      (final i) async {
        final cell__meta = cells__meta[i];

        switch (cell__meta.type()) {
          case base__storage__data__basic__simple__cell__type.BOOL:
            {
              if (value__BOOL == null) {
                cell__assign__nil(
                  cell__meta,
                );
              } else {
                cell__assign__BOOL(
                  cell__meta,
                  value__BOOL,
                );
              }
            }
            break;
          case base__storage__data__basic__simple__cell__type.NI:
            {
              if (value__NI == null) {
                cell__assign__nil(
                  cell__meta,
                );
              } else {
                cell__assign__NI(
                  cell__meta,
                  value__NI,
                );
              }
            }
            break;
          case base__storage__data__basic__simple__cell__type.NIS:
            {
              if (value__NIS == null) {
                cell__assign__nil(
                  cell__meta,
                );
              } else {
                cell__assign__NIS(
                  cell__meta,
                  value__NIS,
                );
              }
            }
            break;
          case base__storage__data__basic__simple__cell__type.NE:
            {
              if (value__NE == null) {
                cell__assign__nil(
                  cell__meta,
                );
              } else {
                cell__assign__NE(
                  cell__meta,
                  value__NE,
                );
              }
            }
            break;
          case base__storage__data__basic__simple__cell__type.byte__array:
            {
              if (value__byte__array == null) {
                cell__assign__nil(
                  cell__meta,
                );
              } else {
                cell__assign__byte__array(
                  cell__meta,
                  value__byte__array,
                );
              }
            }
            break;
          case base__storage__data__basic__simple__cell__type.text:
            {
              if (value__text == null) {
                cell__assign__nil(
                  cell__meta,
                );
              } else {
                cell__assign__text(
                  cell__meta,
                  value__text,
                );
              }
            }
            break;
        }
      },
    );
  }
}

abstract class base__storage__data__basic__simple__cell___protocol {
  base__storage__data__basic__table__row__id row__id();

  base__storage__data__basic__simple__cell__type type();
}

enum base__storage__data__basic__simple__cell__type //
{ BOOL, NI, NIS, NE, byte__array, text }

value__asyn<void> base__storage__data__basic__simple__test({
  required final base__storage__data__basic__simple__mutating__meta storage,
}) async {
  final cases = [
    (
      abc: 99,
      jkl: -99,
      xyz: 99.99,
    ),
    (
      abc: 999,
      jkl: -999,
      xyz: 999.99,
    )
  ];

  base__iterate__basic__asyn(
    cases.elements__count,
    (final i) async {
      final values = cases[i];

      final //
          abc = base__storage__data__basic__simple__testing__cell__abc(),
          jkl = base__storage__data__basic__simple__testing__cell__jkl(),
          xyz = base__storage__data__basic__simple__testing__cell__xyz();

      await storage.cell__assign__NI(abc, values.abc);
      await storage.cell__assign__NIS(jkl, values.jkl);
      await storage.cell__assign__NE(xyz, values.xyz);

      {
        final value = await storage.cell__NI(
          abc,
        );

        value.text__representation().print("abc__value");

        if (value != values.abc) {
          throw "$value ~= ${values.abc}";
        }
      }

      {
        final value = await storage.cell__NIS(
          jkl,
        );

        value.text__representation().print("jkl__value");

        if (value != values.jkl) {
          throw "$value ~= ${values.jkl}";
        }
      }

      {
        final value = await storage.cell__NE(
          xyz,
        );

        value.text__representation().print("xyz__value");

        if (value != values.xyz) {
          throw "$value ~= ${values.xyz}";
        }
      }
    },
  );
}

enum base__storage__data__basic__simple__testing__cells {
  abc,
  jkl,
  xyz,
}

class base__storage__data__basic__simple__testing__cell__abc //
    implements
        base__storage__data__basic__simple__cell___protocol {
  @override
  base__storage__data__basic__table__row__id row__id() {
    return base__storage__data__basic__table__row__id(
      base__storage__data__basic__simple__testing__cells.abc.index,
    );
  }

  @override
  base__storage__data__basic__simple__cell__type type() {
    return base__storage__data__basic__simple__cell__type.NI;
  }
}

class base__storage__data__basic__simple__testing__cell__jkl //
    implements
        base__storage__data__basic__simple__cell___protocol {
  @override
  base__storage__data__basic__table__row__id row__id() {
    return base__storage__data__basic__table__row__id(
      base__storage__data__basic__simple__testing__cells.jkl.index,
    );
  }

  @override
  base__storage__data__basic__simple__cell__type type() {
    return base__storage__data__basic__simple__cell__type.NIS;
  }
}

class base__storage__data__basic__simple__testing__cell__xyz //
    implements
        base__storage__data__basic__simple__cell___protocol {
  @override
  base__storage__data__basic__table__row__id row__id() {
    return base__storage__data__basic__table__row__id(
      base__storage__data__basic__simple__testing__cells.xyz.index,
    );
  }

  @override
  base__storage__data__basic__simple__cell__type type() {
    return base__storage__data__basic__simple__cell__type.NE;
  }
}
