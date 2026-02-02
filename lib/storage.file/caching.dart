part of "_.dart";

/*
TASK
  must support direct-access to the cached file
    through raw proc.s */

/*bool storage__file__fast__block__equal___ok(
  final storage__file__fast__block block,
  final storage__file__fast__block other,
) =>
    (block.offset == other.offset);

class storage__file__fast__block {
  const storage__file__fast__block({
    required this.offset,
    required this.buffer,
  });

  final INT offset /* aligned */ /* TASK: replace with `__reduced` */;
  final BS1__array buffer;
}

/* called buffer-pool, by others */
class storage__file__fast___compo /* `__caching`, `__high__perf__high__mem` */ {
  const storage__file__fast___compo._({
    required this.storage,
    required this.blocks__cach_ed,
    required this.blocks__mod_ed,
    /*required this.free__list,*/
  });

  final storage__file__native__linux__meta___compo storage;
  final stack /* TASK: replace with, either a search-able tree, or implement, placing most-frequently accessed block at last(first during iteration) */ <storage__file__fast__block> blocks__cach_ed /* called page-table, by others */;
  final accumulation__linear__basic___compo<storage__file__fast__block> blocks__mod_ed /* modified blocks; need to be sync-ed, with persistent storage */;
  /*final list__compo<byte__array__compo> free__list;/*
  TASK
    add support, and preference, over `BS1__array__alloc(`, in `_base__storage__file__fast__block__cache__if__needed(` */*/
}

storage__file__fast___compo //
    storage__file__fast__new(
  final storage__file__native__linux__meta___compo storage,
) =>
        storage__file__fast___compo._(
          storage: storage,
          blocks__cach_ed: stack___compo<storage__file__fast__block>(),
          blocks__mod_ed: accumulation__linear__basic___compo<storage__file__fast__block>(),
          /*free__list: list__compo<byte__array__compo>(),*/
        );

/*uu _iterations(final INT count__max) => //
  (count__max >> storage__file__block__size.shift__count);*/

storage__file__fast__block _base__storage__file__fast__block__cache__if__needed(
  final storage__file__fast___compo storage,
  final INT offset,
) {
  if (printing___ok) {
    function__call__print(
      "_base__storage__file__fast__block__cache__if__needed",
      storage.debug__label,
    );

    offset.representation__text().print(
          "offset",
        );
  }

  printing__indentation__increase();

  storage__file__fast__block? block = //
      storage.blocks__cach_ed.contained((final block) => //
          (block.offset == offset)) /* if already cached */;

  if (block != null) {
    if (printing___ok) {
      "already cached".print();
    }

    printing__indentation__decrease();

    return block;
  } else if (printing___ok) {
    "caching".print();
  }

  final buffer = BS1__array(
    storage__file__block__size.size,
  );

  storage__file__native__linux__read_write(
    storage.storage,
    buffer,
    storage__file__block__size.size,
    offset,
  );

  storage.blocks__cach_ed.add(//
      block = storage__file__fast__block(
    offset: offset,
    buffer: buffer,
  ));

  printing__indentation__decrease();

  return block;
}

void _base__storage__file__fast__block__mod__if__needed(
  final storage__file__fast___compo storage,
  final storage__file__fast__block block,
) {
  if (printing___ok) {
    function__call__print(
      "_base__storage__file__fast__block__mod__if__needed",
      storage.debug__label,
    );

    block.offset.representation__text().print(
          "block__offset",
        );
  }

  printing__indentation__increase();

  if (storage.blocks__mod_ed.search(
        (final block_) => storage__file__fast__block__equal___ok(block, block),
      ) ==
      null) {
    if (printing___ok) {
      "adding".print();
    }

    storage.blocks__mod_ed.add(block);
  } else if (printing___ok) {
    "already present".print();
  }

  printing__indentation__decrease();
}

