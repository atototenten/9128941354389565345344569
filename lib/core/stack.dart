part of "_.dart";

class stack___compo //
<element___type extends Object?> //
    implements dispose___protocol {
  stack___compo() //
    : _accumulation = accumulation__chained();

  final accumulation__chained<element___type> _accumulation;

  INT elements__count() {
    return _accumulation.elements__count();
  }

  BOOL empty___ok() {
    return _accumulation.empty___ok();
  }

  accumulation__chained__element<element___type>? element() {
    return _accumulation.element__last();
  }

  void add(final element___type value) {
    _accumulation.add__ending(value);
  }

  void remove() {
    _accumulation.remove__last();
  }

  void iterate(
    final BOOL Function(accumulation__chained__element<element___type> element) element__handle,
  ) {
    _accumulation.iterate(
      element__handle,
    );
  }

  BOOL present___ok(
    final element___type element,
    final value__equality___procedure__format<element___type, element___type> equal___ok,
  ) {
    return _accumulation.present___ok(
      element,
      equal___ok,
    );
  }

  ARRAY<element___type> convert__array() {
    return _accumulation.convert__array();
  }

  void flush() {
    _accumulation.flush();
  }

  @override
  void dispose() {
    _accumulation.dispose();
  }
}
