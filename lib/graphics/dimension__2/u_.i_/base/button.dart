part of "_.dart";

class gui__base__button__children___record {
  const gui__base__button__children___record({
    required this.child__build,
  });

  final gui__base__widget__build__function__format child__build;
}

typedef gui__base__button__press__handle__function__format = //
    procedure__empty__asyn__format /*
asyn. ,because
    tracking of completion is required
not `void`-type ,because
  `void`-type engulfs all the types ,including `value__asyn<type>` */
       ;

class gui__base__button //
    implements gui__base__entity__component___protocol<gui__base__button__children___record> {
  gui__base__button({
    required this.press__handle,
  }) : pressed__ok___raw = NO;

  final gui__base__button__press__handle__function__format press__handle;

  BOOL pressed__ok___raw;

  @override
  void dispose() {}

  BOOL //
      pressed___ok() {
    return pressed__ok___raw;
  }

  BOOL //
      waiting___ok() {
    return pressed__ok___raw;
  }

  @override
  gui__base__widget widget__build(
    final gui__base__widget__building__context context, {
    required final gui__base__button__children___record children,
  }) {
    return gui__base__widget__build(
      child__build: (final context) {
        return gui__base__gesture__press__handling__widget(
          press__down__handle: (_) {
            pressed__ok___raw = OK;
            context.build__re___raw();
          },
          press__cancel__handle: () {
            pressed__ok___raw = NO;
            context.build__re___raw();
          },
          press__handle: () {
            if (pressed__ok___raw) {
              return;
            }

            pressed__ok___raw = OK;
            context.build__re___raw();

            void revert() {
              pressed__ok___raw = NO;
              context.build__re();
            }

            press__handle() //
                .handle(
              (final _) => revert(),
              (final _, final __) {
                /*
should not happen ,because the user should handle the errors ,but anyways */
                revert();
              },
            );
          },
          child: children.child__build(
            context,
          ),
        );
      },
    );
  }
}

class gui__base__button__selectable__children___record //
    extends gui__base__button__children___record {
  const gui__base__button__selectable__children___record({
    required super.child__build,
  });
}

typedef gui__base__button__selectable__press__handle__function__format = //
    BOOL Function();

class gui__base__button__selectable //
    implements gui__base__entity__component___protocol<gui__base__button__selectable__children___record> {
  gui__base__button__selectable({
    required this.press__handle /*
should not invoke `.selection__switch` ,if the result is `OK`
  ,because otherwise `selection__switch` invoked ,implicitly ,after the press__handle's result
    ,would re-switch the selection */
    ,
    this.selected__ok___raw = NO,
  });

  final gui__base__button__selectable__press__handle__function__format press__handle;

  BOOL selected__ok___raw;

  BOOL //
      selected___ok() {
    return selected__ok___raw;
  }

  @override
  gui__base__widget widget__build(
    final gui__base__widget__building__context context, {
    required final gui__base__button__children___record children,
  }) {
    return gui__base__widget__build(
      child__build: (final context) {
        return gui__base__gesture__press__handling__widget(
          press__handle: () {
            final switch___ok = press__handle();

            if (switch___ok.not) {
              return;
            }

            selected__ok___raw = selected__ok___raw.not;
            context.build__re___raw();
          },
          child: children.child__build(
            context,
          ),
        );
      },
    );
  }

  @override
  void dispose() {}
}
