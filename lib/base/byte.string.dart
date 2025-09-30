part of "_.dart";

typedef BS1 /* 8-bits ,single-byte */ = INT;
typedef BS2 /* 16-bits */ = INT;
typedef BS3 /* 24-bits */ = INT;
typedef BS4 /* 32-bits */ = INT;
typedef BS6 /* 48-bits */ = INT;
typedef BS8 /* 64-bits */ = INT;
typedef BS12 /* 96-bits */ = INT;
typedef BS16 /* 128-bits */ = INT;
typedef BS24 /* 192-bits */ = INT;
typedef BS32 /* 256-bits */ = INT;

typedef BS1__array = typed_data.Uint8List;
typedef BS2__array = typed_data.Uint16List;
typedef BS4__array = typed_data.Uint32List;
typedef BS8__array = typed_data.Uint64List;

const //
    BS01__width = 1,
    BS04__width = (4 * BS01__width),
//
    BS1__size = 1,
    BS1__width = (2 * BS04__width);

class BS__size__id {
  const BS__size__id(
    this.value,
  );

  final INT value;
}

BS__size__id BS__size__convert__id(
  final INT size,
) {
  return BS__size__id(
    switch (size) {
       INT__1__size => 0,
       INT__2__size => 1,
       INT__3__size => 2,
       INT__4__size => 3,
       INT__6__size => 4,
       INT__8__size => 5,
       INT__12__size => 6,
       INT__16__size => 7,
       INT__24__size => 8,
       INT__32__size => 9,
      _ => throw "$size(size), is too large, than the limit $INT__32__size(INT__32__size)",
    },
  );
}

extension BS__size__id__conversion //
    on BS__size__id {
  INT BS__size__id__convert(
    final BS__size__id size__id,
  ) {
    const sizes = [
       INT__1__size,
       INT__2__size,
       INT__3__size,
       INT__4__size,
       INT__6__size,
       INT__8__size,
       INT__12__size,
       INT__16__size,
       INT__24__size,
       INT__32__size,
    ];

    if ((size__id.value < sizes.length).not) {
      throw "un-known ${size__id.value}(size__id)";
    }

    return sizes[size__id.value];
  }
}

extension extension__BS4__array on BS4__array {
  BS4__array view__partial(final INT offset, final INT count) => //
      buffer.asUint32List(((offset * 4) + offsetInBytes), count);
}
