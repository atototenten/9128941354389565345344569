part of "_.dart";

/*
`value__asyn__hybrid<value___type>`/`UNION (ASYN<value___type> ,value__type)`/`asyn.FutureOr<value___type>`
  is not supported ,because
    mixing asyn. and syn. ,naturally leads to asyn.
      just-like math.'s negative and positive signs (respectively) */

typedef ASYN__BASIC<value___type> /*
inerrant (never fail(eval. into error)) */ //
= ASYN<value___type>;

typedef ASYN__PROMISE<value___type> //
= dart__async.Completer /* promise */ <value___type>;

typedef ASYN /*
prefer creating as soon as possible, to reduce/shorten the resolving time */ <value___type> //
= dart__async.Future<value___type>;

typedef DELAYING //
= dart__async.Timer;

const //
delay__duration__none = Duration.zero,
    delay__duration__realistic = Duration(
      milliseconds: (1 ~/ 3),
    );

ASYN__BASIC<void> delay___asyn({
  final Duration? duration,
}) {
  if (duration == Duration.zero) {
    return ASYN__BASIC.syncValue(NIL);
  }

  return ASYN__BASIC.delayed(
    (duration ?? delay__duration__realistic),
  );
}

void task__priority__schedule /*
  use-cases
    - linearizing/preventing recursion
        using the event-loop */ (final void___procedure__format handle) {
  dart__async.scheduleMicrotask(handle);
}

extension ASYN__BASIC__extension //
<value___type> //
    on ASYN__BASIC<value___type> {
  void basic__handle(
    final value__single___procedure__format<value___type> value__handle,
  ) {
    then<void>(
      value__handle,
      onError: NIL,
    );
  }
}

extension value__asyn__extension //
<value___type> //
    on ASYN<value___type> {
  void handle(
    final value__single___procedure__format<value___type> value__handle,
    final error__handle__proc_? error__handle,
  ) {
    then<void>(
      value__handle,
      onError: error__handle,
    );
  }
}

extension asyn__advanced__dispose___extension //
<value___type extends dispose___protocol> //
    on ASYN__ADVANCED<value___type> {
  void value__dispose() {
    handle___raw(
      (final v) {
        v.dispose();
      },
      NIL,
    );
  }
}

extension asyn__advanced___extension<value___type> //
    on ASYN__ADVANCED<value___type> {
  void handle___raw /*
ignores the future state-channel events */ (
    final value__single___procedure__format<value___type> value__handle,
    final error__handle__proc_? error__handle,
  ) {
    final state = _state__channel.value();

    switch (state) {
      case asyn__advanced__state__waiting<value___type>():
        state.value.handle(
          value__handle,
          error__handle,
        );
        break;

      case asyn__advanced__state__completion__failure<value___type>():
        error__handle?.call(
          state.error,
          state.trace,
        );
        break;

      case asyn__advanced__state__completion__success<value___type>():
        value__handle(
          state.value,
        );
        break;
    }
  }
}

class ASYN__ADVANCED /*
"ASYN__DEFINITIVE<value___type?>.completion__success" is same as "ASYN__DEFINITIVE.blank"(un-init.ized state) */ <value___type> //
    implements dispose___protocol {
  factory ASYN__ADVANCED(
    final ASYN<value___type> value,
  ) = ASYN__ADVANCED.waiting;

  ASYN__ADVANCED.waiting(
    final ASYN<value___type> value,
  ) : _state__channel = value__mutation__event__channel__broadcast(
        asyn__advanced__state__waiting<value___type>(
          value,
        ),
      ) {
    state__waiting__handle___raw(value);
  }

  ASYN__ADVANCED.completion__success(
    final value___type value,
  ) : _state__channel = value__mutation__event__channel__broadcast(
        asyn__advanced__state__completion__success<value___type>(
          value,
        ),
      );

  ASYN__ADVANCED.completion__failure(
    final Object error,
    final StackTrace trace,
  ) : _state__channel = value__mutation__event__channel__broadcast(
        asyn__advanced__state__completion__failure<value___type>(
          error,
          trace,
        ),
      );

  final value__mutation__event__channel__broadcast<asyn__advanced__state___union<value___type>> _state__channel;

  @override
  void dispose() {
    _state__channel.dispose();
  }

  event__channel__broadcast___protocol state__channel() {
    return _state__channel;
  }

  asyn__advanced__state___union<value___type> state() {
    return _state__channel.value();
  }

  void state__assign__waiting(
    final ASYN<value___type> value,
  ) {
    _state__channel.value__mutation__dispatch(
      asyn__advanced__state__waiting<value___type>(
        value,
      ),
    );

    state__waiting__handle___raw(value);
  }

  void state__assign__completion__success(
    final value___type value,
  ) {
    _state__channel.value__mutation__dispatch(
      asyn__advanced__state__completion__success<value___type>(
        value,
      ),
    );
  }

  void state__waiting__handle___raw(final ASYN<value___type> value) {
    final state = _state__channel.value();

    BOOL valid___ok /*
ensures that the syn.ny has not replaced the state with another
  during the asyn.-gap
  through ".state__assign__waiting" or otherwise
  hence the currently-resolved value is out-dated */ () {
      return identical(state, _state__channel.value());
    }

    value.handle(
      (final value) {
        if (valid___ok().NOT) {
          return;
        }

        _state__channel.value__mutation__dispatch(
          asyn__advanced__state__completion__success<value___type>(
            value,
          ),
        );
      },
      (final error, final trace) {
        if (valid___ok().NOT) {
          return;
        }

        _state__channel.value__mutation__dispatch(
          asyn__advanced__state__completion__failure<value___type>(
            error,
            trace,
          ),
        );
      },
    );
  }
}

class asyn__advanced__state__completion__failure<value___type> //
    implements asyn__advanced__state__completion___union<value___type> {
  const asyn__advanced__state__completion__failure(
    this.error,
    this.trace,
  );

  final Object error;
  final StackTrace trace;
}

class asyn__advanced__state__completion__success<value___type> //
    implements asyn__advanced__state__completion___union<value___type> {
  const asyn__advanced__state__completion__success(
    this.value,
  );

  final value___type value;
}

sealed class asyn__advanced__state__completion___union<value___type> //
    implements asyn__advanced__state___union<value___type> {}

class asyn__advanced__state__waiting<value___type> //
    implements asyn__advanced__state___union<value___type> {
  asyn__advanced__state__waiting(
    this.value,
  );

  final ASYN<value___type> value;
}

sealed class asyn__advanced__state___union<value___type> {}

void asyn__advanced__test() {
  final v = ASYN__ADVANCED(
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
          asyn__advanced__state__waiting<INT__NEG>() => "waiting ...",
          asyn__advanced__state__completion__failure<INT__NEG>() => "FAILURE",
          asyn__advanced__state__completion__success<INT__NEG>() => //
          ((state.value == 1) //
              ? "CORRECT" : "IN-CORRECT"),
        }}",
      );

      v.dispose();
    },
  );
}
