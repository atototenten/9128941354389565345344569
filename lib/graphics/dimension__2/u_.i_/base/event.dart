part of "_.dart";

class gui__base__event__channel__handling__children___record {
  const gui__base__event__channel__handling__children___record({
    required this.child__build,
  });

  final gui__base__widget__build__function__format child__build;
}

extension gui__base__event__channel__broadcast__handling__extension //
    on base__event__channel__broadcast___protocol {
  gui__base__widget handling__widget__build /*
for multiple channels ,prefer `event__channels__broadcast`
like `ListenableBuilder`
a separate `base__value__mutation__event__channel__broadcast__dispose___protocol<value__type, gui__base__widget__building__context__definitive>` handling-widget (like `ValueListenableBuilder`)
  ,is un-necessary
    ,because it would simply be different in `.build` ,with an additional `channel.value()` param. ,which is already a method-call away
      ,and would introduce duplication ,and deviation ,in the a.p.i.
unicast-channels("base__event__channel__unicast___protocol") should be avoided
  due to the flutter's behavior of detaching the old widget
    after attaching the new widget
    and the general un-reliability of the invokation-sequence */ (
    final gui__base__widget__building__context context, {
    required final gui__base__event__channel__handling__children___record children,
    string__raw? label___debug,
  }) {
    label___debug ??= "event__handling__widget";

    "${label___debug}  ${hashCode}  Call".print__raw();

    return _event__channel__handling__widget__definitive(
      channel: this,
      build__handle: children.child__build,
      label___debug: label___debug,
    );

    gui__base__widget__building__context? context_1;

    void build__re() {
      "${label___debug}  ${hashCode}  Re-build ${context_1.hashCode}".print__raw();
      context_1?.re_build__raw();
    }

    return gui__base__widget__definitive__building(
      attach__handle: (final context) {
        "${label___debug}  ${hashCode}  Attach  ${context.hashCode}".print__raw();

        context_1 = context;

        descriptions__add(
          build__re,
        );
      },
      detach__handle: () {
        "${label___debug}  ${hashCode}  Detach  ${context_1.hashCode}".print__raw();

        context_1 = NIL;

        descriptions__remove(
          build__re,
        );
      },
      build__handle: (final context) {
        return children.child__build(
          context,
        );
      },
    );
  }
}

@immutable
class _event__channel__handling__widget__definitive /* FIX */ //
    extends StatefulWidget {
  const _event__channel__handling__widget__definitive({
    required this.channel,
    required this.build__handle,
    required this.label___debug,
  });

  final base__event__channel__broadcast___protocol channel;
  final gui__base__widget__build__function__format build__handle;
  final string__raw label___debug;

  @override
  _event__channel__handling__widget__definitive__state //
  createState() {
    return _event__channel__handling__widget__definitive__state();
  }
}

class _event__channel__handling__widget__definitive__state //
    extends State<_event__channel__handling__widget__definitive> {
  @override
  void initState() {
    super.initState();

    widget.channel.descriptions__add(
      build__re,
    );

    "${widget.label___debug}  ${hashCode}  Attach  ${context.hashCode}".print__raw();
  }

  @override
  void dispose() {
    "${widget.label___debug}  ${hashCode}  Detach  ${context.hashCode}".print__raw();

    widget.channel.descriptions__remove(
      build__re,
    );

    super.dispose();
  }

  void build__re() {
    "${widget.label___debug}  ${hashCode}  Re-build ${context.hashCode}".print__raw();
    context.re_build__raw();
  }

  @override
  gui__base__widget build(_) {
    return widget.build__handle(
      context,
    );
  }
}
