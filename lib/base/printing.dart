part of "_.dart";

base__print__handle__proc_ base__print__handle = print;

const //
    base__printing__label__width__default = 39 /*
16 width (128 bits) integer,
  in hexa-decimal representation, which gives 32(16 * 2),
  separated with char__space(or `integerSeparator`, which is ':' currently), which gives additional 7((32 ~/ 4) -1) chars */
    ,
    base__printing__indentation__size = 4;

var //
    _indentation = 0,
    base__printing__label__width = base__printing__label__width__default;

typedef base__print__handle__proc_ = //
    void Function(
  string,
);

void base__printing__indentation__increase([
  final NI value = 1,
]) /*
user should be careful, to call de-indent ,before `throw`s ,and early `return`s */
{
  if (base__printing___ok) {
    _indentation += value;
  }
}

const base__printing__indent = base__printing__indentation__increase;

void base__printing__indentation__decrease([
  final NI value = 1,
]) {
  if (base__printing___ok //
      &&
      (_indentation != 0)) {
    _indentation -= value;
  }
}

const base__printing__indent__de = base__printing__indentation__decrease;

void base__print__labeled(
  final string value, [
  final string? path /*
usually `value.ingredient.name` */
  ,
  final string? label /*
usually `value.debug__label`, or `value.code__hash.cached` */
  ,
]) {
  final buffer = StringBuffer();

  if (label != null) {
    final //
        chars__count = label.chars__count;

    buffer
      ..write(((chars__count < base__printing__label__width) //
          ? (label + (char__space * (base__printing__label__width - chars__count)))
          : ((chars__count > base__printing__label__width) //
              ? (label.substring(0, (base__printing__label__width - 1)) + char__plus)
              : label.substring(0, base__printing__label__width))))
      ..write(char__space * 2);
  } else {
    buffer.write(char__space * (base__printing__label__width + 2));
  }

  if (_indentation > 0) {
    buffer.write(char__space * (_indentation * base__printing__indentation__size));
  }

  if (path != null) {
    buffer
      ..write(path)
      ..write(char__equal);
  }

  buffer
    ..write(value)
    ..write(char__slash__backward) /*..write(char__line_feed)*/;

  final result = buffer.toString();

  buffer.clear();

  base__print__handle(
    result,
  );
}

void base__print__blank([
  final NI count = 0,
]) {
  base__print__handle(
    (char__line_feed * count),
  );
}

void base__procedure__call__print(
  final string procedure__name, [
  final string? label,
]) {
  base__print__labeled(
    "$procedure__name ( $static__indicate__short_en_ing",
    NIL,
    label,
  );
}

const //
    base__proc__call__print = base__procedure__call__print,
    base__function__call__print = base__procedure__call__print;

extension Object__nilable__label__extension on Object? {
  string get debug__label => //
      hashCode.toString();
}
