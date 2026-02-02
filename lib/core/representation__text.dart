part of "_.dart";

class representation__text___compo /*
`text` vs `representation__text`
  the former is a member of the type-system
    ,while the latter is ,a representation of a value ,and {type-system}-independent abstraction */ {
  const representation__text___compo(
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

const Null__representation__text = representation__text___compo(Null__value__text);

extension representation__text__print__extension //
    on representation__text___compo {
  void print([
    final string? path,
    final string? label,
  ]) {
    print__labeled(
      value,
      path,
      label,
    );
  }
}

abstract class convert__representation__text___protocol {
  representation__text___compo //
  representation__text();
}
