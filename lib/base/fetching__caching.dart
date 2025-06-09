part of "_.dart";

typedef base__block__fetch__asyn__procedure__format //
    <element__type extends base__dispose__asyn__basic___protocol>
    = value__asyn<array<element__type>> Function(
  NIMR block__id,
);

class base__fetching__caching /*
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
    <element__type extends base__dispose__asyn__basic___protocol> //
    implements
        base__dispose__asyn__basic___protocol {
  static const //
      blocks__count__width__default = 2,
      block__elements__count__width__default = 8,
      block__elements__count__width__default__large = 12,
      block__elements__count__width__default__small = 4;

  factory base__fetching__caching({
    required final base__block__fetch__asyn__procedure__format<element__type> block__fetch__asyn,
    required final NIMR elements__count,
    final NIMR block__elements__count__width = block__elements__count__width__default,
    final NIMR blocks__count__width = blocks__count__width__default,
  }) {
    final blocks__count = (1 << blocks__count__width);

    return base__fetching__caching.raw(
      elements__count: elements__count,
      block__elements__count__width: block__elements__count__width,
      block__elements__count__max: NI__max__basic(
        width: block__elements__count__width,
      ),
      blocks__count__max: (blocks__count - 1),
      block__fetch__asyn: block__fetch__asyn,
      blocks__raw: array__new__filled<base__fetching__caching__block<element__type>?>(
        blocks__count,
        NIL,
      ),
    );
  }

  base__fetching__caching.raw({
    required this.elements__count,
    required this.block__elements__count__width,
    required this.block__elements__count__max,
    required this.blocks__count__max,
    required this.block__fetch__asyn,
    required this.blocks__raw,
  });

  final NIMR //
      elements__count /*
fixed because re-loading the affected block (of which ,the elements-count has been changed) ,if loaded
  is highly complicated */
      ,
      blocks__count__max,
      block__elements__count__width,
      block__elements__count__max;

  final base__block__fetch__asyn__procedure__format<element__type> block__fetch__asyn;

  final array<base__fetching__caching__block<element__type>?> blocks__raw;

  ({
    NIMR elements__offset /* not in block */,
    NIMR block__elements__count,
  }) elements__offset__count(
    final NIMR block__id,
  ) {
    final //
        element__id = (block__id << block__elements__count__width),
        block__elements__count = (1 + block__elements__count__max),
        elements__remaining__count = (elements__count - element__id);

    return (
      elements__offset: element__id,
      block__elements__count: ((elements__remaining__count < block__elements__count) /*F*/ //
          ? elements__remaining__count
          : block__elements__count),
    );
  }

  value__asyn<element__type> //
      element__asyn(
    final NIMR element__id,
  ) async {
    if (element__id >= elements__count) {
      throw "`(element__id >= elements__count)`($element__id >= $elements__count)";
    }

    final //
        block__id = (element__id >> block__elements__count__width),
        block__offset /* requested element's offset in block */ = (element__id & block__elements__count__max),
        blocks__offset /* requested element's block's offset in blocks */ = (block__id & blocks__count__max);

    final block__existing = blocks__raw[blocks__offset];

    if ((block__existing == null) || //
        (block__existing.id != block__id)) {
      final block__elements__asyn = block__fetch__asyn(
        block__id,
      );

      if (block__existing != null) {
        final block__elements__existing = block__existing.elements;

        switch (block__elements__existing) {
          case base__fetching__caching__block__elements__waiting<element__type>():
            {
              final block__elements__existing__value = await block__elements__existing.value__asyn_1;

              await base__fetching__caching__block__elements___union.elements__dispose(
                block__elements__existing__value,
              );

              break;
            }
          case base__fetching__caching__block__elements__present<element__type>():
            {
              await base__fetching__caching__block__elements___union.elements__dispose(
                block__elements__existing.value,
              );

              break;
            }
        }
      }

      blocks__raw[blocks__offset] = base__fetching__caching__block(
        id: block__id,
        elements: base__fetching__caching__block__elements__waiting(
          block__elements__asyn,
        ),
      );

      final block = await block__elements__asyn;

      return block[block__offset];
    }

    final block__elements__existing = block__existing.elements;

    switch (block__elements__existing) {
      case base__fetching__caching__block__elements__waiting<element__type>():
        {
          final block__elements__existing__value = await block__elements__existing.value__asyn_1;

          return block__elements__existing__value[block__offset];
        }
      case base__fetching__caching__block__elements__present<element__type>():
        {
          return block__elements__existing.value[block__offset];
        }
    }
  }

  @override
  value__asyn<void> dispose__asyn() async {
    return base__iterate__reverse__basic__asyn(
      blocks__raw.elements__count,
      (final i) async {
        final block = blocks__raw[i];

        if (block == null) {
          return;
        }

        await block.dispose__asyn();
      },
    );
  }
}

