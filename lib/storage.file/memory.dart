part of "_.dart";

class storage__file__memory__meta //
    implements storage__file__meta__basic___protocol {
  storage__file__memory__meta(
    this._file, {
    this.alignment = alignment__modern__normal,
  });

  final storage__file__memory _file;
  final storage__file__alignment___compo alignment;

  @override
  ASYN<storage__file__reading__result___union> //
  read__asyn({
    required final INT count,
    required final INT offset,
  }) {
    final result = _file.read(
      count: count,
      offset: offset,
    );

    return ASYN.syncValue(
      storage__file__reading__result__success(result),
    );
  }

  @override
  ASYN<storage__file__writing__error?> //
  write__asyn(
    final storage__file__blocks value, {
    required final INT offset,
  }) {
    _file.write(
      value,
      offset: offset,
    );

    return ASYN.syncValue(NIL);
  }

  @override
  ASYN<storage__file__closure__error?> //
  dispose__asyn() {
    _file.dispose();

    return ASYN.syncValue(NIL);
  }
}

class storage__file__memory //
    implements dispose___protocol {
  static const //
  block__first__bytes__count__doubling__initial = 2;

  storage__file__memory({
    this.block__meta = alignment__modern__normal,
  }) : _block__accumulation = accumulation__linear__basic___compo();

  final storage__file__alignment___compo block__meta;
  final accumulation__linear__basic___compo<byte__array> _block__accumulation;

  INT _blocks__count = 0;

  INT //
  blocks__count() {
    return _blocks__count;
  }

  BOOL //
  empty___ok() {
    return (_blocks__count == 0);
  }

  INT //
  bytes__count() {
    return (_blocks__count * block__meta.size);
  }

  void block__ensure__valid___raw(
    final INT block__id,
  ) {
    if (block__id > _blocks__count) {
      throw "$block__id\\block__id\\ is not existent in the file";
    }
  }

  void write__fill({
    final byte value = 0,
    required final INT count,
    required final INT offset,
  }) {
    if (printing___ok) {
      function__call__print(
        "storage__file__memory.write__fill",
        label___debug,
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
      block__handle: (_, final block) {
        byte__array__fill(
          block._value,
          count: block__meta.size,
          value: value,
        );
      },
    );
  }

  INT /*offset*/ //
  write__ending(
    final storage__file__blocks value,
  ) {
    final offset = _blocks__count;

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
    final storage__file__blocks value, {
    required final INT offset,
  }) {
    if (printing___ok) {
      function__call__print(
        "storage__file__memory.write",
        label___debug,
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
        copy(
          block._value,
          value[block__id]._value,
          count: block__meta.size,
        );
      },
    );
  }

  storage__file__blocks //
  read__full() {
    if (empty___ok()) {
      return ARRAY__empty();
    }

    final result = read(
      count: _blocks__count,
      offset: 0,
    );

    return result;
  }

  storage__file__blocks //
  read({
    required final INT count,
    required final INT offset,
  }) {
    if (printing___ok) {
      function__call__print(
        "storage__file__memory.read",
        label___debug,
      );

      count.representation__text().print("count");
      offset.representation__text().print("offset");
    }

    final offset__new = (count + offset);

    block__ensure__valid___raw(
      offset__new,
    );

    if (count == 0) {
      return ARRAY__empty();
    }

    final block__accumulation = accumulation__linear__basic___compo<storage__file__block>(
      capacity__initial: count,
    );

    operate___raw(
      count: count,
      offset: offset,
      block__handle: (_, final block) {
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
      storage__file__block block,
    )
    block__handle,
  }) {
    final blocks__iteration__meta = accumulation__conservative__iteration__meta(
      array__first__elements__count__doubling__initial: block__first__bytes__count__doubling__initial,
      elements__count: _blocks__count,
    );

    late byte__array blocks;

    blocks__iteration__meta.iterate__forward__auto(
      count: count,
      offset: offset,
      array__handle:
          (
            final accumulation__element__id,
            final array__id,
          ) {
            blocks = _block__accumulation.element(
              array__id,
            );

            return TRUE;
          },
      element__handle:
          (
            final accumulation__element__id,
            final array__element__id,
          ) {
            block__handle(
              accumulation__element__id,
              storage__file__block(
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
      if /*F*/ (_block__accumulation.empty___ok()) {
        array__last__bytes__count =
            (block__meta.size *
            accumulation__conservative__iteration__meta.array__first__elements__count__ideal(
              array__first__elements__count__doubling__initial: block__first__bytes__count__doubling__initial,
            ));

        _block__accumulation.add__ending(
          byte__array(
            array__last__bytes__count,
          ),
        );
      } else {
        array__last__bytes__count = _block__accumulation.element__last().bytes__count;
      }

      while (true) {
        {
          array__last__bytes__count *= 2;

          _block__accumulation.add__ending(
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

    _blocks__count += count;
  }

  /*void decrease({
    final INT offset = 0,
  });*/

  byte__array convert__byte__array() {
    return read__full().convert__byte__array();
  }

  void flush() {
    if (printing___ok) {
      function__call__print(
        "storage__file__memory.flush",
        label___debug,
      );
    }

    _block__accumulation.flush();

    _blocks__count = 0;
  }

  @override
  void dispose() {
    if (printing___ok) {
      function__call__print(
        "storage__file__memory.dispose",
        label___debug,
      );
    }

    flush();

    _block__accumulation.dispose();
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
      ARRAY__generated(
        5,
        (final i) => storage__file__block(
          byte__array__new__generated(
            file.block__meta.size,
            (_) => i,
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
    .._block__accumulation
        .convert__array()
        .convert(
          (final e) => (e.bytes__count ~/ block__meta.size),
        )
        .representation__text()
        .print()
    ..read(count: 2, offset: 3).convert__byte__array().representation__text().print("file.read(2,3)");
}
