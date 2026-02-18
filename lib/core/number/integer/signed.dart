part of "../../_.dart";

typedef INT__NEG = int;

const //
    INT__NEG__8__size = INT__8__size,
    INT__NEG__8__limit = (1 << ((INT__8__size * BS1__width) - 1)),
    INT__NEG__8__max = (INT__NEG__8__limit - 1),
//
    INT__NEG__size = INT__NEG__8__size;

enum INT__NEG__text__digits__fixed__truncation {
  beginning,
  ending,
}

typedef INT__NEG__bytes__convert__result___compo = ({
  INT__NEG value,
  INT count,
});

class INT__NEG__text__digits__fixed {
  INT__NEG__text__digits__fixed(
    this._value, {
    required this.negative___ok,
    required this.digits__count,
    required this.truncation,
  });

  final INT digits__count;

  final INT__NEG__text__digits__fixed__truncation? truncation;

  INT _value;

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

    if (_value != value__new) {
      _value = value__new;
    }
  }

  string //
      value__convert__text() {
    final //
        value__text = _value.toString(),
        value__text__chars__count = value__text.chars__count,
        buffer = StringBuffer();

    if (negative___ok) {
      buffer.write(
        chars__dash___string,
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
        case INT__NEG__text__digits__fixed__truncation.beginning:
          {
            buffer.write(
              value__text.substring(
                0,
                digits__count,
              ),
            );
          }
          break;
        case INT__NEG__text__digits__fixed__truncation.ending:
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
