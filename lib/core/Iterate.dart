part of "_.dart";

const _iterate = iterate;

@deprecated
void iterate(
  INT count,
  final BOOL Function(INT i) operate, {
  INT offset = 0,
}) {
  count += offset;
  while ((offset < count) && operate(offset++)) ;
}

@deprecated
ASYN<void> iterate__asyn(
  INT count,
  final ASYN<BOOL> Function(INT i) operate, {
  INT offset = 0,
}) async {
  count += offset;
  while ((offset < count) && (await operate(offset++))) ;
}

const _iterate__reverse = iterate__reverse;

@deprecated
void iterate__reverse /* __high_perf__low_mem */ (
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
ASYN<void> iterate__reverse__asyn(
  INT count,
  final ASYN<BOOL> Function(INT i) operate,
) async {
  if /*F*/ (count == 0) {
    return;
  }

  while ((await operate(count -= 1)) && //
      (count /*>*/ != 0)) {}
}
