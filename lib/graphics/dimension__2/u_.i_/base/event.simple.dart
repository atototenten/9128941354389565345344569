import "package:flutter/widgets.dart";

extension event_handling_extension //
    on Listenable {
  Widget handling_widget_build(
    final BuildContext context, {
    required final Widget Function(BuildContext) child_build,
  }) {
    BuildContext? context_1;

    void re_build() {
      if (context_1 == null) {
        return;
      }

      if (!context_1!.mounted) {
        return;
      }

      (context_1 as Element).markNeedsBuild();
    }

    return widget_definitive_building(
      attach_handle: (final context) {
        context_1 = context;

        addListener(re_build);
      },
      detach_handle: () {
        context_1 = null;

        removeListener(re_build);
      },
      child_build: child_build,
    );
  }
}

@immutable
class widget_definitive_building //
    extends StatefulWidget {
  const widget_definitive_building({
    super.key,
    required this.attach_handle,
    required this.detach_handle,
    required this.child_build,
  });

  final void Function(BuildContext) attach_handle;
  final void Function() detach_handle;
  final Widget Function(BuildContext) child_build;

  @override
  widget_definitive_building__state //
  createState() {
    return widget_definitive_building__state();
  }
}

class widget_definitive_building__state //
    extends State<widget_definitive_building> {
  @override
  void initState() {
    super.initState();

    widget.attach_handle(context);
  }

  @override
  void dispose() {
    widget.detach_handle();

    super.dispose();
  }

  @override
  void didUpdateWidget(covariant final widget_definitive_building widget_old) {
    super.didUpdateWidget(widget_old);

    widget_old.detach_handle();
    widget.attach_handle(context);
  }

  @override
  Widget build(final BuildContext context) {
    return widget.child_build(context);
  }
}
