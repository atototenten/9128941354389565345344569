part of "_.dart";

class base__stack //
    <element___type extends Object?> //
    implements
        base__dispose___protocol {
  base__stack() //
      : accumulation___raw = base__accumulation__chained();

  final base__accumulation__chained<element___type> accumulation___raw;

  INT elements__count() {
    return accumulation___raw.elements__count();
  }

  BOOL empty___ok() {
    return accumulation___raw.empty___ok();
  }

  BOOL empty__not() {
    return accumulation___raw.empty__not();
  }

  base__accumulation__chained__element<element___type>? element() {
    return accumulation___raw.element__last();
  }

  void add(
    final element___type value,
  ) {
    accumulation___raw.add__ending(
      value,
    );
  }

  void remove() {
    accumulation___raw.remove__last();
  }

  void iterate(
    final BOOL Function(base__accumulation__chained__element<element___type> element) element__handle,
  ) {
    accumulation___raw.iterate(
      element__handle,
    );
  }

  BOOL present___ok(
    final element___type element,
    final base__value__equality__function__format<element___type, element___type> equal___ok,
  ) {
    return accumulation___raw.present___ok(
      element,
      equal___ok,
    );
  }

  ARRAY<element___type> convert__array() {
    return accumulation___raw.convert__array();
  }

  void flush() {
    accumulation___raw.flush();
  }

  @override
  void dispose() {
    accumulation___raw.dispose();
  }
}
