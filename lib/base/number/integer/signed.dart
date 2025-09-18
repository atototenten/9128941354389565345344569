part of "../../_.dart";

typedef INT__NEG = int;

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
  INT__NEG value,
  INT count,
});

class base__NIS__text__digits__fixed {
  base__NIS__text__digits__fixed(
    this.value___raw, {
    required this.negative___ok,
    required this.digits__count,
    required this.truncation,
  });

  final INT digits__count;

  final base__NIS__text__digits__fixed__truncation? truncation;

  INT value___raw;

  BOOL negative___ok;

  void value__set(
    INT__NEG value__new,
  ) {
    if (negative___ok != value__new.isNegative) {
      negative___ok = value__new.isNegative;
    }

    if (negative___ok) {
      value__new = -value__new;
    }

    if (value___raw != value__new) {
      value___raw = value__new;
    }
  }

  string //
      value__convert__text() {
    final //
        value__text = value___raw.toString(),
        value__text__chars__count = value__text.chars__count,
        buffer = StringBuffer();

    if (negative___ok) {
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
