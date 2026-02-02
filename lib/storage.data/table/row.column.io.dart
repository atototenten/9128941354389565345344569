part of "../_.dart";

INT storage__data__table__row__column__type__uit__write({
  required final BS1__array column__bytes,
  required final number__size size__id,
  required final INT value,
}) {
  copy(
    column__bytes,
    value.cast__byte__array(
      size__id,
    ),
  );

  return size__id.size;
}

INT storage__data__table__row__column__type__uit__write__nilable({
  required final BS1__array column__bytes,
  required final number__size size__id,
  required final INT? data,
}) {
  if (data != null) {
    return storage__data__table__row__column__type__uit__write(
      column__bytes: column__bytes,
      size__id: size__id,
      value: (data + 1),
    );
  }

  final size = size__id.size;

  byte__array__fill(
    column__bytes,
    count: size,
  );

  return size;
}

void storage__data__table__row__column__type__in_direct__write__nil({
  required final BS1__array column__bytes,
}) /*
  `(storage__data__offset == 0)` implies `null`.
    like c-lang */
    =>
    byte__array__fill(
      column__bytes,
      count: storage__data__position__size__id.size,
    );

void storage__data__table__row__column__type__rbt__write({
  required final storage__data__meta___compo ds__meta,
  required final number__size count__size__id,
  required final BS1__array column__bytes,
  required final BS1__array data,
  required final BOOL b__replace,
}) {
  if (b__replace) {
    ds__meta.wastage__change += column__bytes
        .view(
          storage__data__position__size__id.size,
        )
        .cast__number__integer(
          count__size__id,
        ) /*data__old__count*/;
  }

  copy(
    column__bytes,
    data.bytes__count.cast__byte__array(
      count__size__id,
    ),
    dest__offset: copy(
      column__bytes,
      storage__data__write__append(
        ds__meta,
        data,
      ).cast__byte__array(
        storage__data__position__size__id,
      ),
      count: storage__data__position__size__id.size,
    ).dest__offset__new,
    count: count__size__id.size,
  );
}

void storage__data__table__row__column__type__tar__write({
  required final storage__data__meta___compo ds__meta,
  required final number__size rows__count__size__id,
  required final BS1__array column__bytes,
}) =>
    storage__data__tar__create(
      ds__meta,
      column__bytes: column__bytes,
      rows__count__size__id: rows__count__size__id,
    );

void storage__data__table__row__column__type__ear__write({
  required final storage__data__meta___compo ds__meta,
  required final number__size elements__count__size__id,
  required final BS1__array column__bytes,
  required final INT elements__count,
  required final BS1__array elements__bys,
}) {
  copy(
    column__bytes,
    elements__count.cast__byte__array(
      elements__count__size__id,
    ),
    dest__offset: copy(
      column__bytes,
      storage__data__write__append(
        ds__meta,
        elements__bys,
      ).cast__byte__array(
        storage__data__position__size__id,
      ),
      count: storage__data__position__size__id.size,
    ).dest__offset__new,
    count: elements__count__size__id.size,
  );
}

void storage__data__table__row__column__type__irb__write({
  required final BS1__array column__bytes,
  required final INT size,
  required final BS1__array data,
}) {
  copy(
    column__bytes,
    data,
    count: size,
  );
}

void storage__data__table__row__column__type__tbl__write({
  required final storage__data__meta___compo ds__meta,
  required final number__size rows__count__size__id,
  required final INT rows__count__max,
  required final INT row__size,
  required final BS1__array column__bytes,
}) =>
    storage__data__tbl__create(
      ds__meta,
      column__bytes: column__bytes,
      rows__count__size__id: rows__count__size__id,
      rows__count__max: rows__count__max,
      row__size: row__size,
    );

BS1__array storage__data__table__row__column__bytes({
  required final storage__data__table__column___compo table__column,
}) =>
    BS1__array(
      storage__data__table__column__size(
        table__column,
      ),
    );

INT /*value*/ storage__data__table__row__column__type__uit__read({
  required final BS1__array column__bytes,
  required final number__size size__id,
}) =>
    column__bytes.cast__number__integer(
      size__id,
    );

INT? /*data*/ storage__data__table__row__column__type__uit__read__nilable({
  required final BS1__array column__bytes,
  required final number__size size__id,
}) {
  final value = storage__data__table__row__column__type__uit__read(
    column__bytes: column__bytes,
    size__id: size__id,
  );

  return ((value > 0) //
      ? (value - 1)
      : null);
}

({
  INT count,
  INT storage__data__offset,
}) storage__data__table__row__column__type__in_direct__bytes__read({
  required final storage__data__table__column__type__in_direct__meta___protocol column__meta,
  required final BS1__array column__bytes,
}) =>
    (
      count: column__bytes
          .view(
            storage__data__position__size__id.size,
          )
          .cast__number__integer(
            column__meta.count__size__id,
          ),
      storage__data__offset: column__bytes.cast__number__integer(
        storage__data__position__size__id,
      ),
    );
