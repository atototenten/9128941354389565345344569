part of "../_.dart";

typedef APPROX = double /* floating-point number */;

const //
APPROX__8__significand__max = ((1 << 52) /*-1*/ /* because ,the sign bit ,is stored separat-ly */ ),
    APPROX__8__exponent__max = ((1 << 10) - 1 /* because ,exponent can also be ,negative */ );

class base__APPROX__input__digits__fixed {
  base__APPROX__input__digits__fixed({
    final INT significand = 0,
    final BOOL significand__negative___ok = FALSE,
    final INT significand__digits__count = 3,
    final BOOL significand__truncate___ok = FALSE,
    final INT exponent = 0,
    final BOOL exponent__negative___ok = FALSE,
    final INT exponent__digits__count = 2,
    final BOOL exponent__truncate___ok = TRUE,
  }) : significand = base__INT__NEG__text__digits__fixed(
         significand,
         negative___ok: significand__negative___ok,
         digits__count: significand__digits__count,
         truncation:
             (significand__truncate___ok //
             ? base__INT__NEG__text__digits__fixed__truncation.ending
             : NIL),
       ),
       exponent = base__INT__NEG__text__digits__fixed(
         exponent,
         negative___ok: exponent__negative___ok,
         digits__count: exponent__digits__count,
         truncation:
             (exponent__truncate___ok //
             ? base__INT__NEG__text__digits__fixed__truncation.beginning
             : NIL),
       );

  final base__INT__NEG__text__digits__fixed //
  significand,
      exponent;

  void value__set__parse /*
throws ,for non-numbers and in-valid cases ,like `-.1`
absent non-negative significand is treated as zero
negative-zero is treated as non-negative */ (
    final string value__new,
  ) {
    final values = value__new.split(
      char__dot,
    );

    if (values.elements__count > 2) {
      throw "more than one points";
    }

    {
      final value = values.first;

      if (value.empty__not()) {
        final significand_1 = INT__NEG.tryParse(
          value,
        );

        if (significand_1 == null) {
          throw "in-valid significand";
        }

        significand.value__set(
          significand_1,
        );
      } else {
        significand.value__set(
          0,
        );
      }
    }

    if (values.elements__count > 1) {
      final exponent_1 = INT__NEG.tryParse(
        values[1],
      );

      if (exponent_1 == null) {
        throw "in-valid exponent";
      }

      exponent.value__set(
        exponent_1,
      );
    }
  }

  string //
  value__convert__text() {
    return (significand.value__convert__text() + char__dot + exponent.value__convert__text());
  }
}

extension base__APPROX__input__digits__fixed__test //
    on base__APPROX__input__digits__fixed {
  void test() {
    [
      "0",
      ".0",
      "0.0",
      "-0",
      "-0.-0",
      ".-0",
      "1.1",
      "-1.1",
      "1.-1",
      "-1.-1",
      "12.12",
      "123.123",
      "-1234.-1234",
      "1234",
      ".1234",
    ].iterate__basic(
      (final _, final string v) {
        base__APPROX__input__digits__fixed(
            significand__truncate___ok: TRUE,
          )
          ..value__set__parse(v)
          ..value__convert__text().print();
        base__print__blank();
      },
    );
  }
}
