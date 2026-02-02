part of "_.dart";

void storage__data__tar__create(
  final storage__data__meta___compo ds__meta, {
  required final BS1__array column__bytes,
  required final number__size rows__count__size__id,
}) {
  if (printing___ok) {
    function__call__print(
      "storage__data__tar__create",
      ds__meta.debug__label,
    );
  }

  printing__indentation__increase();

  byte__array__fill(
    column__bytes,
    count: storage__data__position__size__id.size,
    value: 1,
  ); /*
  to mark the column, as definitely, NOT nil
    because garbage can be any value, even nil */

  byte__array__fill(
    column__bytes.view(
      storage__data__position__size__id.size,
    ),
    count: rows__count__size__id.size,
  );

  printing__indentation__decrease();
}

typedef storage__data__tar__table__meta___compo = ({
  INT id,
  INT row__id,
  INT rows__count,
});

storage__data__tar__table__meta___compo storage__data__tar__table__meta(
  final INT row__id,
  final INT rows__count__multiplier__initial,
) {
  if (printing___ok) {
    function__call__print(
      "storage__data__tar__table__meta",
    );

    row__id.representation__text().print(
          "row__id",
        );
  }

  printing__indentation__increase();

  INT //
      table__id = 0,
      table__row__id /* table__row__id__offset__to__row */ = row__id,
      table__rows__count /* for the table; `rows_per_table`; `table__rows__count__limit` */ = //
          (4 << rows__count__multiplier__initial);

  while (!(table__row__id < table__rows__count)) {
    table__id += 1;
    table__row__id -= table__rows__count;
    table__rows__count <<= 1 /* (i *= 2) */;
  }

  if (printing___ok) {
    compo__representation__text(
      "storage__data__tar__table__meta__compo",
      {
        "table__id_": table__id.representation__text(),
        "row__id_": table__row__id.representation__text(),
        "rows__count": table__rows__count.representation__text(),
      },
    ).representation__text().print(
      "result",
      row__id.representation__text(),
    );
  }

  printing__indentation__decrease();

  return (
    id: table__id,
    row__id: table__row__id,
    rows__count: table__rows__count,
  );
}

INT storage__data__tar__bytes__count(final INT table__id) => //
    ((table__id + 1) * storage__data__position__size__id.size);

class storage__data__tar__meta___compo //
    extends storage__data__table__meta___protocol {
  storage__data__tar__meta___compo({
    required super.rows__count,
    required super.rows__count__size__id,
    required super.row__size,
    required this.tar__meta__bytes__base__storage__data__offset,
    required this.table__array__bytes__base__storage__data__offset /*
  `if(tar__meta.rows__count == 0) b__ignor_ed` */
    ,
    this.table__array__bytes,
    required this.rows__count__multiplier__initial,
  }) : rows__count__max = INT__max(
          rows__count__size__id.size,
        );

  INT //
      rows__count__max,
      table__array__bytes__base__storage__data__offset;

  final INT //
      tar__meta__bytes__base__storage__data__offset;

  BS1__array? //
      table__array__bytes;

  final INT //
      rows__count__multiplier__initial;

  members___dictionary //
      convert__member__dictionary() {
    return {
      ...super.convert__member__dictionary(),
      "table__array__bytes__base__storage__data__offset": table__array__bytes__base__storage__data__offset.representation__text(),
      "tar__meta__bytes__base__storage__data__offset": tar__meta__bytes__base__storage__data__offset.representation__text(),
      "table__array__bytes": table__array__bytes.representation__text(),
      "rows__count__multiplier__initial": rows__count__multiplier__initial.representation__text(),
    };
  }
}

BS1__array storage__data__tar__table__array__bytes__read(
  final storage__data__meta___compo ds__meta,
  final storage__data__tar__meta___compo tar__meta,
) /* macro */ =>
    storage__data__read(
      ds__meta,
      count: storage__data__tar__bytes__count(
        storage__data__tar__table__meta(
          (tar__meta.rows__count - 1),
          tar__meta.rows__count__multiplier__initial,
        ).id,
      ),
      storage__data__offset: tar__meta.table__array__bytes__base__storage__data__offset,
    );

BS1__array storage__data__tar__table__array__bytes(
  final storage__data__meta___compo ds__meta,
  final storage__data__tar__meta___compo tar__meta,
) /* macro */ =>
    (tar__meta.table__array__bytes ??= //
        storage__data__tar__table__array__bytes__read(
      ds__meta,
      tar__meta,
    ));

INT storage__data__tar__row__bytes__base__storage__data__offset({
  required final storage__data__tar__table__meta___compo table__meta,
  required final INT row__size,
  required final BS1__array table__array__bytes,
  final INT row__offset = 0,
}) /* macro */ =>
    storage__data__table__row__bytes__base__storage__data__offset(
      row__id: table__meta.row__id,
      row__size: row__size,
      table__bytes__base__storage__data__offset: table__array__bytes
          .view(
            (table__meta.id * storage__data__position__size__id.size),
          )
          .cast__number__integer(
            storage__data__position__size__id,
          ),
      row__offset: row__offset,
    );

