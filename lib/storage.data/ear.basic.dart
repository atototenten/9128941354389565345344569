part of "_.dart";

({
  BS1__array element__bytes,
  NI element__base__storage__data__offset,
}) base__storage__data__ear__element__read__basic(
  final base__storage__data__meta___compo ds__meta, {
  required final NI element__id /* un-check-ed for existence, of element, in array */,
  required final BS1__array meta__bytes /* table's `row__column__bytes` */,
  required final NI element__size,
}) /*
  element(-id) is NOT checked, for existence */
{
  final base__storage__data__offset = ((element__id * element__size) + //

      meta__bytes.cast__number__integer(
        base__storage__data__position__size__id,
      ));

  return (
    element__bytes: base__storage__data__read(
      ds__meta,
      count: element__size,
      base__storage__data__offset: base__storage__data__offset,
    ),
    element__base__storage__data__offset: base__storage__data__offset,
  );
}

({
  BS1__array elements__bytes,
  NI elements__count,
}) base__storage__data__ear__read__basic(
  final base__storage__data__meta___compo ds__meta, {
  required final BS1__array meta__bytes,
  required final number__size elements__count__size__id,
  required final NI element__size,
}) {
  final elements__count = meta__bytes
      .view(
        base__storage__data__position__size__id.size,
      )
      .cast__number__integer(
        elements__count__size__id,
      );

  return (
    elements__bytes: base__storage__data__read(
      ds__meta,
      count: (element__size * elements__count),
      base__storage__data__offset: meta__bytes.cast__number__integer(
        base__storage__data__position__size__id,
      ),
    ),
    elements__count: elements__count,
  );
}
