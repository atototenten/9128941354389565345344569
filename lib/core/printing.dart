part of "_.dart";

base__print__handle__proc_ base__print__handle = print;

const //
    base__printing__label__width__default = 39 /*
16 width (128 bits) integer,
  in hexa-decimal representation, which gives 32(16 * 2),
  separated with base__chars__space___string(or `integerSeparator`, which is ':' currently), which gives additional 7((32 ~/ 4) -1) chars */
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
  final INT value = 1,
]) /*
user should be careful, to call de-indent ,before `throw`s ,and early `return`s */
{
  if (base__printing___ok) {
    _indentation += value;
  }
}

const base__printing__indent = base__printing__indentation__increase;

void base__printing__indentation__decrease([
  final INT value = 1,
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
          ? (label + (base__chars__space___string * (base__printing__label__width - chars__count)))
          : ((chars__count > base__printing__label__width) //
              ? (label.substring(0, (base__printing__label__width - 1)) + base__chars__plus___string)
              : label.substring(0, base__printing__label__width))))
      ..write(base__chars__space___string * 2);
  } else {
    buffer.write(base__chars__space___string * (base__printing__label__width + 2));
  }

  if (_indentation > 0) {
    buffer.write(base__chars__space___string * (_indentation * base__printing__indentation__size));
  }

  if (path != null) {
    buffer
      ..write(path)
      ..write(base__chars__equal___string);
  }

  buffer
    ..write(value)
    ..write(base__chars__slash__backward___string) /*..write(char__line_feed)*/;

  final result = buffer.toString();

  buffer.clear();

  base__print__handle(
    result,
  );
}

void base__print__blank([
  final INT count = 0,
]) {
  base__print__handle(
    (base__chars__line_feed___string * count),
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
