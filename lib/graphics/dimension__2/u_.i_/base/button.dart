part of "_.dart";

typedef gui__base__button__press__handle__function__format = //
procedure__empty__asyn__format /*
asyn. ,because
    tracking of completion is required
not `void`-type ,because
  `void`-type engulfs all the types ,including `value__asyn<type>` */;

class gui__base__button {
  gui__base__button({
    required this.press__handle,
  }) : pressed__ok___raw = NO;

  final gui__base__button__press__handle__function__format press__handle;

  BOOL pressed__ok___raw;

  BOOL //
  pressed___ok() {
    return pressed__ok___raw;
  }

  BOOL //
  waiting___ok() {
    return pressed__ok___raw;
  }

  gui__base__widget widget__build(
    final gui__base__widget__building__context context, {
    required final gui__base__widget__build__function__format child__build,
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
          child: child__build(
            context,
          ),
        );
      },
    );
  }
}

typedef gui__base__button__selectable__press__handle__function__format = //
    BOOL Function();

class gui__base__button__selectable {
  gui__base__button__selectable({
    required this.press__handle /*
should not invoke `.selection__switch` ,if the result is `OK`
  ,because otherwise `selection__switch` invoked ,implicitly ,after the press__handle's result
    ,would re-switch the selection */,
    this.selected__ok___raw = NO,
  });

  final gui__base__button__selectable__press__handle__function__format press__handle;

  BOOL selected__ok___raw;

  BOOL //
  selected___ok() {
    return selected__ok___raw;
  }

  gui__base__widget widget__build(
    final gui__base__widget__building__context context, {
    required final gui__base__widget__build__function__format child__build,
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
          child: child__build(
            context,
          ),
        );
      },
    );
  }
}
