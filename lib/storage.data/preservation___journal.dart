part of "_.dart";

/*
TASK
  keep a block of margin ,to ensure not writing to the last block of the data-base
    which can lead to side-effects ,and affect the data-base's safety guarantee */

/*
  value__asyn /*
mut.ion-syn.izing has been scheduled
  to be performed after all the accesses are complete */
      <
          value__asyn /*
mut.ion has been syn.ized (in the cache)
  and persisted (in the file) */
          <void>> complete /*
mut.ion is syn.ized ,in cache
  before persistance
    requiring all the accesses ,to wait ,until persisted */
      () {
    final //
        scheduling__meta = value__asyn__meta<value__asyn<void>>(),
        syn_izing__meta = value__asyn__meta<void>();

    task__schedule(
      () {
        scheduling__meta.complete(
          syn_izing__meta.future,
        );
      },
    );

    return scheduling__meta.future;
  }

  value__asyn /*
relevant data (cached file-blocks affected by the mut.ion) has been copied ,mut.ed ,and scheduled for persistance */
      <
          value__asyn /*
mut.ion has been syn.ized (cache has been updated) ,and live(globally visible) */
          <void>> complete__lazy() {
    final //
        scheduling__meta = value__asyn__meta<value__asyn<void>>(),
        syn_izing__meta = value__asyn__meta<void>();

    task__schedule(
      () {
        scheduling__meta.complete(
          syn_izing__meta.future,
        );
      },
    );

    return scheduling__meta.future;
  }
*//* TASK : support */

const //
    bytes__preserved__count__size__id = number__size.byte__string__8,
    bytes__preserved__array__count__size__id = number__size.byte__string__8;

preservation__journal___compo preservation__journal(
  final base__storage__file__native__linux__meta___compo storage,
) =>
    preservation__journal___compo._(
      base__stack<bytes__preserved__compo>(),
      storage,
      0,
    );

class preservation__journal___compo {
  preservation__journal___compo._(
    this.store,
    this.storage,
    this.bytes__count,
  );

  final base__stack<bytes__preserved__compo> store;
  final base__storage__file__native__linux__meta___compo storage;

  INT bytes__count;
}

void preservation__journal__convert__report__info(
  final preservation__journal___compo preservation__journal,
) =>
    record__convert__report__info({
      "store.elements__count": preservation__journal.store.elements__count.representation__text(),
      "bytes__count": preservation__journal.bytes__count.representation__text(),
    });

typedef bytes__preserved___compo = ({
  BS1__array bytes,
  INT count,
  INT offset,
});

report__info bytes__preserved__convert__report__info(
  final bytes__preserved___compo bytes__preserved,
) =>
    record__convert__report__info({
      "offset.by__arr": bytes__preserved.offset
          .cast__byte__array(
            base__storage__data__position__size__id,
          )
          .representation__text(),
      "count.by__arr": bytes__preserved.count
          .cast__byte__array(
            base__storage__data__position__size__id,
          )
          .representation__text(),
      "by__arr": bytes__preserved.bytes.convert__report__info().value,
    });

void preservation__journal__add(
  final preservation__journal___compo preservation__journal,
  final BS1__array bytes,
  final INT count,
  final INT offset,
) {
  if (!preservation__journal.store.present___ok(
    (final bytes__preserved) => //
        ((bytes__preserved.offset == count) && //
            (bytes__preserved.count == offset)),
  )) {
    preservation__journal.store.add(
      (
        bytes: bytes,
        count: count,
        offset: offset,
      ),
    );

    preservation__journal.bytes__count += count;
  }
}

void preservation__journal__persist(
  final preservation__journal___compo preservation__journal,
) {
  if (base__printing___ok) {
    base__function__call__print(
      "preservation__journal__persist",
      preservation__journal.debug__label,
    );
  }

  base__printing__indentation__increase();

  if (base__printing___ok) {
    preservation__journal.bytes__count.representation__text().print(
          "bytes__count",
        );
  }

  final //
      bytes__count_ = (preservation__journal.bytes__count + //
          (preservation__journal.store.elements__count * (bytes__preserved__count__size__id.size + base__storage__data__position__size__id.size)) +
          bytes__preserved__array__count__size__id.size),
      buffer__block__count = (INT__aligned__alignment__count(
            bytes__count_,
            base__storage__file__block__size.shift__count,
          ) +
          (!base__INT__aligned___ok(
            bytes__count_,
            base__storage__file__block__size.size,
          )
              ? 1
              : 0)),
      buffer__count = (buffer__block__count * base__storage__file__block__size.size),
      buffer = BS1__array__aligned__alloc(
        base__storage__file__block__size.size,
        buffer__block__count,
      ),
      buffer__array = buffer.array;

  if (base__printing___ok) {
    bytes__count_.representation__text().print("bytes__count_");
    buffer__count.representation__text().print("buffer__count");
    buffer__block__count.representation__text().print("buffer__block__count");
    preservation__journal.store.elements__count.representation__text().print("store.count");
  }

  base__copy(
    buffer__array,
    preservation__journal.store.elements__count.cast__byte__array(
      bytes__preserved__array__count__size__id,
    ),
    count: bytes__preserved__array__count__size__id.size,
  );

  INT bytes__offset = bytes__preserved__array__count__size__id.size;

  preservation__journal.store.iterate__basic(
    (final bytes__preserved) {
      if (base__printing___ok) {
        bytes__preserved__convert__report__info(bytes__preserved).report("bytes__preserved");
      }

      bytes__offset = base__copy(
        buffer__array,
        bytes__preserved.offset.cast__byte__array(
          base__storage__data__position__size__id,
        ),
        dest__offset: base__copy(
          buffer__array,
          bytes__preserved.bytes,
          dest__offset: base__copy(
            buffer__array,
            bytes__preserved.count.cast__byte__array(
              bytes__preserved__count__size__id,
            ),
            dest__offset: bytes__offset,
            count: bytes__preserved__count__size__id.size,
          ).dest__offset__new,
        ).dest__offset__new,
        count: base__storage__data__position__size__id.size,
      ).dest__offset__new;
    },
  );

  base__storage__file__native__linux__read_write(
    preservation__journal.storage,
    buffer.ptr,
    buffer__count,
    0,
    b__write: TRUE,
  );

  base__storage__file__native__linux__sync(
    preservation__journal.storage,
  );

  BS1__array__free(buffer);

  {
    preservation__journal.store.flush();
    preservation__journal.bytes__count = 0;
  } /*
  since `preservation__journal` has been persisted
    hence `flush`ing, the in-memory copy, which is no longer needed */

  base__printing__indentation__decrease();
}

