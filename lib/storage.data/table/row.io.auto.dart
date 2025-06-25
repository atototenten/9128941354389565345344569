part of "../_.dart";

void base__storage__data__table__row__bytes__auto({
  required final base__storage__data__meta___compo ds__meta,
  required final base__storage__data__table__columns___compo table__columns,
  required final BS1__array row__bytes,
  required final array<Object?> /*
  `count` MUST NOT `< table__columns.count` */
      data__array,
}) {
  if (base__printing___ok) {
    base__function__call__print(
      "base__storage__data__table__row__bytes__auto",
    );
  }

  base__printing__indentation__increase();

  table__columns.iterate__reverse__basic(
    (final column__id, final table__column) => //
        base__storage__data__table__row__column__bytes__auto(
      ds__meta: ds__meta,
      table__column: table__column,
      column__bytes: ((column__id != 0) //
          ? row__bytes.view(
              table__column.meta.offset,
            )
          : row__bytes),
      data: data__array[column__id],
      b__initial: OK,
    ),
  );

  base__printing__indentation__decrease();
}

void base__storage__data__table__row__bytes__mod__auto({
  required final base__storage__data__meta___compo ds__meta,
  required final base__storage__data__table__columns___compo table__columns,
  required final array<
          ({
            NI meta__id,
            Object? data,
          })>
      column__array,
  required final BS1__array row__bytes,
}) {
  if (base__printing___ok) {
    base__function__call__print(
      "base__storage__data__table__row__bytes__mod__auto",
    );
  }

  base__printing__indentation__increase();

  column__array.iterate__reverse__basic(
    (final _, final column) {
      final table__column = table__columns[column.meta__id];

      base__storage__data__table__row__column__bytes__auto(
        ds__meta: ds__meta,
        table__column: table__column,
        column__bytes: row__bytes.view(
          table__column.meta.offset,
        ),
        data: column.data,
        b__initial: NO,
      );
    },
  );

  base__printing__indentation__decrease();
}

array<Object?> base__storage__data__table__row__data__array__auto({
  required final base__storage__data__meta___compo ds__meta,
  required final base__storage__data__table__columns___compo table__columns,
  required final array<NI> column__meta__id__array,
  required final BS1__array row__bytes,
  required final NI row__bytes__base__storage__data__offset,
}) /* macro */ {
  if (base__printing___ok) {
    base__function__call__print("base__storage__data__table__row__data__array__auto");

    row__bytes.text__representation().print("arguments__row__bytes");
  }

  base__printing__indentation__increase();

  final result = array__new__generated(
    column__meta__id__array.elements__count,
    (final column__id) {
      final table__column = table__columns[column__meta__id__array[column__id]];

      /*if (base__printing___ok) {
        report__NI(
          table__column.meta.offset,
          "table.column.meta.offset",
        );
      }*/

      return base__storage__data__table__row__column__data__auto(
        ds__meta: ds__meta,
        table__column: table__column,
        column__bytes: row__bytes.view(
          table__column.meta.offset,
        ),
        column__bytes__base__storage__data__offset: (table__column.meta.offset + row__bytes__base__storage__data__offset),
      );
    },
  );

  base__printing__indentation__decrease();

  return result;
}
