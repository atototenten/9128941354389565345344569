part of "_.dart";

extension Stream__byte__array__extension //
    on Stream<byte__array> {
  value__asyn<byte__array> convert__byte__array__asyn() /*
forked from core APIs, hence the correct approach, as of "March, 2023" */
  {
    final //
        accumulation = base__byte__array__accumulation(),
        promise = value__asyn__meta<BS1__array>();

    listen(
      (final BS1__array data) => accumulation.add(data /*..count.representation__text().print("byteStream.listen.onData.data.count")*/),
      onError: promise.completeError,
      onDone: () => promise.complete(accumulation.convert__byte__array()),
      cancelOnError: OK,
    );

    return promise.future;
  }

  void convert__messages({
    final INT message__size__size = INT__4__size,
    required final base__message__handle__procedure<BS1__array> message__handle,
    required final dispose__procedure__format channel__close__handle,
    required final base__error__handle__proc_ channel__error__handle,
  }) {
    final accumulation = base__byte__array__accumulation();

    INT //
        count /* `left`, or remaining count */ = 0,
        data__count;

    listen(
      (BS1__array data) {
        data__count = (data..representation__text().print("\n" "stream__BS1__array.listen.onData.data")).bytes__count;

        while (OK) {
          count.representation__text().print("count");
          accumulation.bytes__count().representation__text().print("accumulation.bytes__count");

          if (count != 0) {
            "1: (count != 0)".print();

            if (data__count < count) {
              "1.1: (data__count < count)".print();

              accumulation.add(data);
              count -= data__count;

              count.representation__text().print("count.new");
              accumulation.bytes__count().representation__text().print("accumulation.bytes__count.new");

              return;
            } else {
              "1.2".print();

              accumulation.add(data.view__partial(0, count));
              message__handle(accumulation.convert__byte__array()..representation__text().print("reported"));
              accumulation.flush();
              data = data.view(count);
              data__count = (data__count - count);
              count = 0;
            }
          }

          if (count == 0) {
            "2: (count == 0)".print();

            count = (message__size__size - accumulation.bytes__count());

            if (data__count < count) {
              "2.1: (data__count < count)".print();

              accumulation.add(data);
              count = 0;

              count.representation__text().print("count.new");
              accumulation.bytes__count().representation__text().print("accumulation.bytes__count.new");

              return;
            } else {
              "2.2".print();

              accumulation.add(data.view__partial(0, count));
              data = data.view(count);
              data__count -= count;

              count = accumulation.convert__byte__array().convert__INT__endian__little(
                    message__size__size,
                  );
              accumulation.flush();
            }

            count.representation__text().print("count.new");
            accumulation.bytes__count().representation__text().print("accumulation.bytes__count.new");
          }
        }
      },
      onError: (final Object e, final StackTrace t) {
        return channel__error__handle(e, t);
      },
      onDone: channel__close__handle,
      cancelOnError: OK,
    );
  }
}

extension Stream__array__extension<data__type> //
    on Stream<data__type> {
  value__asyn<array<data__type>> //
      convert__array__asyn() {
    final //
        accumulation = base__accumulation__linear__basic<data__type>(),
        promise = value__asyn__meta<array<data__type>>();

    listen(
      (final data) => accumulation.add__ending(data),
      onError: promise.completeError,
      onDone: () => promise.complete(accumulation.convert__array()),
      cancelOnError: OK,
    );

    return promise.future;
  }
}
