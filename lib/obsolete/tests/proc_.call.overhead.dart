part of "../_.dart";

/*
result :
  run-time efficiency :
    - sync./`value` proc.s :~3 ticks
    - async./`ASYN<value>` proc.s :~30 ticks (sync. x10)
    - possibly-async./`FutureOr<value>` proc.s :~40 ticks (sync. x13)
  `FutureOr` is possibly conditional ,based on ,sync. vs. async. */
ASYN<void> _test__call__overhead() async {
  const count = (1 + 1000);

  final watch = Stopwatch();

  var total = 0;

  for (var i = 0; i < count; i += 1) {
    watch.start();

    final r = /*_syn_(i) await _asyn__or__syn_(i) await _asyn__or__asyn(i) await _asyn(i)*/;

    watch.stop();

    print("${(r?'T':'F')/* to prevent the compiler ,from optimizing `r` ,away */}  ${watch.elapsedTicks}");

    if (i != 0) /* to ingore the first warm-up run ,especially for j.i.t. compilation */ {
      total += watch.elapsedTicks;
    }

    watch.reset();
  }

  print(total / count);
}

@pragma(_inline__never)
bool _syn_(
  final int i,
) {
  return _base(i);
}

@pragma(_inline__never)
FutureOr<bool> _asyn__or__syn_(
  final int i,
) {
  return _base(i);
}

@pragma(_inline__never)
FutureOr<bool> _asyn__or__asyn(
  final int i,
) async {
  return _base(i);
}

@pragma(_inline__never)
ASYN<bool> _asyn(
  final int i,
) async {
  return _base(i);
}

const _inline__never = "vm:never-inline";

@pragma("vm:always-inline")
bool _base(
  final int i,
) {
  return i.isOdd;
}
