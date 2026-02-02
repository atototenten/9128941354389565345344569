part of "_.dart";

class exclusion__mutual___compo //
    implements dispose___protocol {
  exclusion__mutual___compo({
    required this.locking__requests__count__limit,
  }) : _locked___ok = FALSE,
       _lock__requests = queue___compo(),
       _free___channel = event__channel__broadcast();

  final INT? locking__requests__count__limit;
  final queue___compo<value__single___procedure__format<exclusion__mutual__lock>> _lock__requests;
  final event__channel__broadcast _free___channel;

  BOOL _locked___ok;

  @override
  void dispose() {
    _free___channel.dispose();
    _lock__requests.dispose();
  }

  BOOL locked___ok() {
    return _locked___ok;
  }

  event__channel___protocol /*
user must not dispose */ //
  free__channel() {
    return _free___channel;
  }

  void _lock__free__handle() {
    if (_lock__requests.empty___ok()) {
      _locked___ok = FALSE;

      _free___channel.event__dispatch();
    } else {
      final request = _lock__requests.element()!;

      _lock__requests.remove();

      task__urgent__schedule(() {
        request.value(
          exclusion__mutual__lock(
            free__handle: _lock__free__handle,
          ),
        );
      });
    }
  }

  ASYN<exclusion__mutual__lock> //
  lock___async() {
    final meta = ASYN__PROMISE<exclusion__mutual__lock>();

    try {
      lock(meta.complete);
    } catch (e, t) {
      meta.completeError(e, t);
    }

    return meta.future;
  }

  void lock(final value__single___procedure__format<exclusion__mutual__lock> lock__handle) {
    if (_locked___ok) {
      final locking__requests__count__limit_1 = locking__requests__count__limit;
      if ((locking__requests__count__limit_1 != null) && //
          (_lock__requests.elements__count() >= locking__requests__count__limit_1)) {
        throw "count-limit for locking-requests has been exceeded";
      }

      _lock__requests.add(lock__handle);
    } else {
      if /*F*/ (_lock__requests.empty___ok().NOT) {
        throw "exception : \"(${_lock__requests.elements__count()}\\lock__requests__count\\ > 0)\"";
      }

      _locked___ok = TRUE;

      task__urgent__schedule(() {
        lock__handle(
          exclusion__mutual__lock(
            free__handle: _lock__free__handle,
          ),
        );
      });
    }
  }
}

class exclusion__mutual__lock {
  exclusion__mutual__lock({
    required final procedure__empty__format free__handle,
  }) : _value = procedure__empty__complicated__meta(
         free__handle,
       );

  final procedure__empty__complicated__meta _value;

  void free() {
    final invoked__ok_1 = _value.invoked___ok();

    if (invoked__ok_1) {
      throw "freed already";
    }

    _value.invoke();
  }
}

void exclusion__mutual__test() {
  const //
  locking__requests__count__limit = 2,
      iteration__count =
          (2 /*
an extra ,because the first lock ,is resolved directly ,and not added to the request-queue */ +
          locking__requests__count__limit),
      waiting__duration = 3;

  final exclusion__mutual = exclusion__mutual___compo(
    locking__requests__count__limit: locking__requests__count__limit,
  );

  void exclusion__mutual__print(
    final string title,
    final string? label,
  ) {
    title.print(label);
    "exclusion__mutual".print(label);

    printing__indent();

    exclusion__mutual
      .._lock__requests.elements__count().representation__text().print("..lock__requests__count", label)
      ..locked___ok().representation__text().print("..locked___ok", label);

    printing__indent__de();

    print__blank();
  }

  exclusion__mutual__print("begin", NIL);

  iterate(
    iteration__count,
    (final i) {
      final label = "iteration.$i";

      "locking".print(label);

      try {
        exclusion__mutual.lock(
          (final lock) {
            "handling lock".print(label);

            ASYN__BASIC.delayed(
              Duration(
                seconds: waiting__duration,
              ),
              () {
                "freeing lock".print(label);

                lock.free();
              },
            );
          },
        );
      } catch (e) {
        "\"(lock = NIL)\"(${e})".print(label);
      }

      exclusion__mutual__print("locked", label);

      return TRUE;
    },
  );

  ASYN__BASIC.delayed(
    Duration(
      seconds: ((iteration__count ~/ 2) * waiting__duration),
    ),
    () {
      exclusion__mutual__print("almost-middle", NIL);
    },
  );

  ASYN__BASIC.delayed(
    Duration(
      seconds: (iteration__count * waiting__duration),
    ),
    () {
      exclusion__mutual__print("end", NIL);
    },
  );
}
