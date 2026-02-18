part of "_.dart";

typedef block__fetch__asyn___procedure__format //
<element___type extends dispose__asyn__basic___protocol> =
    ASYN<ARRAY<element___type>> Function(
      INT block__id,
    );

class fetching__caching /*
general-purpose caching for elements
  with un-signed integer type id. in sequence ,beginning with 0
behaves like a ring
after ,completely independent ,discovery ,design ,and development
  a chat-bot was asked about any similar existing discovery ,with a description
    which concluded ,that the creation is not first-of-its-kind
      and called circular-buffer/rolling/sliding-window caching ,by others

FIX
  error-handling for block-fetching

TASK
  pre-fetch the next/previous block in advance
    based on the historical-knowledge of last(in time) progression being forward/backward
      because change is less-likely
      but keep the existing block
        to eliminate the cost/wastage ,in case of wrong prediction
  support `error__try__count__max` */ //
<element___type extends dispose__asyn__basic___protocol> //
    implements dispose__asyn__basic___protocol {
  static const //
  blocks__count__width__default = 2,
      block__elements__count__width__default = 8,
      block__elements__count__width__default__large = 12,
      block__elements__count__width__default__small = 4;

  factory fetching__caching({
    required final block__fetch__asyn___procedure__format<element___type> block__fetch__asyn,
    required final INT elements__count,
    final INT block__elements__count__width = block__elements__count__width__default,
    final INT blocks__count__width = blocks__count__width__default,
  }) {
    final blocks__count = (1 << blocks__count__width);

    return fetching__caching._(
      elements__count: elements__count,
      block__elements__count__width: block__elements__count__width,
      block__elements__count__max: INT__max__basic(
        width: block__elements__count__width,
      ),
      blocks__count__max: (blocks__count - 1),
      block__fetch__asyn: block__fetch__asyn,
      blocks: ARRAY__filled<fetching__caching__block<element___type>?>(
        blocks__count,
        NIL,
      ),
    );
  }

  fetching__caching._({
    required this.elements__count,
    required this.block__elements__count__width,
    required this.block__elements__count__max,
    required this.blocks__count__max,
    required this.block__fetch__asyn,
    required final ARRAY<fetching__caching__block<element___type>?> blocks,
  }) : _blocks = blocks;

  final INT //
  elements__count /*
fixed because re-loading the affected block (of which ,the elements-count has been changed) ,if loaded
  is highly complicated */,
      blocks__count__max,
      block__elements__count__width,
      block__elements__count__max;

  final block__fetch__asyn___procedure__format<element___type> block__fetch__asyn;

  final ARRAY<fetching__caching__block<element___type>?> _blocks;

  ({
    INT elements__offset /* not in block */,
    INT block__elements__count,
  })
  elements__offset__count(
    final INT block__id,
  ) {
    final //
    element__id = (block__id << block__elements__count__width),
        block__elements__count = (1 + block__elements__count__max),
        elements__remaining__count = (elements__count - element__id);

    return (
      elements__offset: element__id,
      block__elements__count:
          ((elements__remaining__count < block__elements__count) /*F*/ //
          ? elements__remaining__count
          : block__elements__count),
    );
  }

  ASYN<element___type> //
  element__asyn(
    final INT element__id,
  ) async {
    if (element__id >= elements__count) {
      throw "`(element__id >= elements__count)`($element__id >= $elements__count)";
    }

    final //
    block__id = (element__id >> block__elements__count__width),
        block__offset /* requested element's offset in block */ = (element__id & block__elements__count__max),
        blocks__offset /* requested element's block's offset in blocks */ = (block__id & blocks__count__max);

    final block__existing = _blocks[blocks__offset];

    if ((block__existing == null) || //
        (block__existing.id != block__id)) {
      final block__elements__asyn = block__fetch__asyn(
        block__id,
      );

      if (block__existing != null) {
        final block__elements__existing = block__existing.elements;

        switch (block__elements__existing) {
          case fetching__caching__block__elements__waiting<element___type>():
            {
              final block__elements__existing__value = await block__elements__existing.value__asyn_1;

              await fetching__caching__block__elements___union.elements__dispose(
                block__elements__existing__value,
              );

              break;
            }
          case fetching__caching__block__elements__present<element___type>():
            {
              await fetching__caching__block__elements___union.elements__dispose(
                block__elements__existing.value,
              );

              break;
            }
        }
      }

      _blocks[blocks__offset] = fetching__caching__block(
        id: block__id,
        elements: fetching__caching__block__elements__waiting(
          block__elements__asyn,
        ),
      );

      final block = await block__elements__asyn;

      return block[block__offset];
    }

    final block__elements__existing = block__existing.elements;

    switch (block__elements__existing) {
      case fetching__caching__block__elements__waiting<element___type>():
        {
          final block__elements__existing__value = await block__elements__existing.value__asyn_1;

          return block__elements__existing__value[block__offset];
        }
      case fetching__caching__block__elements__present<element___type>():
        {
          return block__elements__existing.value[block__offset];
        }
    }
  }

  @override
  ASYN<void> dispose__asyn() async {
    return ITERATE__backwards___asyn(
      _blocks.elements__count,
      (final i) async {
        final block = _blocks[i];

        if (block == null) {
          return TRUE;
        }

        await block.dispose__asyn();

        return TRUE;
      },
    );
  }
}

