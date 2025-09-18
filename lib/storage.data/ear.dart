part of "_.dart";

class base__storage__data__ear__meta___compo {
  const base__storage__data__ear__meta___compo({
    required this.elements__count,
    required this.elements__count__size__id,
    required this.element__size,
    required this.elements__bytes__base__storage__data__offset,
    required this.meta__bytes__base__storage__data__offset,
  });

  final INT //
      elements__count;

  final number__size //
      elements__count__size__id;

  final INT //
      element__size;

  final INT //
      elements__bytes__base__storage__data__offset,
      meta__bytes__base__storage__data__offset;
}

typedef base__storage__data__ear__result___compo = ({
  BS1__array elements__bys,
  INT elements__count,
});

base__storage__data__ear__result___compo base__storage__data__ear({
  required final INT elements__count,
  required final INT element__size,
  required final void Function(INT, BS1__array) element__fill,
}) {
  if (base__printing___ok) {
    base__function__call__print(
      "base__storage__data__ear",
    );
  }

  base__printing__indentation__increase();

  final bys = BS1__array(elements__count * element__size);

  base__iterate__basic(
      elements__count,
      (final element__id) => //
          element__fill(
            element__id,
            bys.view__partial(
              (element__id * element__size),
              element__size,
            ),
          ));

  base__printing__indentation__decrease();

  return (
    elements__bys: bys,
    elements__count: elements__count,
  );
}

base__storage__data__table__row___compo base__storage__data__ear__element__read(
  final base__storage__data__meta___compo ds__meta,
  final base__storage__data__ear__meta___compo ear__meta, {
  required final INT element__id,
  final INT elements__count = 1,
}) /*
  checkout `base__storage__data__tbl__row` */
{
  final INT count;
  if (elements__count < 2) {
    base__storage__data__table__row__ensure__exists(
      row__id: element__id,
      rows__count: elements__count,
    );

    count = ear__meta.element__size;
  } else {
    base__storage__data__table__row__ensure__exists(
      row__id: (element__id + (elements__count - 1)),
      rows__count: elements__count,
    );

    count = (elements__count * ear__meta.element__size);
  }

  final offset = ((element__id * ear__meta.element__size) + //
      ear__meta.elements__bytes__base__storage__data__offset);

  return (
    bytes: base__storage__data__read(
      ds__meta,
      count: count,
      base__storage__data__offset: offset,
    ),
    bytes__base__storage__data__offset: offset,
  );
}

void base__storage__data__ear__elements__all__iterate(
  final base__storage__data__meta___compo ds__meta,
  final base__storage__data__ear__meta___compo ear__meta,
  final void Function(
    INT element__id,
    BS1__array element__bytes,
    INT element__bytes__base__storage__data__offset,
  ) element__handle,
) /*
  read all the elements, in one op, then iterate */
{
  final //
      elements__all = base__storage__data__ear__element__read(
        ds__meta,
        ear__meta,
        element__id: 0,
        elements__count: ear__meta.elements__count,
      ),
      element__size = ear__meta.element__size;

  INT offset = /*column.row__offset*/ 0;

  base__iterate__basic(ear__meta.elements__count, (final element__id) {
    element__handle(
      element__id,
      elements__all.bytes.view__partial(
        offset,
        element__size,
      ),
      (offset + elements__all.bytes__base__storage__data__offset),
    );

    offset += element__size;
  });
}
