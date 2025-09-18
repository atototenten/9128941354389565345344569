part of "_.dart";

class base__storage__data__rbt__meta___compo {
  const base__storage__data__rbt__meta___compo({
    required this.bytes__count,
    required this.count__size__id,
    required this.rbt__bytes__base__storage__data__offset,
    required this.meta__bytes__base__storage__data__offset,
  });

  final INT //
      bytes__count;

  final number__size //
      count__size__id;

  final INT //
      rbt__bytes__base__storage__data__offset,
      meta__bytes__base__storage__data__offset;
}

base__storage__data__table__row___compo base__storage__data__rbt__read(
  final base__storage__data__meta___compo ds__meta,
  final base__storage__data__rbt__meta___compo rbt__meta,
) =>
    (
      bytes: base__storage__data__read(
        ds__meta,
        count: rbt__meta.bytes__count,
        base__storage__data__offset: rbt__meta.rbt__bytes__base__storage__data__offset,
      ),
      bytes__base__storage__data__offset: rbt__meta.rbt__bytes__base__storage__data__offset,
    );
