part of "_.dart";

void ITERATE__forwards(
  final INT count,
  final BOOL /*continue___ok*/ Function(INT) operate, {
  final INT offset = 0,
}) {
  final vending = INT__VENDING__generate(
    count,
    offset: offset,
  );

  for (final i in vending) {
    final continue___ok = operate(i);

    if (continue___ok.NOT) {
      break;
    }
  }
}

void ITERATE__backwards(
  final INT count,
  final BOOL /*continue___ok*/ Function(INT) operate,
) {
  final vending = INT__VENDING__generate__reverse(count);

  for (final i in vending) {
    final continue___ok = operate(i);

    if (continue___ok.NOT) {
      break;
    }
  }
}

ASYN<void> ITERATE__forwards___asyn(
  final INT count,
  final ASYN<BOOL /*continue___ok*/> Function(INT) operate, {
  final INT offset = 0,
}) async {
  final vending = INT__VENDING__generate(
    count,
    offset: offset,
  );

  for (final i in vending) {
    final continue___ok = await operate(i);

    if (continue___ok.NOT) {
      break;
    }
  }
}

ASYN<void> ITERATE__backwards___asyn(
  final INT count,
  final ASYN<BOOL /*continue___ok*/> Function(INT) operate,
) async {
  final vending = INT__VENDING__generate__reverse(count);

  for (final i in vending) {
    final continue___ok = await operate(i);

    if (continue___ok.NOT) {
      break;
    }
  }
}
