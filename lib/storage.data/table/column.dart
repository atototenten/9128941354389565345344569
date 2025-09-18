part of "../_.dart";

/*
  `table:column != table:row:column`
    the former is `base__storage__data__table__column__compo`
      which is merely a structure of the details, of the column-of-table
        and not a part of any row
    the latter is the actual data of a table's row's column */

enum base__storage__data__table__column__type___enum //
{ /*direct, primitive,*/ uit, iid, eid, irb, /*in_direct,*/ rbt, bst, wst, /*array,*/ ear, /*table,*/ tbl, tar }

typedef base__storage__data__table__column___compo = ({
  base__storage__data__table__column__type___enum type,
  base__storage__data__table__column__meta___protocol /*
  would map to `void ptr` in nc */
  meta,
});

typedef base__storage__data__table__columns___compo = //
    array<base__storage__data__table__column__compo>;

INT base__storage__data__table__column__size(
  final base__storage__data__table__column___compo table__column,
) {
  final type = table__column.type;

  return (((type == base__storage__data__table__column__type___enum.rbt) || //
          (type == base__storage__data__table__column__type___enum.tar) || //
          (type == base__storage__data__table__column__type___enum.bst) || //
          (type == base__storage__data__table__column__type___enum.wst) || //
          (type == base__storage__data__table__column__type___enum.ear) || //
          (type == base__storage__data__table__column__type___enum.tbl)) //
      ? ((table__column.meta as base__storage__data__table__column__type__in_direct__meta___protocol).count__size__id.size + base__storage__data__position__size__id.size)
      : (((type == base__storage__data__table__column__type___enum.uit) || //
              (type == base__storage__data__table__column__type___enum.iid) || //
              (type == base__storage__data__table__column__type___enum.eid)) //
          ? (table__column.meta as base__storage__data__table__column__type__primitive__meta___protocol).size__id.size
          : ((type == base__storage__data__table__column__type___enum.irb) //
              ? (table__column.meta as base__storage__data__table__column__type__irb__meta__compo).size
              : throw "${table__column.meta.runtimeType}(column__meta.type) is un-known")));
}

INT base__storage__data__table__column__row__bytes__offset(
  final base__storage__data__table__column___compo table__column__previous,
) =>
    (base__storage__data__table__column__size(
          table__column__previous,
        ) +
        table__column__previous.meta.offset);

abstract class base__storage__data__table__column__meta___protocol {
  base__storage__data__table__column__meta___protocol(
    this.name /*
  SHOULD
    contain, ONLY, 'a'-'z', 'A'-'Z', '0'-'9', '_', '.', ':' */
    ,
    final base__storage__data__table__column__compo? table__column__previous,
    this.b__nilable,
  ) : offset = ((table__column__previous != null) //
            ? base__storage__data__table__column__row__bytes__offset(
                table__column__previous,
              )
            : 0);

  /*uu /*column__*/ meta__id() => //
      ((column__previous__meta !=  null) //
          ? (1 + column__previous__meta.meta__id)
          : 0);*/

  final string //
      name;

  final BOOL //
      b__nilable;

  final INT /*row__bytes__*/ offset /*
  is calculat-able, whenever required
    but based on the usage count, caching would be more efficient */
      ;
}

abstract class base__storage__data__table__column__type__direct__meta___protocol //
    extends base__storage__data__table__column__meta___protocol {
  base__storage__data__table__column__type__direct__meta___protocol(
    super.name,
    super.table__column__previous,
    super.b__nilable,
  );
}

abstract class base__storage__data__table__column__type__primitive__meta___protocol //
    extends base__storage__data__table__column__type__direct__meta___protocol {
  base__storage__data__table__column__type__primitive__meta___protocol(
    super.name,
    super.table__column__previous,
    super.b__nilable,
    this.size__id,
  );

  final number__size //
      size__id;
}

base__storage__data__table__column___compo //
    base__storage__data__table__column__type__uit(
  final string name, {
  required final base__storage__data__table__column__compo? table__column__previous,
  required final number__size size__id,
  final BOOL b__nilable = NO,
}) {
  return (
    type: base__storage__data__table__column__type___enum.uit,
    meta: base__storage__data__table__column__type__uit__meta___compo(
      name,
      table__column__previous,
      b__nilable,
      size__id,
    ),
  );
}

