part of "_.dart";

gui__base__widget gui__base__widget__definitive__building({
  final gui__base__widget__attach__proc__format? attach__handle,
  final gui__base__widget__detach__proc__format? detach__handle,
  required final gui__base__widget__build__function__format build__handle,
}) {
  return _widget__definitive(
    attach__handle: attach__handle,
    detach__handle: detach__handle,
    build__handle: build__handle,
  );
}

@immutable
class _widget__definitive /*
prefer wrapping with `RepaintBoundary`
forked, from "StatefulBuilder":"flutter/lib/src/widgets/basic.dart" */ //
    extends StatefulWidget {
  const _widget__definitive({
    this.attach__handle,
    this.detach__handle,
    required this.build__handle /*
refer to "gui__base__widget__building.build__handle" */,
  });

  final gui__base__widget__attach__proc__format? attach__handle;
  final gui__base__widget__detach__proc__format? detach__handle;
  final gui__base__widget__build__function__format build__handle;

  @override
  _widget__definitive__state //
  createState() {
    return _widget__definitive__state();
  }
}

class _widget__definitive__state //
    extends State<_widget__definitive> {
  @override
  void initState() {
    super.initState();

    widget.attach__handle?.call(
      context,
    );
  }

  /*@override
  void didUpdateWidget /* called on parent re-build */ (
    covariant final _widget__build__definitive< entity__type> oldWidget,
  ) {
    super.didUpdateWidget(oldWidget);
    widget.update?.call(widget__new: widget, widget__old: oldWidget,);
  }*/ /*
quite useless ,for the meta-framework's architecture ,except the event-call
  ,because `oldWidget` has no relevant data-members */

  @override
  gui__base__widget build(
    _ /*
guaranteed(by the framework) to be same ,as ".context" */,
  ) {
    return widget.build__handle(
      context,
    );
  }

  @override
  void dispose() {
    widget.detach__handle?.call();

    super.dispose();
  }
}

gui__base__widget gui__base__widget__building({
  required final gui__base__widget__build__function__format build__handle,
}) {
  return _widget(
    build__handle,
  );
}

@immutable
class _widget /*
can not be re-built
  ,if needed ,prefer using `_widget__building`
forked, from "flutter/widgets/basic.dart:Builder" */ //
    extends StatelessWidget {
  const _widget(
    this.build_1 /*
- must be nullipotent(side-effect free)
  ,and should not contain any other code, than g.u.i. presentation
- can be invoked anytime ,and any number of times
  ,and timing is un-deterministic */,
  );

  final gui__base__widget__build__function__format build_1;

  @override
  gui__base__widget build(
    final gui__base__widget__building__context context,
  ) {
    return build_1(
      context,
    );
  }
}
