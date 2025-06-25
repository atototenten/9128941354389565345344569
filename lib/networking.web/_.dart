import "package:base/base/_.dart";

import "package:http/http.dart" as http;

//

export "package:http/http.dart";
export "package:http/retry.dart";

//

part "client.dart";

const //
base__net__web__method__get = "GET",
    base__net__web__method__post = "POST",
    base__net__web__scheme__fix__pre = "http",
    base__net__web__scheme__secure__fix__pre = (base__net__web__scheme__fix__pre + "s");

enum base__net__request__results {
  //informational,
  success,
  //re_direction,
  failure /* client-side issue */,
  failure__internal /* non-{client-side} issue ,like communicat-ion ,{internal|server}-side */,
  other,
}

base__net__request__results //
base__net__web__status__code__convert__summary(
  final NI status__code,
) {
  if ((status__code == /*HttpStatus.ok*/ 200) || ((status__code > 200) && (status__code < 300))) {
    return base__net__request__results.success;
  } else if ((status__code == 400) || ((status__code > 400) && (status__code < 500))) {
    return base__net__request__results.failure;
  } else if ((status__code == 500) || ((status__code > 500) && (status__code < 600))) {
    return base__net__request__results.failure__internal;
  } else {
    return base__net__request__results.other;
  }
}