class base__storage__data__table__column__type__uit__meta___compo /*
  integer.un-signed */ //
    extends base__storage__data__table__column__type__primitive__meta___protocol {
  base__storage__data__table__column__type__uit__meta___compo(
    super.name,
    super.table__column__previous,
    super.b__nilable /*
  SIDE-EFFECT|TRADE-OFF
    `(max -= 1)`(decrease the `max`, hence memory capacity, by one unit)
  MUST
    user ensure, that 0, as value, is reserved for  null checking
      write, as `uu value = ((data !=  null) ? (data +1) : 0);`
      read, as `uu data = ((value > 0) ? (value -1) :  null);` */
    ,
    super.size__id,
  );
}

base__storage__data__table__column___compo //
    base__storage__data__table__column__type__iid(
  final string name, {
  required final base__storage__data__table__column__compo? table__column__previous,
  required final base__storage__data__table__column__type__ear__meta___compo column,
  final BOOL b__nilable = NO,
}) {
  return (
    type: base__storage__data__table__column__type___enum.iid,
    meta: base__storage__data__table__column__type__iid__meta___compo(
      name,
      table__column__previous,
      b__nilable,
      column.id__size__id,
    ),
  );
}

class base__storage__data__table__column__type__iid__meta___compo /*
  internal-id */ //
    extends base__storage__data__table__column__type__uit__meta___compo {
  base__storage__data__table__column__type__iid__meta___compo(
    super.name,
    super.table__column__previous,
    super.b__nilable,
    super.size__id,
  );
}

base__storage__data__table__column___compo //
    base__storage__data__table__column__type__eid(
  final string name, {
  required final base__storage__data__table__column__compo? table__column__previous,
  required final number__size size__id,
  final BOOL b__nilable = NO,
}) {
  return (
    type: base__storage__data__table__column__type___enum.eid,
    meta: base__storage__data__table__column__type__eid__meta___compo(
      name,
      table__column__previous,
      b__nilable,
      size__id,
    ),
  );
}

class base__storage__data__table__column__type__eid__meta___compo /*
  external-id */ //
    extends base__storage__data__table__column__type__uit__meta___compo {
  base__storage__data__table__column__type__eid__meta___compo(
    super.name,
    super.table__column__previous,
    super.b__nilable,
    super.size__id,
  );
}

base__storage__data__table__column___compo //
    base__storage__data__table__column__type__irb(
  final string name, {
  required final base__storage__data__table__column__compo? table__column__previous,
  required final INT size,
}) {
  return (
    type: base__storage__data__table__column__type___enum.irb,
    meta: base__storage__data__table__column__type__irb__meta___compo(
      name,
      table__column__previous,
      NO,
      size,
    ),
  );
}

class base__storage__data__table__column__type__irb__meta___compo /*
  in-row bytes */ //
    extends base__storage__data__table__column__type__direct__meta___protocol {
  base__storage__data__table__column__type__irb__meta___compo(
    super.name,
    super.table__column__previous,
    super.b__nilable,
    this.size,
  );

  final INT //
      size;
}

abstract class base__storage__data__table__column__type__in_direct__meta___protocol /*
  only the `ds__meta.offset` and `element.arr.count` are written `direct`ly to `table.row.column`
    the actual data, need to be accessed from the `ds__meta.offset`
  contrast to `type.direct`, which is written directly to `table.row.column` */ //
    extends base__storage__data__table__column__meta___protocol {
  base__storage__data__table__column__type__in_direct__meta___protocol(
    super.name,
    super.table__column__previous,
    super.b__nilable,
    this.count__size__id,
  );

  final number__size //
      count__size__id;
}

