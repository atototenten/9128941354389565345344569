part of "_.dart";

value__asyn<void> base__net__reliable__server__socket__close__safe(
  final net.Socket socket,
) async {
  await socket.flush();
  await socket.close();

  socket.destroy();
}

value__asyn<void> base__net__reliable__server__simple({
  required final net.InternetAddress
      address /*io.InternetAddress.fromRawAddress(ip__v4,type:io.InternetAddressType.IPv4)*/,
  required final INT port,
  required final value__asyn<void> Function(
          net.Socket client__socket /* must not be close-ed ,nor dispose-ed */)
      request__handle,
  final base__error__handle__proc_? request__listen__error__handle,
  final BOOL latency__low___ok = FALSE,
}) async {
  (await net.NetworkInterface.list(
    includeLoopback: TRUE,
    includeLinkLocal: TRUE,
  ))
      .iterate__basic(
    (final _, final interface) {
      interface.representation__text().print("NetworkInterface");
    },
  );

  final socket__server__central = await net.ServerSocket.bind(
    address,
    port,
  )
    ..listen(
      (final client__socket) async {
        final //
            stop_watch = Stopwatch()..start(),
            client__address = base__net__address__port__convert__text(
              client__socket.remoteAddress.address,
              client__socket.remotePort,
            );

        "client.address".print(client__address);

        if (latency__low___ok) {
          if (client__socket.setOption(net.SocketOption.tcpNoDelay, TRUE).not) {
            throw "client.socket.option.t_c_p_.no_delay.set";
          }
        }

        await request__handle(
          client__socket,
        );

        stop_watch.stop();

        await base__net__reliable__server__socket__close__safe(
          client__socket,
        );

        "served in ${stop_watch.elapsedMicroseconds} micro-seconds"
            .print(client__address);
      },
      onError: (
        final Object e,
        final StackTrace t,
      ) {
        (request__listen__error__handle ?? base__error__handle)(e, t);
      },
    );

  base__net__address__port__convert__text(
    socket__server__central.address.address,
    socket__server__central.port,
  ).representation__text().print("server.socket.address");
}

value__asyn<void>
    base__net__reliable__server__simple__file /*
request responses :`base__results__basic` */
    ({
  required final net.InternetAddress address,
  required final INT port,
  required final string directory__path,
}) {
  final //
      result__success__code__BS1__array =
          (BS1__array(1)..first = base__results__basic.success.index),
      result__failure__code__BS1__array =
          (BS1__array(1)..first = base__results__basic.failure.index),
      result__error__code__BS1__array = (BS1__array(1)
        ..first = base__results__basic.failure__internal.index);

  return base__net__reliable__server__simple(
    address: address,
    port: port,
    request__handle: (final socket) async {
      final BS1__array request;
      try {
        request = await socket.convert__byte__array__asyn();
      } catch (e, t) {
        base__error__handle(e, t);
        socket.add(result__error__code__BS1__array);
        return;
      }

      final string file__path;
      try {
        file__path = str__convert__text(
          request,
        )..representation__text()
            .print("net:server:simple:file:request:file:path");
      } catch (e, t) {
        base__error__handle(e, t);
        socket.add(result__failure__code__BS1__array);
        return;
      }

      try {
        final file = io.File(
          (directory__path + base__storage__file__path__separation__char + file__path),
        );

        if (file.existsSync().not) {
          socket.add(result__failure__code__BS1__array);
        }

        socket
          ..add(result__success__code__BS1__array)
          ..addStream(
            file.openRead(),
          );
      } catch (e, t) {
        base__error__handle(e, t);
        socket.add(result__error__code__BS1__array);
        return;
      }
    },
  );
}
