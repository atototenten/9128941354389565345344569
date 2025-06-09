part of "_.dart";

void base__storage__data__tar__create(
  final base__storage__data__meta___compo ds__meta, {
  required final BS1__array column__bytes,
  required final number__size rows__count__size__id,
}) {
  if (base__printing__ok) {
    base__function__call__print(
      "base__storage__data__tar__create",
      ds__meta.debug__label,
    );
  }

  base__printing__indentation__increase();

  byte__array__fill(
    column__bytes,
    count: base__storage__data__position__size__id.size,
    value: 1,
  ); /*
  to mark the column, as definitely, NOT nil
    because garbage can be any value, even nil */

  byte__array__fill(
    column__bytes.view(
      base__storage__data__position__size__id.size,
    ),
    count: rows__count__size__id.size,
  );

  base__printing__indentation__decrease();
}

typedef base__storage__data__tar__table__meta___compo = ({
  NIMR id,
  NIMR row__id,
  NIMR rows__count,
});

base__storage__data__tar__table__meta___compo base__storage__data__tar__table__meta(
  final NIMR row__id,
  final NI1R rows__count__multiplier__initial,
) {
  if (base__printing__ok) {
    base__function__call__print(
      "base__storage__data__tar__table__meta",
    );

    row__id.text__representation().print(
          "row__id",
        );
  }

  base__printing__indentation__increase();

  NIMR //
      table__id = 0,
      table__row__id /* table__row__id__offset__to__row */ = row__id,
      table__rows__count /* for the table; `rows_per_table`; `table__rows__count__limit` */ = //
          (4 << rows__count__multiplier__initial);

  while (!(table__row__id < table__rows__count)) {
    table__id += 1;
    table__row__id -= table__rows__count;
    table__rows__count <<= 1 /* (i *= 2) */;
  }

  if (base__printing__ok) {
    base__compo__text__representation(
      "base__storage__data__tar__table__meta__compo",
      {
        "table__id_": table__id.text__representation(),
        "row__id_": table__row__id.text__representation(),
        "rows__count": table__rows__count.text__representation(),
      },
    ).text__representation().print(
      "result",
      row__id.text__representation(),
    );
  }

  base__printing__indentation__decrease();

  return (
    id: table__id,
    row__id: table__row__id,
    rows__count: table__rows__count,
  );
}

NIMR base__storage__data__tar__bytes__count(final NIMR table__id) => //
    ((table__id + 1) * base__storage__data__position__size__id.size);

class base__storage__data__tar__meta___compo //
    extends base__storage__data__table__meta___protocol {
  base__storage__data__tar__meta___compo({
    required super.rows__count,
    required super.rows__count__size__id,
    required super.row__size,
    required this.tar__meta__bytes__base__storage__data__offset,
    required this.table__array__bytes__base__storage__data__offset /*
  `if(tar__meta.rows__count == 0) b__ignor_ed` */
    ,
    this.table__array__bytes,
    required this.rows__count__multiplier__initial,
  }) : rows__count__max = NI__max(
          rows__count__size__id.size,
        );

  NIMR //
      rows__count__max,
      table__array__bytes__base__storage__data__offset;

  final NIMR //
      tar__meta__bytes__base__storage__data__offset;

  BS1__array? //
      table__array__bytes;

  final NI1R //
      rows__count__multiplier__initial;

  base__compo__member__dictionary //
      convert__member__dictionary() {
    return {
      ...super.convert__member__dictionary(),
      "table__array__bytes__base__storage__data__offset": table__array__bytes__base__storage__data__offset.text__representation(),
      "tar__meta__bytes__base__storage__data__offset": tar__meta__bytes__base__storage__data__offset.text__representation(),
      "table__array__bytes": table__array__bytes.text__representation(),
      "rows__count__multiplier__initial": rows__count__multiplier__initial.text__representation(),
    };
  }
}

BS1__array base__storage__data__tar__table__array__bytes__read(
  final base__storage__data__meta___compo ds__meta,
  final base__storage__data__tar__meta___compo tar__meta,
) /* macro */ =>
    base__storage__data__read(
      ds__meta,
      count: base__storage__data__tar__bytes__count(
        base__storage__data__tar__table__meta(
          (tar__meta.rows__count - 1),
          tar__meta.rows__count__multiplier__initial,
        ).id,
      ),
      base__storage__data__offset: tar__meta.table__array__bytes__base__storage__data__offset,
    );

