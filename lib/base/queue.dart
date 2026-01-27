part of "_.dart";

class base__queue___compo /*
dart's `ListQueue` should be preferred
  which is also more efficient(space and run-time)
    due to lack of linking and in-direction in elements
      and elimination of excessive overhead at memory-[de-]alloc.ion */ //
    <element__type extends Object?> //
    implements
        base__dispose___protocol {
  base__queue___compo() //
      : _accumulation = base__accumulation__linked___compo();

  final base__accumulation__linked___compo<element__type> _accumulation;

  @override
  void dispose() {
    _accumulation.dispose();
  }

  void flush() {
    _accumulation.flush();
  }

  INT elements__count() {
    return _accumulation.elements__count();
  }

  BOOL empty___ok() {
    return _accumulation.empty___ok();
  }

  base__accumulation__linked__element<element__type>? element() {
    return _accumulation.element__first();
  }

  void add(
    final element__type value,
  ) {
    _accumulation.add__ending(
      value,
    );
  }

  void remove() {
    _accumulation.remove__first();
  }

  void iterate(
    final BOOL Function(base__accumulation__linked__element<element__type> element) element__handle,
  ) {
    _accumulation.iterate(
      element__handle,
    );
  }

  BOOL present___ok(
    final element__type element,
    final base__value__equality__function__format<element__type,element__type> equal___ok,
  ) {
    return _accumulation.present___ok(
      element,
      equal___ok,
    );
  }

  ARRAY<element__type> convert__array() {
    return _accumulation.convert__array();
  }
}
