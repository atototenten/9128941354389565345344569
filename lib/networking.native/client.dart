part of "_.dart";

ASYN<bool> net__connect_ed___ok({
  final string host = "example.com",
}) async {
  try {
    final result = await net.InternetAddress.lookup(host);
    if (result.empty___ok().NOT && //
        result.first.rawAddress.empty___ok().NOT) {
      return TRUE;
    }
  } on net.SocketException catch (_) {
  } catch (e) {
    rethrow;
  }

  return FALSE;
}

ASYN<void> net__reliable__client__socket__close__safe(
  final net.Socket socket,
) async {
  await socket.flush();
  await socket.close();
}

ASYN<BS1__array> net__reliable__client__simple__communicate({
  required final net.InternetAddress address,
  required final INT port,
  required final BS1__array request,
}) async {
  final socket = await net.Socket.connect(
    address,
    port,
  )
    ..setOption(
      net.SocketOption.tcpNoDelay,
      TRUE,
    )
    /*..add(
       INT__convert__BS1__array__little_endian(
        request.bytes__count,
        net__request__size__size,
      ),
    )*/
    ..add(
      request,
    );

  await net__reliable__client__socket__close__safe(
    socket,
  );

  final result = await socket.convert__byte__array__asyn();

  if (printing___ok) {
    result
        .representation__text()
        .print("net__reliable__client__simple__response");
  }

  return result;
}
