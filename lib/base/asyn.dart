part of "_.dart";

/*
`value__asyn__hybrid<value__type>`/`UNION (value__asyn<value__type> ,value__type)`/`asyn.FutureOr<value__type>`
  is not supported ,because
    mixing asyn. and syn. ,naturally leads to asyn.
      just-like math.'s negative and positive signs (respectively) */

typedef value__asyn__basic<value__type> /*
inerrant (never fail(eval. into error)) */ //
= value__asyn<value__type>;

typedef value__asyn__meta<value__type> //
= async.Completer /* promise */ <value__type>;

typedef value__asyn /*
prefer creating as soon as possible, to reduce/shorten the resolving time */ <value__type> //
= async.Future<value__type>;

typedef delaying__asyn //
= async.Timer;

const //
base__delay__duration__none = Duration.zero,
    base__delay__duration__realistic = Duration(
      milliseconds: (1 ~/ 3),
    );

final empty__value__asyn__void = value__asyn<void>.value(
  NIL,
);

value__asyn__basic<void> base__delay({
  final Duration? duration,
}) {
  if (duration == Duration.zero) {
    return value__asyn__basic.value(NIL);
  }

  return value__asyn__basic<void>.delayed(
    (duration ?? base__delay__duration__realistic),
  );
}

void task__schedule(
  final procedure__empty__format proc_,
) {
  async.scheduleMicrotask(
    proc_,
  );
}

extension value__asyn__basic__extension //
<value__type> //
    on value__asyn__basic<value__type> {
  void basic__handle(
    final base__value__single__procedure__format<value__type> value__handle,
  ) {
    then<void>(
      value__handle,
      onError: NIL,
    );
  }
}

extension value__asyn__extension //
<value__type> //
    on value__asyn<value__type> {
  void handle(
    final base__value__single__procedure__format<value__type> value__handle,
    final base__error__handle__proc_? error__handle,
  ) {
    then<void>(
      value__handle,
      onError: error__handle,
    );
  }
}

value__asyn<void> base__delaying__asyn([
  final Duration? duration,
]) {
  return value__asyn<void>.delayed(
    (duration ?? base__delay__duration__realistic),
  );
}

extension base__value__asyn__definitive__dispose___extension //
<value__type extends base__dispose___protocol> //
    on base__value__asyn__definitive<value__type> {
  void value__dispose() {
    handle___raw(
      (final v) {
        v.dispose();
      },
      NIL,
    );
  }
}