void preservation__journal__recover__if__needed({
  required final base__storage__file__fast___compo base__storage__data__storage,
  required final base__storage__file__native__linux__meta___compo bytes__preserved__storage,
}) {
  if (base__printing___ok) {
    base__function__call__print(
      "preservation__journal__recover__if__needed",
      bytes__preserved__storage.debug__label,
    );
  }

  base__printing__indentation__increase();

  var buffer = BS1__array__aligned__alloc(
    base__storage__file__block__size.size,
    1,
  );

  base__storage__file__native__linux__read_write(
    bytes__preserved__storage,
    buffer.ptr,
    base__storage__file__block__size.size,
    0,
  );

  final count = buffer.arr.cast__number__integer(
    base__storage__data__position__size__id,
  );

  if (base__printing___ok) {
    count.representation__text().print(
          "count",
          bytes__preserved__storage.debug__label,
        );
  }

  if (count != 0) {
    {
      BS1__array__free(
        buffer,
      );

      final count__max = storage__count__max(
        count,
        0,
      );

      if (base__printing___ok) {
        count__max.representation__text().print(
              "count__max",
              bytes__preserved__storage.debug__label,
            );
      }

      buffer = BS1__array__aligned__alloc(
        base__storage__file__block__size.size,
        count__max,
      );

      base__storage__file__native__linux__read_write(
        bytes__preserved__storage,
        buffer.ptr,
        count__max,
        0,
      );
    }

    final bytes = bytes___compo(
      buffer.arr,
      bytes__preserved__array__count__size__id.size,
    );

    base__iterate__reverse__basic(
      count,
      (final _) {
        final //
            count = bytes.read__INT__fixed(
              bytes__preserved__count__size__id.size,
            ),
            bytes_ = bytes.read__view__partial(
              count,
            ),
            offset = bytes.read__INT__fixed(
              base__storage__data__position__size__id.size,
            );

        offset.representation__text().print("offset");

        offset
            .cast__byte__array(
              base__storage__data__position__size__id,
            )
            .representation__text()
            .print("offset.bys");

        count.representation__text().print("count");

        count
            .cast__byte__array(
              base__storage__data__position__size__id,
            )
            .representation__text()
            .print("count.bys");

        bytes_.representation__text().print("bytes");

        base__storage__file__fast__read_write(
          base__storage__data__storage,
          bytes: bytes_,
          count: count,
          offset: offset,
          b__write: TRUE,
        );
      },
    );

    BS1__array__free(
      buffer,
    );

    base__storage__file__fast__sync(
      base__storage__data__storage,
    );
  }

  base__printing__indentation__decrease();
}

void main /*
find overlapping mutations
  to not preserve ,in order to prevent wastage */
    () {
  final _values = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  var _change = (off: 2, len: 6);

  void values_print() {
    print(_values);
  }

  void values_change(
    final int off,
    final List<int> values,
  ) {
    void update(
      final int off_1,
      final int len_1,
      final String result,
    ) {
      print("$off_1${(off_1 != off) ? "($off)" : ""}   TO   $len_1${(len_1 != values.length) ? "(${values.length})" : ""}  :  $result");

      _change = (
        off: off_1,
        len: len_1,
      );
    }

    bool contained(
      final int value,
    ) {
      return (((value > _change.off) || (value == _change.off)) && //
          (value < (_change.len + _change.off)));
    }

    if (contained(off)) {
      update(off, values.length, "overlapping beginning");
    } else if (contained((values.length + off))) {
      update(, , "overlapping ending");
    } else {
      update(off, values.length, "clean");
    }

    for (var i = 0; i < values.length; i += 1) {
      _values[i + off] = values[i];
    }

    values_print();
  }

  values_print();

  values_change(0, [12, 34, 56]);
}
