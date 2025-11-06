part of "_.dart";

const //
base__overlay__width__multiple__default__phone = (3 * (1 / 4)),
    base__overlay__height__multiple__default__phone = (2 * (1 / 3)),
        //
        base__overlay__width__multiple__default__tablet =
        (1 / 3),
    base__overlay__height__multiple__default__tablet = (2 * base__overlay__width__multiple__default__tablet);

gui__base__widget base__overlay__base(
  final gui__base__widget__building__context context, {
  final APPROX width__multiple = base__overlay__width__multiple__default__phone,
  final APPROX height__multiple = base__overlay__height__multiple__default__phone,
  required final gui__base__widget__build__function__format child__build,
}) {
  final size__default = base__wall__size__default();

  return base__wall__base(
    context,
    size: Size(
      (width__multiple * size__default.width),
      (height__multiple * size__default.height),
    ),
    child__build: child__build,
  );
}

gui__base__entity__overlay___compo gui__base__overlay__notice({
  final Alignment notice__position = Alignment.center,
  final Duration? notice__duration /*
auto.-dismiss duration
values :
  NIL :permanent
  other :temporary */ = const Duration(
    seconds: 3,
  ),
  required final gui__base__widget__build__function__format notice__build,
}) {
  return gui__base__entity__overlay___compo(
    dispose__handle: NIL,
    widget__build: (final context) {
      if (notice__duration != null) {
        delaying__asyn(
          notice__duration,
          () {
            if (context.valid___ok().not) {
              return;
            }

            context.navigation().backward();
          },
        );
      }

      return Align(
        alignment: notice__position,
        child: notice__build(context),
      );
    },
  );
}

({
  value__asyn<value___type> value___asyn,
  gui__base__entity__overlay___compo overlay,
}) //
gui__base__overlay__waiting /*
- must be exclusive (one at a time)
- prefer disabling dismissal/back-navigation gestures
  like press ,and drag
- example[-usage] : "
final (result___asyn, overlay) = gui__base__overlay__waiting(
  context,
  result__fetch___asyn(),
  waiting__build: waiting__build,
);

/*await*/ context
  .navigation()
    .forward__overlay__bottom(
      gesture__press__background__dismiss___ok: FALSE,
      gesture__drag__bottom__dismiss___ok: FALSE,
      entity: overlay,
    );

final result = await result___asyn;
" */ //
<value___type>(
  final gui__base__widget__building__context context,
  final value__asyn<value___type> value /*
"value__asyn.sync" can be used for sync. actions
handles {"value__asyn.value" ,and "value__asyn.delayed"} too */, {
  required final gui__base__widget__build__function__format waiting__build,
}) {
  final promise = value__asyn__meta<value___type>();

  var context__latest = context;

  void backward() {
    if (context__latest.valid___ok().not) {
      return;
    }

    context__latest.navigation().backward();
  }

  var resolved___ok /*
needed to handle already-resolved asyn.-values */ =
      FALSE;

  value.handle(
    (final value) {
      resolved___ok = TRUE;

      backward();

      promise.complete(value);
    },
    (final e, final t) {
      resolved___ok = TRUE;

      backward();

      promise.completeError(e, t);
    },
  );

  var navigation__back__scheduled___ok = FALSE;

  final overlay = gui__base__entity__overlay___compo(
    dispose__handle: NIL,
    widget__build: (final context_1) {
      if (navigation__back__scheduled___ok) {
        return gui__base__empty__widget;
      }

      if (resolved___ok) {
        navigation__back__scheduled___ok = TRUE;

        task__schedule(() {
          context_1.navigation().backward();
        });

        return gui__base__empty__widget;
      }

      context__latest = context_1;

      return PopScope(
        canPop: FALSE,
        child: waiting__build(context_1),
      );
    },
  );

  return (
    value___asyn: promise.future,
    overlay: overlay,
  );
}

class gui__base__overlays__management //
<overlay___type extends gui__base__entity__overlay___compo> //
    implements base__dispose___protocol {
  gui__base__overlays__management() //
    : _overlays = base__accumulation__linear__basic(),
      _channel = base__event__channel__broadcast();

  final base__accumulation__linear__basic<overlay___type> _overlays;
  final base__event__channel__broadcast _channel;

  void add(
    final overlay___type overlay /*
widget suggestions
  - prefer `Align`-widget
    ,for non-center pos.
  - prefer `TapRegion`-widget
    ,to support touch-based dismiss behavior */,
  ) {
    _overlays.add__ending(overlay);

    _channel.event__dispatch();
  }

  @override
  void dispose() {
    _channel.dispose();

    _overlays.iterate((final _, final overlay) {
      overlay.dispose();

      return TRUE;
    });

    _overlays.dispose();
  }

  gui__base__widget widget__build(
    final gui__base__widget__building__context context, {
    required final gui__base__widget__build__function__format child__build,
  }) {
    return _channel.handling__widget__build(
      context,
      child__build: (final context) {
        return gui__base__stack___widget(
          alignment: Alignment.center,
          children: [
            child__build(context),
            ..._overlays //
                .convert__array()
                .convert(
                  (overlay) => //
                      overlay.widget__build(context),
                ),
          ],
        );
      },
    );
  }
}

/* void add__temporary(
  final base__overlay< entity__type> overlay, {
  required final Duration dismiss__duration,
}) {
  add(
    overlay,
  );

  delaying__asyn(
    dismiss__duration,
    () {
      if (overlay.disabled___ok()) {
        return;
      }

      overlay.disable();
    },
  );
} */ /* TASK : add example */
