part of "_.dart";

void divide(
  final int nume,
  final int deno,
) {
  final BOOL isNegative;

  final int _deno;

  int //
      _nume,
      counter = 0;

  {
    if (nume < 0) {
      if (deno < 0) /* `deno` is ALSO -ve, hence result in +ve, as -ve cancel each other */ {
        _nume = -nume;
        _deno = -deno;
        isNegative = NO;
      } else /* ONLY `nume` is -ve, hence result in -ve */ {
        _nume = -nume;
        _deno = deno;
        isNegative = OK;
      }
    } else if (deno < 0) /* ONLY `deno` is -ve, hence result in -ve */ {
      _nume = nume;
      _deno = -deno;
      isNegative = OK;
    } else {
      _nume = nume;
      _deno = deno;
      isNegative = NO;
    }
  }

  while (_nume > 0) {
    _nume -= _deno;
    counter += 1;
    //print("\t$_nume  $counter");
  }

  print("$nume == " +
      (isNegative ? "-" : '') +
      ((_nume == 0) //
          ? "($deno * $counter)"
          : "(($deno * ${counter - 1}) + ${_nume + deno})"));
}

void divideStdLib(
  final int nume,
  final int deno,
) {
  final int _nume = (nume % deno);

  print("$nume == " +
      ((_nume == 0) //
          ? "($deno * ${nume ~/ deno})"
          : "(($deno * ${nume ~/ deno}) + $_nume)"));
}

void basic__math__divide__test() {
  const int //
      deno = 3;

  <int>[
    33,
    32,
    13,
    7,
    6,
    3,
    2,
    1,
    0,
    -1,
    -2,
    -3,
    -6,
    -7,
    -13,
    -32,
    -33,
  ].forEach((final int nume) {
    print("$nume ~/ $deno");

    divide(nume, deno);

    divideStdLib(nume, deno);

    print("\t${nume / deno}");
  });
}

/* copied from `~/bin/dart-sdk/lib/_internal/wasm/lib/int.dart`::`_BoxedInt`::`_modulo` */
int _modulo(final int a, final int b) {
  final int remainder = a - (a ~/ b) * b;

  return ((remainder < 0) ? ((b < 0) ? (remainder - b) : (remainder + b)) : remainder);
}

extension on NFP {
  NFP truncate__parsable__human() => //
      ((this * 100).toInt() / 100);
}

/* copied from `~/bin/dart-sdk/lib/_internal/wasm/lib/double.dart`::`_BoxedDouble`::`_remainder` */
double _remainder(final double a, final double b) {
  return (a - (a / b).truncateToDouble() * b);
}

({
  int result,
  int remainder,
}) _division(
  final int numerator,
  final int denominator,
) {
  final double result = (numerator / denominator);
  final int result_ = result.toInt();

  return (
    result: result_,
    remainder: ((result - result_) * denominator).toInt(),
  );
}

void _division__test() {
  print(_division(19, 9));
  print(_division(17, 16));
  print(_division(37, 16));
  print(_division(27, 8));
}
