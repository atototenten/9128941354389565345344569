part of "_.dart";

/*class storage__file__memory__simple /*
based on byte-id. ,instead of block-id. */ //
    implements
        dispose___protocol {
  static const length__initial__default = INT__2__limit;

  storage__file__memory__simple({
    final INT length__initial = length__initial__default,
  }) : _value = byte__array(
          length__initial,
        );

  byte__array _value;

  INT _length = 0;

  INT capacity___raw() {
    return _value.bytes__count;
  }

  INT length() {
    return _length;
  }

  void length__update__if__needed___raw(
    final INT offset__new /* end ,`file__length__new` */,
  ) {
    if (offset__new > _length) {
      _length = offset__new;
    }
  }

  void capacity__extend__if__needed___raw(
    final INT capacity__required,
  ) {
    printing__indentation__increase();

    var capacity__current = capacity___raw();

    while (capacity__current < capacity__required) {
      capacity__current *= 2;
    }

    if (capacity__current > capacity___raw()) {
      if (printing___ok) {
        "storage__file__memory.capacity__extend___raw: extending `storage`'s capacity, from ${capacity___raw()}, to $capacity__current".print(
          label___debug,
        );
      }

      final value__old = _value;

      _value = byte__array(
        capacity__current,
      );

      copy(
        _value,
        value__old,
        count: _length,
      );
    }

    printing__indentation__decrease();
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
    final offset = _length;

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
    final offset = _length;

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
      _value.view(
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
    if (printing___ok) {
      function__call__print(
        "storage__file__memory.write",
        label___debug,
      );

      value.bytes__count.representation__text().print("bytes__count");
      offset.representation__text().print("offset");
    }

    printing__indentation__increase();

    final offset__new = (value.bytes__count + offset);

    capacity__extend__if__needed___raw(
      offset__new,
    );

    copy(
      _value,
      value,
      dest__offset: offset,
    );

    length__update__if__needed___raw(
      offset__new,
    );

    printing__indentation__decrease();
  }

  storage__file__memory__reading__full__result //
      read__full() {
    final result = read(
      length: _length,
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
    if (printing___ok) {
      function__call__print(
        "storage__file__memory.read",
        label___debug,
      );

      length.representation__text().print("length");
      offset.representation__text().print("offset");
    }

    printing__indentation__increase();

    final offset__new = (length + offset);

    final storage__file__memory__reading__result___union result;

    if (offset__new > _length) {
      result = storage__file__memory__reading__result__failure();
    } else {
      result = storage__file__memory__reading__result__success(
        ARRAY__element__single(
          file__segment(
            _value.view__partial(
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

    printing__indentation__decrease();

    return result;
  }

  INT reserve({
    required final INT length,
  }) {
    final //
        offset = _length,
        offset__new = (length + offset);

    capacity__extend__if__needed___raw(
      offset__new,
    );

    _length = length;

    return offset;
  }

  void length__increase({
    required final INT length,
  }) {
    capacity__extend__if__needed___raw(
      length,
    );

    _length = length;
  }

  void length__decrease({
    final INT length = 0,
  }) {
    _length = length;
  }

  byte__array convert__byte__array() {
    final result = byte__array(
      _length,
    );

    copy(
      result,
      _value,
      count: _length,
    );

    return result;
  }

  members___dictionary //
      member__dictionary() {
    return {
      "length": _length.representation__text(),
    };
  }

  @override
  void dispose() {
    if (printing___ok) {
      function__call__print(
        "storage__file__memory.dispose",
        label___debug,
      );
    }

    _value = empty__byte__array;
    _length = 0;
  }
}*/
