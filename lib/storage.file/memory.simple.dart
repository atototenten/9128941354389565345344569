part of "_.dart";

/*class storage__file__memory__simple /*
based on byte-id. ,instead of block-id. */ //
    implements
        base__dispose___protocol {
  static const length__initial__default = NI2__limit;

  storage__file__memory__simple({
    final NIMR length__initial = length__initial__default,
  }) : value__raw = byte__array(
          length__initial,
        );

  byte__array value__raw;

  NIMR length__raw = 0;

  NIMR capacity__raw() {
    return value__raw.bytes__count;
  }

  NIMR length() {
    return length__raw;
  }

  void length__update__if__needed__raw(
    final NIMR offset__new /* end ,`file__length__new` */,
  ) {
    if (offset__new > length__raw) {
      length__raw = offset__new;
    }
  }

  void capacity__extend__if__needed__raw(
    final NIMR capacity__required,
  ) {
    base__printing__indentation__increase();

    var capacity__current = capacity__raw();

    while (capacity__current < capacity__required) {
      capacity__current *= 2;
    }

    if (capacity__current > capacity__raw()) {
      if (base__printing__ok) {
        "storage__file__memory.capacity__extend__raw: extending `storage`'s capacity, from ${capacity__raw()}, to $capacity__current".print(
          debug__label,
        );
      }

      final value__old = value__raw;

      value__raw = byte__array(
        capacity__current,
      );

      base__copy(
        value__raw,
        value__old,
        count: length__raw,
      );
    }

    base__printing__indentation__decrease();
  }

  NIMR write__append__blank({
    required final NIMR length,
  }) {
    return reserve(
      length: length,
    );
  }

  NIMR write__append__fill(
    final NIMR count, {
    final byte value = 0,
  }) {
    final offset = length__raw;

    write__fill(
      count,
      value: value,
      offset: offset,
    );

    return offset;
  }

  NIMR write__append(
    final byte__array value,
  ) {
    final offset = length__raw;

    write(
      value,
      offset: offset,
    );

    return offset;
  }

  void write__fill(
    final NIMR count, {
    final byte value = 0,
    required final NIMR offset,
  }) {
    final offset__new = (count + offset);

    capacity__extend__if__needed__raw(
      offset__new,
    );

    byte__array__fill(
      value__raw.view(
        offset,
      ),
      count: count,
      value: value,
    );

    length__update__if__needed__raw(
      offset__new,
    );
  }

  void write(
    final byte__array value, {
    required final NIMR offset,
  }) {
    if (base__printing__ok) {
      base__function__call__print(
        "storage__file__memory.write",
        debug__label,
      );

      value.bytes__count.text__representation().print("bytes__count");
      offset.text__representation().print("offset");
    }

    base__printing__indentation__increase();

    final offset__new = (value.bytes__count + offset);

    capacity__extend__if__needed__raw(
      offset__new,
    );

    base__copy(
      value__raw,
      value,
      dest__offset: offset,
    );

    length__update__if__needed__raw(
      offset__new,
    );

    base__printing__indentation__decrease();
  }

  storage__file__memory__reading__full__result //
      read__full() {
    final result = read(
      length: length__raw,
      offset: 0,
    );

    return storage__file__memory__reading__full__result(
      (result as storage__file__memory__reading__result__success).value,
    );
  }

  storage__file__memory__reading__result___union //
      read({
    required final NIMR length,
    required final NIMR offset,
  }) {
    if (base__printing__ok) {
      base__function__call__print(
        "storage__file__memory.read",
        debug__label,
      );

      length.text__representation().print("length");
      offset.text__representation().print("offset");
    }

    base__printing__indentation__increase();

    final offset__new = (length + offset);

    final storage__file__memory__reading__result___union result;

    if (offset__new > length__raw) {
      result = storage__file__memory__reading__result__failure();
    } else {
      result = storage__file__memory__reading__result__success(
        array__new__element__single(
          file__segment(
            value__raw.view__partial(
              offset,
              length,
            ),
            block__id__raw: 0,
          ),
        ),
      ) /*
FIX
  move to block-wise */
          ;
    }

    base__printing__indentation__decrease();

    return result;
  }

  NIMR reserve({
    required final NIMR length,
  }) {
    final //
        offset = length__raw,
        offset__new = (length + offset);

    capacity__extend__if__needed__raw(
      offset__new,
    );

    length__raw = length;

    return offset;
  }

  void length__increase({
    required final NIMR length,
  }) {
    capacity__extend__if__needed__raw(
      length,
    );

    length__raw = length;
  }

  void length__decrease({
    final NIMR length = 0,
  }) {
    length__raw = length;
  }

  byte__array convert__byte__array() {
    final result = byte__array(
      length__raw,
    );

    base__copy(
      result,
      value__raw,
      count: length__raw,
    );

    return result;
  }

  base__compo__member__dictionary //
      members__dictionary() {
    return {
      "length": length__raw.text__representation(),
    };
  }

  @override
  void dispose() {
    if (base__printing__ok) {
      base__function__call__print(
        "storage__file__memory.dispose",
        debug__label,
      );
    }

    value__raw = empty__byte__array;
    length__raw = 0;
  }
}*/
