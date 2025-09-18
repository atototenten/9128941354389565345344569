part of "../_.dart";

void base__storage__data__table__row__column__bytes__auto({
  required final base__storage__data__meta___compo ds__meta,
  required final base__storage__data__table__column___compo table__column,
  required final BS1__array column__bytes,
  required final Object? /*
  uit: `uu`
  irb|rbt: `by__arr`(by[te]s)
  ear: `base__storage__data__ear__result__compo`
  tar|tbl: `Object`(prefer `1`) */
      data,
  required final BOOL b__initial,
}) /* macro */ {
  if (table__column.type == base__storage__data__table__column__type___enum.uit) {
    final column__meta = (table__column.meta as base__storage__data__table__column__type__uit__meta__compo);

    if (!column__meta.b__nilable) {
      base__storage__data__table__row__column__type__uit__write(
        column__bytes: column__bytes,
        size__id: column__meta.size__id,
        value: (data as INT),
      );
    } else //
      base__storage__data__table__row__column__type__uit__write__nilable(
        column__bytes: column__bytes,
        size__id: column__meta.size__id,
        data: (data as INT?),
      );
  } else if /* un-likely */ (table__column.meta.b__nilable && //
      (data == null)) {
    base__storage__data__table__row__column__type__in_direct__write__nil(
      column__bytes: column__bytes,
    );
  } else //
    switch (table__column.type) {
      case base__storage__data__table__column__type___enum.rbt:
        final column__meta = (table__column.meta as base__storage__data__table__column__type__rbt__meta__compo);
        base__storage__data__table__row__column__type__rbt__write(
          ds__meta: ds__meta,
          count__size__id: column__meta.count__size__id,
          column__bytes: column__bytes,
          data: (data as BS1__array),
          b__replace: !b__initial,
        );
        break;

      case base__storage__data__table__column__type___enum.tar:
        final column__meta = (table__column.meta as base__storage__data__table__column__type__tar__meta__compo);
        base__storage__data__table__row__column__type__tar__write(
          ds__meta: ds__meta,
          rows__count__size__id: column__meta.rows__count__size__id,
          column__bytes: column__bytes,
        );
        break;

      case base__storage__data__table__column__type___enum.ear:
        final //
            column__meta = (table__column.meta as base__storage__data__table__column__type__ear__meta__compo),
            data_ = (data as base__storage__data__ear__result__compo);

        base__storage__data__table__row__column__type__ear__write(
          ds__meta: ds__meta,
          elements__count__size__id: column__meta.elements__count__size__id,
          column__bytes: column__bytes,
          elements__count: data_.elements__count,
          elements__bys: data_.elements__bys,
        );
        break;

      case base__storage__data__table__column__type___enum.irb:
        final column__meta = (table__column.meta as base__storage__data__table__column__type__irb__meta__compo);
        base__storage__data__table__row__column__type__irb__write(
          column__bytes: column__bytes,
          size: column__meta.size,
          data: (data as BS1__array),
        );
        break;

      case base__storage__data__table__column__type___enum.tbl:
        final column__meta = (table__column.meta as base__storage__data__table__column__type__tbl__meta__compo);
        base__storage__data__table__row__column__type__tbl__write(
          ds__meta: ds__meta,
          rows__count__size__id: column__meta.rows__count__size__id,
          rows__count__max: column__meta.rows__count__max,
          row__size: column__meta.row__size,
          column__bytes: column__bytes,
        );
        break;

      default:
        throw "${table__column.type}(base__storage__data__table__column__type___enum) is un-known";
    }
}

