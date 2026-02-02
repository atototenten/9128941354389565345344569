part of "../_.dart";

/*INT storage__data__table__rows__count__size(
  final INT rows__count,
) {
  if (rows__count < INT__1__limit) {
    return INT__1__size;
  } else if (!(INT__2__size > storage__data__position__size__id.size) /*
  "`INT__2__size` is NOT MORE than `storage__data__position__size__id.size`"
  equal to "`INT__2__size` is EQUAL OR LESS than `storage__data__position__size__id.size`"
  if `storage__data__position__size__id.size` is standard(`u`*`__size`)
    also equal to "`INT__2__size` is EQUAL to `storage__data__position__size__id.size`" */
      && //
      (rows__count < INT__2__limit)) {
    return INT__2__size;
  } else if (!(INT__3__size > storage__data__position__size__id.size) && //
      (rows__count < INT__3__limit)) {
    return INT__3__size;
  } else if (!(INT__4__size > storage__data__position__size__id.size) && //
      (rows__count < INT__4__limit)) {
    return INT__4__size;
  } else if (!(INT__8__size > storage__data__position__size__id.size) && //
      (rows__count < INT__8__limit)) {
    return INT__8__size;
  } else {
    throw "$rows__count(row__count) exceeds the limits of $storage__data__position__size__id.size(storage__data__position__size__id.size)";
  }
}*/

void storage__data__table__row__ensure__space({
  required final INT rows__count,
  required final INT rows__count__max,
}) {
  if (!(rows__count < rows__count__max)) {
    throw "$rows__count__max(rows__count__max) reached; can NOT add any row";
  }
}

void storage__data__table__row__ensure__exists({
  required final INT row__id,
  required final INT rows__count,
}) {
  if (!(row__id < rows__count)) {
    throw "$row__id(row__id) does NOT exist";
  }
}

INT storage__data__table__row__bytes__base__storage__data__offset({
  required final INT row__id,
  required final INT row__size,
  required final INT table__bytes__base__storage__data__offset,
  final INT row__offset = 0,
}) =>
    ((row__offset + (row__id * row__size)) + table__bytes__base__storage__data__offset);

INT storage__data__table__row__bytes__count({
  required final INT row__size,
  final INT rows__count = 1,
  final INT row__offset = 0,
}) =>
    ((row__size * rows__count) - row__offset);

void storage__data__table__rows__count__update(
  final storage__data__meta___compo ds__meta,
  final storage__data__table__meta___protocol table__meta, {
  required final INT rows__count__bytes__base__storage__data__offset,
}) /*
  MUST be called, AFTER, the whole process, if `table__row__add(` was called, during the process */
{
  if (printing___ok) {
    function__call__print(
      "storage__data__table__rows__count__update",
      table__meta.debug__label,
    );
  }

  printing__indentation__increase();

  final rows__count__byte__array = table__meta.rows__count.cast__byte__array(
    table__meta.rows__count__size__id,
  );

  storage__data__write__replace(
    ds__meta,
    bytes: rows__count__byte__array,
    bytes__count: table__meta.rows__count__size__id.size,
    storage__data__offset: rows__count__bytes__base__storage__data__offset,
  );

  printing__indentation__decrease();
}
