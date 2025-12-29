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
      : accumulation___raw = base__accumulation__linked();

  final base__accumulation__linked<element__type> accumulation___raw;

  INT elements__count() {
    return accumulation___raw.elements__count();
  }

  BOOL empty___ok() {
    return accumulation___raw.empty___ok();
  }

  BOOL empty__not() {
    return accumulation___raw.empty__not();
  }

  base__accumulation__linked__element<element__type>? element() {
    return accumulation___raw.element__first();
  }

  void add(
    final element__type value,
  ) {
    accumulation___raw.add__ending(
      value,
    );
  }

  void remove() {
    accumulation___raw.remove__first();
  }

  void iterate(
    final BOOL Function(base__accumulation__linked__element<element__type> element) element__handle,
  ) {
    accumulation___raw.iterate(
      element__handle,
    );
  }

  BOOL present___ok(
    final element__type element,
    final base__value__equality__function__format<element__type,element__type> equal___ok,
  ) {
    return accumulation___raw.present___ok(
      element,
      equal___ok,
    );
  }

  ARRAY<element__type> convert__array() {
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
