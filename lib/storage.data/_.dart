import "package:foundation/core/_.dart";
import "package:foundation/storage.file/_.dart" show storage__file__block__size;

part "conversion.dart";
part "manager.dart";
part "ear.dart";
part "ear.basic.dart";
part "main.tbl.dart";
part "tar.dart";
part "rbt.dart";
part "tbl.dart";
part "preservation__journal.dart";
part "table/row.column.io.dart";
part "table/column.dart";
part "table/_.dart";
part "table/row.column.io.auto.dart";
part "table/row.io.auto.dart";
part "table/column.io.dart";
part "table/_.io.dart";

final
//
    storage__data__position__offset = 0,
    storage__data__position__size__id = number__size.byte__string__32,
//
    storage__data__wastage__offset = (storage__data__position__size__id.size + storage__data__position__offset),
    storage__data__wastage__size__id = number__size.byte__string__32,
//
    storage__data__main__tbl__offset = (0 /* padding to achieve alignment */ + storage__data__wastage__size__id.size + storage__data__wastage__offset),
    storage__data__table__main__rows__count__size /*
  because we do not know the exact requirements, so the maximum is chosen */
    = INT__16__size,
    storage__data__main__tbl__rows__count__max = INT__1__max; /*
  {max|siz}es are chosen, finely, to keep, `data:base:position`, `data:base:wastage`, and `main:tbl`
    in a single block of `storage__file__block__size.alignment__flash`
      hence maintain a(not "the") perfect-alignment */

enum number__size {
  byte__string__1(INT__1__size),
  byte__string__2(INT__2__size),
  byte__string__4(INT__4__size),
  byte__string__8(INT__8__size),
  byte__string__16(INT__16__size),
  byte__string__32(INT__32__size);

  const number__size(
    this.size,
  );

  final INT size;
}

class storage__data__meta___compo /*
called DBMS(DataBase Management System), by others
guide-lines
  minimum {amount of data writing/modification} ,and {number of write operations} should be instructed ,instead of the whole row/record
    ,because
      its the common-sense efficient approach ,of not wasting the resources
      the flash-memory cannot replace/overwrite data (write at the same place ,and always writes to a new place) ,irrespective of the extent of change
    ,example
      if the columns-id. 0,1,3 are modified (out of 5 columns ,`0..4`) ,then `0..3` columns-id.'s values(not in-direct value ,in case of pointer) should be re-written ,while `4` should be excluded ,and kept original
the persistent-storage updation ,is optimistic(backtrack/revert/reverse on failure)
  ,instead of pessimistic
    ,because failure is the rare-case ,hence should not affect the prominent case
the storage's alignment/block-size ,is ignored (and not respected)
  ,because
    the perception(including the practice ,of aligning) are based on disk-based storage (which have now ,become a rarity ,and has long been almost-completely replaced)
    the flash-memory(the new default and majority) has much-more complex-architecture (of internal partitioning ,the whole space) ,compared to the traditional block-based model
      ,hence making the latter completely/rarely relevant
        ,especially because the internal structure of the devices ,is intentionally hidden by the vendors
    the alignment/block-size reported by the storage-devices ,is usually fake ,and emulated to support compatibility ,with other devices
      ,hence un-reliable and dangerous for optimizations
    alignment requires padding ,which wastes space ,at rest ,as well as in the cache
      ,leading to caching in-efficiency
    majority of the storage devices ,have an integral and internal memory-controller ,to handle/optimize the read-write operations
      ,hence a general and manual optimization ,can backfire ,by disturbing its working ,and leading to [performance-]issues
TASK
  rename, all `meta_data__bytes`, which are actually `row__column__bytes`, to the latter
  move struct+functions to class approach
  move static constructors to factory */
{
  storage__data__meta___compo({
    required this.storage,
    required this.preservation__journal,
    required this.position,
    required this.wastage,
  })  : position__change = 0,
        wastage__change = 0;

  final storage__file__fast___compo //
      storage /* heap */;

  final preservation__journal__compo? //
      preservation__journal;

  INT //
      position /*
  `storage__data__position` is `count`(un-aligned), while `ds__meta.size` is `count__max`(aligned) */
      ,
      position__change /*
  change, in `position`, since the last `:sync(` */
      ,
      wastage /*
  is not, very useful
    was simply added because the space(in data:base), was anyways being wasted, due to padding, to achieve alignment
    block(of storage) is anyways read, before writ-ing, so maintaining a wastage-counter, should not be expensive, maybe some nano-seconds, at most */
      ,
      wastage__change;

  members___dictionary //
      convert__member__dictionary() {
    return {
      "position": position.representation__text(),
      "wastage": wastage.representation__text(),
    };
  }
}

