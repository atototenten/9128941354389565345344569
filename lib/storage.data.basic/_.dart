import "package:base/base/_.dart";

import "package:sqlite_async/sqlite_async.dart" as sqlite_async;
import "package:sqlite_async/sqlite3.dart" as sqlite_sync;

class base__storage__data__basic__meta //
    extends
        base__storage__data__basic__meta__base //
    implements
        base__dispose__asyn___protocol //
        <base__storage__data__basic__meta__disposal__result> {
  static value__asyn<base__storage__data__basic__meta> //
  asyn({
    required final string file__path /*
usually (storage__directory__permanent__path__absolute + base__storage__file__path__separation__char + file__name) */,
  }) /*
the data-base access ,must be exclusive */ async {
    if (base__printing___ok) {
      base__storage__data__basic__meta__base.sqlite__info().representation__text().print("sqlite__info");
    }

    final value = sqlite_async.SqliteDatabase(
      path: file__path,
      maxReaders: INT__1__limit,
      options: sqlite_async.SqliteOptions(
        journalMode: sqlite_async.SqliteJournalMode.wal,
        journalSizeLimit: 0,
        synchronous: sqlite_async.SqliteSynchronous.full,
      ),
    );

    await value.initialize();

    return value__asyn.value(
      base__storage__data__basic__meta.raw(
        value,
      ),
    );
  }

  base__storage__data__basic__meta.raw(
    super.value___raw,
  );

  value__asyn<BOOL?> //
  init_ization__needed__ok__auto__asyn() async {
    final meta__asyn = accessing__meta__asyn();

    if (meta__asyn == null) {
      return NIL;
    }

    final meta = await meta__asyn;

    final result = init_ization__needed__ok__asyn(
      meta,
    );

    await meta.complete__asyn();

    return result;
  }

  value__asyn<BOOL> //
  init_ization__needed__ok__asyn(
    final base__storage__data__basic__accessing__meta meta,
  ) async {
    final tables__count = await meta.tables__count__asyn();
    return (tables__count == 0);
  }

  @override
  value__asyn<base__storage__data__basic__meta__disposal__result> //
  dispose__asyn() async {
    await value___raw.close();

    return base__storage__data__basic__meta__disposal__result.success;
  }
}

enum base__storage__data__basic__meta__disposal__result {
  success,
}

abstract class base__storage__data__basic__meta__base /*
based on sqlite-3
  sqlite is quite-ok(compared to alternatives) ,for {non-concurrent connections ,and storage__data__file__size less than the file-system's limits}
    ,otherwise postgresql ,but overall ,s.q.l.-to-software interface is a non-sensible approach
requires `sqlite3_flutter_libs` pkg. */ {
  static const //
  table__row__id__column__name = char__underscore;

  static sqlite_sync.Version sqlite__info() => //
      sqlite_sync.sqlite3.version;

  static void sqlite__temporary__directory__init_ize(
    final string storage__directory__temporary__path__absolute,
  ) {
    sqlite_sync.sqlite3.tempDirectory = storage__directory__temporary__path__absolute;
  }

  base__storage__data__basic__meta__base(
    this.value___raw,
  ) : accesses__count___raw = 0,
      access__mutating__exclusion___raw = base__exclusion__mutual(),
      accesses__empty__channel___raw = base__event__channel__broadcast() {
    access__mutating__exclusion___raw //
        .free__channel()
        .descriptions__add(
          procedure__empty__meta(
            () {
              if (accesses__count___raw != 0) {
                return;
              }

              accesses__empty__channel___raw.event__dispatch();
            },
          ),
        );
  }

  final sqlite_async.SqliteDatabase value___raw;
  final base__event__channel__broadcast accesses__empty__channel___raw;
  final base__exclusion__mutual access__mutating__exclusion___raw;
  INT accesses__count___raw /*
excluding mutating-access
  available through `access__mutating__exclusion___raw.locked__ok` proc. */;

  value__asyn<base__storage__data__basic__accessing__meta>? //
  accessing__meta__asyn /*
required for read op.ions */ () async {
    accesses__count___raw += 1;

    final result = value__asyn__meta<base__storage__data__basic__accessing__meta>();

    value___raw.readLock(
      (final value) {
        final completion__asyn__meta = value__asyn__meta<void>();

        value
            .operate__asyn___raw(
              statement: "BEGIN",
            )
            .handle(
              (final _) {
                result.complete(
                  base__storage__data__basic__accessing__meta.raw(
                    value,
                    completion__meta___raw: base__procedure__empty__complicated__meta(
                      () {
                        {
                          accesses__count___raw -= 1;

                          if (accesses__count___raw != 0) {
                            return;
                          }
                        }

                        {
                          final access__mutating__exclusion__locked___ok = access__mutating__exclusion___raw.locked___ok();
                          if (access__mutating__exclusion__locked___ok) {
                            return;
                          }
                        }

                        accesses__empty__channel___raw.event__dispatch();

                        completion__asyn__meta.complete();
                      },
                    ),
                  ),
                );
              },
              (final e, final t) {
                completion__asyn__meta.complete();

                result.completeError(e, t);
              },
            );

        return completion__asyn__meta.future;
      },
    );

    return result.future;
  }

  value__asyn<base__storage__data__basic__accessing__mutating__meta>? //
  accessing__mutating__meta__asyn /*
required for write op.ions */ () {
    late final value__asyn__meta<base__storage__data__basic__accessing__mutating__meta> result;

    final ok = access__mutating__exclusion___raw.lock(
      (final lock) {
        value___raw.writeLock(
          (final value) {
            final completion__asyn__meta = value__asyn__meta<void>();

            value
                .operate__asyn___raw(
                  statement: "BEGIN IMMEDIATE",
                )
                .handle(
                  (final _) {
                    result.complete(
                      base__storage__data__basic__accessing__mutating__meta.raw(
                        value,
                        lock___raw: lock,
                        completion__meta___raw: base__procedure__empty__complicated__meta(
                          () {
                            completion__asyn__meta.complete();
                          },
                        ),
                      ),
                    );
                  },
                  (final e, final t) {
                    completion__asyn__meta.complete();

                    result.completeError(e, t);
                  },
                );

            return completion__asyn__meta.future;
          },
        );
      },
    );

    if (ok.not) {
      return NIL;
    }

    result = value__asyn__meta<base__storage__data__basic__accessing__mutating__meta>();

    return result.future;
  }
}

