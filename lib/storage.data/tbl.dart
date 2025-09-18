part of "_.dart";

void base__storage__data__tbl__create(
  final base__storage__data__meta___compo ds__meta, {
  required final BS1__array column__bytes,
  required final number__size rows__count__size__id,
  required final INT rows__count__max,
  required final INT row__size,
}) {
  if (base__printing___ok) {
    base__function__call__print(
      "base__storage__data__tbl__create",
      ds__meta.debug__label,
    );
  }

  base__printing__indentation__increase();

  base__copy(
    column__bytes,
    base__storage__data__write__reserve(
      ds__meta,
      (rows__count__max * row__size),
    ).cast__byte__array(
      base__storage__data__position__size__id,
    ),
    count: base__storage__data__position__size__id.size,
  );

  byte__array__fill(
    column__bytes.view(
      base__storage__data__position__size__id.size,
    ),
    count: rows__count__size__id.size,
  );

  base__printing__indentation__decrease();
}

class base__storage__data__tbl__meta___compo //
    extends base__storage__data__table__meta___protocol {
  base__storage__data__tbl__meta___compo({
    required super.rows__count,
    required super.rows__count__size__id,
    required super.row__size,
    required this.rows__count__max,
    required this.table__bytes__base__storage__data__offset,
    required final INT tbl__meta__bytes__base__storage__data__offset,
  }) : rows__count__bytes__base__storage__data__offset = (base__storage__data__position__size__id.size + tbl__meta__bytes__base__storage__data__offset);

  final INT //
      rows__count__max,
      table__bytes__base__storage__data__offset,
      rows__count__bytes__base__storage__data__offset;

  base__compo__member__dictionary //
      convert__member__dictionary() {
    return {
      ...super.convert__member__dictionary(),
      "table__bytes__base__storage__data__offset": table__bytes__base__storage__data__offset.representation__text(),
      "rows__count__bytes__base__storage__data__offset": rows__count__bytes__base__storage__data__offset.representation__text(),
    };
  }
}

INT /*row__id_*/ base__storage__data__tbl__row__add(
  final base__storage__data__meta___compo ds__meta,
  final base__storage__data__tbl__meta___compo tbl__meta,
  final BS1__array bytes /* any `bytes`__count, more than `row__size`, are ignored */,
) {
  if (base__printing___ok) {
    base__function__call__print(
      "base__storage__data__tbl__row__add",
      tbl__meta.debug__label,
    );

    bytes.representation__text().print(
          "bytes",
        );
  }

  base__printing__indentation__increase();

  final row__id = tbl__meta.rows__count;

  base__storage__data__table__row__ensure__space(
    rows__count: row__id,
    rows__count__max: tbl__meta.rows__count__max,
  );

  base__storage__data__write(
    ds__meta,
    bytes: bytes,
    bytes__count: tbl__meta.row__size,
    base__storage__data__offset: base__storage__data__table__row__bytes__base__storage__data__offset(
      row__id: row__id,
      row__size: tbl__meta.row__size,
      table__bytes__base__storage__data__offset: tbl__meta.table__bytes__base__storage__data__offset,
    ),
  );

  tbl__meta.rows__count += 1;

  base__printing__indentation__decrease();

  return row__id;
}

void base__storage__data__tbl__rows__count__update(
  final base__storage__data__meta___compo ds__meta,
  final base__storage__data__tbl__meta___compo tbl__meta, {
  required final INT rows__count__base__storage__data__offset,
}) =>
    base__storage__data__table__rows__count__update(
      ds__meta,
      tbl__meta,
      rows__count__bytes__base__storage__data__offset: tbl__meta.rows__count__bytes__base__storage__data__offset,
    );

base__storage__data__table__row___compo base__storage__data__tbl__row(
  final base__storage__data__meta___compo ds__meta,
  final base__storage__data__tbl__meta___compo tbl__meta, {
  required final INT row__id,
  required final BS1__array? bytes /* write(or mod) | read */,
  INT? count /* un-check for correct-ness; use with care */,
  final INT rows__count /* ignored if `count` is non-null */ = 1,
  final INT row__offset = 0,
}) {
  if (base__printing___ok) {
    base__function__call__print(
      "base__storage__data__tbl__row",
      tbl__meta.debug__label,
    );

    row__id.representation__text().print("row__id");
  }

  base__printing__indentation__increase();

  base__storage__data__table__row__ensure__exists(
    row__id: ((rows__count < 2) /* `!(rows__count > 1)` */ //
        ? row__id
        : (row__id + (rows__count - 1))),
    rows__count: tbl__meta.rows__count,
  );

  count ??= base__storage__data__table__row__bytes__count(
    row__size: tbl__meta.row__size,
    rows__count: rows__count,
    row__offset: row__offset,
  );

  final offset = base__storage__data__table__row__bytes__base__storage__data__offset(
    row__id: row__id,
    row__size: tbl__meta.row__size,
    table__bytes__base__storage__data__offset: tbl__meta.table__bytes__base__storage__data__offset,
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

base__storage__data__table__row__column___compo base__storage__data__tbl__row__column(
  final base__storage__data__meta___compo ds__meta,
  final base__storage__data__tbl__meta___compo tbl__meta, {
  required final INT row__id,
  required final BS1__array? bytes,
  required final base__storage__data__table__column___compo table__column,
}) /* macro */ =>
    base__storage__data__tbl__row(
      ds__meta,
      tbl__meta,
      row__id: row__id,
      bytes: bytes,
      count: base__storage__data__table__column__size(
        table__column,
      ),
      row__offset: table__column.meta.offset,
    );

BS1__array base__storage__data__tbl__rows__all(
  final base__storage__data__meta___compo ds__meta,
  final base__storage__data__tbl__meta___compo tbl__meta,
) /*
  read all the rows, in one op
  most time efficient
    even if, a single column need to be access-ed; but, of each row, of the table
    despite the presence of `base__storage__file__fast` layer, above `storage__persistent`
      because direct access, is always faster, than in-direct access, even in-memory
  least space efficient */
    =>
    base__storage__data__tbl__row(
      ds__meta,
      tbl__meta,
      row__id: 0,
      bytes: NIL,
      rows__count: tbl__meta.rows__count,
    ).bytes;
