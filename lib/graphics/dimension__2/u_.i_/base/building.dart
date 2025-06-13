part of "_.dart";

gui__base__widget gui__base__widget__definitive__build({
  required final gui__base__widget__attach__proc__format attach__handle,
  required final gui__base__widget__detach__proc__format detach__handle,
  required final gui__base__widget__build__function__format child__build,
}) {
  return _widget__definitive__building(
    attach__handle: attach__handle,
    detach__handle: detach__handle,
    child__build: child__build,
  );
}

@immutable
class _widget__definitive__building /*
prefer wrapping with `RepaintBoundary`
inspired by "StatefulBuilder" of "flutter/widgets/basic.dart" */ //
    extends StatefulWidget {
  const _widget__definitive__building({
    required this.attach__handle,
    required this.detach__handle,
    required this.child__build /*
refer to "_widget__building.child__build" */,
  });

  final gui__base__widget__attach__proc__format attach__handle;
  final gui__base__widget__detach__proc__format detach__handle;
  final gui__base__widget__build__function__format child__build;

  @override
  _widget__definitive__building__state //
  createState() {
    return _widget__definitive__building__state();
  }
}

class _widget__definitive__building__state //
    extends State<_widget__definitive__building> {
  @override
  void initState() {
    super.initState();

    widget.attach__handle(context);
  }

  @override
  void dispose() {
    widget.detach__handle();

    super.dispose();
  }

  @override
  void didUpdateWidget /*
useless ,for us(the base meta-framework)
  because widget has no relevant data-members
    and all the data is handled otherwise */ (/*covariant*/ final _widget__definitive__building widget__old) {
    super.didUpdateWidget(widget__old);

    widget__old.detach__handle();
    widget.attach__handle(context);
  }

  @override
  gui__base__widget build(final gui__base__widget__building__context context_1) {
    if (context_1 != context) {
      throw "exception : in-valid state (\"context ~= this.context\")";
    } /*
"context_1" guaranteed(by the framework) to be same ,as ".context" */

    return widget.child__build(context);
  }
}

gui__base__widget gui__base__widget__build({
  required final gui__base__widget__build__function__format child__build,
}) {
  return _widget__building(child__build);
}

@immutable
class _widget__building /*
inspired by "Builder" of "flutter/widgets/basic.dart" */ //
    extends StatelessWidget {
  const _widget__building(
    this.child__build /*
must be nullipotent(side-effect free)
  and should not contain any other code, than g.u.i. presentation
can be invoked anytime ,and any number of times
  and timing is un-deterministic */,
  );

  final gui__base__widget__build__function__format child__build;

  @override
  gui__base__widget build(final gui__base__widget__building__context context) {
    return child__build(context);
  }
}