class fetching__caching__block //
<element___type extends dispose__asyn__basic___protocol> //
    implements dispose__asyn__basic___protocol {
  const fetching__caching__block({
    required this.id,
    required this.elements,
  });

  final INT id;
  final fetching__caching__block__elements___union<element___type> elements;

  @override
  ASYN<void> dispose__asyn() async {
    await elements.dispose__asyn();
  }
}

class fetching__caching__block__elements__waiting //
<element___type extends dispose__asyn__basic___protocol> //
    implements fetching__caching__block__elements___union<element___type> {
  const fetching__caching__block__elements__waiting(
    this.value__asyn_1,
  );

  final ASYN<ARRAY<element___type>> value__asyn_1;

  @override
  ASYN<void> dispose__asyn() async {
    final value = await value__asyn_1;

    await fetching__caching__block__elements___union.elements__dispose(
      value,
    );
  }
}

class fetching__caching__block__elements__present //
<element___type extends dispose__asyn__basic___protocol> //
    implements fetching__caching__block__elements___union<element___type> {
  const fetching__caching__block__elements__present(
    this.value,
  );

  final ARRAY<element___type> value;

  @override
  ASYN<void> dispose__asyn() async {
    await fetching__caching__block__elements___union.elements__dispose(
      value,
    );
  }
}

sealed class fetching__caching__block__elements___union //
<element___type extends dispose__asyn__basic___protocol> //
    implements dispose__asyn__basic___protocol {
  static ASYN<void> elements__dispose<element___type extends dispose__asyn__basic___protocol>(
    final ARRAY<element___type> elements,
  ) async {
    await ITERATE__backwards___asyn(
      elements.elements__count,
      (final i) async {
        await elements[i].dispose__asyn();

        return TRUE;
      },
    );
  }
}

class fetching__caching__testing__element //
    implements dispose__asyn__basic___protocol {
  const fetching__caching__testing__element(
    this.value,
  );

  final INT value;

  @override
  ASYN<void> dispose__asyn() async {}
}

ASYN<void> fetching__caching__test() async {
  const //
  blocks__count__width = 1,
      block__elements__count__width = (1 + blocks__count__width),
      elements__count = (3 + (3 * (1 << (block__elements__count__width + blocks__count__width))));

  elements__count //
      .representation__text()
      .print("elements__count");

  late final fetching__caching<fetching__caching__testing__element> fetching;

  fetching = fetching__caching(
    block__fetch__asyn: (final block__id) async {
      final elements__offset__count = fetching.elements__offset__count(
        block__id,
      );

      elements__offset__count //
          .representation__text()
          .print("elements__offset__count (block__id : $block__id)");

      final result = ARRAY__generated(
        elements__offset__count.block__elements__count,
        (final i) {
          return fetching__caching__testing__element(
            (i + elements__offset__count.elements__offset),
          );
        },
      );

      /*await ASYN__BASIC<void>.delayed(
        Duration(
          seconds: 1,
        ),
      );*/

      return result;
    },
    elements__count: elements__count,
    block__elements__count__width: block__elements__count__width,
  );

  await ITERATE__forwards___asyn(
    (1 + elements__count),
    (final element__id) async {
      final element = await fetching.element__asyn(
        element__id,
      );

      element
          .value //
          .representation__text()
          .print("element.value");

      if (element.value != element__id) {
        throw "`(element.value ~= element__id)`(${element.value} ~= $element__id)";
      }

      return TRUE;
    },
  );

  await fetching.dispose__asyn();
}
