part of "_.dart";

class base__representation__text /*
`text` vs `representation__text`
  the former is a member of the type-system 
    ,while the latter is ,a representation of a value ,and {type-system}-independent abstraction */
{
  const base__representation__text(
    this.value,
  );

  final string value;

  Never representation__text() {
    throw Error();
  }

  @override
  String toString() {
    return value;
  }
}

const Null__representation__text = base__representation__text(
  Null__value__text,
);

extension base__representation__text__print__extension //
    on base__representation__text {
  void print([
    final string? path,
    final string? label,
  ]) {
    base__print__labeled(
      value,
      path,
      label,
    );
  }
}

abstract class base__convert__representation__text___protocol {
  base__representation__text //
      representation__text();
}