final //
    storage__data__position__initial = (storage__data__main__tbl__size(
          storage__data__main__tbl__rows__count__max,
        ) +
        storage__data__main__tbl__offset);

INT storage__data__main__tbl__size(
  final INT rows__count,
) =>
    (rows__count * //
        (storage__data__table__main__rows__count__size + storage__data__position__size__id.size));

storage__data__meta___compo storage__data__create({
  required final storage__file__fast___compo storage__data__storage,
  required final storage__file__native__linux__meta__compo? bytes__preserved__storage /*
  is NOT truncated */
  ,
}) /*
  until, the success-ful, execution, of this procedure
    `data:base` is NOT created, and is equal to garbage
      hence, the `:storage`, MUST NOT be passed to `:open`
        because `:storage` has NO indicator of the `data:base`'s correct-ness

  if the proc `throw`s
    the same `storage__data__storage`, can be passsed to `storage__data__create`, again
      to re-try, the creat-ion */
{
  if (printing___ok) {
    function__call__print(
      "storage__data__create",
      storage__data__storage.label___debug,
    );
  }

  printing__indentation__increase();

  final buffer = BS1__array__aligned__alloc(
    storage__file__block__size.size,
    1,
  );

  {
    copy(
      buffer.arr,
      storage__data__position__initial.cast__byte__array(
        storage__data__position__size__id,
      ),
      count: storage__data__position__size__id.size,
    );

    byte__array__fill(
      buffer.arr.view(
        storage__data__position__size__id.size,
      ),
      count: storage__data__wastage__size__id.size,
    );

    storage__file__native__linux__read_write(
      storage__data__storage.storage,
      buffer.ptr,
      storage__file__block__size.size,
      storage__data__position__offset,
      b__write: TRUE,
    );

    storage__file__native__linux__sync(
      storage__data__storage.storage,
    );
  }

  final bytes__preservation__b__needed = (bytes__preserved__storage != null);

  if (bytes__preservation__b__needed) {
    byte__array__fill(
      buffer.arr,
      count: bytes__preserved__array__count__size__id.size,
    );

    storage__file__native__linux__read_write(
      bytes__preserved__storage,
      buffer.ptr,
      storage__file__block__size.size,
      0,
      b__write: TRUE,
    );

    storage__file__native__linux__sync(
      bytes__preserved__storage,
    );
  }
  /* {over-write}-ing the garbage */;

  BS1__array__free(
    buffer,
  );

  final result = storage__data__meta___compo(
    storage: storage__data__storage,
    preservation__journal: (bytes__preservation__b__needed
        ? preservation__journal(
            bytes__preserved__storage,
          )
        : NIL),
    position: storage__data__position__initial,
    wastage: 0,
  );

  printing__indentation__decrease();

  return result;
}

storage__data__meta___compo storage__data__open({
  required final storage__file__fast___compo storage__data__storage,
  required final storage__file__native__linux__meta__compo? bytes__preserved__storage,
}) {
  if (printing___ok) {
    function__call__print(
      "storage__data__open",
      storage__data__storage.label___debug,
    );
  }

  printing__indentation__increase();

  final bytes__preservation__b__needed = (bytes__preserved__storage != null);

  if (bytes__preservation__b__needed) {
    preservation__journal__recover__if__needed(
      storage__data__storage: storage__data__storage,
      bytes__preserved__storage: bytes__preserved__storage,
    );
  }

  final //
      meta__bytes = storage__file__fast__read__auto(
        storage__data__storage,
        count: (storage__data__position__size__id.size + storage__data__wastage__size__id.size),
        offset: storage__data__position__offset,
      ),
      position = meta__bytes.cast__number__integer(
        storage__data__position__size__id,
      ),
      wastage = meta__bytes
          .view(
            storage__data__position__size__id.size,
          )
          .cast__number__integer(
            storage__data__wastage__size__id,
          );

  if (printing___ok) {
    position.representation__text().print(
          "data:base:position",
          storage__data__storage.label___debug,
        );

    position.representation__text().print(
          "data:base:wastage",
          storage__data__storage.label___debug,
        );
  }

  final result = storage__data__meta___compo(
    storage: storage__data__storage,
    preservation__journal: (bytes__preservation__b__needed
        ? preservation__journal(
            bytes__preserved__storage,
          )
        : NIL),
    position: position,
    wastage: wastage,
  );

  printing__indentation__decrease();

  return result;
}