extension SqliteReadContext__operation__extension //
    on sqlite_async.SqliteReadContext {
  value__asyn<array<array<Object?>>> //
  operate__asyn___raw({
    required final string statement,
    final array<Object?>? statement__arguments,
  }) async {
    statement__print___raw(
      statement: statement,
      statement__arguments: statement__arguments,
    );

    final result = await this.getAll(
      statement,
      (statement__arguments ?? const <Object?>[]),
    );

    return result.rows;
  }

  void statement__print___raw({
    required final string statement,
    final array<Object?>? statement__arguments,
  }) {
    statement.representation__text().print("statement");
    statement__arguments
        .representation__text(
          elements__truncation__count__threshold: 0,
        )
        .print("statement__arguments");
  }
}

class base__storage__data__basic__accessing__meta //
    extends
        base__storage__data__basic__accessing__meta__base //
        <sqlite_async.SqliteReadContext> {
  base__storage__data__basic__accessing__meta.raw(
    final sqlite_async.SqliteReadContext value, {
    required this.completion__meta___raw,
  }) : super.raw(
         value,
       );

  final base__procedure__empty__complicated__meta completion__meta___raw;

  value__asyn<void> complete__asyn() async {
    final completed__already___ok = completion__meta___raw.invoked___ok();

    if (completed__already___ok) {
      throw "completed already";
    }

    await value___raw.operate__asyn___raw(
      statement: "END TRANSACTION",
    );

    completion__meta___raw.invoke();
  }
}

