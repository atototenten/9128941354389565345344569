part of "_.dart";

const //
    base__overlay__width__multiple__default__phone = (3 * (1 / 4)),
    base__overlay__height__multiple__default__phone = (2 * (1 / 3)),
//
    base__overlay__width__multiple__default__tablet = (1 / 3),
    base__overlay__height__multiple__default__tablet = (2 * base__overlay__width__multiple__default__tablet);

gui__base__widget base__overlay__base(
  final gui__base__widget__building__context context, {
  final NEMR width__multiple = base__overlay__width__multiple__default__phone,
  final NEMR height__multiple = base__overlay__height__multiple__default__phone,
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

class gui__base__overlays__management__children___record {
  const gui__base__overlays__management__children___record({
    required this.child__build,
  });

  final gui__base__widget__build__function__format child__build;
}

class gui__base__overlays__management //
    <entity__type extends gui__base__entity__overlay___compo> //
    implements gui__base__entity__component___protocol<gui__base__overlays__management__children___record> {
  gui__base__overlays__management() //
      : overlays__raw = base__accumulation__linear__basic(),
        channel__raw = base__event__channel__broadcast();

  final base__accumulation__linear__basic<base__overlay<entity__type>> overlays__raw;
  final base__event__channel__broadcast channel__raw;

  void add(
    final base__overlay<entity__type> overlay,
  ) {
    overlays__raw.add__ending(
      overlay,
    );

    channel__raw.event__dispatch();
  }

  @override
  void dispose() {
    channel__raw.dispose();

    overlays__raw.iterate(
      (final _, final overlay) {
        overlay.dispose();

        return OK;
      },
    );

    overlays__raw.dispose();
  }

  @override
  gui__base__widget widget__build(
    final gui__base__widget__building__context context, {
    required final gui__base__overlays__management__children___record children,
  }) {
    return channel__raw.handling__widget__build(
      context,
      children: gui__base__event__channel__handling__children___record(
        child__build: (final context) {
          final array<gui__base__widget> stack__children;
          {
            final stack__children__accumulation = base__accumulation__linear__basic<gui__base__widget>();

            stack__children__accumulation.add__ending(
              children.child__build(
                context,
              ),
            );

            overlays__raw.iterate(
              (final _, final overlay) {
                stack__children__accumulation.add__ending(
                  overlay.entity.widget__build(
                    context,
                  ),
                );

                return OK;
              },
            );

            stack__children = stack__children__accumulation.convert__array();

            stack__children__accumulation.dispose();
          }

          return gui__base__stack__widget(
            alignment: Alignment.center,
            clipping: Clip.none,
            children: stack__children,
          );
        },
      ),
    );
  }
}

class base__overlay //
    <entity__type extends gui__base__entity__overlay___compo> //
    implements
        base__dispose___protocol {
  const base__overlay({
    required this.entity /*
widget suggestions
  - prefer `Align`-widget
    ,for non-center pos.
  - prefer `TapRegion`-widget
    ,to support touch-based dismiss behavior */
    ,
  });

  final entity__type entity;

  @override
  void dispose() {
    entity.dispose();
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
      if (overlay.disabled__ok()) {
        return;
      }

      overlay.disable();
    },
  );
} */ /* TASK : add example */
