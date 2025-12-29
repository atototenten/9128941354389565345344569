part of "_.dart";

/*
  `table__main != main__tbl`
    former is a member/element of `main__tbl`
    latter is the persisted(to ds.), representation, of `table__main__arr` */

typedef base__storage__data__table__main__array___compo = //
    ARRAY<base__storage__data__table__column__compo>;

void base__storage__data__table__main__array__write(
  final base__storage__data__meta___compo ds__meta, {
  required final base__storage__data__table__main__array___compo table__main__array,
}) {
  if (base__printing___ok) {
    base__function__call__print(
      "base__storage__data__tbl__main__write",
      ds__meta.debug__label,
    );
  }

  base__printing__indentation__increase();

  final //
      table__array__count = table__main__array.elements__count,
      tbl__size = base__storage__data__main__tbl__size(
        table__array__count,
      ),
      tbl__bytes = BS1__array(
        tbl__size,
      );

  base__iterate__reverse__basic(
    table__array__count,
    (final table__id) {
      final //
          table__column = table__main__array[table__id],
          bytes /* macro */ = tbl__bytes.view(
            base__storage__data__main__tbl__size(
              table__id,
            ),
          );

      switch (table__column.type) {
        case base__storage__data__table__column__type___enum.tar:
          base__storage__data__tar__create(
            ds__meta,
            column__bytes: bytes,
            rows__count__size__id: (table__column.meta as base__storage__data__table__column__type__tar__meta__compo).rows__count__size__id,
          );

          break;

        case base__storage__data__table__column__type___enum.tbl:
          final column__meta = (table__column.meta as base__storage__data__table__column__type__tbl__meta__compo);

          base__storage__data__tbl__create(
            ds__meta,
            column__bytes: bytes,
            rows__count__size__id: column__meta.rows__count__size__id,
            rows__count__max: column__meta.rows__count__max,
            row__size: column__meta.row__size,
          );

          break;

        default:
          throw "ONLY allowed, `type`s are, `tar`, and `tbl`";
      }
    },
  );

  base__storage__data__write(
    ds__meta,
    bytes: tbl__bytes,
    bytes__count: tbl__size,
    base__storage__data__offset: base__storage__data__main__tbl__offset,
  );

  base__printing__indentation__decrease();
}

base__storage__data__table__meta___protocol base__storage__data__table__main__open(
  final base__storage__data__meta___compo ds__meta, {
  required final base__storage__data__table__main__array___compo table__main__array,
  required final INT table__main__id,
}) {
  if (base__printing___ok) {
    base__function__call__print(
      "base__storage__data__tbl__main__table",
      ds__meta.debug__label,
    );

    table__main__id.representation__text().print("table__main__id");
  }

  base__printing__indentation__increase();

  final //
      column__bytes__base__storage__data__offset = //
          (base__storage__data__main__tbl__size(
                table__main__id,
              ) +
              base__storage__data__main__tbl__offset),
      column__bytes = base__storage__data__read(
        ds__meta,
        count: (base__storage__data__table__main__rows__count__size + base__storage__data__position__size__id.size),
        base__storage__data__offset: column__bytes__base__storage__data__offset,
      ),
      table__column = table__main__array[table__main__id];

  final base__storage__data__table__meta___protocol result;

  switch (table__column.type) {
    case base__storage__data__table__column__type___enum.tar:
      final //
          column__meta = (table__column.meta as base__storage__data__table__column__type__tar__meta__compo),
          details /* ignored, if `(rows__count == 0)` */ = base__storage__data__table__row__column__type__in_direct__bytes__read(
            column__meta: column__meta,
            column__bytes: column__bytes,
          );

      result = base__storage__data__tar__meta___compo(
        rows__count: details.count,
        rows__count__size__id: column__meta.rows__count__size__id,
        row__size: column__meta.row__size,
        tar__meta__bytes__base__storage__data__offset: column__bytes__base__storage__data__offset,
        table__array__bytes__base__storage__data__offset: details.base__storage__data__offset,
        rows__count__multiplier__initial: column__meta.rows__count__multiplier__initial,
      );

      break;

    case base__storage__data__table__column__type___enum.tbl:
      final //
          column__meta = (table__column.meta as base__storage__data__table__column__type__tbl__meta__compo),
          details = base__storage__data__table__row__column__type__in_direct__bytes__read(
            column__meta: column__meta,
            column__bytes: column__bytes,
          );

      result = base__storage__data__tbl__meta___compo(
        rows__count: details.count,
        rows__count__size__id: column__meta.rows__count__size__id,
        rows__count__max: column__meta.rows__count__max,
        row__size: column__meta.row__size,
        table__bytes__base__storage__data__offset: details.base__storage__data__offset,
        tbl__meta__bytes__base__storage__data__offset: column__bytes__base__storage__data__offset,
      );

      break;

    default:
      throw Exception();
  }

  base__printing__indentation__decrease();

  return result;
}
