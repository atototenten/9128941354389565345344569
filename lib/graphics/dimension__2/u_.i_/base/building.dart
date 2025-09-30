part of "_.dart";

gui__base__widget gui__base__widget__definitive__build<storage___type>({
  required final gui__base__widget__attach__procedure__format<storage___type> attach__handle,
  required final gui__base__widget__detach__procedure__format<storage___type> detach__handle,
  required final gui__base__widget__definitive__build__procedure__format<storage___type> child__build,
}) {
  return _widget__definitive__building(
    attach__handle: attach__handle,
    detach__handle: detach__handle,
    child__build: child__build,
  );
}

@immutable
class _widget__definitive__building<storage___type> /*
- prefer wrapping with `RepaintBoundary`
- def.ing the storage as a member of {widget returning closure}'s env. ,is in-correct approach
  because instantiation will happen at every call of closure
    while widget's attaching/detaching happens just once ,when the widget's element is {added to}/{removed from} the element-tree
- inspired by "StatefulBuilder" of "flutter/widgets/basic.dart" */ //
    extends StatefulWidget {
  const _widget__definitive__building({
    required this.attach__handle,
    required this.detach__handle,
    required this.child__build /*
refer to "_widget__building.child__build" */,
  });

  final gui__base__widget__attach__procedure__format<storage___type> attach__handle;
  final gui__base__widget__detach__procedure__format<storage___type> detach__handle;
  final gui__base__widget__definitive__build__procedure__format<storage___type> child__build;

  @override
  _widget__definitive__building__state<storage___type> //
  createState() {
    return _widget__definitive__building__state<storage___type>();
  }
}

class _widget__definitive__building__state<storage___type> //
    extends State<_widget__definitive__building<storage___type>> {
  late storage___type storage;

  @override
  void initState() {
    super.initState();

    storage = widget.attach__handle(context);
  }

  @override
  void dispose() {
    widget.detach__handle(storage);

    super.dispose();
  }

  @override
  void didUpdateWidget /*
useless ,for us(the base meta-framework)
  because widget has no relevant data-members
    and all the data is handled otherwise */ (/*covariant*/ final _widget__definitive__building<storage___type> widget__old) {
    super.didUpdateWidget(widget__old);

    widget__old.detach__handle(storage);
    storage = widget.attach__handle(context);
  }

  @override
  gui__base__widget build(final gui__base__widget__building__context context_1) {
    if (context_1 != context) {
      throw "exception : in-valid state (\"context ~= this.context\")";
    } /*
"context_1" guaranteed(by the framework) to be same ,as ".context" */

    return widget.child__build(context, storage);
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