void storage__file__fast__read_write /* __caching */ (
  final storage__file__fast___compo storage, {
  required final BS1__array bytes,
  required INT count,
  required INT offset,
  final BOOL b__write = FALSE,
}) /*
  design
    throws `if ((count <= 0) || (offset < 0))`
    first of all, there are 2 choices
      `if(count <= storage__file__block__size.size)`
        because most of the ops are less than a block's size
        called fast(or hot) path
        also handles the case where `(count + offset)` makes the op, span over 2 consecutive blocks
      other wise a complex approach
        where the `(count + offset)` is converted into 3 parts, or steps
          all the bys before the next aligned block
            if the offset is perfectly aligned, with `storage__file__block__size`
              example: `write(count: 32768, offset: 8192)
              then skips this step
          all bys, from aligned offset, to aligned count
          all remaining bys, if any */
{
  if (printing___ok) {
    function__call__print(
      ("storage." + (b__write ? "write" : "read")),
      storage.debug__label,
    );

    count.representation__text().print("count");
    offset.representation__text().print("offset");
  }

  printing__indentation__increase();

  if /* un-likely */ (!(count > 0)) //
    throw "$count(count) MUST be more than 0";

  if /* un-likely */ (offset < 0) //
    throw "$offset(offset) MUST be positive";

  final offset__aligned = storage__file__offset__aligned(offset);

  if (printing___ok) {
    offset__aligned.representation__text().print(
          "offset__aligned",
          storage.debug__label,
        );
  }

  printing__indentation__increase();

  if /* likely */ (!(count > storage__file__block__size.size)) /* fast-path */ {
    if (printing___ok) {
      "Fast-path".print(storage.debug__label);
    }

    final //
        block = _base__storage__file__fast__block__cache__if__needed(
          storage,
          offset__aligned.offset__aligned,
        ),
        count_ = (((count + offset__aligned.buffer__offset) /* offset__new */ < storage__file__block__size.size) //
            ? /* single block op */ count
            : /* multi block op */ (storage__file__block__size.size - offset__aligned.buffer__offset));

    if (b__write) {
      copy(
        block.buffer,
        bytes,
        dest__offset: offset__aligned.buffer__offset,
        src__offset: 0,
        count: count_,
      );

      _base__storage__file__fast__block__mod__if__needed(
        storage,
        block,
      );
    } else {
      copy(
        bytes,
        block.buffer,
        dest__offset: 0,
        src__offset: offset__aligned.buffer__offset,
        count: count_,
      );
    }

    printing__indentation__increase();

    if /* un-likely */ ((count -= count_) != 0) /* multi block op */ {
      if (printing___ok) {
        "Multi block op".print(storage.debug__label);
      }

      final block = _base__storage__file__fast__block__cache__if__needed(
        storage,
        (storage__file__block__size.size + offset__aligned.offset__aligned),
      );

      if (b__write) {
        copy(
          block.buffer,
          bytes,
          dest__offset: 0,
          src__offset: count_,
          count: count,
        );

        _base__storage__file__fast__block__mod__if__needed(
          storage,
          block,
        );
      } else {
        copy(
          bytes,
          block.buffer,
          dest__offset: count_,
          src__offset: 0,
          count: count,
        );
      }
    }

    printing__indentation__decrease();
  } else {
    if (printing___ok) {
      "Normal-path".print(
        storage.debug__label,
      );
    }

    /*bytes__*/ offset = 0;

    INT offset__diff;

    printing__indentation__increase();

    if /* likely */ (offset__aligned.buffer__offset != 0) {
      if (printing___ok) {
        "First step (un-aligned bys Before)".print(
          storage.debug__label,
        );
      }

      final //
          block = _base__storage__file__fast__block__cache__if__needed(
            storage,
            offset__aligned.offset__aligned,
          ),
          count_ = (storage__file__block__size.size - offset__aligned.buffer__offset);

      if (b__write) {
        copy(
          block.buffer,
          bytes,
          dest__offset: offset__aligned.buffer__offset,
          src__offset: 0,
          count: count_,
        );

        _base__storage__file__fast__block__mod__if__needed(
          storage,
          block,
        );
      } else {
        copy(
          bytes,
          block.buffer,
          dest__offset: 0,
          src__offset: offset__aligned.buffer__offset,
          count: count_,
        );
      }

      count -= count_;
      offset += count_;

      offset__diff = 0;
    } else /*
  `offset`(the argument) is already aligned */
    {
      offset__diff = -base__storage__file__block__size.size; /*
  TASK
    consider, removing, this, ugly, statement */
    }

    printing__indentation__decrease();

/*
  aligned-offset to aligned-count write
    TASK
      if `b__mod`(or write ops), and any block is not cached; instead of, first caching(actually reading), then writing, behaviour
        directly create the blocks, and add to, `block__cached__list`, and `block__moded__list`
          because the block would anyways be overwritten, so why read
      all the reads(or caches), should happen in a single syscall, instead of, per-block basis
        maybe, before the while loop, because the system alread has the info */

    final count__aligned = INT__aligned(
      count,
      storage__file__block__size.size,
      storage__file__block__size.shift__count,
    );

    if (printing___ok) {
      count__aligned.representation__text().print(
            "count__aligned",
            storage.debug__label,
          );
    }

    count = count__aligned.value__aligned;

    printing__indentation__increase();

    while (count != 0) {
      if (printing___ok) {
        "while ($count != 0)".print(
          storage.debug__label,
        );
      }

      offset__diff += storage__file__block__size.size;

      final block = _base__storage__file__fast__block__cache__if__needed(
        storage,
        (offset__diff + offset__aligned.offset__aligned),
      );

      if (b__write) {
        copy(
          block.buffer,
          bytes,
          dest__offset: 0,
          src__offset: offset,
          count: storage__file__block__size.size,
        );

        _base__storage__file__fast__block__mod__if__needed(
          storage,
          block,
        );
      } else {
        copy(
          bytes,
          block.buffer,
          dest__offset: offset,
          src__offset: 0,
          count: storage__file__block__size.size,
        );
      }

      count -= storage__file__block__size.size;
      offset += storage__file__block__size.size;
    }

    if (count__aligned.remainder__un_aligned != 0) {
      if (printing___ok) {
        "Last step (un-aligned bys After)".print(
          storage.debug__label,
        );
      }

      count = count__aligned.remainder__un_aligned;

      final block = _base__storage__file__fast__block__cache__if__needed(
        storage,
        ((offset__diff + storage__file__block__size.size) + offset__aligned.offset__aligned),
      );

/* `(count < storage__file__block__size.size)` is fact */

      if (b__write) {
        copy(
          block.buffer,
          bytes,
          dest__offset: 0,
          src__offset: offset,
          count: count,
        );

        _base__storage__file__fast__block__mod__if__needed(
          storage,
          block,
        );
      } else {
        copy(
          bytes,
          block.buffer,
          dest__offset: offset,
          src__offset: 0,
          count: count,
        );
      }
    }

    printing__indentation__decrease();
  }

  printing__indentation__decrease(2);
}

