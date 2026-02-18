part of "_.dart";

ASYN<BOOL> net__connect_ed___ok({
  final string host = "example.com",
}) async {
  try {
    final result = await dart__net.InternetAddress.lookup(host);
    if (result.empty___ok().NOT && //
        result.first.rawAddress.empty___ok().NOT) {
      return TRUE;
    }
  } on dart__net.SocketException catch (_) {
  } catch (e) {
    rethrow;
  }

  return FALSE;
}

ASYN<void> net__reliable__client__socket__close__safe(
  final dart__net.Socket socket,
) async {
  await socket.flush();
  await socket.close();
}

ASYN<BS1__array> net__reliable__client__simple__communicate({
  required final dart__net.InternetAddress address,
  required final INT port,
  required final BS1__array request,
}) async {
  final socket = await dart__net.Socket.connect(
    address,
    port,
  )
    ..setOption(
      dart__net.SocketOption.tcpNoDelay,
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
