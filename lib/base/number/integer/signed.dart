part of "../../_.dart";

typedef NISR = int;
typedef NIS1R = NISR;
typedef NIS2R = NISR;
typedef NIS4R = NISR;
typedef NIS8R = NISR;
typedef NISMR = NIS8R;

const //
    NIS8__size = NI8__size,
    NIS8__limit = (1 << ((NI8__size * BS1__width) - 1)),
    NIS8__max = (NIS8__limit - 1),
//
    NISM__size = NIS8__size;

enum base__NIS__text__digits__fixed__truncation {
  beginning,
  ending,
}

typedef NIS__bytes__convert__result___compo = ({
  NISMR value,
  NIMR count,
});

class base__NIS__text__digits__fixed {
  base__NIS__text__digits__fixed(
    this.value__raw, {
    required this.negative__ok,
    required this.digits__count,
    required this.truncation,
  });

  final NIMR digits__count;

  final base__NIS__text__digits__fixed__truncation? truncation;

  NIMR value__raw;

  BOOL negative__ok;

  void value__set(
    NISMR value__new,
  ) {
    if (negative__ok != value__new.isNegative) {
      negative__ok = value__new.isNegative;
    }

    if (negative__ok) {
      value__new = -value__new;
    }

    if (value__raw != value__new) {
      value__raw = value__new;
    }
  }

  string__raw //
      value__convert__text() {
    final //
        value__text = value__raw.toString(),
        value__text__chars__count = value__text.chars__count,
        buffer = StringBuffer();

    if (negative__ok) {
      buffer.write(
        char__dash,
      );
    }

    if (value__text__chars__count < digits__count) {
      buffer
        ..write(zero * (digits__count - value__text__chars__count))
        ..write(value__text);
    } else if (value__text__chars__count > digits__count) {
      switch (truncation) {
        case NIL:
          {
            buffer.write(value__text);
          }
          break;
        case base__NIS__text__digits__fixed__truncation.beginning:
          {
            buffer.write(
              value__text.substring(
                0,
                digits__count,
              ),
            );
          }
          break;
        case base__NIS__text__digits__fixed__truncation.ending:
          {
            buffer.write(
              value__text.substring(
                (value__text__chars__count - digits__count),
                value__text__chars__count,
              ),
            );
          }
          break;
      }
    } else /*if (significand__text__chars__count == significand__digits__count)*/ {
      buffer.write(value__text);
    }

    final result = buffer.toString();

    buffer.clear();

    return result;
  }
}
