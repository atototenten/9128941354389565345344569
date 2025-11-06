part of "_.dart";

class base__exclusion__mutual //
    implements
        base__dispose___protocol {
  static const //
      lock__requests__count__limit__default = 32;

  base__exclusion__mutual({
    this.lock__requests__count__limit = lock__requests__count__limit__default,
  })  : locked__ok___raw = FALSE,
        lock__requests___raw = base__queue(),
        free__channel___raw = base__event__channel__broadcast();

  final INT lock__requests__count__limit;
  final base__queue<base__value__single__procedure__format<base__exclusion__mutual__lock>> lock__requests___raw;
  final base__event__channel__broadcast free__channel___raw;

  BOOL locked__ok___raw;

  BOOL locked___ok() {
    return locked__ok___raw;
  }

  base__event__channel__broadcast /*
user must not dispose */ //
      free__channel() {
    return free__channel___raw;
  }

  void lock__free__handle___raw() {
    if (lock__requests___raw.empty___ok()) {
      locked__ok___raw = FALSE;

      free__channel___raw.event__dispatch();
    } else {
      final request = lock__requests___raw.element()!;

      lock__requests___raw.remove();

      request.value(
        base__exclusion__mutual__lock(
          free__handle___raw: lock__free__handle___raw,
        ),
      );
    }
  }

  BOOL lock(
    final base__value__single__procedure__format<base__exclusion__mutual__lock> lock__handle,
  ) {
    if (locked__ok___raw) {
      if (lock__requests___raw.elements__count() >= lock__requests__count__limit) {
        return FALSE;
      }

      lock__requests___raw.add(
        lock__handle,
      );
    } else {
      if /*F*/ (lock__requests___raw.empty__not()) {
        throw "exception : `(${lock__requests___raw.elements__count()}\\lock__requests__count\\ > 0)`";
      }

      locked__ok___raw = TRUE;

      lock__handle(
        base__exclusion__mutual__lock(
          free__handle___raw: lock__free__handle___raw,
        ),
      );
    }

    return TRUE;
  }

  @override
  void dispose() {
    free__channel___raw.dispose();
    lock__requests___raw.dispose();
  }
}

class base__exclusion__mutual__lock {
  base__exclusion__mutual__lock({
    required final procedure__empty__format free__handle___raw,
  }) : value___raw = base__procedure__empty__complicated__meta(
          free__handle___raw,
        );

  final base__procedure__empty__complicated__meta value___raw;

  void free() {
    final invoked__ok_1 = value___raw.invoked___ok();

    if (invoked__ok_1) {
      throw "freed already";
    }

    value___raw.invoke();
  }
}

void base__exclusion__mutual__test() {
  const //
      lock__requests__count__limit = 2,
      iteration__count = (2 /*
an extra ,because the first lock ,is resolved directly ,and not added to the request-queue */
          +
          lock__requests__count__limit),
      waiting__duration = 3;

  final exclusion__mutual = base__exclusion__mutual(
    lock__requests__count__limit: lock__requests__count__limit,
  );

  void exclusion__mutual__print(
    final string title,
    final string? label,
  ) {
    title.print(label);
    "exclusion__mutual".print(label);

    base__printing__indent();

    exclusion__mutual
      ..lock__requests___raw.elements__count().representation__text().print("..lock__requests__count", label)
      ..locked__ok___raw.representation__text().print("..locked__ok", label);

    base__printing__indent__de();

    base__print__blank();
  }

  exclusion__mutual__print("begin", NIL);

  base__iterate__basic(
    iteration__count,
    (final i) {
      final label = "iteration.$i";

      "locking".print(label);

      final ok = exclusion__mutual.lock(
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

      if (ok.not) {
        "`(lock = NIL)`".print(label);
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
