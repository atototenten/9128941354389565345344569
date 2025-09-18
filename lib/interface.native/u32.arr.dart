part of "_.dart";

class BS4__array___compo {
  static final BS4__array___compo empty = //
      BS4__array___compo(ffi_.nullptr, 0);

  const BS4__array___compo(
    this.ptr,
    this.count,
  );

  final ffi_.Pointer<ffi_.Uint32> ptr;
  final INT count;

  BS4__array get arr => //
      ptr.asTypedList(count);
}

BS4__array___compo BS4__array__alloc(
  final INT count,
) =>
    BS4__array___compo(
      ffi__mem__alloc<ffi_.Uint32>(
        (count * NI4__size),
      ),
      count,
    );

void BS4__array__free(
  final BS4__array___compo arr,
) =>
    ffi__mem__free(
      arr.ptr,
    );