INT storage__data__tar__row__add(
  final storage__data__meta___compo ds__meta,
  final storage__data__tar__meta___compo tar__meta,
  final BS1__array bytes /* refer to `ds__table__row__add__bytes` */,
) {
  if (printing___ok) {
    function__call__print(
      "storage__data__tar__row__add",
      tar__meta.debug__label,
    );

    bytes.representation__text().print("bytes");
  }

  printing__indentation__increase();

  final row__id = tar__meta.rows__count++;

  if (printing___ok) {
    row__id.representation__text().print(
          "row__id",
          tar__meta.debug__label,
        );
  }

  storage__data__table__row__ensure__space(
    rows__count: row__id,
    rows__count__max: tar__meta.rows__count__max,
  );

  final table__meta = storage__data__tar__table__meta(
    row__id,
    tar__meta.rows__count__multiplier__initial,
  );

  if (table__meta.row__id != 0) /*
  the table has sufficient space */ //
    storage__data__write(
      ds__meta,
      bytes: bytes,
      bytes__count: tar__meta.row__size,
      storage__data__offset: storage__data__tar__row__bytes__base__storage__data__offset(
        table__meta: table__meta,
        row__size: tar__meta.row__size,
        table__array__bytes: storage__data__tar__table__array__bytes__read(
          ds__meta,
          tar__meta,
        ),
      ),
    );
  else {
    printing__indentation__increase();

    if (printing___ok) {
      ((table__meta.id != 0)
              ? ("current `table` is out-of-space;"
                  " allocating a new `table`;"
                  " also extend-ing the current `table__arr`'s capacity;")
              : "allocating, and populating; the `table`, and `table__arr`")
          .print(tar__meta.debug__label);
    }

    final //
        table__array__new__bytes__count = storage__data__tar__bytes__count(
          table__meta.id,
        ),
        table__array__new__bytes = BS1__array(table__array__new__bytes__count),
        storage__data__offset__to__table = storage__data__write__reserve(
          ds__meta,
          (table__meta.rows__count * tar__meta.row__size),
        );

    if (printing___ok) {
      ("${(table__meta.rows__count * tar__meta.row__size)}"
              "(${table__meta.rows__count}(rows) * ${tar__meta.row__size}(row's size))")
          .representation__text()
          .print(
            "table__new__size",
            tar__meta.debug__label,
          );

      storage__data__offset__to__table.representation__text().print(
            "storage__data__offset__to__table__new",
            tar__meta.debug__label,
          );
    }

    copy(
      table__array__new__bytes,
      storage__data__offset__to__table.cast__byte__array(
        storage__data__position__size__id,
      ),
      dest__offset: ((row__id != 0) //
          ? copy(
              table__array__new__bytes,
              (tar__meta.table__array__bytes ??
                  storage__data__tar__table__array__bytes__read(
                    ds__meta,
                    tar__meta,
                  )),
            ).dest__offset__new
          : 0),
      count: storage__data__position__size__id.size,
    );

    ((row__id != 0) //
        ? storage__data__write__replace
        : storage__data__write)(
      ds__meta,
      bytes: (tar__meta.table__array__bytes__base__storage__data__offset = //
              storage__data__write__append(
        ds__meta,
        (tar__meta.table__array__bytes = table__array__new__bytes),
        table__array__new__bytes__count,
      ))
          .cast__byte__array(
        storage__data__position__size__id,
      ),
      bytes__count: storage__data__position__size__id.size,
      storage__data__offset: tar__meta.tar__meta__bytes__base__storage__data__offset,
    );

    if (printing___ok) {
      storage__data__position(ds__meta).representation__text().print(
            "table__array__new__base__storage__data__offset",
            tar__meta.debug__label,
          );
    }

    printing__indentation__decrease();

    storage__data__write(
      ds__meta,
      bytes: bytes,
      bytes__count: tar__meta.row__size,
      storage__data__offset: storage__data__tar__row__bytes__base__storage__data__offset(
        table__meta: table__meta,
        row__size: tar__meta.row__size,
        table__array__bytes: table__array__new__bytes,
      ),
    );
  }

  printing__indentation__decrease();

  return row__id;
}

void storage__data__tar__rows__count__update(
  final storage__data__meta___compo ds__meta,
  final storage__data__tar__meta___compo tar__meta,
) =>
    storage__data__table__rows__count__update(
      ds__meta,
      tar__meta,
      rows__count__bytes__base__storage__data__offset: (storage__data__position__size__id.size + tar__meta.tar__meta__bytes__base__storage__data__offset),
    );

