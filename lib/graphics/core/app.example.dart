import "../../../../core/_.dart";

import "../flutter/_.dart";

import "_.dart";

void app__example() {
  _app__example();
}

void _app__example() {
  app__run__simple(
    app__title: "example-app",
    service__authority: service__authority__local(),
    entity:
        () => //
        ASYN.delayed(
          Duration(
            seconds: 3,
          ),
          () => //
              _app__example__entity(),
        ),
    splash__build:
        (final context) => //
        ColoredBox(
          color: flutter__material__colors.blue,
          child: box__expanded__widget(),
        ),
  );
}

class _app__example__entity //
    implements entity__page___protocol {
  const _app__example__entity();

  @override
  widget___protocol widget__build(final widget__building__context___compo context) {
    return ColoredBox(
      color: flutter__material__colors.green,
      child: box__expanded__widget(),
    );
  }

  @override
  void dispose() {}
}
