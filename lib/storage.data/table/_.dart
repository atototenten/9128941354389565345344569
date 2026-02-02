part of "../_.dart";

typedef storage__data__table__row___compo = ({
  BS1__array bytes,
  INT bytes__base__storage__data__offset,
});

typedef storage__data__table__row__column___compo = //
    storage__data__table__row__compo;

abstract class storage__data__table__meta___protocol /*
  FACT
    `(table == row__array == struct__array)`
    `(row == struct)`
    `(row__column == struct__member)`
    `(table__arr` == `row__array__array)` */
{
  storage__data__table__meta___protocol({
    required this.rows__count,
    required this.rows__count__size__id,
    required this.row__size,
  });

  INT //
      rows__count /* `row_counter`, next `row__id`, always less than `rows__count`(`(rows__count__current + rows__count__current)`) */;

  final number__size //
      rows__count__size__id;

  final INT //
      row__size /* row__bytes__count */;

  members___dictionary //
      convert__member__dictionary() {
    return {
      "rows__count": rows__count.representation__text(),
      "rows__count__size__id_": rows__count__size__id.name.representation__text(),
      "row__size": row__size.representation__text(),
    };
  }
}