storage__data__table__row___compo storage__data__tar__row(
  final storage__data__meta___compo ds__meta,
  final storage__data__tar__meta___compo tar__meta, {
  required final INT row__id,
  required final BS1__array? bytes,
  INT? count,
  final INT row__offset = 0,
}) /* refer to `ds_.tbl.row` */ {
  if (printing___ok) {
    function__call__print(
      "storage__data__tar__row",
      tar__meta.debug__label,
    );

    row__id.representation__text().print("row__id");
  }

  printing__indentation__increase();

  storage__data__table__row__ensure__exists(
    row__id: row__id,
    rows__count: tar__meta.rows__count,
  );

  count ??= storage__data__table__row__bytes__count(
    row__size: tar__meta.row__size,
    rows__count: 1,
    row__offset: row__offset,
  );

  final //
      table__meta = storage__data__tar__table__meta(
        row__id,
        tar__meta.rows__count__multiplier__initial,
      ),
      offset = storage__data__tar__row__bytes__base__storage__data__offset(
        table__meta: table__meta,
        row__size: tar__meta.row__size,
        table__array__bytes: storage__data__tar__table__array__bytes(
          ds__meta,
          tar__meta,
        ),
        row__offset: row__offset,
      );

  if (bytes == null) {
    final bytes = storage__data__read(
      ds__meta,
      count: count,
      storage__data__offset: offset,
    );

    printing__indentation__decrease();

    return (
      bytes: bytes,
      bytes__base__storage__data__offset: offset,
    );
  } else {
    storage__data__write__replace(
      ds__meta,
      bytes: bytes,
      bytes__count: count,
      storage__data__offset: offset,
    );

    printing__indentation__decrease();

    return (
      bytes: bytes,
      bytes__base__storage__data__offset: offset,
    );
  }
}

storage__data__table__row__column___compo storage__data__tar__row__column(
  final storage__data__meta___compo ds__meta,
  final storage__data__tar__meta___compo tar__meta, {
  required final INT row__id,
  required final BS1__array? bytes,
  required final storage__data__table__column___compo table__column,
}) /* macro */ =>
    storage__data__tar__row(
      ds__meta,
      tar__meta,
      row__id: row__id,
      bytes: bytes,
      count: storage__data__table__column__size(
        table__column,
      ),
      row__offset: table__column.meta.offset,
    );

BS1__array storage__data__tar__row__group__bytes(
  final storage__data__meta___compo ds__meta,
  final storage__data__tar__meta___compo tar__meta, {
  required final INT group__id,
}) {
  if (printing___ok) {
    function__call__print(
      "storage__data__tar__row__group__bytes",
      tar__meta.debug__label,
    );
  }

  printing__indentation__increase();

  if (tar__meta.rows__count == 0) {
    "table.empty__ok".print();

    printing__indentation__decrease();

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

  INT row__id /*rows__offset*/ = (group__id * row__group__size);

  if (!(row__id < tar__meta.rows__count) /*b__exists*/) {
    "table.end".print();

    printing__indentation__decrease();

    return empty__byte__array;
  }

  final sink = byte__array__accumulation___compo();

  INT count = (((row__group__size + row__id) > tar__meta.rows__count) //
      ? tar__meta.rows__count
      : row__group__size);

  while (count != 0) {
    final //
        table__meta = storage__data__tar__table__meta(
          row__id,
          tar__meta.rows__count__multiplier__initial,
        ),
        rows__count = ((count < table__meta.rows__count) //
            ? count
            : table__meta.rows__count);

    sink.add(
      storage__data__read(
        ds__meta,
        count: storage__data__table__row__bytes__count(
          row__size: tar__meta.row__size,
          rows__count: rows__count,
        ),
        storage__data__offset: storage__data__tar__row__bytes__base__storage__data__offset(
          table__meta: table__meta,
          row__size: tar__meta.row__size,
          table__array__bytes: storage__data__tar__table__array__bytes(
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

  printing__indentation__decrease();

  return result;
}

void storage__data__tar__rows__all__iterate(
  final storage__data__meta___compo ds__meta,
  final storage__data__tar__meta___compo tar__meta,
  final void Function(
    INT row__id,
    BS1__array row__bytes,
    INT row__bytes__base__storage__data__offset,
  ) row__handle,
) /*
  REFER
    `data__base::table::rows::all` */
{
  if (printing___ok) {
    function__call__print(
      "storage__data__tar__rows__all",
      tar__meta.debug__label,
    );
  }

  printing__indentation__increase();

  if (tar__meta.rows__count == 0) {
    printing__indentation__decrease();

    throw "tar.table.empty__ok";
  }

  INT row__id__offset = 0;

  while (row__id__offset < tar__meta.rows__count) {
    final //
        table__meta = storage__data__tar__table__meta(
          row__id__offset,
          tar__meta.rows__count__multiplier__initial,
        ),
        table__bytes__base__storage__data__offset = storage__data__tar__row__bytes__base__storage__data__offset(
          table__meta: table__meta,
          row__size: tar__meta.row__size,
          table__array__bytes: storage__data__tar__table__array__bytes(
            ds__meta,
            tar__meta,
          ),
        ),
        table__bytes = storage__data__read(
          ds__meta,
          count: storage__data__table__row__bytes__count(
            row__size: tar__meta.row__size,
            rows__count: table__meta.rows__count,
          ),
          storage__data__offset: table__bytes__base__storage__data__offset,
        );

    INT table__bytes__offset = 0;

    iterate__basic(
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

  printing__indentation__decrease();
}
