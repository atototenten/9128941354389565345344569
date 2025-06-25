part of "_.dart";

extension Iterable___extension<element___type> //
on Iterable<element___type> {
  Iterable<element__new__type> //
  convert<element__new__type>(
    final element__new__type Function(element___type) operate,
  ) {
    return map<element__new__type>(
      operate,
    );
  }

  array<element___type> //
  convert__array() {
    return toList(
      growable: NO,
    );
  }

  BOOL empty___ok() {
    return isEmpty;
  }
}