BS1__array base__storage__data__tar__table__array__bytes(
  final base__storage__data__meta___compo ds__meta,
  final base__storage__data__tar__meta___compo tar__meta,
) /* macro */ =>
    (tar__meta.table__array__bytes ??= //
        base__storage__data__tar__table__array__bytes__read(
      ds__meta,
      tar__meta,
    ));

NIMR base__storage__data__tar__row__bytes__base__storage__data__offset({
  required final base__storage__data__tar__table__meta___compo table__meta,
  required final NIMR row__size,
  required final BS1__array table__array__bytes,
  final NIMR row__offset = 0,
}) /* macro */ =>
    base__storage__data__table__row__bytes__base__storage__data__offset(
      row__id: table__meta.row__id,
      row__size: row__size,
      table__bytes__base__storage__data__offset: table__array__bytes
          .view(
            (table__meta.id * base__storage__data__position__size__id.size),
          )
          .cast__number__integer(
            base__storage__data__position__size__id,
          ),
      row__offset: row__offset,
    );

NIMR base__storage__data__tar__row__add(
  final base__storage__data__meta___compo ds__meta,
  final base__storage__data__tar__meta___compo tar__meta,
  final BS1__array bytes /* refer to `ds__table__row__add__bytes` */,
) {
  if (base__printing__ok) {
    base__function__call__print(
      "base__storage__data__tar__row__add",
      tar__meta.debug__label,
    );

    bytes.text__representation().print("bytes");
  }

  base__printing__indentation__increase();

  final row__id = tar__meta.rows__count++;

  if (base__printing__ok) {
    row__id.text__representation().print(
          "row__id",
          tar__meta.debug__label,
        );
  }

  base__storage__data__table__row__ensure__space(
    rows__count: row__id,
    rows__count__max: tar__meta.rows__count__max,
  );

  final table__meta = base__storage__data__tar__table__meta(
    row__id,
    tar__meta.rows__count__multiplier__initial,
  );

  if (table__meta.row__id != 0) /*
  the table has sufficient space */ //
    base__storage__data__write(
      ds__meta,
      bytes: bytes,
      bytes__count: tar__meta.row__size,
      base__storage__data__offset: base__storage__data__tar__row__bytes__base__storage__data__offset(
        table__meta: table__meta,
        row__size: tar__meta.row__size,
        table__array__bytes: base__storage__data__tar__table__array__bytes__read(
          ds__meta,
          tar__meta,
        ),
      ),
    );
  else {
    base__printing__indentation__increase();

    if (base__printing__ok) {
      ((table__meta.id != 0)
              ? ("current `table` is out-of-space;"
                  " allocating a new `table`;"
                  " also extend-ing the current `table__arr`'s capacity;")
              : "allocating, and populating; the `table`, and `table__arr`")
          .print(tar__meta.debug__label);
    }

    final //
        table__array__new__bytes__count = base__storage__data__tar__bytes__count(
          table__meta.id,
        ),
        table__array__new__bytes = BS1__array(table__array__new__bytes__count),
        base__storage__data__offset__to__table = base__storage__data__write__reserve(
          ds__meta,
          (table__meta.rows__count * tar__meta.row__size),
        );

    if (base__printing__ok) {
      ("${(table__meta.rows__count * tar__meta.row__size)}"
              "(${table__meta.rows__count}(rows) * ${tar__meta.row__size}(row's size))")
          .text__representation()
          .print(
            "table__new__size",
            tar__meta.debug__label,
          );

      base__storage__data__offset__to__table.text__representation().print(
            "base__storage__data__offset__to__table__new",
            tar__meta.debug__label,
          );
    }

    base__copy(
      table__array__new__bytes,
      base__storage__data__offset__to__table.cast__byte__array(
        base__storage__data__position__size__id,
      ),
      dest__offset: ((row__id != 0) //
          ? base__copy(
              table__array__new__bytes,
              (tar__meta.table__array__bytes ??
                  base__storage__data__tar__table__array__bytes__read(
                    ds__meta,
                    tar__meta,
                  )),
            ).dest__offset__new
          : 0),
      count: base__storage__data__position__size__id.size,
    );

    ((row__id != 0) //
        ? base__storage__data__write__replace
        : base__storage__data__write)(
      ds__meta,
      bytes: (tar__meta.table__array__bytes__base__storage__data__offset = //
              base__storage__data__write__append(
        ds__meta,
        (tar__meta.table__array__bytes = table__array__new__bytes),
        table__array__new__bytes__count,
      ))
          .cast__byte__array(
        base__storage__data__position__size__id,
      ),
      bytes__count: base__storage__data__position__size__id.size,
      base__storage__data__offset: tar__meta.tar__meta__bytes__base__storage__data__offset,
    );

    if (base__printing__ok) {
      base__storage__data__position(ds__meta).text__representation().print(
            "table__array__new__base__storage__data__offset",
            tar__meta.debug__label,
          );
    }

    base__printing__indentation__decrease();

    base__storage__data__write(
      ds__meta,
      bytes: bytes,
      bytes__count: tar__meta.row__size,
      base__storage__data__offset: base__storage__data__tar__row__bytes__base__storage__data__offset(
        table__meta: table__meta,
        row__size: tar__meta.row__size,
        table__array__bytes: table__array__new__bytes,
      ),
    );
  }

  base__printing__indentation__decrease();

  return row__id;
}

