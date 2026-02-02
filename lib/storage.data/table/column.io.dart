part of "../_.dart";

typedef storage__data__table__columns__array___compo = //
    ARRAY<storage__data__table__columns__compo>;

string storage__data__table__column__meta__convert__text(
  final storage__data__table__column___compo column,
  final storage__data__table__columns__array___compo columns__array,
) {
  final //
      buffer = StringBuffer(),
      column__meta = column.meta,
      column__type = column.type;

  {
    buffer.write(column__meta.name);

    if (column__meta.b__nilable) {
      buffer.write(char__question);
    }

    buffer
      ..write("offset")
      ..write(column__meta.offset);
  }

  void buffer__write(
    final string name,
    final Object value,
  ) {
    buffer
      ..write(char__line_feed)
      ..write(value)
      ..write(char__space)
      ..write(char__bracket__round__open)
      ..write(name)
      ..write(char__bracket__round__close);
  }

  {
    final string type;

    switch (column__type) {
      case storage__data__table__column__type___enum.uit:
        type = "direct:primitive:uit";
        break;
      case storage__data__table__column__type___enum.iid:
        type = "direct:primitive:uit:iid";
        break;
      case storage__data__table__column__type___enum.eid:
        type = "direct:primitive:uit:eid";
        break;
      case storage__data__table__column__type___enum.irb:
        type = "direct:irb";
        break;
      case storage__data__table__column__type___enum.rbt:
        type = "in_direct:rbt";
        break;
      case storage__data__table__column__type___enum.bst:
        type = "in_direct:rbt:bst";
        break;
      case storage__data__table__column__type___enum.wst:
        type = "in_direct:rbt:wst";
        break;
      case storage__data__table__column__type___enum.ear:
        type = "in_direct:array:ear";
        break;
      case storage__data__table__column__type___enum.tbl:
        type = "in_direct:array[:ear]:table:tbl";
        break;
      case storage__data__table__column__type___enum.tar:
        type = "in_direct:array[:ear]:table:tar";
        break;
    }

    buffer__write(
      "type",
      type,
    );
  }

  {
    if ((column__type == storage__data__table__column__type___enum.tar) || //
        (column__type == storage__data__table__column__type___enum.tbl)) {
      buffer__write(
        "rows:count:size:id",
        (column__meta as storage__data__table__column__type__table__meta___protocol).rows__count__size__id,
      );
    } else if (column__type == storage__data__table__column__type___enum.ear) {
      buffer__write(
        "elements:count:size:id",
        (column__meta as storage__data__table__column__type__ear__meta__compo).elements__count__size__id,
      );
    } else if ((column__type == storage__data__table__column__type___enum.rbt) || //
        (column__type == storage__data__table__column__type___enum.bst) || //
        (column__type == storage__data__table__column__type___enum.wst)) {
      buffer__write(
        "count:size:id",
        (column__meta as storage__data__table__column__type__in_direct__meta___protocol).count__size__id,
      );
    } else if ((column__type == storage__data__table__column__type___enum.uit) || //
        (column__type == storage__data__table__column__type___enum.iid) || //
        (column__type == storage__data__table__column__type___enum.eid)) {
      buffer__write(
        "size:id",
        (column__meta as storage__data__table__column__type__uit__meta__compo).size__id,
      );
    } else if (column__type == storage__data__table__column__type___enum.irb) {
      buffer__write(
        "size",
        (column__meta as storage__data__table__column__type__irb__meta__compo).size,
      );
    }
  }

  if ((column__type == storage__data__table__column__type___enum.tar) || //
      (column__type == storage__data__table__column__type___enum.tbl) || //
      (column__type == storage__data__table__column__type___enum.ear)) {
    buffer__write(
      "row:size",
      (column__meta as storage__data__table__column__type__array__meta___protocol).row__size,
    );
  }

  if (column__type == storage__data__table__column__type___enum.tar) {
    buffer__write(
      "rows:count:multiplier:initial",
      (column__meta as storage__data__table__column__type__tar__meta__compo).rows__count__multiplier__initial,
    );
  } else if (column__type == storage__data__table__column__type___enum.tbl) {
    buffer__write(
      "rows:count:max",
      (column__meta as storage__data__table__column__type__tbl__meta__compo).rows__count__max,
    );
  }

  return buffer.toString();
}

/*void report__base__storage__data__table__main__meta(
  final storage__data__table__columns__array___compo table__columns__array,
  final storage__data__table__main___compo table__main,
) =>
    report__base__storage__data__table__columns__meta__recursive__fancy(
      table__columns__array,
      table__main,
    );

void report__base__storage__data__table__columns__meta__recursive__fancy(
  final storage__data__table__columns__array___compo table__columns__array,
  final storage__data__table__columns___compo columns,
) =>
    columns.iterate__basic((_, final column) {
      report__history__write(printing__indentation__increaseation__text * printing__indentation__increaseation);
      report__history__write(column__meta.name);

      if (column__meta.b__nilable) {
        report__history__write__short('?');
      }

      report__history__write__short(identifier__value__separator);
      report__history__write__short(column__meta.runtimeType);

      final columns__meta = ((column__meta is storage__data__table__column__type__array__meta___protocol) //
          ? table__columns__meta__array[column__meta.columns__meta__id]
          :  null);

      if (columns__meta !=  null) {
        report__history__write__short(char__bracket__round__open);
        report__history__write__short(columns__meta.column__meta__array.count);
        report__history__write__short(char__colon);
        report__history__write__short(columns__meta.size);
        report__history__write__short(char__bracket__round__close);
      }

      report__history__write__short(printing__indentation__increaseation__text);
      report__history__write__short(column__meta.offset);

      report__history__write__short(char__colon);
      report__history__write__short(column__meta.size);

      report__line_feed();
      if (columns__meta !=  null) {
        printing__indentation__increase();

        report__base__storage__data__table__columns__meta__recursive__fancy(
          table__columns__meta__array,
          columns__meta.column__meta__array,
        );

        printing__indentation__decrease();
      }
    });*/
