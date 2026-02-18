import "dart:ffi" as dart__ffi;

import "package:ffi/ffi.dart" as package__ffi;

import "../../core/_.dart";

final class memory__native__vending__session___compo /*
  - element-size is always one (no multiplication)
      because byte is the unit of memory-accession
  - prefer "this.clone"-ing to peek ahead(forward) ,independently */ {
  dart__ffi.Pointer<dart__ffi.Uint8> _byte__current___reference;
  INT _bytes__remaining;

  memory__native__vending__session___compo({
    required final dart__ffi.Pointer<dart__ffi.Uint8> beginning /*
      must be valid ,and not equal "dart__ffi.nullptr" */,
    required final INT length /*
      must not be zero (or negative) */,
  }) : _byte__current___reference = beginning,
       _bytes__remaining = length;

  memory__native__vending__session___compo._(
    this._byte__current___reference,
    this._bytes__remaining,
  );

  memory__native__vending__session___compo clone() {
    return memory__native__vending__session___compo._(
      _byte__current___reference,
      _bytes__remaining,
    );
  }

  dart__ffi.Pointer<dart__ffi.Uint8> //
  byte__current___reference() {
    return _byte__current___reference;
  }

  INT byte__current() {
    return _byte__current___reference.value;
  }

  INT bytes__remaining() {
    return _bytes__remaining;
  }

  BOOL bytes__remaining___ok() {
    return (_bytes__remaining > 0);
  }

  BOOL move__forward({
    final INT steps__count = 1,
  }) {
    if (steps__count < 0) {
      throw Exception();
    }

    if (_bytes__remaining == 0) {
      return FALSE;
    }

    _bytes__remaining -= steps__count;

    if (_bytes__remaining < 0) {
      _bytes__remaining += steps__count;

      return FALSE;
    }

    _byte__current___reference = (_byte__current___reference + steps__count);

    return TRUE;
  }

  void move__backward___raw({
    final INT steps__count = 1,
  }) {
    _bytes__remaining += steps__count;

    _byte__current___reference = _backward___raw(
      steps__count: steps__count,
    );
  }

  INT peek__backward___raw({
    final INT steps__count = 1,
  }) {
    return _backward___raw(
      steps__count: steps__count,
    ).value;
  }

  dart__ffi.Pointer<dart__ffi.Uint8> //
  _backward___raw({
    final INT steps__count = 1,
  }) {
    return (_byte__current___reference - steps__count);
  }
}

//

final class memory__native___compo /*
  empty memory is same as in-valid (no memory)
    but need not special handling
      except "this.valid___ok"always returning "FALSE" */ //
</*dart__ffi.Uint8*/ type extends dart__ffi.NativeType> //
    implements dispose___protocol {
  late INT _memory__offset;

  memory__native___compo({
    required final byte__array bytes,
  }) {
    if (bytes.bytes__count == 0) {
      _memory__offset = dart__ffi.nullptr.address;

      return;
    }

    final memory__offset = package__ffi.malloc.allocate<type>(bytes.bytes__count);

    try {
      memory__copy(
        memory__offset.cast(),
        bytes.address.cast(),
        bytes.bytes__count,
      );

      _memory__offset = memory__offset.address;
    } catch (_) {
      package__ffi.malloc.free(memory__offset);
      _in_validate___raw();

      rethrow;
    }
  }

  memory__native___compo.empty() //
    : _memory__offset = dart__ffi.nullptr.address;

  @override
  void dispose() {
    if (valid___ok().NOT) {
      /*throw Exception("memory disposed ,already")*/
      return; /*
        not thrown ,because empty byte-array has the same value */
    }

    package__ffi.malloc.free(reference());
    _in_validate___raw();
  }

  void _in_validate___raw() {
    _memory__offset = dart__ffi.nullptr.address;
  }

  BOOL valid___ok() {
    return (_memory__offset != dart__ffi.nullptr.address);
  }

  INT memory__offset() {
    return _memory__offset;
  }

  dart__ffi.Pointer<type> reference() {
    return dart__ffi.Pointer<type>.fromAddress(_memory__offset);
  }
}

//

@dart__ffi.Native<dart__ffi.Pointer<dart__ffi.Void> Function(dart__ffi.Pointer<dart__ffi.Void> dest, dart__ffi.Pointer<dart__ffi.Void> src, dart__ffi.Size n)>(symbol: "memcpy", isLeaf: TRUE)
external dart__ffi.Pointer<dart__ffi.Void> memory__copy(final dart__ffi.Pointer<dart__ffi.Void> destination, final dart__ffi.Pointer<dart__ffi.Void> source, final INT count);

@dart__ffi.Native<dart__ffi.Int Function(dart__ffi.Pointer<dart__ffi.Void> s1, dart__ffi.Pointer<dart__ffi.Void> s2, dart__ffi.Size n)>(symbol: "memcmp", isLeaf: TRUE)
external INT__NEG memory__compare(final dart__ffi.Pointer<dart__ffi.Void> value, final dart__ffi.Pointer<dart__ffi.Void> other, final INT count);
