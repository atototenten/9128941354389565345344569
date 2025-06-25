part of "../_.dart";

/*widget__build__stored___compo data__base__table__explore__page__stored({
  required final string db__name,
  required final array<data__base__table__column__meta___protocol> table__main,
  required final data__base__meta___compo ds__meta,
  required final array<data__base__table__columns__meta__compo> columns__meta__array,
}) {
  final //
      scroll__manager_ = scroll__manager();

  gui__base__widget page(final _) => //
      page__foundation(
        base__list_ing__generat_ed(
          scroll__manager: scroll__manager_,
          page__title: base__page__title__aligned__center(
            primary__text: db__name,
            secondary__text: (table__main.elements__count.toString() + " Tables"),
          ),
          item__array__count: table__main.elements__count,
          item__build: (final _, final table__id) {
            final column__meta = table__main[table__id];

            return GestureDetector(
              onTap: () {},
              child: gui__base__listing__item(
                body: gui__base__box__text__primary(
                  data__base__table__column__meta__convert__text(
                    column__meta,
                  ),
                ),
                trailing: base__icon(
                  flutter__icon__navigation__forward,
                ),
              ),
            );
          },
        ),
      );

  return (
    de_init_: scroll__manager_.de_init_,
    widget__build: page,
  );
}

widget__build__stored___compo data__base__table__rows__page__stored({
  required final data__base__meta___compo ds__meta,
  required final array<data__base__table__columns__meta__compo> columns__meta__array,
  required final array<data__base__table__column__meta___protocol> column__meta__array,
  required final string name,
}) {
  final //
      scroll__manager_ = scroll__manager();

  gui__base__widget page(final _) => //
      page__foundation(
        base__list_ing__generat_ed(
          scroll__manager: scroll__manager_,
          page__title: base__page__title__aligned__center(
            primary__text: name,
            secondary__text: (column__meta__array.elements__count.toString() + " Rows"),
          ),
          item__array__count: column__meta__array.elements__count,
          item__build: (final _, final column__id) {
            final column__meta = column__meta__array[column__id];

            return GestureDetector(
              onTap: () {},
              child: gui__base__listing__item(
                body: gui__base__box__text__primary(
                  data__base__table__column__meta__convert__text(
                    column__meta,
                  ),
                ),
                trailing: base__icon(
                  flutter__icon__navigation__forward,
                ),
              ),
            );
          },
        ),
      );

  return (
    de_init_: scroll__manager_.de_init_,
    widget__build: page,
  );
}

widget__build__stored___compo data__base__table__columns__page__stored({
  required final data__base__meta___compo ds__meta,
  required final array<data__base__table__columns__meta__compo> columns__meta__array,
  required final array<data__base__table__column__meta___protocol> column__meta__array,
  required final string name,
}) {
  final //
      scroll__manager_ = scroll__manager();

  gui__base__widget page(final _) => //
      page__foundation(
        base__list_ing__generat_ed(
          scroll__manager: scroll__manager_,
          page__title: base__page__title__aligned__center(
            primary__text: name,
            secondary__text: (column__meta__array.elements__count.toString() + " Columns"),
          ),
          item__array__count: column__meta__array.elements__count,
          item__build: (final _, final column__id) => //
              gui__base__listing__item(
            body: gui__base__box__text__primary(
              data__base__table__column__meta__convert__text(
                column__meta__array[column__id],
              ),
            ),
          ),
        ),
      );

  return (
    de_init_: scroll__manager_.de_init_,
    widget__build: page,
  );
}*/
