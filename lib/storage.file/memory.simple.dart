part of "_.dart";

/*class storage__file__memory__simple /*
based on byte-id. ,instead of block-id. */ //
    implements
        base__dispose___protocol {
  static const length__initial__default = NI2__limit;

  storage__file__memory__simple({
    final INT length__initial = length__initial__default,
  }) : value___raw = byte__array(
          length__initial,
        );

  byte__array value___raw;

  INT length___raw = 0;

  INT capacity___raw() {
    return value___raw.bytes__count;
  }

  INT length() {
    return length___raw;
  }

  void length__update__if__needed___raw(
    final INT offset__new /* end ,`file__length__new` */,
  ) {
    if (offset__new > length___raw) {
      length___raw = offset__new;
    }
  }

  void capacity__extend__if__needed___raw(
    final INT capacity__required,
  ) {
    base__printing__indentation__increase();

    var capacity__current = capacity___raw();

    while (capacity__current < capacity__required) {
      capacity__current *= 2;
    }

    if (capacity__current > capacity___raw()) {
      if (base__printing___ok) {
        "storage__file__memory.capacity__extend___raw: extending `storage`'s capacity, from ${capacity___raw()}, to $capacity__current".print(
          debug__label,
        );
      }

      final value__old = value___raw;

      value___raw = byte__array(
        capacity__current,
      );

      base__copy(
        value___raw,
        value__old,
        count: length___raw,
      );
    }

    base__printing__indentation__decrease();
  }

  INT write__append__blank({
    required final INT length,
  }) {
    return reserve(
      length: length,
    );
  }

  INT write__append__fill(
    final INT count, {
    final byte value = 0,
  }) {
    final offset = length___raw;

    write__fill(
      count,
      value: value,
      offset: offset,
    );

    return offset;
  }

  INT write__append(
    final byte__array value,
  ) {
    final offset = length___raw;

    write(
      value,
      offset: offset,
    );

    return offset;
  }

  void write__fill(
    final INT count, {
    final byte value = 0,
    required final INT offset,
  }) {
    final offset__new = (count + offset);

    capacity__extend__if__needed___raw(
      offset__new,
    );

    byte__array__fill(
      value___raw.view(
        offset,
      ),
      count: count,
      value: value,
    );

    length__update__if__needed___raw(
      offset__new,
    );
  }

  void write(
    final byte__array value, {
    required final INT offset,
  }) {
    if (base__printing___ok) {
      base__function__call__print(
        "storage__file__memory.write",
        debug__label,
      );

      value.bytes__count.representation__text().print("bytes__count");
      offset.representation__text().print("offset");
    }

    base__printing__indentation__increase();

    final offset__new = (value.bytes__count + offset);

    capacity__extend__if__needed___raw(
      offset__new,
    );

    base__copy(
      value___raw,
      value,
      dest__offset: offset,
    );

    length__update__if__needed___raw(
      offset__new,
    );

    base__printing__indentation__decrease();
  }

  storage__file__memory__reading__full__result //
      read__full() {
    final result = read(
      length: length___raw,
      offset: 0,
    );

    return storage__file__memory__reading__full__result(
      (result as storage__file__memory__reading__result__success).value,
    );
  }

  storage__file__memory__reading__result___union //
      read({
    required final INT length,
    required final INT offset,
  }) {
    if (base__printing___ok) {
      base__function__call__print(
        "storage__file__memory.read",
        debug__label,
      );

      length.representation__text().print("length");
      offset.representation__text().print("offset");
    }

    base__printing__indentation__increase();

    final offset__new = (length + offset);

    final storage__file__memory__reading__result___union result;

    if (offset__new > length___raw) {
      result = storage__file__memory__reading__result__failure();
    } else {
      result = storage__file__memory__reading__result__success(
        array__new__element__single(
          file__segment(
            value___raw.view__partial(
              offset,
              length,
            ),
            block__id___raw: 0,
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

  INT reserve({
    required final INT length,
  }) {
    final //
        offset = length___raw,
        offset__new = (length + offset);

    capacity__extend__if__needed___raw(
      offset__new,
    );

    length___raw = length;

    return offset;
  }

  void length__increase({
    required final INT length,
  }) {
    capacity__extend__if__needed___raw(
      length,
    );

    length___raw = length;
  }

  void length__decrease({
    final INT length = 0,
  }) {
    length___raw = length;
  }

  byte__array convert__byte__array() {
    final result = byte__array(
      length___raw,
    );

    base__copy(
      result,
      value___raw,
      count: length___raw,
    );

    return result;
  }

  base__compo__member__dictionary //
      members__dictionary() {
    return {
      "length": length___raw.representation__text(),
    };
  }

  @override
  void dispose() {
    if (base__printing___ok) {
      base__function__call__print(
        "storage__file__memory.dispose",
        debug__label,
      );
    }

    value___raw = empty__byte__array;
    length___raw = 0;
  }
}*/