Object? base__storage__data__table__row__column__data__auto({
  required final base__storage__data__meta___compo ds__meta,
  required final base__storage__data__table__column___compo table__column,
  required final BS1__array column__bytes,
  required final INT column__bytes__base__storage__data__offset,
}) /*
  instead of multiple [consecutive] calls
    prefer calling `base__storage__data__table__row__data__array__auto`
      because storage:fast:io, is although efficient, but NOT free */
{
  if (table__column.type == base__storage__data__table__column__type___enum.uit) {
    final column__meta = (table__column.meta as base__storage__data__table__column__type__uit__meta__compo);

    return (!column__meta.b__nilable //
        ? base__storage__data__table__row__column__type__uit__read
        : base__storage__data__table__row__column__type__uit__read__nilable)(
      column__bytes: column__bytes,
      size__id: column__meta.size__id,
    );
  }

  if (table__column.type == base__storage__data__table__column__type___enum.irb) {
    return byte__array__create(
      column__bytes,
      count: (table__column.meta as base__storage__data__table__column__type__irb__meta__compo).size,
    );
  }

  if (table__column.meta.b__nilable &&
      byte__array__blank___ok(
        column__bytes,
        count: base__storage__data__position__size__id.size,
      )) {
    return null;
  }

  switch (table__column.type) {
    case base__storage__data__table__column__type___enum.rbt:
      final //
          column__meta = (table__column.meta as base__storage__data__table__column__type__rbt__meta__compo),
          details = base__storage__data__table__row__column__type__in_direct__bytes__read(
            column__meta: column__meta,
            column__bytes: column__bytes,
          );

      return base__storage__data__rbt__meta___compo(
        bytes__count: details.count,
        count__size__id: column__meta.count__size__id,
        rbt__bytes__base__storage__data__offset: details.base__storage__data__offset,
        meta__bytes__base__storage__data__offset: column__bytes__base__storage__data__offset,
      );

    case base__storage__data__table__column__type___enum.tar:
      final //
          column__meta = (table__column.meta as base__storage__data__table__column__type__tar__meta__compo),
          details = base__storage__data__table__row__column__type__in_direct__bytes__read(
            column__meta: column__meta,
            column__bytes: column__bytes,
          );

      return base__storage__data__tar__meta___compo(
        rows__count: details.count,
        rows__count__size__id: column__meta.rows__count__size__id,
        row__size: column__meta.row__size,
        tar__meta__bytes__base__storage__data__offset: column__bytes__base__storage__data__offset,
        table__array__bytes__base__storage__data__offset: details.base__storage__data__offset,
        rows__count__multiplier__initial: column__meta.rows__count__multiplier__initial,
      );

    case base__storage__data__table__column__type___enum.ear:
      final //
          column__meta = (table__column.meta as base__storage__data__table__column__type__ear__meta__compo),
          details = base__storage__data__table__row__column__type__in_direct__bytes__read(
            column__meta: column__meta,
            column__bytes: column__bytes,
          );

      return base__storage__data__ear__meta___compo(
        elements__count: details.count,
        elements__count__size__id: column__meta.elements__count__size__id,
        element__size: column__meta.row__size,
        elements__bytes__base__storage__data__offset: details.base__storage__data__offset,
        meta__bytes__base__storage__data__offset: column__bytes__base__storage__data__offset,
      );

    case base__storage__data__table__column__type___enum.tbl:
      final //
          column__meta = (table__column.meta as base__storage__data__table__column__type__tbl__meta__compo),
          details = base__storage__data__table__row__column__type__in_direct__bytes__read(
            column__meta: column__meta,
            column__bytes: column__bytes,
          );

      return base__storage__data__tbl__meta___compo(
        rows__count: details.count,
        rows__count__size__id: column__meta.rows__count__size__id,
        row__size: column__meta.row__size,
        rows__count__max: column__meta.rows__count__max,
        table__bytes__base__storage__data__offset: details.base__storage__data__offset,
        tbl__meta__bytes__base__storage__data__offset: column__bytes__base__storage__data__offset,
      );

    default:
      throw "${table__column.type}(base__storage__data__table__column__type___enum), ${table__column.meta.runtimeType}(column__meta.type), are un-known";
  }
}
