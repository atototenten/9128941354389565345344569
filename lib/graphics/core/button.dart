part of "_.dart";

typedef button__press__handle__function__format = //
procedure__empty__asyn__format /*
asyn. ,because
    tracking of completion is required
not `void`-type ,because
  `void`-type engulfs all the types ,including `ASYN<type>` */;

class button___compo {
  button___compo({
    required this.press__handle,
  }) : pressed__ok___raw = FALSE;

  final button__press__handle__function__format press__handle;

  BOOL pressed__ok___raw;

  BOOL //
  pressed___ok() {
    return pressed__ok___raw;
  }

  BOOL //
  waiting___ok() {
    return pressed__ok___raw;
  }

  widget___protocol widget__build(
    final widget__building__context___compo context, {
    required final widget__build__function__format child__build,
  }) {
    return _widget__build(
      child__build: (final context) {
        return gesture__detection__widget(
          press__down__handle: (_) {
            pressed__ok___raw = TRUE;
            context.build__re___raw();
          },
          press__cancel__handle: () {
            pressed__ok___raw = FALSE;
            context.build__re___raw();
          },
          press__handle: () {
            if (pressed__ok___raw) {
              return;
            }

            pressed__ok___raw = TRUE;
            context.build__re___raw();

            void revert() {
              pressed__ok___raw = FALSE;
              context.build__re();
            }

            press__handle() //
                .handle(
                  (_) => revert(),
                  (_, __) {
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

typedef button__selectable__press__handle__function__format = //
    BOOL Function();

class button__selectable {
  button__selectable({
    required this.press__handle /*
should not invoke `.selection__switch` ,if the result is `OK`
  ,because otherwise `selection__switch` invoked ,implicitly ,after the press__handle's result
    ,would re-switch the selection */,
    this.selected__ok___raw = FALSE,
  });

  final button__selectable__press__handle__function__format press__handle;

  BOOL selected__ok___raw;

  BOOL //
  selected___ok() {
    return selected__ok___raw;
  }

  widget___protocol widget__build(
    final widget__building__context___compo context, {
    required final widget__build__function__format child__build,
  }) {
    return _widget__build(
      child__build: (final context) {
        return gesture__detection__widget(
          press__handle: () {
            final switch___ok = press__handle();

            if (switch___ok.NOT) {
              return;
            }

            selected__ok___raw = selected__ok___raw.NOT;
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
