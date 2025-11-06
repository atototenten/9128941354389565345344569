part of "_.dart";

class base__storage__file__memory__meta //
    implements
        base__storage__file__meta__basic___protocol {
  base__storage__file__memory__meta(
    this.file___raw, {
    this.alignment = alignment__modern__normal,
  });

  final storage__file__memory file___raw;
  final base__storage__file__alignment___compo alignment;

  @override
  value__asyn<base__storage__file__reading__result___union> //
      read__asyn({
    required final INT count,
    required final INT offset,
  }) {
    final result = file___raw.read(
      count: count,
      offset: offset,
    );

    return value__asyn.value(
      base__storage__file__reading__result__success(
        result,
      ),
    );
  }

  @override
  value__asyn<base__storage__file__writing__error?> //
      write__asyn(
    final base__storage__file__blocks value, {
    required final INT offset,
  }) {
    file___raw.write(
      value,
      offset: offset,
    );

    return value__asyn.value(
      NIL,
    );
  }

  @override
  value__asyn<base__storage__file__closure__error?> //
      dispose__asyn() {
    file___raw.dispose();

    return value__asyn.value(
      NIL,
    );
  }
}

class storage__file__memory //
    implements
        base__dispose___protocol {
  static const //
      block__first__bytes__count__doubling__initial = 2;

  storage__file__memory({
    this.block__meta = alignment__modern__normal,
  }) : block__accumulation___raw = base__accumulation__linear__basic();

  final base__storage__file__alignment___compo block__meta;
  final base__accumulation__linear__basic<byte__array> block__accumulation___raw;

  INT blocks__count___raw = 0;

  INT //
      blocks__count() {
    return blocks__count___raw;
  }

  BOOL //
      empty___ok() {
    return (blocks__count___raw == 0);
  }

  BOOL //
      empty__not() {
    return (blocks__count___raw != 0);
  }

  INT //
      bytes__count() {
    return (blocks__count___raw * block__meta.size);
  }

  void block__ensure__valid___raw(
    final INT block__id,
  ) {
    if (block__id > blocks__count___raw) {
      throw "$block__id\\block__id\\ is not existent in the file";
    }
  }

  void write__fill({
    final byte value = 0,
    required final INT count,
    required final INT offset,
  }) {
    if (base__printing___ok) {
      base__function__call__print(
        "storage__file__memory.write__fill",
        debug__label,
      );

      value.representation__text().print("value");
      count.representation__text().print("count");
      offset.representation__text().print("offset");
    }

    if (count == 0) {
      block__ensure__valid___raw(
        offset,
      );

      return;
    }

    {
      final offset__new = (count + offset);

      block__ensure__valid___raw(
        offset__new,
      );
    }

    operate___raw(
      count: count,
      offset: offset,
      block__handle: (final _, final block) {
        byte__array__fill(
          block.value___raw,
          count: block__meta.size,
          value: value,
        );
      },
    );
  }

  INT /*offset*/ //
      write__ending(
    final base__storage__file__blocks value,
  ) {
    final offset = blocks__count___raw;

    increase(
      count: value.elements__count,
    );

    write(
      value,
      offset: offset,
    );

    return offset;
  }

  void write(
    final base__storage__file__blocks value, {
    required final INT offset,
  }) {
    if (base__printing___ok) {
      base__function__call__print(
        "storage__file__memory.write",
        debug__label,
      );

      value.elements__count.representation__text().print("blocks__count");
      offset.representation__text().print("offset");
    }

    if (value.empty___ok()) {
      block__ensure__valid___raw(
        offset,
      );

      return;
    }

    {
      final offset__new = (value.elements__count + offset);

      block__ensure__valid___raw(
        offset__new,
      );
    }

    operate___raw(
      count: value.elements__count,
      offset: offset,
      block__handle: (final block__id, final block) {
        base__copy(
          block.value___raw,
          value[block__id].value___raw,
          count: block__meta.size,
        );
      },
    );
  }

  base__storage__file__blocks //
      read__full() {
    if (empty___ok()) {
      return array__new__empty();
    }

    final result = read(
      count: blocks__count___raw,
      offset: 0,
    );

    return result;
  }

  base__storage__file__blocks //
      read({
    required final INT count,
    required final INT offset,
  }) {
    if (base__printing___ok) {
      base__function__call__print(
        "storage__file__memory.read",
        debug__label,
      );

      count.representation__text().print("count");
      offset.representation__text().print("offset");
    }

    final offset__new = (count + offset);

    block__ensure__valid___raw(
      offset__new,
    );

    if (count == 0) {
      return array__new__empty();
    }

    final block__accumulation = base__accumulation__linear__basic<base__storage__file__block>(
      capacity__initial: count,
    );

    operate___raw(
      count: count,
      offset: offset,
      block__handle: (final _, final block) {
        block__accumulation.add__ending(
          block,
        );
      },
    );

    final result = block__accumulation.convert__array();

    block__accumulation.dispose();

    return result;
  }

  void operate___raw({
    required final INT count,
    required final INT offset,
    required final void Function(
      INT block__id,
      base__storage__file__block block,
    ) block__handle,
  }) {
    final blocks__iteration__meta = base__accumulation__conservative__iteration__meta(
      array__first__elements__count__doubling__initial: block__first__bytes__count__doubling__initial,
      elements__count: blocks__count___raw,
    );

    late byte__array blocks;

    blocks__iteration__meta.iterate__forward__auto(
      count: count,
      offset: offset,
      array__handle: (
        final accumulation__element__id,
        final array__id,
      ) {
        blocks = block__accumulation___raw.element(
          array__id,
        );

        return TRUE;
      },
      element__handle: (
        final accumulation__element__id,
        final array__element__id,
      ) {
        block__handle(
          accumulation__element__id,
          base__storage__file__block(
            blocks.view__partial(
              (array__element__id * block__meta.size),
              block__meta.size,
            ),
          ),
        );

        return TRUE;
      },
    );
  }

  void increase({
    required final INT count,
  }) {
    {
      final bytes__count = (count * block__meta.size);

      INT array__last__bytes__count;
      if /*F*/ (block__accumulation___raw.empty___ok()) {
        array__last__bytes__count = (block__meta.size *
            base__accumulation__conservative__iteration__meta.array__first__elements__count__ideal(
              array__first__elements__count__doubling__initial: block__first__bytes__count__doubling__initial,
            ));

        block__accumulation___raw.add__ending(
          byte__array(
            array__last__bytes__count,
          ),
        );
      } else {
        array__last__bytes__count = block__accumulation___raw.element__last().bytes__count;
      }

      while (true) {
        {
          array__last__bytes__count *= 2;

          block__accumulation___raw.add__ending(
            byte__array(
              array__last__bytes__count,
            ),
          );
        }

        if /*F*/ (array__last__bytes__count < bytes__count) {
          continue;
        }

        break;
      }
    }

    blocks__count___raw += count;
  }

  /*void decrease({
    final INT offset = 0,
  });*/

  byte__array convert__byte__array() {
    return read__full().convert__byte__array();
  }

  void flush() {
    if (base__printing___ok) {
      base__function__call__print(
        "storage__file__memory.flush",
        debug__label,
      );
    }

    block__accumulation___raw.flush();

    blocks__count___raw = 0;
  }

  @override
  void dispose() {
    if (base__printing___ok) {
      base__function__call__print(
        "storage__file__memory.dispose",
        debug__label,
      );
    }

    flush();

    block__accumulation___raw.dispose();
  }
}

void storage__file__memory__test() {
  const block__meta = (
    size: 2,
    shift__count: 1,
  );

  final file = storage__file__memory(
    block__meta: block__meta,
  );

  file
    ..read__full().convert__byte__array().representation__text().print("file.read.full")
    //..read(count: 1, offset: 0).convert__byte__array().representation__text().print("file.read(1,0)")
    ..write__ending(
      array__new__generated(
        5,
        (final i) => base__storage__file__block(
          byte__array__new__generated(
            file.block__meta.size,
            (final _) => i,
          ),
        ),
      ),
    ).representation__text().print("file.write__ending(generate*5)")
    ..read__full()
        .convert__byte__array()
        .representation__text(
          elements__truncate___ok: FALSE,
        )
        .print("file.read.full.1")
    ..block__accumulation__raw
        .convert__array()
        .convert(
          (final e) => (e.bytes__count ~/ block__meta.size),
        )
        .representation__text()
        .print()
    ..read(count: 2, offset: 3).convert__byte__array().representation__text().print("file.read(2,3)");
}
