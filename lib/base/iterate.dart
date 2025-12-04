part of "_.dart";

@deprecated
void base__iterate(
  INT count,
  final BOOL Function(INT i) operate, {
  INT offset = 0,
}) {
  count += offset;
  while ((offset < count) && operate(offset++)) ;
}

@deprecated
value__asyn<void> base__iterate__asyn(
  INT count,
  final value__asyn<BOOL> Function(INT i) operate, {
  INT offset = 0,
}) async {
  count += offset;
  while ((offset < count) && (await operate(offset++))) ;
}

@deprecated
void base__iterate__basic(
  final INT count,
  final void Function(INT i) operate, {
  final INT offset = 0,
}) => base__iterate(
  count,
  (final i) {
    operate(i);
    return TRUE;
  },
  offset: offset,
);

@deprecated
value__asyn<void> base__iterate__basic__asyn(
  final INT count,
  final value__asyn<void> Function(INT i) operate, {
  final INT offset = 0,
}) => base__iterate__asyn(
  count,
  (final i) async {
    await operate(i);
    return TRUE;
  },
  offset: offset,
);

@deprecated
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

@deprecated
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

@deprecated
void base__iterate__reverse__basic(
  final INT count,
  final void Function(INT i) operate,
) => base__iterate__reverse(
  count,
  (final i) {
    operate(i);
    return TRUE;
  },
);

@deprecated
value__asyn<void> base__iterate__reverse__basic__asyn(
  final INT count,
  final value__asyn<void> Function(INT i) operate,
) => base__iterate__reverse__asyn(
  count,
  (final i) async {
    await operate(i);
    return TRUE;
  },
);