base__storage__data__table__column___compo //
    base__storage__data__table__column__type__rbt(
  final string name, {
  required final base__storage__data__table__column__compo? table__column__previous,
  required final number__size count__size__id,
  final BOOL b__nilable = NO,
}) {
  return (
    type: base__storage__data__table__column__type___enum.rbt,
    meta: base__storage__data__table__column__type__rbt__meta___compo(
      name,
      table__column__previous,
      b__nilable,
      count__size__id,
    ),
  );
}

class base__storage__data__table__column__type__rbt__meta___compo /*
  bytes; `bytes` is reserved, hence named `raw-bytes` */ //
    extends base__storage__data__table__column__type__in_direct__meta___protocol {
  base__storage__data__table__column__type__rbt__meta___compo(
    super.name,
    super.table__column__previous,
    super.b__nilable,
    super.count__size__id,
  );
}

base__storage__data__table__column___compo //
    base__storage__data__table__column__type__bst(
  final string name, {
  required final base__storage__data__table__column__compo? table__column__previous,
  required final number__size count__size__id,
  final BOOL b__nilable = NO,
}) {
  return (
    type: base__storage__data__table__column__type___enum.bst,
    meta: base__storage__data__table__column__type__bst__meta___compo(
      name,
      table__column__previous,
      b__nilable,
      count__size__id,
    ),
  );
}

class base__storage__data__table__column__type__bst__meta___compo /*
  basic(non-wide)-text */ //
    extends base__storage__data__table__column__type__rbt__meta___compo {
  base__storage__data__table__column__type__bst__meta___compo(
    super.name,
    super.table__column__previous,
    super.b__nilable,
    super.count__size__id,
  );
}

base__storage__data__table__column___compo //
    base__storage__data__table__column__type__wst(
  final string name, {
  required final base__storage__data__table__column__compo? table__column__previous,
  required final number__size count__size__id,
  final BOOL b__nilable = NO,
}) {
  return (
    type: base__storage__data__table__column__type___enum.wst,
    meta: base__storage__data__table__column__type__wst__meta___compo(
      name,
      table__column__previous,
      b__nilable,
      count__size__id,
    ),
  );
}

class base__storage__data__table__column__type__wst__meta___compo /*
  wide-text bytes */ //
    extends base__storage__data__table__column__type__rbt__meta___compo {
  base__storage__data__table__column__type__wst__meta___compo(
    super.name,
    super.table__column__previous,
    super.b__nilable,
    super.count__size__id,
  );
}

typedef base__storage__data__table__row__convert__text__summary__function__format = //
    ({
  string title,
  string sub_title,
})
        Function(
  array<Object?> data__array,
);

typedef base__storage__data__table__row__convert__text__function__format = //
    string Function(
  array<Object?> data__array,
);

abstract class base__storage__data__table__column__type__array__meta___protocol //
    extends base__storage__data__table__column__type__in_direct__meta___protocol {
  base__storage__data__table__column__type__array__meta___protocol(
    super.name,
    super.table__column__previous,
    super.b__nilable,
    super.count__size__id,
    final base__storage__data__table__column___compo columns__last,
    this.row__convert__text__summary,
    this.row__convert__text,
  ) : row__size = base__storage__data__table__column__row__bytes__offset(
          columns__last,
        );

  final INT row__size;

  final base__storage__data__table__row__convert__text__summary__function__format? row__convert__text__summary;

  final base__storage__data__table__row__convert__text__function__format row__convert__text /*__full*/;

  /*uu columns__meta__id() => //
      ((columns__meta__previous !=  null) //
          ? (1 + columns__meta__previous.meta__id())
          : 0);*/
}

base__storage__data__table__column___compo //
    base__storage__data__table__column__type__ear(
  final string name, {
  required final base__storage__data__table__column__compo? table__column__previous,
  required final number__size elements__count__size__id,
  required final base__storage__data__table__column___compo columns__last,
  final base__storage__data__table__row__convert__text__summary__function__format? row__convert__text__summary,
  required final base__storage__data__table__row__convert__text__function__format row__convert__text,
  final BOOL b__nilable = NO,
}) {
  return (
    type: base__storage__data__table__column__type___enum.ear,
    meta: base__storage__data__table__column__type__ear__meta___compo(
      name,
      table__column__previous,
      b__nilable,
      elements__count__size__id,
      columns__last,
      row__convert__text__summary,
      row__convert__text,
    ),
  );
}

