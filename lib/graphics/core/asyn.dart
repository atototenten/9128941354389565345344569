part of "_.dart";

extension asyn__definitive__handling___extension<value___type> //
    on ASYN__DEFINITIVE<value___type> {
  widget___protocol handling__widget__build /*
compared to `FutureBuilder<T>`(of `flutter/widgets/async.dart`)
  `value__type` can be nil-able
    unlike `FutureBuilder` which silently behaves in-correctly
      instead of supporting ,failing ,or error-ing out
        due to `snapshot.data` being internally nil-able
          despite its type being un-constrained
            which is implicitly `extends Object?` in dart-lang.
              breaking the promise of void-safety
  value is available in the very-first frame ,if completed already
    due to the value being accessible syn.ly ,from "ASYN__DEFINITIVE"
  child-build are separate ,for each state
    reducing duplication ,and maintaining separation-of-concern */ (
    final widget__building__context___compo context, {
    required final widget__build__function__format child__state__waiting__build,
    required final widget__state__failure__build__function__format child__state__completion__failure__build /*=widget__error__default__build*/,
    required final widget__state__success__build__function__format<value___type> child__state__completion__success__build,
  }) {
    return state__channel().handling__widget__build(
      context,
      child__build: (final context) {
        final state_1 = state();

        return switch (state_1) {
          asyn__definitive__state__waiting<value___type>() => //
          child__state__waiting__build(
            context,
          ),
          asyn__definitive__state__completion___union<value___type>() => //
          switch (state_1) {
            asyn__definitive__state__completion__success<value___type>() => //
            child__state__completion__success__build(
              context,
              state_1.value,
            ),
            asyn__definitive__state__completion__failure<value___type>() => //
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

typedef widget__state__success__build__function__format<value___type> = //
    widget___protocol Function(
      widget__building__context___compo context,
      value___type value,
    );

typedef widget__state__failure__build__function__format = //
    widget___protocol Function(
      widget__building__context___compo context,
      Object error,
      StackTrace trace,
    );

widget___protocol widget__error__default__build(
  final widget__building__context___compo context,
  final Object error,
  final StackTrace trace,
) {
  return ErrorWidget(
    "${error.representation__text().value}\n\n\n${trace.representation__text().value}",
  );
}

extension value__asyn__handling___extension<value___type> //
    on ASYN<value___type> {
  widget___protocol handling__widget__build /*
compared to "FutureBuilder<T>"(of "flutter/widgets/async.dart")
  "value__type" can be nil-able
    unlike "FutureBuilder" which silently behaves in-correctly
      instead of supporting ,failing ,or error-ing out
        due to "snapshot.data" being internally nil-able
          despite its type-decl.ion being un-constrained
            breaking the promise of void-safety */ (
    final widget__building__context___compo context, {
    required final widget__build__function__format child__state__waiting__build,
    required final widget__state__success__build__function__format<value___type> child__state__completion__success__build,
    required final widget__state__failure__build__function__format child__state__completion__failure__build,
  }) {
    return FutureBuilder<value___type>(
      future: this,
      builder: (final context, final snap_shot) {
        if (snap_shot.connectionState == ConnectionState.waiting) {
          return child__state__waiting__build(context);
        } else if (snap_shot.hasError) {
          return child__state__completion__failure__build(
            context,
            snap_shot.error!,
            snap_shot.stackTrace!,
          );
        } /*
"snap_shot.hasData" cannot handle "value__type" being nil */

        return child__state__completion__success__build(
          context,
          (snap_shot.data as value___type) /*
"snap_shot.data!" is in-correct if "value__type" is nil */,
        );
      },
    );
  }
}