typedef storage__data__linux__auto__result___compo = ({
  storage__file__native__linux__meta___compo storage,
  storage__file__fast___compo storage__file__fast,
  storage__file__native__linux__meta__compo? bytes__preserved__storage,
  storage__data__meta___compo ds__meta,
});

storage__data__linux__auto__result___compo storage__data__linux__auto({
  required string directory__path,
  final string file__name = "db",
  required final INT ds__storage__size,
  final BOOL bytes__b__preserve = TRUE,
  required final void Function(storage__data__linux__auto__result__compo) create__handle,
}) {
  if (printing___ok) {
    function__call__print("storage__data__linux__auto");

    directory__path.representation__text().print("directory__path");
    file__name.representation__text().print("file__name");
    ds__storage__size.representation__text().print("storage__data__storage__size");
  }

  printing__indentation__increase();

  const //
      file__type__indicator = ".bin";

  final //
      b__create = (!(storage__file__native__linux__b__exists(
        ((directory__path += storage__file__path__separation__char) + file__name + file__type__indicator),
      ))),
      storage = storage__file__native__linux(
        (directory__path + file__name + file__type__indicator),
      ),
      storage__file__fast_ = storage__file__fast(
        storage,
      ),
      bytes__preserved__storage = //
          (bytes__b__preserve
              ? storage__file__native__linux(
                  (directory__path + file__name + ".save" + file__type__indicator),
                )
              : NIL),
      ds__meta = (b__create //
          ? storage__data__create
          : storage__data__open)(
        storage__data__storage: storage__file__fast_,
        bytes__preserved__storage: bytes__preserved__storage,
      );

  storage__file__native__linux__allocate(
    storage,
    ds__storage__size,
  ); /*
   pre-allocat-ing to avoid perf issues, due to fragment-ation */

  final result = (
    storage: storage,
    storage__file__fast: storage__file__fast_,
    bytes__preserved__storage: bytes__preserved__storage,
    ds__meta: ds__meta,
  );

  if (b__create) {
    create__handle(result);
  }

  printing__indentation__decrease();

  return result;
}

/*void storage__data__position__update__if__needed(
    final INT position__new,
  ) {
    if (position__new > storage__data__position){
      storage__data__position = position__new;}
  }*/

INT storage__data__position(
  final storage__data__meta___compo ds__meta,
) {
  return (ds__meta.position__change + ds__meta.position);
}

BS1__array storage__data__read(
  final storage__data__meta___compo ds__meta, {
  required final INT count,
  required final INT storage__data__offset,
}) /*
  also applicable for, `bytes`, `str`(non-wide `text`s), and `wstr__bytes` */
    =>
    storage__file__fast__read__auto(
      ds__meta.storage,
      count: count,
      offset: storage__data__offset,
    );

void storage__data__write(
  final storage__data__meta___compo ds__meta, {
  required final BS1__array bytes,
  final INT? bytes__count,
  required final INT storage__data__offset,
}) /*
  should, be used, only, if the write op
    is on garbage, ir-relevent, or obsolete bytes
    and the op is ir-relevent(or useless), without updat-ing `position`
      example
        append op is useless, if the `position` is not updat-ed, after the op
          because another append op will overwrite the previous append */
    =>
    storage__file__fast__read_write(
      ds__meta.storage,
      bytes: bytes,
      count: (bytes__count ?? bytes.bytes__count),
      offset: storage__data__offset,
      b__write: TRUE,
    );