class base__storage__data__table__column__type__ear__meta___compo /*
  array; `arr` is reserved for in-memory(or run-time) array, hence named element-array
  like: fixed size, pre-filled, array
  `elements == arr`
  `element == value` */ //
    extends base__storage__data__table__column__type__array__meta___protocol {
  base__storage__data__table__column__type__ear__meta___compo(
    super.name,
    super.table__column__previous,
    super.b__nilable,
    super.count__size__id,
    super.columns__last,
    super.row__convert__text__summary,
    super.row__convert__text,
  );

  number__size get elements__count__size__id => //
      count__size__id;

  number__size get id__size__id => //
      elements__count__size__id;
}

abstract class base__storage__data__table__column__type__table__meta___protocol //
    extends base__storage__data__table__column__type__ear__meta___compo {
  base__storage__data__table__column__type__table__meta___protocol(
    super.name,
    super.table__column__previous,
    super.b__nilable,
    super.elements__count__size__id /*base__storage__data__table__row__count__size(table__rows__count__max, base__storage__data__position__size__id.size)*/,
    super.columns__last,
    super.row__convert__text__summary,
    super.row__convert__text,
  );

  number__size get rows__count__size__id => //
      count__size__id;
}

base__storage__data__table__column___compo //
    base__storage__data__table__column__type__tbl(
  final string name, {
  required final base__storage__data__table__column__compo? table__column__previous,
  required final number__size rows__count__size__id,
  required final INT rows__count__max,
  required final base__storage__data__table__column___compo columns__last,
  final base__storage__data__table__row__convert__text__summary__function__format? row__convert__text__summary,
  required final base__storage__data__table__row__convert__text__function__format row__convert__text,
  final BOOL b__nilable = NO,
}) {
  return (
    type: base__storage__data__table__column__type___enum.tbl,
    meta: base__storage__data__table__column__type__tbl__meta___compo(
      name,
      table__column__previous,
      b__nilable,
      rows__count__size__id,
      rows__count__max,
      columns__last,
      row__convert__text__summary,
      row__convert__text,
    ),
  );
}

class base__storage__data__table__column__type__tbl__meta___compo /*
  table
  like: initially un-filled, array */ //
    extends base__storage__data__table__column__type__table__meta___protocol {
  base__storage__data__table__column__type__tbl__meta___compo(
    super.name,
    super.table__column__previous,
    super.b__nilable,
    super.elements__count__size__id,
    this.rows__count__max,
    super.columns__last,
    super.row__convert__text__summary,
    super.row__convert__text,
  );

  final INT //
      rows__count__max;
}

base__storage__data__table__column___compo //
    base__storage__data__table__column__type__tar(
  final string name, {
  required final base__storage__data__table__column__compo? table__column__previous,
  required final number__size rows__count__size__id,
  final INT rows__count__multiplier__initial = 0,
  required final base__storage__data__table__column___compo columns__last,
  final base__storage__data__table__row__convert__text__summary__function__format? row__convert__text__summary,
  required final base__storage__data__table__row__convert__text__function__format row__convert__text,
  final BOOL b__nilable = NO,
}) {
  return (
    type: base__storage__data__table__column__type___enum.tar,
    meta: base__storage__data__table__column__type__tar__meta___compo(
      name,
      table__column__previous,
      b__nilable,
      rows__count__size__id,
      rows__count__multiplier__initial,
      columns__last,
      row__convert__text__summary,
      row__convert__text,
    ),
  );
}

class base__storage__data__table__column__type__tar__meta___compo /*
  table.array
  like: auto growing, array */ //
    extends base__storage__data__table__column__type__table__meta___protocol {
  base__storage__data__table__column__type__tar__meta___compo(
    super.name,
    super.table__column__previous,
    super.b__nilable,
    super.elements__count__size__id,
    this.rows__count__multiplier__initial,
    super.columns__last,
    super.row__convert__text__summary,
    super.row__convert__text,
  );

  final INT //
      rows__count__multiplier__initial;
}
