part of "_.dart";

class base__exclusion__mutual___compo //
    implements base__dispose___protocol {
  static const //
  locking__requests__count__limit__default = 32;

  base__exclusion__mutual___compo({
    this.locking__requests__count__limit = locking__requests__count__limit__default,
  }) : _locked___ok = FALSE,
       _lock__requests = base__queue___compo(),
       _free___channel = base__event__channel__broadcast();

  final INT? locking__requests__count__limit;
  final base__queue___compo<base__value__single__procedure__format<base__exclusion__mutual__lock>> _lock__requests;
  final base__event__channel__broadcast _free___channel;

  BOOL _locked___ok;

  @override
  void dispose() {
    _free___channel.dispose();
    _lock__requests.dispose();
  }

  BOOL locked___ok() {
    return _locked___ok;
  }

  base__event__channel___protocol /*
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
          base__exclusion__mutual__lock(
            free__handle: _lock__free__handle,
          ),
        );
      });
    }
  }

  value__asyn<base__exclusion__mutual__lock> //
  lock___async() {
    final meta = value__asyn__meta<base__exclusion__mutual__lock>();

    try {
      lock(meta.complete);
    } catch (e, t) {
      meta.completeError(e, t);
    }

    return meta.future;
  }

  void lock(final base__value__single__procedure__format<base__exclusion__mutual__lock> lock__handle) {
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
          base__exclusion__mutual__lock(
            free__handle: _lock__free__handle,
          ),
        );
      });
    }
  }
}

class base__exclusion__mutual__lock {
  base__exclusion__mutual__lock({
    required final procedure__empty__format free__handle,
  }) : _value = base__procedure__empty__complicated__meta(
         free__handle,
       );

  final base__procedure__empty__complicated__meta _value;

  void free() {
    final invoked__ok_1 = _value.invoked___ok();

    if (invoked__ok_1) {
      throw "freed already";
    }

    _value.invoke();
  }
}

void base__exclusion__mutual__test() {
  const //
  locking__requests__count__limit = 2,
      iteration__count =
          (2 /*
an extra ,because the first lock ,is resolved directly ,and not added to the request-queue */ +
          locking__requests__count__limit),
      waiting__duration = 3;

  final exclusion__mutual = base__exclusion__mutual___compo(
    locking__requests__count__limit: locking__requests__count__limit,
  );

  void exclusion__mutual__print(
    final string title,
    final string? label,
  ) {
    title.print(label);
    "exclusion__mutual".print(label);

    base__printing__indent();

    exclusion__mutual
      .._lock__requests.elements__count().representation__text().print("..lock__requests__count", label)
      ..locked___ok().representation__text().print("..locked___ok", label);

    base__printing__indent__de();

    base__print__blank();
  }

  exclusion__mutual__print("begin", NIL);

  base__iterate__basic(
    iteration__count,
    (final i) {
      final label = "iteration.$i";

      "locking".print(label);

      try {
        exclusion__mutual.lock(
          (final lock) {
            "handling lock".print(label);

            value__asyn__basic.delayed(
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
    },
  );

  value__asyn__basic.delayed(
    Duration(
      seconds: ((iteration__count ~/ 2) * waiting__duration),
    ),
    () {
      exclusion__mutual__print("almost-middle", NIL);
    },
  );

  value__asyn__basic.delayed(
    Duration(
      seconds: (iteration__count * waiting__duration),
    ),
    () {
      exclusion__mutual__print("end", NIL);
    },
  );
}
