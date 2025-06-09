part of "_.dart";

class base__queue /*
dart's `ListQueue` should be preferred
  which is also more efficient(space and run-time)
    due to lack of linking and in-direction in elements
      and elimination of excessive overhead at memory-[de-]alloc.ion */ //
    <element__type extends Object?> //
    implements
        base__dispose___protocol {
  base__queue() //
      : accumulation__raw = base__accumulation__linked();

  final base__accumulation__linked<element__type> accumulation__raw;

  NIMR elements__count() {
    return accumulation__raw.elements__count();
  }

  BOOL empty__ok() {
    return accumulation__raw.empty__ok();
  }

  BOOL empty__not() {
    return accumulation__raw.empty__not();
  }

  base__accumulation__linked__element<element__type>? element() {
    return accumulation__raw.element__first();
  }

  void add(
    final element__type value,
  ) {
    accumulation__raw.add__ending(
      value,
    );
  }

  void remove() {
    accumulation__raw.remove__first();
  }

  void iterate(
    final BOOL Function(base__accumulation__linked__element<element__type> element) element__handle,
  ) {
    accumulation__raw.iterate(
      element__handle,
    );
  }

  BOOL present__ok(
    final element__type element,
    final base__value__equal__ok__function__format<element__type,element__type> equal__ok,
  ) {
    return accumulation__raw.present__ok(
      element,
      equal__ok,
    );
  }

  array<element__type> convert__array() {
    return accumulation__raw.convert__array();
  }

  void flush() {
    accumulation__raw.flush();
  }

  @override
  void dispose() {
    accumulation__raw.dispose();
  }
}