class base__value__asyn__definitive /*
"base__value__asyn__definitive<value___type?>.completion__success" is same as "base__value__asyn__definitive.blank"(un-init.ized state) */ <value__type> //
    implements base__dispose___protocol {
  factory base__value__asyn__definitive(
    final value__asyn<value__type> value,
  ) = base__value__asyn__definitive.waiting;

  base__value__asyn__definitive.waiting(
    final value__asyn<value__type> value,
  ) : state__channel___raw = base__value__mutation__event__channel__broadcast(
        base__value__asyn__definitive__state__waiting<value__type>(
          value,
        ),
      ) {
    state__waiting__handle___raw(value);
  }

  base__value__asyn__definitive.completion__success(
    final value__type value,
  ) : state__channel___raw = base__value__mutation__event__channel__broadcast(
        base__value__asyn__definitive__state__completion__success<value__type>(
          value,
        ),
      );

  base__value__asyn__definitive.completion__failure(
    final Object error,
    final StackTrace trace,
  ) : state__channel___raw = base__value__mutation__event__channel__broadcast(
        base__value__asyn__definitive__state__completion__failure<value__type>(
          error,
          trace,
        ),
      );

  final base__value__mutation__event__channel__broadcast<base__value__asyn__definitive__state___union<value__type>> state__channel___raw;

  @override
  void dispose() {
    state__channel___raw.dispose();
  }

  base__event__channel__broadcast___protocol state__channel() {
    return state__channel___raw;
  }

  base__value__asyn__definitive__state___union<value__type> state() {
    return state__channel___raw.value();
  }

  void state__assign__waiting(
    final value__asyn<value__type> value,
  ) {
    state__channel___raw.value__mutation__dispatch(
      base__value__asyn__definitive__state__waiting<value__type>(
        value,
      ),
    );

    state__waiting__handle___raw(value);
  }

  void state__assign__completion__success(
    final value__type value,
  ) {
    state__channel___raw.value__mutation__dispatch(
      base__value__asyn__definitive__state__completion__success<value__type>(
        value,
      ),
    );
  }

  void state__waiting__handle___raw(final value__asyn<value__type> value) {
    final state = state__channel___raw.value();

    BOOL valid___ok /*
ensures that the syn.ny has not replaced the state with another
  during the asyn.-gap
  through ".state__assign__waiting" or otherwise
  hence the currently-resolved value is out-dated */ () {
      return identical(state, state__channel___raw.value());
    }

    value.handle(
      (final value) {
        if (valid___ok().not) {
          return;
        }

        state__channel___raw.value__mutation__dispatch(
          base__value__asyn__definitive__state__completion__success<value__type>(
            value,
          ),
        );
      },
      (final error, final trace) {
        if (valid___ok().not) {
          return;
        }

        state__channel___raw.value__mutation__dispatch(
          base__value__asyn__definitive__state__completion__failure<value__type>(
            error,
            trace,
          ),
        );
      },
    );
  }

  void handle___raw /*
ignores the future state-channel events */ (
    final base__value__single__procedure__format<value__type> value__handle,
    final base__error__handle__proc_? error__handle,
  ) {
    final state = state__channel___raw.value();

    switch (state) {
      case base__value__asyn__definitive__state__waiting<value__type>():
        state.value.handle(
          value__handle,
          error__handle,
        );
        break;

      case base__value__asyn__definitive__state__completion__failure<value__type>():
        error__handle?.call(
          state.error,
          state.trace,
        );
        break;

      case base__value__asyn__definitive__state__completion__success<value__type>():
        value__handle(
          state.value,
        );
        break;
    }
  }
}

class base__value__asyn__definitive__state__completion__failure<value__type> //
    implements base__value__asyn__definitive__state__completion___union<value__type> {
  const base__value__asyn__definitive__state__completion__failure(
    this.error,
    this.trace,
  );

  final Object error;
  final StackTrace trace;
}

class base__value__asyn__definitive__state__completion__success<value__type> //
    implements base__value__asyn__definitive__state__completion___union<value__type> {
  const base__value__asyn__definitive__state__completion__success(
    this.value,
  );

  final value__type value;
}

sealed class base__value__asyn__definitive__state__completion___union<value__type> //
    implements base__value__asyn__definitive__state___union<value__type> {}

class base__value__asyn__definitive__state__waiting<value__type> //
    implements base__value__asyn__definitive__state___union<value__type> {
  base__value__asyn__definitive__state__waiting(
    this.value,
  );

  final value__asyn<value__type> value;
}

sealed class base__value__asyn__definitive__state___union<value__type> {}

void base__value__asyn__definitive__test() {
  final v = base__value__asyn__definitive(
    Future.delayed(
      Duration(seconds: 3),
      () {
        print("3 seconds");

        return 3;
      },
    ),
  );

  v.state__assign__waiting(
    Future.delayed(
      Duration(seconds: 1),
      () {
        print("1 second");

        return 1;
      },
    ),
  );

  Future.delayed(
    Duration(seconds: 5),
    () {
      print("5 seconds");

      final state = v.state();

      print(
        "AFTER : ${switch (state) {
          base__value__asyn__definitive__state__waiting<INT__NEG>() => "waiting ...",
          base__value__asyn__definitive__state__completion__failure<INT__NEG>() => "FAILURE",
          base__value__asyn__definitive__state__completion__success<INT__NEG>() => //
          ((state.value == 1) //
              ? "CORRECT" : "IN-CORRECT"),
        }}",
      );

      v.dispose();
    },
  );
}
