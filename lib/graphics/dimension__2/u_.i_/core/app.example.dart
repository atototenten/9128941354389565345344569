import "../../../../core/_.dart";

import "../flutter/_.dart";

import "_.dart";

void gui__base__app__example() {
  _app__example();
}

void _app__example() {
  base__app__run__simple(
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
          child: gui__base__box__expanded__widget(),
        ),
  );
}

class _app__example__entity //
    implements gui__base__entity__page___protocol {
  const _app__example__entity();

  @override
  gui__base__widget widget__build(final gui__base__widget__building__context context) {
    return ColoredBox(
      color: flutter__material__colors.green,
      child: gui__base__box__expanded__widget(),
    );
  }

  @override
  void dispose() {}
}
