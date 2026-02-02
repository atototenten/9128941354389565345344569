part of "_.dart";

print__handle__proc_ print__handle = print;

const //
    printing__label__width__default = 39 /*
16 width (128 bits) integer,
  in hexa-decimal representation, which gives 32(16 * 2),
  separated with chars__space___string(or `integerSeparator`, which is ':' currently), which gives additional 7((32 ~/ 4) -1) chars */
    ,
    printing__indentation__size = 4;

var //
    _indentation = 0,
    printing__label__width = printing__label__width__default;

typedef print__handle__proc_ = //
    void Function(
  string,
);

void printing__indentation__increase([
  final INT value = 1,
]) /*
user should be careful, to call de-indent ,before `throw`s ,and early `return`s */
{
  if (printing___ok) {
    _indentation += value;
  }
}

const printing__indent = printing__indentation__increase;

void printing__indentation__decrease([
  final INT value = 1,
]) {
  if (printing___ok //
      &&
      (_indentation != 0)) {
    _indentation -= value;
  }
}

const printing__indent__de = printing__indentation__decrease;

void print__labeled(
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
      ..write(((chars__count < printing__label__width) //
          ? (label + (chars__space___string * (printing__label__width - chars__count)))
          : ((chars__count > printing__label__width) //
              ? (label.substring(0, (printing__label__width - 1)) + chars__plus___string)
              : label.substring(0, printing__label__width))))
      ..write(chars__space___string * 2);
  } else {
    buffer.write(chars__space___string * (printing__label__width + 2));
  }

  if (_indentation > 0) {
    buffer.write(chars__space___string * (_indentation * printing__indentation__size));
  }

  if (path != null) {
    buffer
      ..write(path)
      ..write(chars__equal___string);
  }

  buffer
    ..write(value)
    ..write(chars__slash__backward___string) /*..write(char__line_feed)*/;

  final result = buffer.toString();

  buffer.clear();

  print__handle(
    result,
  );
}

void print__blank([
  final INT count = 0,
]) {
  print__handle(
    (chars__line_feed___string * count),
  );
}

void procedure__call__print(
  final string procedure__name, [
  final string? label,
]) {
  print__labeled(
    "$procedure__name ( $static__indicate__short_en_ing",
    NIL,
    label,
  );
}

const //
    proc__call__print = procedure__call__print,
    function__call__print = procedure__call__print;

extension Object__nilable__label__extension on Object? {
  string get debug__label => //
      hashCode.toString();
}