/*void write__direct /*__un_cached*/ (
    final BOOL Function(BS1__array bytes) b__mod,
    final INT count,
    final INT offset,
  ) {
    if (printing___ok) //
      print__info("storage.write__direct(count: $count, offset: $offset)");

    final //
        offset__aligned = storage__file__offset__aligned(offset),
        count__max = storage__file__count__max(count, offset__aligned.buffer__offset),
        buffer = BS1__array(count__max);

    storage.read(
      buffer,
      count__max,
      offset__aligned.offset__aligned,
    );

    if (b__mod(buffer.view(offset__aligned.buffer__offset, count))) {
      storage.write(
        buffer,
        count__max,
        offset__aligned.offset__aligned,
      );
    }
  }*/ /*
  introduces, in-consistencies
    especially calling `storage.read(`
      if the block is already cached, then `sync(` will anyways overwrite the changes made through `write__direct(`, so why call it */

BS1__array storage__file__fast__read__auto(
  final storage__file__fast___compo storage, {
  required final INT count,
  required final INT offset,
}) {
  final bytes = BS1__array(count);
  storage__file__fast__read_write(
    storage,
    bytes: bytes,
    count: count,
    offset: offset,
  );
  return bytes;
}

/*BS1__array read__direct(
    final INT count,
    final INT offset,
  ) {
    BS1__array bytes = empty__byte__array;

    write__direct((final bytes_) {
      bytes = bytes_;
      return FALSE;
    }, count, offset);

    return bytes;
  }*/ /* in-efficient */

void storage__file__fast__sync(
  final storage__file__fast___compo storage,
) {
  if (printing___ok) //
    function__call__print(
      "storage__file__fast__sync",
      storage.debug__label,
    );

  printing__indentation__increase();

  if (storage.blocks__mod_ed.empty___ok().NOT) {
    storage.blocks__mod_ed.iterate__basic(
      (final element) {
        if (printing___ok) {
          element.offset.representation__text().print(
                "block__moded__list__block__offset",
                storage.debug__label,
              );
        }

        storage__file__native__linux__read_write(
          storage.storage,
          element.buffer,
          storage__file__block__size.size,
          element.offset,
          b__write: TRUE,
        );
      },
    );

    storage.blocks__mod_ed.flush();
  }

  storage__file__native__linux__sync(
    storage.storage,
  );

  printing__indentation__decrease();
}

void storage__file__fast__flush(
  final storage__file__fast___compo storage,
) /*
  SHOULD
    prefer calling `sync(`, before */
{
  if (printing___ok) //
    function__call__print(
      "storage__file__fast__flush",
      storage.debug__label,
    );

  printing__indentation__increase();

  if (storage.blocks__cach_ed.empty___ok.NOT) {
    storage.blocks__cach_ed
      ..iterate__basic((final block) {
        /*free__list.add*/ /*block.buffer.mem_:free()*/
      })
      ..flush();
  }

  printing__indentation__decrease();
}

/*void storage__file__fast__free__if__not__needed() {
  if (printing___ok) //
    print__info("storage.free__if__not__needed()");

  if (!(free__list.empty___ok)) //
    free__list.iterate__basic(BS1__array__free);
}*/*/