abstract class base__storage__data__basic__accessing__meta__base //
<value__type extends sqlite_async.SqliteReadContext> {
  base__storage__data__basic__accessing__meta__base.raw(
    this.value___raw,
  );

  final value__type value___raw;

  value__asyn<
    ({
      INT occupied /*
including `.wasted` */,
      INT wasted,
    })
  >
  space__usage__summary() async {
    final result = await value___raw.operate__asyn___raw(
      statement: "SELECT page_count * page_size as total_size, freelist_count * page_size as freelist_size FROM pragma_freelist_count(), pragma_page_size();" /*
source : `web://powersync.com/blog/sqlite-optimizations-for-ultra-high-performance#strongstrong10-free-up-space-when-appropriate` */,
    );

    return (
      occupied: (result.first as INT),
      wasted: (result[1] as INT),
    );
  }

  /*value__asyn<void> build__re__asyn({
    required final string file__path,
    required final base__storage__data__basic__table__column__id? Function(
      array<base__storage__data__basic__table__cell__id> /*
empty for root-table */
          table__path,
    ) table__build__re__column /*
column is asumed to be boolean-type
  and true if not zero
after re-building
  row-id.s are in-validated
    including the ref.s to the rows
  row-order is maintained */
    ,
  }) async {
    await value___raw.operate__asyn___raw(
      statement: "vacuum; pragma wal_checkpoint(truncate);",
    );
  }*/ /*
TASK
  support */

  value__asyn<INT> table__rows__count__asyn___raw({
    required final string table__name,
    final string suffix = empty__string,
  }) async {
    final result = await value___raw.operate__asyn___raw(
      statement: ("SELECT COUNT(*) FROM " + table__name + suffix),
    );

    return (result.first.first as INT);
  }

  value__asyn<INT> table__rows__count__asyn({
    required final base__storage__data__basic__table__id table__id,
  }) {
    return table__rows__count__asyn___raw(
      table__name: table__id.convert__name___raw(),
    );
  }

  value__asyn<INT> tables__count__asyn() /*
excluding, the mandatory, ad default, schema table
refer to `web://sqlite.org/schematab.html` */ {
    return table__rows__count__asyn___raw(
      table__name: "sqlite_schema",
      suffix: " WHERE type = 'table'",
    );
  }

  void table__columns__id__join___raw(
    final StringBuffer buffer,
    final array<base__storage__data__basic__table__column__meta> columns__meta,
    final BOOL result__column__id___ok,
  ) {
    if (columns__meta.empty___ok() /* because sqlite mandates non-empty selection-columns */ ) {
      buffer.write(base__storage__data__basic__meta__base.table__row__id__column__name);
      return;
    }

    if (result__column__id___ok) {
      buffer
        ..write(base__storage__data__basic__meta__base.table__row__id__column__name)
        ..write(", ");
    }

    buffer.write(
      columns__meta.first.name(),
    );

    columns__meta.iterate__basic(
      (final /*column__id__id_*/ _, final column__meta) {
        buffer
          ..write(", ")
          ..write(column__meta.name());
      },
      offset: 1,
    );
  }

  value__asyn<array<base__storage__data__basic__table__row>> /*
the first column of each row ,is the unique id ,of the row ,its type ,is un-signed integer ,and range 1..s64 */
  table__rows__asyn({
    required final base__storage__data__basic__table__id table__id,
    required final array<base__storage__data__basic__table__column__meta>? result__columns__meta /*
if NIL ,then all the columns ,but respecting the "conditions" argument
if empty ,then the column-id column ,is implicit */,
    final BOOL result__column__id___ok /*
ignored if `result__columns__meta == NIL` */ =
        FALSE,
    final BOOL result__rows__distinct___ok = FALSE,
    required final string? result__conditions /*
  example: "\(column__name) LIKE ?"
    '?' indicates substitution, from "conditions__arguments" */,
    required final array<Object?>? result__conditions__arguments /*
  example: "Dr%", "%@mail.com" */,
    final array<base__storage__data__basic__table__column__meta>? result__order__columns__meta /*
if NIL ,then resulting rows ,are un-order-ed ,or the order is un-defin-ed ,and "result__order__ascend_ing__ok" is ignored  */,
    final BOOL result__order__ascend_ing___ok /* otherwise descend-ing */ = TRUE,
    final INT? result__rows__count__limit,
    final INT? result__rows__id__offset /*
`result__order__columns__meta` should also be passed */,
  }) /*
example
  search
    table__rows ( \arg.s\  result__conditions :"\(column__name) LIKE ?" ,result__conditions__arguments :[ "%@mail.com" ] ) */ async {
    final statement__buffer = StringBuffer("SELECT ");

    if (result__rows__distinct___ok) {
      statement__buffer.write("DISTINCT ");
    }

    if (result__columns__meta != null) {
      table__columns__id__join___raw(
        statement__buffer,
        result__columns__meta,
        result__column__id___ok,
      );
    } else {
      statement__buffer.write(char__asterisk);
    }

    statement__buffer
      ..write(" FROM ")
      ..write(table__id.convert__name___raw());

    if (result__conditions != null) {
      statement__buffer.write(
        (" WHERE " + result__conditions),
      );
    }

    if (result__order__columns__meta != null) {
      statement__buffer.write(" ORDER BY ");

      table__columns__id__join___raw(
        statement__buffer,
        result__order__columns__meta,
        FALSE,
      );

      statement__buffer
        ..write(char__space)
        ..write(
          (result__order__ascend_ing___ok //
              ? "ASC"
              : "DESC"),
        );
    }

    if (result__rows__count__limit != null) {
      statement__buffer
        ..write(" LIMIT ")
        ..write(result__rows__count__limit);
    }

    if (result__rows__id__offset != null) {
      statement__buffer
        ..write(" OFFSET ")
        ..write(result__rows__id__offset);
    }

    final statement = statement__buffer.toString();
    statement__buffer.clear();

    return await value___raw.operate__asyn___raw(
      statement: statement,
      statement__arguments: result__conditions__arguments,
    );
  }

  value__asyn<array<base__storage__data__basic__table__row>> table__rows__all__asyn({
    required final base__storage__data__basic__table__id table__id,
    final array<base__storage__data__basic__table__column__meta>? result__columns__meta,
    final BOOL result__column__id___ok = FALSE,
  }) {
    return table__rows__asyn(
      table__id: table__id,
      result__columns__meta: result__columns__meta,
      result__column__id___ok: result__column__id___ok,
      result__conditions: NIL,
      result__conditions__arguments: NIL,
    );
  }

  value__asyn<base__storage__data__basic__table__row?> table__row__asyn({
    required final base__storage__data__basic__table__id table__id,
    required final base__storage__data__basic__table__row__id table__row__id,
    required final array<base__storage__data__basic__table__column__meta>? result__columns__meta,
  }) async {
    final rows = await table__rows__asyn(
      table__id: table__id,
      result__columns__meta: result__columns__meta,
      result__conditions: (base__storage__data__basic__meta__base.table__row__id__column__name + " = ?"),
      result__conditions__arguments: [table__row__id.value],
    );

    if (rows.empty___ok()) {
      return NIL;
    }

    if /*F*/ (rows.elements__count > 1) {
      throw "exception : `table__row__id` is not unique";
    }

    return rows.first;
  }
}

