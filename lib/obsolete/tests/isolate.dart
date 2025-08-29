part of "../_.dart";

value__asyn<void> process(
  final SendPort port__send,
) async {
  Isolate.current.hashCode.representation__text().print("Isolate.current.hashCode");

  final ReceivePort port__receive = ReceivePort()
    ..listen(
      (final Object? message) async {
        message.representation__text().print("in.port__receive.listen.message");

        if (message is byte__array) {
          final byte__array__kampo data = byte__array__bytes__convert(message)
            ..representation__text().print(
              "in.data__decoded.original",
               null,
              OK,
            );

          port__send.send(0);
        } else if (message is ss) {
          switch (message) {
            case 1:
              Isolate.current.kill();
              break;
            default:
              throw UnimplementedError();
          }
        } else {
          throw UnimplementedError();
        }
      },
      onDone: () {
        print__info("in: KILL-ing isolate NOW");
        Isolate.current.kill();
      },
    );

  port__send.send(port__receive.sendPort);
}

value__asyn<void> main /*isolate__test*/ () async {
  Isolate.current.hashCode.representation__text().print("Isolate.current.hashCode");

  final byte__array__kampo data = byte__array__alloc(17) //
    ..representation__text().print("out.data");

  late final SendPort port__send;

  final ReceivePort port__receive = ReceivePort()
    ..listen(
      (final Object? message) async {
        print__info("out.port__receive.listen.message: $message");

        if (message is int) {
          switch (message) {
            case 0:
              data.representation__text().print(
                "out.data.new",
                 null,
                OK,
              );
              break;
            case 1:
              port__send.send(1);
              break;
            default:
              UnimplementedError();
          }
        } else if (message is SendPort) /* should be LAST, as this will only happen one-time */ {
          port__send = message//
          ..send(byte__array__convert__bytes(data));
        } else {
          throw UnimplementedError();
        }
      },
      onDone: () {
        print__info("out.port__receive.listen.onDone");
      },
    );

  final Isolate isolate = await Isolate.spawn(
    process,
    port__receive.sendPort,
  );

  mem__free(data.ptr);
}