void base__storage__data__tar__rows__count__update(
  final base__storage__data__meta___compo ds__meta,
  final base__storage__data__tar__meta___compo tar__meta,
) =>
    base__storage__data__table__rows__count__update(
      ds__meta,
      tar__meta,
      rows__count__bytes__base__storage__data__offset: (base__storage__data__position__size__id.size + tar__meta.tar__meta__bytes__base__storage__data__offset),
    );

base__storage__data__table__row___compo base__storage__data__tar__row(
  final base__storage__data__meta___compo ds__meta,
  final base__storage__data__tar__meta___compo tar__meta, {
  required final NIMR row__id,
  required final BS1__array? bytes,
  NIMR? count,
  final NIMR row__offset = 0,
}) /* refer to `ds_.tbl.row` */ {
  if (base__printing__ok) {
    base__function__call__print(
      "base__storage__data__tar__row",
      tar__meta.debug__label,
    );

    row__id.text__representation().print("row__id");
  }

  base__printing__indentation__increase();

  base__storage__data__table__row__ensure__exists(
    row__id: row__id,
    rows__count: tar__meta.rows__count,
  );

  count ??= base__storage__data__table__row__bytes__count(
    row__size: tar__meta.row__size,
    rows__count: 1,
    row__offset: row__offset,
  );

  final //
      table__meta = base__storage__data__tar__table__meta(
        row__id,
        tar__meta.rows__count__multiplier__initial,
      ),
      offset = base__storage__data__tar__row__bytes__base__storage__data__offset(
        table__meta: table__meta,
        row__size: tar__meta.row__size,
        table__array__bytes: base__storage__data__tar__table__array__bytes(
          ds__meta,
          tar__meta,
        ),
        row__offset: row__offset,
      );

  if (bytes == null) {
    final bytes = base__storage__data__read(
      ds__meta,
      count: count,
      base__storage__data__offset: offset,
    );

    base__printing__indentation__decrease();

    return (
      bytes: bytes,
      bytes__base__storage__data__offset: offset,
    );
  } else {
    base__storage__data__write__replace(
      ds__meta,
      bytes: bytes,
      bytes__count: count,
      base__storage__data__offset: offset,
    );

    base__printing__indentation__decrease();

    return (
      bytes: bytes,
      bytes__base__storage__data__offset: offset,
    );
  }
}

base__storage__data__table__row__column___compo base__storage__data__tar__row__column(
  final base__storage__data__meta___compo ds__meta,
  final base__storage__data__tar__meta___compo tar__meta, {
  required final NIMR row__id,
  required final BS1__array? bytes,
  required final base__storage__data__table__column___compo table__column,
}) /* macro */ =>
    base__storage__data__tar__row(
      ds__meta,
      tar__meta,
      row__id: row__id,
      bytes: bytes,
      count: base__storage__data__table__column__size(
        table__column,
      ),
      row__offset: table__column.meta.offset,
    );

