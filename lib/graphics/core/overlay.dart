part of "_.dart";

const //
overlay__width__multiple__default__phone = (3 * (1 / 4)),
    overlay__height__multiple__default__phone = (2 * (1 / 3)),
        //
        overlay__width__multiple__default__tablet =
        (1 / 3),
    overlay__height__multiple__default__tablet = (2 * overlay__width__multiple__default__tablet);

widget___protocol overlay__base(
  final widget__building__context___compo context, {
  final APPROX width__multiple = overlay__width__multiple__default__phone,
  final APPROX height__multiple = overlay__height__multiple__default__phone,
  required final widget__build__function__format child__build,
}) {
  final size__default = wall__size__default();

  return wall__base(
    context,
    size: Size(
      (width__multiple * size__default.width),
      (height__multiple * size__default.height),
    ),
    child__build: child__build,
  );
}

entity__overlay___compo overlay__notice({
  final Alignment notice__position = Alignment.center,
  final Duration? notice__duration /*
auto.-dismiss duration
values :
  NIL :permanent
  other :temporary */ = const Duration(
    seconds: 3,
  ),
  required final widget__build__function__format notice__build,
}) {
  widget___protocol child__build(final widget__building__context___compo context) {
    return Align(
      alignment: notice__position,
      child: notice__build(context),
    );
  }

  return entity__overlay___compo(
    dispose__handle: NIL,
    widget__build: (final context) {
      if (notice__duration == null) {
        return child__build(context);
      }

      return widget__definitive__build(
        context,
        attach__handle: (final context) {
          return DELAYING(
            notice__duration,
            () {
              if (context.valid___ok().NOT) {
                return;
              }

              context.navigation().backward();
            },
          );
        },
        detach__handle: (final delaying) {
          if (delaying.isActive.NOT) {
            return;
          }

          delaying.cancel();
        },
        child__build: (final context, _) {
          return child__build(context);
        },
      );
    },
  );
}

({
  ASYN<value___type> value___asyn,
  entity__overlay___compo overlay,
}) //
overlay__waiting /*
- must be exclusive (one at a time)
- prefer disabling dismissal/back-navigation gestures
  like press ,and drag
- example[-usage] : "
final (result___asyn, overlay) = overlay__waiting(
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
  final widget__building__context___compo context,
  final ASYN<value___type> value___asyn /*
"ASYN.sync" can be used for sync. actions
handles {"ASYN.syncValue" ,and "ASYN.delayed"} too */, {
  required final widget__build__function__format waiting__build,
}) {
  final promise = ASYN__PROMISE<value___type>();

  final overlay = entity__overlay___compo(
    dispose__handle: NIL,
    widget__build: (final context) {
      return widget__definitive__build(
        context,
        attach__handle: (final context) {
          void backward() {
            if (context.valid___ok().NOT) {
              return;
            }

            context.navigation().backward();
          }

          value___asyn.handle(
            (final v) {
              backward();

              promise.complete(v);
            },
            (final e, final t) {
              backward();

              promise.completeError(e, t);
            },
          );
        },
        detach__handle: (_) {},
        child__build: (final context, _) {
          return PopScope(
            canPop: FALSE,
            child: waiting__build(context),
          );
        },
      );
    },
  );

  return (
    value___asyn: promise.future,
    overlay: overlay,
  );
}

class overlays__management //
<overlay___type extends entity__overlay___compo> //
    implements dispose___protocol {
  overlays__management() //
    : _overlays = accumulation__linear__basic___compo(),
      _channel = event__channel__broadcast();

  final accumulation__linear__basic___compo<overlay___type> _overlays;
  final event__channel__broadcast _channel;

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

    _overlays.iterate((_, final overlay) {
      overlay.dispose();

      return TRUE;
    });

    _overlays.dispose();
  }

  widget___protocol widget__build(
    final widget__building__context___compo context, {
    required final widget__build__function__format child__build,
  }) {
    return _channel.handling__widget__build(
      context,
      child__build: (final context) {
        return widget__stack___widget(
          context,
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
  final overlay< entity__type> overlay, {
  required final Duration dismiss__duration,
}) {
  add(
    overlay,
  );

  DELAYING(
    dismiss__duration,
    () {
      if (overlay.disabled___ok()) {
        return;
      }

      overlay.disable();
    },
  );
} */ /* TASK : add example */
