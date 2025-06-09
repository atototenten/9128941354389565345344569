part of "../_.dart";

/*NIMR base__storage__data__table__rows__count__size(
  final NIMR rows__count,
) {
  if (rows__count < NI1__limit) {
    return NI1__size;
  } else if (!(NI2__size > base__storage__data__position__size__id.size) /*
  "`NI2__size` is NOT MORE than `base__storage__data__position__size__id.size`"
  equal to "`NI2__size` is EQUAL OR LESS than `base__storage__data__position__size__id.size`"
  if `base__storage__data__position__size__id.size` is standard(`u`*`__size`)
    also equal to "`NI2__size` is EQUAL to `base__storage__data__position__size__id.size`" */
      && //
      (rows__count < NI2__limit)) {
    return NI2__size;
  } else if (!(NI3__size > base__storage__data__position__size__id.size) && //
      (rows__count < NI3__limit)) {
    return NI3__size;
  } else if (!(NI4__size > base__storage__data__position__size__id.size) && //
      (rows__count < NI4__limit)) {
    return NI4__size;
  } else if (!(NI8__size > base__storage__data__position__size__id.size) && //
      (rows__count < NI8__limit)) {
    return NI8__size;
  } else {
    throw "$rows__count(row__count) exceeds the limits of $base__storage__data__position__size__id.size(base__storage__data__position__size__id.size)";
  }
}*/

void base__storage__data__table__row__ensure__space({
  required final NIMR rows__count,
  required final NIMR rows__count__max,
}) {
  if (!(rows__count < rows__count__max)) {
    throw "$rows__count__max(rows__count__max) reached; can NOT add any row";
  }
}

void base__storage__data__table__row__ensure__exists({
  required final NIMR row__id,
  required final NIMR rows__count,
}) {
  if (!(row__id < rows__count)) {
    throw "$row__id(row__id) does NOT exist";
  }
}

NIMR base__storage__data__table__row__bytes__base__storage__data__offset({
  required final NIMR row__id,
  required final NIMR row__size,
  required final NIMR table__bytes__base__storage__data__offset,
  final NIMR row__offset = 0,
}) =>
    ((row__offset + (row__id * row__size)) + table__bytes__base__storage__data__offset);

NIMR base__storage__data__table__row__bytes__count({
  required final NIMR row__size,
  final NIMR rows__count = 1,
  final NIMR row__offset = 0,
}) =>
    ((row__size * rows__count) - row__offset);

void base__storage__data__table__rows__count__update(
  final base__storage__data__meta___compo ds__meta,
  final base__storage__data__table__meta___protocol table__meta, {
  required final NIMR rows__count__bytes__base__storage__data__offset,
}) /*
  MUST be called, AFTER, the whole process, if `table__row__add(` was called, during the process */
{
  if (base__printing__ok) {
    base__function__call__print(
      "base__storage__data__table__rows__count__update",
      table__meta.debug__label,
    );
  }

  base__printing__indentation__increase();

  final rows__count__byte__array = table__meta.rows__count.cast__byte__array(
    table__meta.rows__count__size__id,
  );

  base__storage__data__write__replace(
    ds__meta,
    bytes: rows__count__byte__array,
    bytes__count: table__meta.rows__count__size__id.size,
    base__storage__data__offset: rows__count__bytes__base__storage__data__offset,
  );

  base__printing__indentation__decrease();
}
