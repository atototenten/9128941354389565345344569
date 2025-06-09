part of "_.dart";

void base__iterate__until(
  NIMR until,
  final BOOL Function(NIMR i) operate, {
  NIMR offset = 0,
}) {
  while ((offset < until) && operate(offset++));
}

value__asyn<void> base__iterate__until__asyn(
  NIMR until,
  final value__asyn<BOOL> Function(NIMR i) operate, {
  NIMR offset = 0,
}) async {
  while ((offset < until) && (await operate(offset++)));
}

void base__iterate__until__basic(
  final NIMR until,
  final void Function(NIMR i) operate, {
  final NIMR offset = 0,
}) =>
    base__iterate__until(
      until,
      (final i) {
        operate(i);
        return OK;
      },
      offset: offset,
    );

value__asyn<void> base__iterate__until__basic__asyn(
  final NIMR until,
  final value__asyn<void> Function(NIMR i) operate, {
  final NIMR offset = 0,
}) =>
    base__iterate__until__asyn(
      until,
      (final i) async {
        await operate(i);
        return OK;
      },
      offset: offset,
    );

void base__iterate(
  NIMR count,
  final BOOL Function(NIMR i) operate, {
  NIMR offset = 0,
}) {
  count += offset;
  while ((offset < count) && operate(offset++));
}

value__asyn<void> base__iterate__asyn(
  NIMR count,
  final value__asyn<BOOL> Function(NIMR i) operate, {
  NIMR offset = 0,
}) async {
  count += offset;
  while ((offset < count) && (await operate(offset++)));
}

void base__iterate__basic(
  final NIMR count,
  final void Function(NIMR i) operate, {
  final NIMR offset = 0,
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
  final NIMR count,
  final value__asyn<void> Function(NIMR i) operate, {
  final NIMR offset = 0,
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
  NIMR count,
  final BOOL Function(NIMR i) operate,
) {
  if /*F*/ (count == 0) {
    return;
  }

  while (operate(count -= 1) && //
      (count /*>*/ != 0)) {}
}

value__asyn<void> base__iterate__reverse__asyn(
  NIMR count,
  final value__asyn<BOOL> Function(NIMR i) operate,
) async {
  if /*F*/ (count == 0) {
    return;
  }

  while ((await operate(count -= 1)) && //
      (count /*>*/ != 0)) {}
}

void base__iterate__reverse__basic(
  final NIMR count,
  final void Function(NIMR i) operate,
) =>
    base__iterate__reverse(
      count,
      (final i) {
        operate(i);
        return OK;
      },
    );

value__asyn<void> base__iterate__reverse__basic__asyn(
  final NIMR count,
  final value__asyn<void> Function(NIMR i) operate,
) =>
    base__iterate__reverse__asyn(
      count,
      (final i) async {
        await operate(i);
        return OK;
      },
    );

void base__iterate__forever(
  final BOOL Function(NIMR i) operate, [
  NIMR offset = 0,
]) {
  while (operate(offset++));
}

value__asyn<void> base__iterate__forever__asyn(
  final value__asyn<BOOL> Function(NIMR i) operate, [
  NIMR offset = 0,
]) async {
  while (await operate(offset++));
}