class base__storage__data__basic__table__cell__id {
  const base__storage__data__basic__table__cell__id({
    required this.row__id,
    required this.column__id,
  });

  final base__storage__data__basic__table__row__id row__id;
  final base__storage__data__basic__table__column__id column__id;
}

class base__storage__data__basic__table__column__id {
  const base__storage__data__basic__table__column__id(
    this.value,
  );

  final INT value;
}

typedef base__storage__data__basic__table__row = array<Object?>;

class base__storage__data__basic__table__id //
    extends base__storage__data__basic__table__row__id__base {
  const base__storage__data__basic__table__id(
    super.value,
  );

  string convert__name___raw() {
    return (char__underscore + value.toString());
  }
}

class base__storage__data__basic__accessing__mutating__meta //
    extends
        base__storage__data__basic__accessing__meta__base //
        <sqlite_async.SqliteWriteContext> {
  base__storage__data__basic__accessing__mutating__meta.raw(
    final sqlite_async.SqliteWriteContext value, {
    required this.lock___raw,
    required this.completion__meta___raw,
  }) : super.raw(
         value,
       );

  final base__exclusion__mutual__lock lock___raw;
  final base__procedure__empty__complicated__meta completion__meta___raw;

  value__asyn<
    base__storage__data__basic__table__id /*/*
table-id.'s assignment is fully-defined
  equal to row-id. */ */
  > //
  table__add__asyn({
    required final array<base__storage__data__basic__table__column__meta> columns__meta,
  }) async {
    final //
    table__id__value = await tables__count__asyn(),
        table__id = base__storage__data__basic__table__id(
          table__id__value,
        ),
        statement__buffer = StringBuffer("CREATE TABLE ")
          ..write(table__id.convert__name___raw())
          ..write(" (")
          ..write(base__storage__data__basic__meta__base.table__row__id__column__name)
          ..write(" ")
          ..write(base__storage__data__basic__table__column__data__type.number__integer__auto.name)
          ..write(" PRIMARY KEY") /*
avoid `AUTOINCREMENT`
  `http://www.sqlite.org/autoinc.html` */;

    columns__meta.iterate__basic(
      (final column__id, final column__meta) {
        statement__buffer
          ..write(", _")
          ..write(column__id)
          ..write(char__space)
          ..write(
            column__meta.type.name,
          );

        if (column__meta.nil_able___ok.not) {
          statement__buffer
            ..write(char__space)
            ..write("NOT ")
            ..write(
              base__storage__data__basic__table__column__data__type.nil.name,
            );
        }
      },
    );

    statement__buffer.write(");");

    await value___raw.operate__asyn___raw(
      statement: statement__buffer.toString(),
    );

    statement__buffer.clear();

    return table__id;
  }

  /*value__asyn<void> table__remove__asyn({
    required final base__storage__data__basic__table__id table__id,
    required final array<base__storage__data__basic__table__column__meta> columns__meta,
  }) async {
    await value___raw.operate__asyn___raw(
      statement: ("DROP TABLE " + table__id.convert__name___raw()),
    );
  }*/ /*
tables cannot be removed ,after addition
  almost-completely similar to rows */

  value__asyn<
    base__storage__data__basic__table__row__id /*
row-id.'s assignment/sequence is well-defined ,as always increasing integer ,beginning from zero */
  > //
  table__row__add__asyn /*
can add only-single row */ ({
    required final base__storage__data__basic__table__id table__id,
    required final array<base__storage__data__basic__table__column__meta> columns__meta,
    required final base__storage__data__basic__table__row row,
  }) async {
    final //
    statement = table__row__addition__statement___raw(
          table__id: table__id,
          columns__meta: columns__meta,
        ),
        result = await value___raw.operate__asyn___raw(
          statement: statement,
          statement__arguments: row,
        );

    return base__storage__data__basic__table__row__id(
      ((result.first.first as INT) - 1),
    );
  }

  value__asyn<
    base__storage__data__basic__table__row__id /*
of `rows.first` */
  > //
  table__rows__add__asyn /*
can add multiple-rows ,as well as a single-row */ ({
    required final base__storage__data__basic__table__id table__id,
    required final array<base__storage__data__basic__table__column__meta> columns__meta,
    required final array<base__storage__data__basic__table__row> rows,
  }) async {
    final statement = table__row__addition__statement___raw(
      table__id: table__id,
      columns__meta: columns__meta,
    );

    final result = await value___raw.operate__asyn___raw(
      statement: statement,
      statement__arguments: rows.first,
    );

    if (rows.elements__count > 1) {
      await value___raw.operate__compound__asyn___raw(
        statement: statement,
        statement__arguments: rows.sublist(1),
      );
    }

    return base__storage__data__basic__table__row__id(
      (result.first.first as INT),
    );
  }

  string //
  table__row__addition__statement___raw({
    required final base__storage__data__basic__table__id table__id,
    required final array<base__storage__data__basic__table__column__meta> columns__meta,
  }) {
    final //
    columns__count = columns__meta.elements__count,
        statement__buffer = StringBuffer("INSERT INTO ")
          ..write(table__id.convert__name___raw())
          ..write(" (");

    {
      statement__buffer.write(columns__meta.first.name());

      base__iterate__basic(
        (columns__count - 1),
        (final column__id) {
          statement__buffer
            ..write(", ")
            ..write(columns__meta[column__id].name());
        },
        offset: 1,
      );
    }

    statement__buffer
      ..write(") VALUES (?")
      ..write(",?" * (columns__count - 1))
      ..write(char__bracket__round__close)
      ..write(" RETURNING ")
      ..write(base__storage__data__basic__meta__base.table__row__id__column__name);

    final result = statement__buffer.toString();
    statement__buffer.clear();

    return result;
  }

  value__asyn<void> table__row__cells__assign__asyn({
    required final base__storage__data__basic__table__id table__id,
    required final base__storage__data__basic__table__row__id table__row__id,
    required final array<base__storage__data__basic__table__column> columns,
  }) async {
    final //
    statement__buffer = StringBuffer("UPDATE ")
          ..write(table__id.convert__name___raw())
          ..write(" SET "),
        statement__arguments__accumulation = base__accumulation__linear__basic<Object?>();

    columns.iterate__basic(
      (final column__id, final column) {
        if (column__id != 0) {
          statement__buffer.write(", ");
        }

        statement__buffer
          ..write(column.meta.name())
          ..write(" = ?");

        statement__arguments__accumulation.add__ending(
          column.value,
        );
      },
    );

    statement__buffer
      ..write(" WHERE ")
      ..write(base__storage__data__basic__meta__base.table__row__id__column__name)
      ..write(" = ?");

    statement__arguments__accumulation.add__ending(
      table__row__id.value,
    );

    final //
    statement = statement__buffer.toString(),
        statement__arguments = statement__arguments__accumulation.convert__array();

    statement__buffer.clear();
    statement__arguments__accumulation.dispose();

    await value___raw.operate__asyn___raw(
      statement: statement,
      statement__arguments: statement__arguments,
    );
  }

  /*value__asyn<void> table__row__remove__asyn({
    required final base__storage__data__basic__table__id table__id,
    required final base__storage__data__basic__table__row__id table__row__id,
  }) async {
    final statement__buffer = StringBuffer("DELETE FROM ")
      ..write(table__id.convert__name___raw())
      ..write(" WHERE ")
      ..write(base__storage__data__basic__meta__base.table__row__id__column__name)
      ..write(" = ?");

    final statement = statement__buffer.toString();

    statement__buffer.clear();

    await value___raw.operate__asyn___raw(
      statement: statement,
      statement__arguments: [table__row__id.value],
    );
  }
  value__asyn<void> table__rows__all__remove__asyn({
    required final base__storage__data__basic__table__id table__id,
  }) async {
    await value___raw.operate__asyn___raw(
      statement: ("DELETE FROM " + table__id.convert__name___raw()),
    );
  }*/ /*
rows cannot be removed after addition
  but should be manually set to direct/default values
    which do not ref. the storage
      to reduce the storage's space-usage ,after re-building
  because
    removal in-validates the row-id.s
    removal of an inter-mediate row would require moving the subsequent rows
      which can become too heavy and expensive (in all relevant terms) */

  value__asyn<void> complete__asyn /*
finish the mutation process */ () async {
    await complete__asyn___raw(
      "COMMIT",
    );
  }

  value__asyn<void> abort__asyn /*
revert the changes/mutations */ () async {
    await complete__asyn___raw(
      "ROLLBACK",
    );
  }

  value__asyn<void> complete__asyn___raw(
    final string statement,
  ) async {
    {
      final completed__already___ok = completion__meta___raw.invoked___ok();

      if (completed__already___ok) {
        throw "completed already";
      }

      await value___raw.operate__asyn___raw(
        statement: statement,
      );

      completion__meta___raw.invoke();
    }

    lock___raw.free();
  }
}

