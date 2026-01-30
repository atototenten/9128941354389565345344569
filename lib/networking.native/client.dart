part of "_.dart";

ASYN<bool> base__net__connect_ed___ok({
  final string host = "example.com",
}) async {
  try {
    final result = await net.InternetAddress.lookup(host);
    if (result.empty__not() && //
        result.first.rawAddress.empty__not()) {
      return TRUE;
    }
  } on net.SocketException catch (_) {
  } catch (e) {
    rethrow;
  }

  return FALSE;
}

ASYN<void> base__net__reliable__client__socket__close__safe(
  final net.Socket socket,
) async {
  await socket.flush();
  await socket.close();
}

ASYN<BS1__array> base__net__reliable__client__simple__communicate({
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
        base__net__request__size__size,
      ),
    )*/
    ..add(
      request,
    );

  await base__net__reliable__client__socket__close__safe(
    socket,
  );

  final result = await socket.convert__byte__array__asyn();

  if (base__printing___ok) {
    result
        .representation__text()
        .print("net__reliable__client__simple__response");
  }

  return result;
}
