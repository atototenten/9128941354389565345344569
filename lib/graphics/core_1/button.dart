import "../../core/_.dart";
import "../core/_.dart";
import "../flutter/_.dart";
import "_.dart";

typedef button__press__handle___procedure__format = //
ASYN<void> Function(widget__building__context___compo context) /*
asyn. ,because
    tracking of completion is required
not `void`-type ,because
  `void`-type engulfs all the types ,including `ASYN<type>` */;

class button___compo {
  button___compo({
    required this.press__handle,
  }) : _pressed___ok = FALSE;

  final button__press__handle___procedure__format press__handle;

  BOOL _pressed___ok;

  BOOL //
  pressed___ok() {
    return _pressed___ok;
  }

  BOOL //
  waiting___ok() {
    return _pressed___ok;
  }

  widget___protocol widget__build(
    final widget__building__context___compo context, {
    required final widget__build___procedure__format child__build,
  }) {
    return widget__basic__build(
      child__build: (final context) {
        return gesture__detection__widget(
          press__down__handle: (_) {
            _pressed___ok = TRUE;
            context.re_build___raw();
          },
          press__cancel__handle: () {
            _pressed___ok = FALSE;
            context.re_build___raw();
          },
          press__handle: () {
            if (_pressed___ok) {
              return;
            }

            _pressed___ok = TRUE;
            context.re_build___raw();

            WidgetsBinding.instance.task__rendering__frame__current__after__schedule(() {
              void revert() {
                _pressed___ok = FALSE;
                context.re_build();
              }

              press__handle(context).handle(
                (_) => revert(),
                (_, __) => revert(),
              );
            });
          },
          child: child__build(context),
        );
      },
    );
  }
}

typedef button__selectable__press__handle___procedure__format = //
    BOOL Function();

class button__selectable {
  button__selectable({
    required this.press__handle /*
should not invoke `.selection__switch` ,if the result is `OK`
  ,because otherwise `selection__switch` invoked ,implicitly ,after the press__handle's result
    ,would re-switch the selection */,
    final BOOL selected___ok = FALSE,
  }) : _selected___ok = selected___ok;

  final button__selectable__press__handle___procedure__format press__handle;

  BOOL _selected___ok;

  BOOL //
  selected___ok() {
    return _selected___ok;
  }

  widget___protocol widget__build(
    final widget__building__context___compo context, {
    required final widget__build___procedure__format child__build,
  }) {
    return widget__basic__build(
      child__build: (final context) {
        return gesture__detection__widget(
          press__handle: () {
            final switch___ok = press__handle();

            if (switch___ok.NOT) {
              return;
            }

            _selected___ok = _selected___ok.NOT;
            context.re_build___raw();
          },
          child: child__build(context),
        );
      },
    );
  }
}
