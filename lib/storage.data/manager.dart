part of "_.dart";

class storage__data__column__tree__element___compo {
  const storage__data__column__tree__element___compo(
    this.column,
  );

  final storage__data__table__column___compo column;
}

class storage__data__column__tree__element__super___compo //
    extends storage__data__column__tree__element___compo {
  const storage__data__column__tree__element__super___compo(
    super.column,
    this.row__bytes__fetch,
    this.columns,
  );

  final ARRAY<
      ({
        storage__data__column__tree__element___compo element,
        void Function(
          void Function(
            Object? data,
          ),
        )? fetch,
      })> columns;

  final void Function(
    void Function(
      ARRAY<Object?> data__array,
    ) submit,
  ) row__bytes__fetch;
}

class storage__data__manager___compo {
  storage__data__manager___compo(
    this.ds__meta,
    this.column__tree,
  );

  final storage__data__meta___compo ds__meta;
  final ARRAY<storage__data__column__tree__element__super__compo> column__tree;

  ARRAY<string> table__main__name__array() {
    return ARRAY__generated(
      column__tree.elements__count,
      (final i) => column__tree[i].column.meta.name,
    );
  }

  storage__data__table__meta___protocol table__main(
    final INT table__main__id,
  ) {
    return storage__data__table__main__open(
      ds__meta,
      table__main__array: ARRAY__generated(
        column__tree.elements__count,
        (final i) => column__tree[i].column,
      ),
      table__main__id: table__main__id,
    );
  }
}
