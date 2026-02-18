part of "_.dart";

class queue___compo /*
dart's `ListQueue` should be preferred
  which is also more efficient(space and run-time)
    due to lack of linking and in-direction in elements
      and elimination of excessive overhead at memory-[de-]alloc.ion */ //
    <element___type extends Object?> //
    implements
        dispose___protocol {
  queue___compo() //
      : _accumulation = accumulation__linked___compo();

  final accumulation__linked___compo<element___type> _accumulation;

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

  accumulation__linked__element<element___type>? element() {
    return _accumulation.element__first();
  }

  void add(
    final element___type value,
  ) {
    _accumulation.add__ending(
      value,
    );
  }

  void remove() {
    _accumulation.remove__first();
  }

  void iterate(
    final BOOL Function(accumulation__linked__element<element___type> element) element__handle,
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
}
