part of "_.dart";

class base__storage__data__column__tree__element___compo {
  const base__storage__data__column__tree__element___compo(
    this.column,
  );

  final base__storage__data__table__column___compo column;
}

class base__storage__data__column__tree__element__super___compo //
    extends base__storage__data__column__tree__element___compo {
  const base__storage__data__column__tree__element__super___compo(
    super.column,
    this.row__bytes__fetch,
    this.columns,
  );

  final array<
      ({
        base__storage__data__column__tree__element___compo element,
        void Function(
          void Function(
            Object? data,
          ),
        )? fetch,
      })> columns;

  final void Function(
    void Function(
      array<Object?> data__array,
    ) submit,
  ) row__bytes__fetch;
}

class base__storage__data__manager___compo {
  base__storage__data__manager___compo(
    this.ds__meta,
    this.column__tree,
  );

  final base__storage__data__meta___compo ds__meta;
  final array<base__storage__data__column__tree__element__super__compo> column__tree;

  array<string> table__main__name__array() {
    return array__new__generated(
      column__tree.elements__count,
      (final i) => column__tree[i].column.meta.name,
    );
  }

  base__storage__data__table__meta___protocol table__main(
    final NI table__main__id,
  ) {
    return base__storage__data__table__main__open(
      ds__meta,
      table__main__array: array__new__generated(
        column__tree.elements__count,
        (final i) => column__tree[i].column,
      ),
      table__main__id: table__main__id,
    );
  }
}
