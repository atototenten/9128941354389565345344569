part of "../_.dart";

typedef NER = double /* floating-point number */;
typedef NE8R = NER;
typedef NEMR = NE8R;

const //
    NE8__significand__max = ((1 << 52) /*-1*/ /* because ,the sign bit ,is stored separat-ly */),
    NE8__exponent__max = ((1 << 10) - 1 /* because ,exponent can also be ,negative */);

class base__NE__input__digits__fixed {
  base__NE__input__digits__fixed({
    final NIMR significand = 0,
    final BOOL significand__negative__ok = NO,
    final NIMR significand__digits__count = 3,
    final BOOL significand__truncate__ok = NO,
    final NIMR exponent = 0,
    final BOOL exponent__negative__ok = NO,
    final NIMR exponent__digits__count = 2,
    final BOOL exponent__truncate__ok = OK,
  })  : significand = base__NIS__text__digits__fixed(
          significand,
          negative__ok: significand__negative__ok,
          digits__count: significand__digits__count,
          truncation: (significand__truncate__ok //
              ? base__NIS__text__digits__fixed__truncation.ending
              : NIL),
        ),
        exponent = base__NIS__text__digits__fixed(
          exponent,
          negative__ok: exponent__negative__ok,
          digits__count: exponent__digits__count,
          truncation: (exponent__truncate__ok //
              ? base__NIS__text__digits__fixed__truncation.beginning
              : NIL),
        );

  final base__NIS__text__digits__fixed //
      significand,
      exponent;

  void value__set__parse /*
throws ,for non-numbers and in-valid cases ,like `-.1`
absent non-negative significand is treated as zero
negative-zero is treated as non-negative */
      (
    final string__raw value__new,
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
        final significand_1 = NISMR.tryParse(
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
      final exponent_1 = NISMR.tryParse(
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

  string__raw //
      value__convert__text() {
    return (significand.value__convert__text() + char__dot + exponent.value__convert__text());
  }
}

extension base__NE__input__digits__fixed__test //
    on base__NE__input__digits__fixed {
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
      (final _, final string__raw v) {
        base__NE__input__digits__fixed(
          significand__truncate__ok: OK,
        )
          ..value__set__parse(v)
          ..value__convert__text().print();
        base__print__blank();
      },
    );
  }
}
