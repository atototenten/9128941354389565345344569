import "package:base/base/_.dart";
import "package:base/storage.file/_.dart";

import "dart:io" as io;
import "dart:io" as net;

//

part "server.dart";
part "client.dart";

const base__net__request__size__size = INT__4__size;

final base__net__ip__local__v4 = BS1__array.fromList(
  const [127, 0, 0, 1],
);

value__asyn<bool> inet__connect_ed___ok({
  final string host = "example.com",
}) async {
  try {
    final result = await net.InternetAddress.lookup(host);
    if (result.empty__not() && result.first.rawAddress.empty__not()) {
      return OK;
    }
  } catch (e) {
    if (e is net.SocketException) {
    } else {
      rethrow;
    }
  }

  return NO;
}

string base__net__address__port__convert__text(
  final string address,
  final INT port,
) =>
    (address + char__colon + port.toString());
