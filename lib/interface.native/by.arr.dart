part of "_.dart";

class byte__array___compo {
  static final byte__array___compo empty = //
      byte__array___compo(ffi_.nullptr, 0);

  const byte__array___compo(
    this.ptr,
    this.count,
  );

  final ffi_.Pointer<ffi_.Uint8> ptr;
  final INT count;

  BS1__array get arr => //
      ptr.asTypedList(count);

  /* INT? check__equal(
    final byte__array___compo other,
  ) {
    INT? result /* un-equal id */;

    final bys = array;
    other.arr.iterate((final id, final b) {
      if (b == bys[id]) //
        return OK;

      result = id;
      return NO;
    });

    return result;
  } */

  /* BOOL b__equal(final byte__array___compo other) => //
      ((other.count == count) && (check__equal(other) ==  null)); */

  BOOL b__same(final byte__array___compo other) => //
      (other.ptr.address == ptr.value);
}

byte__array___compo BS1__array__alloc(final INT count) => //
    byte__array___compo(
      ffi__mem__alloc<ffi_.Uint8>(count),
      count,
    );

byte__array___compo BS1__array__aligned__alloc(
  final INT alignment__size,
  INT count /*
  of `alignment__size`s, or aligned-blocks of memory; not bytes */
  ,
) =>
    byte__array___compo(
      ffi__mem__aligned__alloc<ffi_.Uint8>(
        alignment__size,
        (count *= alignment__size),
      ),
      count,
    );

BS1__array BS1__array__convert__bytes(
  final byte__array___compo BS1__array,
) =>
    (BS8__array(2)
          ..[0] = BS1__array.ptr.address
          ..[1] = BS1__array.count)
        .buffer
        .asUint8List();

byte__array___compo BS1__array__bytes__convert(
  final BS1__array bytes,
) =>
    byte__array___compo(
      ffi_.Pointer<ffi_.Uint8>.fromAddress(
        bytes.convert__NI__endian__little(
           INT 8__size,
        ),
      ),
       INT __bytes__convert(
        bytes.view(
           INT 8__size,
        ),
      ).value,
    );

void BS1__array__free(
  final byte__array___compo arr,
) =>
    ffi__mem__free(arr.ptr);
