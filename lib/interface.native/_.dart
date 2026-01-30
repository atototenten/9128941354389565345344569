import "dart:ffi" as ffi_;

import "package:foundation/core/_.dart";

//import "dart:io" as io_;
//import "dart:io" as net_;

//

part "bindings.dart";
part "by.arr.dart";
part "u32.arr.dart";

/*typedef s32 = int;
typedef u31 = int;
typedef u63 = int;*/

const //
    ffi__NIL__address = 0; /*
  check as `if(p.address == ffi__NIL__address)` */

final ffi_.DynamicLibrary //
    library__c = ffi_.DynamicLibrary.open("libc.so.6"),
    library__global /* including `__program` */ = ffi_.DynamicLibrary.process() /* copied from `ffi-2.0.2/lib/src/allocation.dart`::`stdlib` */,
    library__program /*__current*/ = ffi_.DynamicLibrary.executable();

const //
    ffi__mem__free = free;

ffi_.Pointer<T> ffi__mem__alloc<T extends ffi_.NativeType>(
  final INT byteCount,
) {
  final ptr = malloc(
    byteCount,
  );

  if (ptr.address == ffi__NIL__address) //
    throw "`malloc` `return`ed `NIL`";

  return ptr.cast();
}

ffi_.Pointer<T> ffi__mem__aligned__alloc<T extends ffi_.NativeType>(
  final INT alignment,
  final INT size,
) {
  final //
      ptr = ffi__mem__alloc<ffi_.Pointer<T>>(
        ffi_.sizeOf<ffi_.Pointer<ffi_.Void>>(),
      ),
      result = posix_memalign(
        ptr,
        alignment,
        size,
      );

  if (result != 0) //
    throw "`posix_memalign` `return`ed $result";

  return ptr.value;
}

INT ffi__text__count(
  final ffi_.Pointer<ffi_.Uint8> s,
) {
  INT count = 0;
  while (s[count++] != 0);
  return (count - 1);
}

byte__array___compo ffi__text__convert(
  final string s,
) {
  final //
      bytes = string__convert__utf_8__bytes(s),
      bytes__count = bytes.bytes__count,
      result = BS1__array__alloc(bytes__count + 1);

  base__copy(
    (result.arr //
      ..[bytes__count] = 0),
    bytes,
    count: bytes__count,
  );

  return result;
}

string ffi__convert__text(
  final ffi_.Pointer<ffi_.Uint8> bytes,
) =>
    utf_8__bytes__convert__string(
      bytes.asTypedList(
        ffi__text__count(
          bytes,
        ),
      ),
    );

ffi_.Pointer<ffi_.Int32> ffi__errno() => //
    (environment__phone__android___ok.NOT //
            ? ffi__binding__errno_location
            : ffi__binding__errno) /*
  source: `https://github.com/termux/termux-packages/issues/10244#issuecomment-1103748373` */
        ();

s32 ffi__errno__set(
  final u31 value,
) =>
    (ffi__errno().value = value);

void ffi__errno__re_set() => //
    ffi__errno__set(0);

s32 ffi__errno__value() /*
  should be at the very next line to the result function call
    to prevent the errno, from being over-written */
    =>
    ffi__errno().value;

({
  string name /* title */,
  string desc /* description */,
}) ffi__errno__parsable__human(
  final s32 errno /* `ffi__errno__value()` */,
) =>
    (
      name: ffi__convert__text(strerrorname_np(errno)),
      desc: ffi__convert__text(strerrordesc_np(errno)),
    );

void ffi__check__features() /* port of c's `TEST` */ {
  if (ffi_.sizeOf<ffi_.Size>() != ffi_.sizeOf<ffi_.Uint64>()) {
    throw "`sizeof(size_t) != sizeof(uint64_t)`";
  }

  if (ffi_.sizeOf<ffi_.UintPtr>() != ffi_.sizeOf<ffi_.Uint64>()) {
    throw "`sizeof(uintptr_t) != sizeof(uint64_t)`";
  }

  if (ffi_.sizeOf<ffi_.UnsignedLong>() != ffi_.sizeOf<ffi_.Uint64>()) {
    throw "`sizeof(unsigned long) != sizeof(uint64_t)`";
  }
}