class base__storage__data__basic__table__row__id //
    extends base__storage__data__basic__table__row__id__base {
  const base__storage__data__basic__table__row__id(
    super.value,
  );
}

abstract class base__storage__data__basic__table__row__id__base {
  const base__storage__data__basic__table__row__id__base(
    this.value,
  );

  final INT value;
}

extension SqliteWriteContext__operation__extension //
    on sqlite_async.SqliteWriteContext {
  value__asyn<void> operate__compound__asyn___raw({
    required final string statement,
    required final array<array<Object?>> statement__arguments,
  }) {
    statement__print___raw(
      statement: statement,
      statement__arguments: statement__arguments,
    );

    return this.executeBatch(
      statement,
      statement__arguments,
    );
  }
}

enum base__storage__data__basic__table__column__data__type {
  nil("NULL") /*Null*/,
  number__integer__auto("INTEGER") /*INT__NEG*/,
  number__exponential("REAL") /*APPROX*/,
  bytes("BLOB") /*byte__array*/,
  text("TEXT") /*string*/ /*
prefer `.byte__array`, unless searching is required */;

  const base__storage__data__basic__table__column__data__type(this.name);

  final string name;
}

class base__storage__data__basic__table__column__meta /*
example : `
typedef _column__meta = base__storage__data__table__column__meta;
typedef _column__data__type = base__storage__data__table__column__data__type;
final //
  _column__abc = _column__meta(NIL,_column__data__type.integer__un_signed),
  _column__jkl = _column__meta(_column__abc,_column__data__type.integer__auto),
  _column__xyz = _column__meta(_column__jkl,_column__data__type.bytes, nil_able___ok: TRUE),
  _columns__meta = [_column__abc, _column__jkl, _column__xyz];` */ {
  base__storage__data__basic__table__column__meta(
    final base__storage__data__basic__table__column__meta? column__previous__meta,
    this.type, {
    this.nil_able___ok = FALSE,
  }) : id =
           ((column__previous__meta != null) //
           ? (1 + column__previous__meta.id)
           : 0);

  final INT id;
  /*final string name;*/
  final base__storage__data__basic__table__column__data__type type;
  final BOOL nil_able___ok;

  string name() {
    return (char__underscore + id.toString());
  }
}

