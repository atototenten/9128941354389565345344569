part of "_.dart";

void base__iterate__until(
  INT limit,
  final BOOL Function(INT i) operate, {
  INT offset = 0,
}) {
  while ((offset < limit) && operate(offset++));
}

value__asyn<void> base__iterate__until__asyn(
  INT limit,
  final value__asyn<BOOL> Function(INT i) operate, {
  INT offset = 0,
}) async {
  while ((offset < limit) && (await operate(offset++)));
}

void base__iterate__until__basic(
  final INT limit,
  final void Function(INT i) operate, {
  final INT offset = 0,
}) =>
    base__iterate__until(
      limit,
      (final i) {
        operate(i);
        return TRUE;
      },
      offset: offset,
    );

value__asyn<void> base__iterate__until__basic__asyn(
  final INT limit,
  final value__asyn<void> Function(INT i) operate, {
  final INT offset = 0,
}) =>
    base__iterate__until__asyn(
      limit,
      (final i) async {
        await operate(i);
        return TRUE;
      },
      offset: offset,
    );

void base__iterate(
  INT count,
  final BOOL Function(INT i) operate, {
  INT offset = 0,
}) {
  count += offset;
  while ((offset < count) && operate(offset++));
}

value__asyn<void> base__iterate__asyn(
  INT count,
  final value__asyn<BOOL> Function(INT i) operate, {
  INT offset = 0,
}) async {
  count += offset;
  while ((offset < count) && (await operate(offset++)));
}

void base__iterate__basic(
  final INT count,
  final void Function(INT i) operate, {
  final INT offset = 0,
}) =>
    base__iterate(
      count,
      (final i) {
        operate(i);
        return TRUE;
      },
      offset: offset,
    );

value__asyn<void> base__iterate__basic__asyn(
  final INT count,
  final value__asyn<void> Function(INT i) operate, {
  final INT offset = 0,
}) =>
    base__iterate__asyn(
      count,
      (final i) async {
        await operate(i);
        return TRUE;
      },
      offset: offset,
    );

void base__iterate__reverse /* __high_perf__low_mem */ (
  INT count,
  final BOOL Function(INT i) operate,
) {
  if /*F*/ (count == 0) {
    return;
  }

  while (operate(count -= 1) && //
      (count /*>*/ != 0)) {}
}

value__asyn<void> base__iterate__reverse__asyn(
  INT count,
  final value__asyn<BOOL> Function(INT i) operate,
) async {
  if /*F*/ (count == 0) {
    return;
  }

  while ((await operate(count -= 1)) && //
      (count /*>*/ != 0)) {}
}

void base__iterate__reverse__basic(
  final INT count,
  final void Function(INT i) operate,
) =>
    base__iterate__reverse(
      count,
      (final i) {
        operate(i);
        return TRUE;
      },
    );

value__asyn<void> base__iterate__reverse__basic__asyn(
  final INT count,
  final value__asyn<void> Function(INT i) operate,
) =>
    base__iterate__reverse__asyn(
      count,
      (final i) async {
        await operate(i);
        return TRUE;
      },
    );

void base__iterate__forever(
  final BOOL Function(INT i) operate, [
  INT offset = 0,
]) {
  while (operate(offset++));
}

value__asyn<void> base__iterate__forever__asyn(
  final value__asyn<BOOL> Function(INT i) operate, [
  INT offset = 0,
]) async {
  while (await operate(offset++));
}
