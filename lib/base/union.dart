part of "_.dart";

class union {
  union(
    this._value,
    this._types,
  );

  final array<Type> _types /*
sub-typing is not supported
/*must be ordered in narrow-to-wide sequence 
  ,like `[NIR ,NI2R ,... ,NIMR]` ,because `NI2R` is `NI4R` ,but `NI4R` is-not `NI2R`*/ */
      ;

  dynamic _value;

  dynamic get value => //
      _value;

  void value__set(
    final dynamic value__new,
  ) {
    var type__ok = NO;

    _types.iterate(
      (
        final _,
        final e,
      ) {
        if (value__new.runtimeType == e) {
          type__ok = OK;

          return NO;
        }

        return OK;
      },
    );

    if (type__ok.not) {
      throw "\"$value__new\" of type `${value__new.runtimeType}` ,cannot be assigned to union$_types";
    }

    _value = value__new;
  }

  BOOL equal__ok(
    final union other,
  ) /*
`_types` is ignored */
  {
    return ((runtimeType == other.runtimeType) //
        &&
        (_value == other._value));
  }

  @override
  BOOL operator ==(
    final Object other,
  ) {
    return ((other is union) &&
        equal__ok(
          other,
        ));
  }

  string__raw convert__text() {
    return "<${_value.runtimeType}>${_value ?? Null__value__text}";
  }

  @override
  string__raw toString() => //
      convert__text();
}

void union__test() {
  final u = union(
    NIL,
    [Null, NIMR, string__raw],
  );

  void value__set(
    final dynamic value__new,
  ) {
    u
      ..toString().print("u.value.before")
      ..value__set(value__new)
      ..toString().print("u.value");
  }

  value__set("zero");
  value__set("zer0");
  value__set("0");
  value__set(0);
  value__set(1);
  value__set("one");
  value__set(1.0);
  value__set(NIL);
}