class base__storage__data__basic__table__column {
  const base__storage__data__basic__table__column(
    this.meta,
    this.value,
  );

  final base__storage__data__basic__table__column__meta meta;
  final Object? value;
}

/*string byte__array__convert__sqlite__data__type__BLOB__text(
  final byte__array bytes,
) {
  final buffer = StringBuffer("x'");

  bytes.iterate__basic(
    (final _, final byte) {
      buffer.write(
        byte.toRadixString(16),
      );
    },
  );

  buffer.write(
    char__quote__single,
  );

  final result = buffer.toString();

  buffer.clear();

  return result;
}*/

value__asyn<void> base__storage__data__basic__meta__test(
  final string file__path,
) async {
  {
    final value = sqlite_async.SqliteDatabase(
      path: file__path,
      maxReaders: INT__1__limit,
      options: sqlite_async.SqliteOptions(
        journalMode: sqlite_async.SqliteJournalMode.wal,
        journalSizeLimit: 0,
        synchronous: sqlite_async.SqliteSynchronous.full,
      ),
    );

    await value.initialize();

    value.readLock(
      (final context) async {
        await context.getAll(
          "BEGIN",
        );

        final result = await context.getAll(
          "SELECT COUNT(*) FROM sqlite_schema WHERE type = 'table'",
        );

        final tables__count = (result.rows.first.first as INT);

        "tables__count : $tables__count".print();

        await context.getAll(
          "END TRANSACTION",
        );
      },
    );
  }

  value__asyn<void> storage__print(
    final base__storage__data__basic__accessing__meta__base meta,
  ) async {
    "printing storage".print();

    final tables__count = await meta.tables__count__asyn();

    tables__count.representation__text().print("tables__count");

    await base__iterate__basic__asyn(
      tables__count,
      (final table__id) async {
        final rows = await meta.table__rows__all__asyn(
          table__id: base__storage__data__basic__table__id(
            table__id,
          ),
        );

        rows
            .representation__text(
              elements__truncation__count__threshold: 0,
            )
            .print("tables[$table__id].rows");
      },
    );

    "printed".print();
  }

  final storage = await base__storage__data__basic__meta.asyn(
    file__path: file__path,
  );

  value__asyn<void> storage__print__auto__asyn() async {
    "auto-printing storage".print();

    final meta = await storage.accessing__meta__asyn();

    if (meta == null) {
      "ISSUE : `(storage.access__meta() = NIL)`".print();
    } else {
      await storage__print(
        meta,
      );

      await meta.complete__asyn();
    }

    "auto-printed".print();
  }

  {
    final init_ization__needed___ok = await storage.init_ization__needed__ok__auto__asyn();
    init_ization__needed__ok.representation__text().print("init_ization__needed__ok");
  }

  await storage__print__auto__asyn();

  {
    var abort___ok = TRUE;

    await base__iterate__forever__asyn(
      (final _) async {
        final meta = await storage.accessing__mutating__meta__asyn();

        if (meta == null) {
          "ISSUE : `(storage.access__mutating__meta() = NIL)`".print();

          return FALSE;
        } else {
          final //
          name = base__storage__data__basic__table__column__meta(
                NIL,
                base__storage__data__basic__table__column__data__type.text,
              ),
              age = base__storage__data__basic__table__column__meta(
                name,
                base__storage__data__basic__table__column__data__type.number__integer__auto,
              ),
              weight = base__storage__data__basic__table__column__meta(
                age,
                base__storage__data__basic__table__column__data__type.number__exponential,
              ),
              columns__meta = [name, age, weight];

          final table__id = await meta.table__add__asyn(
            columns__meta: columns__meta,
          );

          table__id.representation__text().print("table__id");

          final table__row__id = await meta.table__row__add__asyn(
            table__id: table__id,
            columns__meta: columns__meta,
            row: ["abc-xyz", 27, 76.0],
          );

          table__row__id.value.representation__text().print("table__row__id");

          if (abort___ok.not) {
            "mutating".print();

            await meta.complete__asyn();

            return FALSE;
          }

          abort___ok = FALSE;

          "aborting".print();

          await meta.abort__asyn();

          return TRUE;
        }
      },
    );
  }

  await storage__print__auto__asyn();

  await storage.dispose__asyn();
}
