part of "_.dart";

void base__iterate__until(
  NI limit,
  final BOOL Function(NI i) operate, {
  NI offset = 0,
}) {
  while ((offset < limit) && operate(offset++));
}

value__asyn<void> base__iterate__until__asyn(
  NI limit,
  final value__asyn<BOOL> Function(NI i) operate, {
  NI offset = 0,
}) async {
  while ((offset < limit) && (await operate(offset++)));
}

void base__iterate__until__basic(
  final NI limit,
  final void Function(NI i) operate, {
  final NI offset = 0,
}) =>
    base__iterate__until(
      limit,
      (final i) {
        operate(i);
        return OK;
      },
      offset: offset,
    );

value__asyn<void> base__iterate__until__basic__asyn(
  final NI limit,
  final value__asyn<void> Function(NI i) operate, {
  final NI offset = 0,
}) =>
    base__iterate__until__asyn(
      limit,
      (final i) async {
        await operate(i);
        return OK;
      },
      offset: offset,
    );

void base__iterate(
  NI count,
  final BOOL Function(NI i) operate, {
  NI offset = 0,
}) {
  count += offset;
  while ((offset < count) && operate(offset++));
}

value__asyn<void> base__iterate__asyn(
  NI count,
  final value__asyn<BOOL> Function(NI i) operate, {
  NI offset = 0,
}) async {
  count += offset;
  while ((offset < count) && (await operate(offset++)));
}

void base__iterate__basic(
  final NI count,
  final void Function(NI i) operate, {
  final NI offset = 0,
}) =>
    base__iterate(
      count,
      (final i) {
        operate(i);
        return OK;
      },
      offset: offset,
    );

value__asyn<void> base__iterate__basic__asyn(
  final NI count,
  final value__asyn<void> Function(NI i) operate, {
  final NI offset = 0,
}) =>
    base__iterate__asyn(
      count,
      (final i) async {
        await operate(i);
        return OK;
      },
      offset: offset,
    );

void base__iterate__reverse /* __high_perf__low_mem */ (
  NI count,
  final BOOL Function(NI i) operate,
) {
  if /*F*/ (count == 0) {
    return;
  }

  while (operate(count -= 1) && //
      (count /*>*/ != 0)) {}
}

value__asyn<void> base__iterate__reverse__asyn(
  NI count,
  final value__asyn<BOOL> Function(NI i) operate,
) async {
  if /*F*/ (count == 0) {
    return;
  }

  while ((await operate(count -= 1)) && //
      (count /*>*/ != 0)) {}
}

void base__iterate__reverse__basic(
  final NI count,
  final void Function(NI i) operate,
) =>
    base__iterate__reverse(
      count,
      (final i) {
        operate(i);
        return OK;
      },
    );

value__asyn<void> base__iterate__reverse__basic__asyn(
  final NI count,
  final value__asyn<void> Function(NI i) operate,
) =>
    base__iterate__reverse__asyn(
      count,
      (final i) async {
        await operate(i);
        return OK;
      },
    );

void base__iterate__forever(
  final BOOL Function(NI i) operate, [
  NI offset = 0,
]) {
  while (operate(offset++));
}

value__asyn<void> base__iterate__forever__asyn(
  final value__asyn<BOOL> Function(NI i) operate, [
  NI offset = 0,
]) async {
  while (await operate(offset++));
}
