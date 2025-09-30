part of "_.dart";

extension gui__base__event__channel__broadcast__handling__extension //
    on base__event__channel__broadcast___protocol {
  gui__base__widget handling__widget__build /*
like `ListenableBuilder`
a separate `base__value__mutation__event__channel__broadcast__dispose___protocol<value__type, gui__base__widget__building__context__definitive>` handling-widget (like `ValueListenableBuilder`)
  ,is un-necessary
    ,because it would simply be different in `.build` ,with an additional `channel.value()` param. ,which is already a method-call away
      ,and would introduce duplication ,and deviation ,in the a.p.i.
unicast-channels("base__event__channel__unicast___protocol") should be avoided
  due to the flutter's behavior of detaching the old widget
    after attaching the new widget
    and the general un-reliability of the invocation-sequence */ (
    final gui__base__widget__building__context context, {
    required final gui__base__widget__build__function__format child__build,
  }) {
    return gui__base__widget__definitive__build(
      attach__handle: (final context) {
        void build__re() {
          context.build__re___raw();
        }

        descriptions__add(build__re);

        return (build__re: build__re);
      },
      detach__handle: (final storage) {
        descriptions__remove(storage.build__re);
      },
      child__build: (final context, _) {
        return child__build(context);
      },
    );
  }
}

/*@immutable
class gui__base__event__channel__handling__widget //
    extends StatefulWidget {
  const gui__base__event__channel__handling__widget({
    super.key,
    required this.channel,
    required this.children,
  });

  final base__event__channel__broadcast___protocol channel;
  final gui__base__event__channel__handling__children___record children;

  @override
  gui__base__event__channel__handling__widget__state //
  createState() {
    return gui__base__event__channel__handling__widget__state();
  }
}

class gui__base__event__channel__handling__widget__state //
    extends State<gui__base__event__channel__handling__widget> {
  @override
  void initState() {
    super.initState();

    widget.channel.descriptions__add(build__re);
  }

  @override
  void dispose() {
    widget.channel.descriptions__remove(build__re);

    super.dispose();
  }

  @override
  void didUpdateWidget(final gui__base__event__channel__handling__widget widget__old) {
    super.didUpdateWidget(widget__old);

    widget__old.channel.descriptions__remove(build__re);
    widget.channel.descriptions__add(build__re);
  }

  void build__re() {
    context.build__re___raw();
  }

  @override
  gui__base__widget build(final gui__base__widget__building__context context) {
    return widget.children.child__build(context);
  }
}*/