class base__fetching__caching__block //
    <element__type extends base__dispose__asyn__basic___protocol> //
    implements
        base__dispose__asyn__basic___protocol {
  const base__fetching__caching__block({
    required this.id,
    required this.elements,
  });

  final NIMR id;
  final base__fetching__caching__block__elements___union<element__type> elements;

  @override
  value__asyn<void> dispose__asyn() async {
    await elements.dispose__asyn();
  }
}

class base__fetching__caching__block__elements__waiting //
    <element__type extends base__dispose__asyn__basic___protocol> //
    implements
        base__fetching__caching__block__elements___union<element__type> {
  const base__fetching__caching__block__elements__waiting(
    this.value__asyn_1,
  );

  final value__asyn<array<element__type>> value__asyn_1;

  @override
  value__asyn<void> dispose__asyn() async {
    final value = await value__asyn_1;

    await base__fetching__caching__block__elements___union.elements__dispose(
      value,
    );
  }
}

class base__fetching__caching__block__elements__present //
    <element__type extends base__dispose__asyn__basic___protocol> //
    implements
        base__fetching__caching__block__elements___union<element__type> {
  const base__fetching__caching__block__elements__present(
    this.value,
  );

  final array<element__type> value;

  @override
  value__asyn<void> dispose__asyn() async {
    await base__fetching__caching__block__elements___union.elements__dispose(
      value,
    );
  }
}

sealed class base__fetching__caching__block__elements___union //
    <element__type extends base__dispose__asyn__basic___protocol> //
    implements
        base__dispose__asyn__basic___protocol {
  static value__asyn<void> elements__dispose<element__type extends base__dispose__asyn__basic___protocol>(
    final array<element__type> elements,
  ) async {
    await base__iterate__reverse__basic__asyn(
      elements.elements__count,
      (final i) async {
        await elements[i].dispose__asyn();
      },
    );
  }
}

class base__fetching__caching__testing__element //
    implements
        base__dispose__asyn__basic___protocol {
  const base__fetching__caching__testing__element(
    this.value,
  );

  final NIMR value;

  @override
  value__asyn<void> dispose__asyn() async {}
}

value__asyn<void> base__fetching__caching__test() async {
  const //
      blocks__count__width = 1,
      block__elements__count__width = (1 + blocks__count__width),
      elements__count = (3 + (3 * (1 << (block__elements__count__width + blocks__count__width))));

  elements__count //
      .text__representation()
      .print("elements__count");

  late final base__fetching__caching<base__fetching__caching__testing__element> fetching;

  fetching = base__fetching__caching(
    block__fetch__asyn: (final block__id) async {
      final elements__offset__count = fetching.elements__offset__count(
        block__id,
      );

      elements__offset__count //
          .text__representation()
          .print("elements__offset__count (block__id : $block__id)");

      final result = array__new__generated(
        elements__offset__count.block__elements__count,
        (final i) {
          return base__fetching__caching__testing__element(
            (i + elements__offset__count.elements__offset),
          );
        },
      );

      /*await value__asyn__basic<void>.delayed(
        Duration(
          seconds: 1,
        ),
      );*/

      return result;
    },
    elements__count: elements__count,
    block__elements__count__width: block__elements__count__width,
  );

  await base__iterate__basic__asyn(
    (1 + elements__count),
    (final element__id) async {
      final element = await fetching.element__asyn(
        element__id,
      );

      element.value //
          .text__representation()
          .print("element.value");

      if (element.value != element__id) {
        throw "`(element.value ~= element__id)`(${element.value} ~= $element__id)";
      }
    },
  );

  await fetching.dispose__asyn();
}
