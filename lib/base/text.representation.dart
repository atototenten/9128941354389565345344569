part of "_.dart";

class base__text__representation /*
`text` vs `text__representation`
  the former is a member of the type-system 
    ,while the latter is ,a representation of a value ,and {type-system}-independent abstraction */
{
  const base__text__representation(
    this.value,
  );

  final string__raw value;

  Never text__representation() {
    throw Error();
  }

  @override
  String toString() {
    return value;
  }
}

const Null__text__representation = base__text__representation(
  Null__value__text,
);

extension base__text__representation__print__extension //
    on base__text__representation {
  void print([
    final string__raw? path,
    final string__raw? label,
  ]) {
    base__print__labeled(
      value,
      path,
      label,
    );
  }
}

abstract class base__convert__text__representation___protocol {
  base__text__representation //
      text__representation();
}