void storage__data__write__replace /*:preserved*/ (
  final storage__data__meta___compo ds__meta, {
  required final BS1__array bytes,
  required final INT bytes__count,
  required final INT storage__data__offset,
}) /*
  similar to `transaction`s in other dbms-es; but not as heavy, because, only, the original un-modified bytes, are saved(or preserved)

  `if(count > 96)`, prefer append op, instead of (over-)writing directly
    due to, the increase, in preservation cost, of pre-mod(or un-modified) data */
{
  if (printing___ok) {
    function__call__print(
      "storage__data__write__replace",
      ds__meta.label___debug,
    );

    storage__data__offset.representation__text().print("storage__data__offset");
    bytes__count.representation__text().print("bytes__count");
    bytes.representation__text().print("bytes");
  }

  printing__indentation__increase();

  final preservation__journal = ds__meta.preservation__journal;
  if (preservation__journal != null) {
    final bytes__preserved = BS1__array(bytes__count);

    storage__file__fast__read_write(
      ds__meta.storage,
      bytes: bytes__preserved,
      count: bytes__count,
      offset: storage__data__offset,
    );

    if (printing___ok) {
      bytes__preserved.representation__text().print(
            "bytes__preserved",
            ds__meta.label___debug,
          );
    }

    preservation__journal__add(
      preservation__journal,
      bytes__preserved,
      bytes__count,
      storage__data__offset,
    );
  }

  storage__data__write(
    ds__meta,
    bytes: bytes,
    bytes__count: bytes__count,
    storage__data__offset: storage__data__offset,
  );

  printing__indentation__decrease();
}

INT storage__data__write__reserve(
  final storage__data__meta___compo ds__meta,
  final INT count,
) {
  if (printing___ok) {
    function__call__print(
      "storage__data__write__reserve",
      ds__meta.label___debug,
    );

    count.representation__text().print("count");
  }

  final storage__data__offset = storage__data__position(
    ds__meta,
  );

  ds__meta.position__change += count;

  return storage__data__offset;
}

INT /*storage__data__offset*/ storage__data__write__append(
  final storage__data__meta___compo ds__meta,
  final BS1__array bytes, [
  INT? count,
]) /*
  un-preserved write */
{
  final storage__data__offset = storage__data__write__reserve(
    ds__meta,
    (count ??= bytes.bytes__count),
  );

  storage__data__write(
    ds__meta,
    bytes: bytes,
    bytes__count: count,
    storage__data__offset: storage__data__offset,
  );

  return storage__data__offset;
}

void storage__data__sync(
  final storage__data__meta___compo ds__meta,
) /*
  similar to `commit` in other DBMS */
{
  if (printing___ok) {
    function__call__print(
      "storage__data__sync",
      ds__meta.label___debug,
    );
  }

  printing__indentation__increase();

  final //
      preservation__journal = ds__meta.preservation__journal,
      position__change = ds__meta.position__change;

  var b__preserve = (preservation__journal != null);

  if /* likely */ (/*position:update:b:needed*/ (position__change != 0)) {
    storage__data__write__replace(
      ds__meta,
      bytes: (ds__meta.position += position__change).cast__byte__array(
        storage__data__position__size__id,
      ),
      bytes__count: storage__data__position__size__id.size,
      storage__data__offset: storage__data__position__offset,
    );

    ds__meta.position__change = 0;

    final wastage__change = ds__meta.wastage__change;
    if /* likely */ (/*wastage:update:b:needed*/ (wastage__change != 0)) {
      storage__data__write__replace(
        ds__meta,
        bytes: (ds__meta.wastage += wastage__change).cast__byte__array(
          storage__data__wastage__size__id,
        ),
        bytes__count: storage__data__wastage__size__id.size,
        storage__data__offset: storage__data__wastage__offset,
      );

      ds__meta.wastage__change = 0;
    }
  } else if (b__preserve) {
    b__preserve = (preservation__journal.bytes__count != 0);
  }

  if (b__preserve) {
    preservation__journal__persist(
      preservation__journal!,
    );
  }

  storage__file__fast__sync(
    ds__meta.storage,
  );

  if (b__preserve) {
    final buffer = BS1__array__aligned__alloc(
      storage__file__block__size.size,
      1,
    );

    byte__array__fill(
      buffer.arr,
      count: bytes__preserved__array__count__size__id.size,
    );

    final bytes__preserved__storage = preservation__journal!.storage;

    storage__file__native__linux__read_write(
      bytes__preserved__storage,
      buffer.ptr,
      storage__file__block__size.size,
      0,
      b__write: TRUE,
    );

    storage__file__native__linux__sync(
      bytes__preserved__storage,
    );

    BS1__array__free(
      buffer,
    );
  } /*
  since data-base's modifications(or changes), have already been persisted */

  printing__indentation__decrease();
}