BS1__array base__storage__data__tar__row__group__bytes(
  final base__storage__data__meta___compo ds__meta,
  final base__storage__data__tar__meta___compo tar__meta, {
  required final NIMR group__id,
}) {
  if (base__printing__ok) {
    base__function__call__print(
      "base__storage__data__tar__row__group__bytes",
      tar__meta.debug__label,
    );
  }

  base__printing__indentation__increase();

  if (tar__meta.rows__count == 0) {
    "table.empty__ok".print();

    base__printing__indentation__decrease();

    return empty__byte__array;
  }

  const row__group__size = 12 /*
  12 as row__group__size
    8 is quite less, while 16 is too much
    12(or `(4 + 8)`) is also aligned with the `table__arr`'s first two `table`s `rows__count__max`
      hence the most efficient approach, because
        it allows consuming, all of the first 2 `table`'s `rows__count`, fully; while
          8(or `(4 + 4)`) would require accessing 2 `table`(of the `table__arr`)s
            and not consume (hence waste), half the `rows__count`, of the 2nd `table`
          16(or `(4 + 8 + 4)`) would require 3 `table` accesses
            and consume, a mere one-fourth of the `rows__count`, of the 3rd `table`
    12 is also more, than the usual user's expected count of 10, hence the 2 extra rows, feel like a bonus */
      ;

  NIMR row__id /*rows__offset*/ = (group__id * row__group__size);

  if (!(row__id < tar__meta.rows__count) /*b__exists*/) {
    "table.end".print();

    base__printing__indentation__decrease();

    return empty__byte__array;
  }

  final sink = base__byte__array__accumulation();

  NIMR count = (((row__group__size + row__id) > tar__meta.rows__count) //
      ? tar__meta.rows__count
      : row__group__size);

  while (count != 0) {
    final //
        table__meta = base__storage__data__tar__table__meta(
          row__id,
          tar__meta.rows__count__multiplier__initial,
        ),
        rows__count = ((count < table__meta.rows__count) //
            ? count
            : table__meta.rows__count);

    sink.add(
      base__storage__data__read(
        ds__meta,
        count: base__storage__data__table__row__bytes__count(
          row__size: tar__meta.row__size,
          rows__count: rows__count,
        ),
        base__storage__data__offset: base__storage__data__tar__row__bytes__base__storage__data__offset(
          table__meta: table__meta,
          row__size: tar__meta.row__size,
          table__array__bytes: base__storage__data__tar__table__array__bytes(
            ds__meta,
            tar__meta,
          ),
        ),
      ),
    );

    row__id += rows__count;
    count -= rows__count;
  }

  final result = sink.convert__byte__array();

  base__printing__indentation__decrease();

  return result;
}

void base__storage__data__tar__rows__all__iterate(
  final base__storage__data__meta___compo ds__meta,
  final base__storage__data__tar__meta___compo tar__meta,
  final void Function(
    NIMR row__id,
    BS1__array row__bytes,
    NIMR row__bytes__base__storage__data__offset,
  ) row__handle,
) /*
  REFER
    `data__base::table::rows::all` */
{
  if (base__printing__ok) {
    base__function__call__print(
      "base__storage__data__tar__rows__all",
      tar__meta.debug__label,
    );
  }

  base__printing__indentation__increase();

  if (tar__meta.rows__count == 0) {
    base__printing__indentation__decrease();

    throw "tar.table.empty__ok";
  }

  NIMR row__id__offset = 0;

  while (row__id__offset < tar__meta.rows__count) {
    final //
        table__meta = base__storage__data__tar__table__meta(
          row__id__offset,
          tar__meta.rows__count__multiplier__initial,
        ),
        table__bytes__base__storage__data__offset = base__storage__data__tar__row__bytes__base__storage__data__offset(
          table__meta: table__meta,
          row__size: tar__meta.row__size,
          table__array__bytes: base__storage__data__tar__table__array__bytes(
            ds__meta,
            tar__meta,
          ),
        ),
        table__bytes = base__storage__data__read(
          ds__meta,
          count: base__storage__data__table__row__bytes__count(
            row__size: tar__meta.row__size,
            rows__count: table__meta.rows__count,
          ),
          base__storage__data__offset: table__bytes__base__storage__data__offset,
        );

    NIMR table__bytes__offset = 0;

    base__iterate__basic(
      (((row__id__offset + table__meta.rows__count) < tar__meta.rows__count) //
          ? table__meta.rows__count
          : (tar__meta.rows__count - row__id__offset) /* once, at last */),
      (final row__id) {
        row__handle(
          (row__id + row__id__offset),
          table__bytes.view__partial(
            table__bytes__offset,
            tar__meta.row__size,
          ),
          (table__bytes__offset + table__bytes__base__storage__data__offset),
        );

        table__bytes__offset += tar__meta.row__size;
      },
    );

    row__id__offset += table__meta.rows__count;
  }

  base__printing__indentation__decrease();
}
