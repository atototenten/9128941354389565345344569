part of "_.dart";

abstract class service__authority__base {
  const service__authority__base();

  value__asyn<void> handle();
}

class service__authority //
    extends service__authority__base {
  const service__authority(
    this.sources,
    this.data__handle,
  );

  final ARRAY<service__authority__source> sources /*
resolving is
  ,from begin to end ,but stops if any source denies
    ,simply logical-OR towards denial */;
  final value__asyn<gui__base__widget?> Function(base__value__optional___union<java_script__type>) data__handle;

  @override
  value__asyn<void> handle() async {
    final requests = sources.convert((e) => e.resolve());

    for (final request in requests) {
      try {
        final widget = await data__handle(
          await request,
        );

        if (widget != null) {
          runApp(
            widget,
          );
        }

        break;
      } catch (_) {}
    }
  }
}

class service__authority__local //
    extends service__authority__base {
  const service__authority__local();

  @override
  value__asyn<void> handle() //
  => empty__value__asyn__void;
}
