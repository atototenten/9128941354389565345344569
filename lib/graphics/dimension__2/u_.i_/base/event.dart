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
    and the general un-reliability of the invocation-sequence */ (
    final gui__base__widget__building__context context, {
    required final gui__base__event__channel__handling__children___record children,
  }) {
    gui__base__widget__building__context? context_1;

    void build__re() {
      context_1?.build__re__raw();
    }

    return gui__base__widget__definitive__build(
      attach__handle: (final context) {
        context_1 = context;

        descriptions__add(build__re);
      },
      detach__handle: () {
        context_1 = NIL;

        descriptions__remove(build__re);
      },
      child__build: (final context) {
        return children.child__build(context);
      },
    );
  }
}
