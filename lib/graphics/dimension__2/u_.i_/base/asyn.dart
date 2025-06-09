part of "_.dart";

extension gui__base__value__asyn__definitive__handling__extension<value__type> //
    on base__value__asyn__definitive<value__type> {
  gui__base__widget handling__widget__build(
    final gui__base__widget__building__context context, {
    required final gui__base__value__asyn__handling__children___record<value__type> children,
  }) {
    return state__channel().handling__widget__build(
      context,
      children: gui__base__event__channel__handling__children___record(
        child__build: (final context) {
          final state_1 = state();

          return switch (state_1) {
            base__value__asyn__definitive__state__waiting() => //
            children.child__state__waiting__build(
              context,
            ),
            base__value__asyn__definitive__state__completion___union() => //
            switch (state_1) {
              base__value__asyn__definitive__state__completion__success<value__type>() => //
              children.child__state__completion__success__build(
                context,
                state_1.value,
              ),
              base__value__asyn__definitive__state__completion__failure<value__type>() => //
              children.child__state__completion__failure__build(
                context,
                state_1.error,
                state_1.trace,
              ),
            },
          };
        },
      ),
    );
  }
}

class gui__base__value__asyn__handling__children___record<value__type> {
  const gui__base__value__asyn__handling__children___record({
    required this.child__state__waiting__build,
    required this.child__state__completion__failure__build,
    required this.child__state__completion__success__build,
  });

  final gui__base__widget__build__function__format child__state__waiting__build;
  final gui__base__widget__state__failure__build__function__format child__state__completion__failure__build /*=gui__base__widget__error__default__build*/;
  final gui__base__widget__state__success__build__function__format<value__type> child__state__completion__success__build;
}

typedef gui__base__widget__state__success__build__function__format<value__type> //
=
    gui__base__widget Function(
      gui__base__widget__building__context context,
      value__type value,
    );

typedef gui__base__widget__state__failure__build__function__format //
=
    gui__base__widget Function(
      gui__base__widget__building__context context,
      Object error,
      StackTrace trace,
    );

gui__base__widget gui__base__widget__error__default__build(
  final gui__base__widget__building__context context,
  final Object error,
  final StackTrace trace,
) {
  return ErrorWidget(
    "${error.text__representation().value}\n\n\n${trace.text__representation().value}",
  );
}

gui__base__widget _value__asyn__handling__widget /*
compared to "FutureBuilder<T>"(of "flutter/widgets/async.dart")
  "value__type" can be nil-able
    unlike "FutureBuilder" which silently behaves in-correctly
      instead of supporting ,failing ,or error-ing out
        due to "snapshot.data" being internally nil-able
          despite its type-decl.ion being un-constrained
            breaking the promise of void-safety */ <value__type>({
  required final value__asyn<value__type> value,
  required final gui__base__widget__build__function__format child__state__waiting__build,
  required final gui__base__widget__state__success__build__function__format<value__type> child__state__completion__success__build,
  required final gui__base__widget__state__failure__build__function__format child__state__completion__failure__build,
}) {
  return FutureBuilder<value__type>(
    future: value,
    builder: (final context, final snap_shot) {
      switch (snap_shot.connectionState) {
        case ConnectionState.done:
          {
            if (snap_shot.hasError) {
              return child__state__completion__failure__build(
                context,
                snap_shot.error!,
                snap_shot.stackTrace!,
              );
            } /*
"snap_shot.hasData" cannot handle "value__type" being nil */

            return child__state__completion__success__build(
              context,
              (snap_shot.data as value__type) /*
"snap_shot.data!" is in-correct if "value__type" is nil */,
            );
          }
        case ConnectionState.waiting:
          {
            return child__state__waiting__build(
              context,
            );
          }

        default /*
should never happen
  because `future` param. is non-nil */ :
          throw "un-known connection-state";
      }
    },
  );
}
