part of "../_.dart";

typedef base__storage__data__table__row___compo = ({
  BS1__array bytes,
  NI bytes__base__storage__data__offset,
});

typedef base__storage__data__table__row__column___compo = //
    base__storage__data__table__row__compo;

abstract class base__storage__data__table__meta___protocol /*
  FACT
    `(table == row__array == struct__array)`
    `(row == struct)`
    `(row__column == struct__member)`
    `(table__arr` == `row__array__array)` */
{
  base__storage__data__table__meta___protocol({
    required this.rows__count,
    required this.rows__count__size__id,
    required this.row__size,
  });

  NI //
      rows__count /* `row_counter`, next `row__id`, always less than `rows__count`(`(rows__count__current + rows__count__current)`) */;

  final number__size //
      rows__count__size__id;

  final NI //
      row__size /* row__bytes__count */;

  base__compo__member__dictionary //
      convert__member__dictionary() {
    return {
      "rows__count": rows__count.representation__text(),
      "rows__count__size__id_": rows__count__size__id.name.representation__text(),
      "row__size": row__size.representation__text(),
    };
  }
}
