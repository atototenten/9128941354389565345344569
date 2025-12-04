part of "_.dart";

extension gui__base__value__asyn__definitive__handling___extension<value__type> //
    on base__value__asyn__definitive<value__type> {
  gui__base__widget handling__widget__build /*
compared to `FutureBuilder<T>`(of `flutter/widgets/async.dart`)
  `value__type` can be nil-able
    unlike `FutureBuilder` which silently behaves in-correctly
      instead of supporting ,failing ,or error-ing out
        due to `snapshot.data` being internally nil-able
          despite its type being un-constrained
            which is implicitly `extends Object?` in dart-lang.
              breaking the promise of void-safety
  value is available in the very-first frame ,if completed already
    due to the value being accessible syn.ly ,from "base__value__asyn__definitive"
  child-build are separate ,for each state
    reducing duplication ,and maintaining separation-of-concern */ (
    final gui__base__widget__building__context context, {
    required final gui__base__widget__build__function__format child__state__waiting__build,
    required final gui__base__widget__state__failure__build__function__format child__state__completion__failure__build /*=gui__base__widget__error__default__build*/,
    required final gui__base__widget__state__success__build__function__format<value__type> child__state__completion__success__build,
  }) {
    return state__channel().handling__widget__build(
      context,
      child__build: (final context) {
        final state_1 = state();

        return switch (state_1) {
          base__value__asyn__definitive__state__waiting<value__type>() => //
          child__state__waiting__build(
            context,
          ),
          base__value__asyn__definitive__state__completion___union<value__type>() => //
          switch (state_1) {
            base__value__asyn__definitive__state__completion__success<value__type>() => //
            child__state__completion__success__build(
              context,
              state_1.value,
            ),
            base__value__asyn__definitive__state__completion__failure<value__type>() => //
            child__state__completion__failure__build(
              context,
              state_1.error,
              state_1.trace,
            ),
          },
        };
      },
    );
  }
}

typedef gui__base__widget__state__success__build__function__format<value__type> = //
    gui__base__widget Function(
      gui__base__widget__building__context context,
      value__type value,
    );

typedef gui__base__widget__state__failure__build__function__format = //
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
    "${error.representation__text().value}\n\n\n${trace.representation__text().value}",
  );
}

extension value__asyn__handling___extension<value__type> //
    on value__asyn<value__type> {
  gui__base__widget handling__widget__build /*
compared to "FutureBuilder<T>"(of "flutter/widgets/async.dart")
  "value__type" can be nil-able
    unlike "FutureBuilder" which silently behaves in-correctly
      instead of supporting ,failing ,or error-ing out
        due to "snapshot.data" being internally nil-able
          despite its type-decl.ion being un-constrained
            breaking the promise of void-safety */ (
    final gui__base__widget__building__context context, {
    required final gui__base__widget__build__function__format child__state__waiting__build,
    required final gui__base__widget__state__success__build__function__format<value__type> child__state__completion__success__build,
    required final gui__base__widget__state__failure__build__function__format child__state__completion__failure__build,
  }) {
    return FutureBuilder<value__type>(
      future: this,
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
}
