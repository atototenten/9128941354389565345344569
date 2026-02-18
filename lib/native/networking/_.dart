import "package:foundation/core/_.dart";
import "package:foundation/storage.file/_.dart";

import "dart:io" as dart__io;
import "dart:io" as dart__net;

//

part "server.dart";
part "client.dart";

const net__request__size__size = INT__4__size;

final net__ip__local__v4 = BS1__array.fromList(
  const [127, 0, 0, 1],
);

ASYN<BOOL> inet__connect_ed___ok({
  final string host = "example.com",
}) async {
  try {
    final result = await dart__net.InternetAddress.lookup(host);
    if (result.empty___ok().NOT && result.first.rawAddress.empty___ok().NOT) {
      return TRUE;
    }
  } catch (e) {
    if (e is dart__net.SocketException) {
    } else {
      rethrow;
    }
  }

  return FALSE;
}

string net__address__port__convert__text(
  final string address,
  final INT port,
) =>
    (address + chars__colon___string + port.toString());
