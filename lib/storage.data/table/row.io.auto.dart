part of "../_.dart";

void storage__data__table__row__bytes__auto({
  required final storage__data__meta___compo ds__meta,
  required final storage__data__table__columns___compo table__columns,
  required final BS1__array row__bytes,
  required final ARRAY<Object?> /*
  `count` MUST NOT `< table__columns.count` */
      data__array,
}) {
  if (printing___ok) {
    function__call__print(
      "storage__data__table__row__bytes__auto",
    );
  }

  printing__indentation__increase();

  table__columns.iterate__reverse__basic(
    (final column__id, final table__column) => //
        storage__data__table__row__column__bytes__auto(
      ds__meta: ds__meta,
      table__column: table__column,
      column__bytes: ((column__id != 0) //
          ? row__bytes.view(
              table__column.meta.offset,
            )
          : row__bytes),
      data: data__array[column__id],
      b__initial: TRUE,
    ),
  );

  printing__indentation__decrease();
}

void storage__data__table__row__bytes__mod__auto({
  required final storage__data__meta___compo ds__meta,
  required final storage__data__table__columns___compo table__columns,
  required final ARRAY<
          ({
            INT meta__id,
            Object? data,
          })>
      column__array,
  required final BS1__array row__bytes,
}) {
  if (printing___ok) {
    function__call__print(
      "storage__data__table__row__bytes__mod__auto",
    );
  }

  printing__indentation__increase();

  column__array.iterate__reverse__basic(
    (_, final column) {
      final table__column = table__columns[column.meta__id];

      storage__data__table__row__column__bytes__auto(
        ds__meta: ds__meta,
        table__column: table__column,
        column__bytes: row__bytes.view(
          table__column.meta.offset,
        ),
        data: column.data,
        b__initial: FALSE,
      );
    },
  );

  printing__indentation__decrease();
}

ARRAY<Object?> storage__data__table__row__data__array__auto({
  required final storage__data__meta___compo ds__meta,
  required final storage__data__table__columns___compo table__columns,
  required final ARRAY<INT> column__meta__id__array,
  required final BS1__array row__bytes,
  required final INT row__bytes__base__storage__data__offset,
}) /* macro */ {
  if (printing___ok) {
    function__call__print("storage__data__table__row__data__array__auto");

    row__bytes.representation__text().print("arguments__row__bytes");
  }

  printing__indentation__increase();

  final result = ARRAY__generated(
    column__meta__id__array.elements__count,
    (final column__id) {
      final table__column = table__columns[column__meta__id__array[column__id]];

      /*if (printing___ok) {
        report__INT(
          table__column.meta.offset,
          "table.column.meta.offset",
        );
      }*/

      return storage__data__table__row__column__data__auto(
        ds__meta: ds__meta,
        table__column: table__column,
        column__bytes: row__bytes.view(
          table__column.meta.offset,
        ),
        column__bytes__base__storage__data__offset: (table__column.meta.offset + row__bytes__base__storage__data__offset),
      );
    },
  );

  printing__indentation__decrease();

  return result;
}
