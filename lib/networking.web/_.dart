import "package:foundation/core/_.dart";

import "package:http/http.dart" as http;

//

export "package:http/http.dart";
export "package:http/retry.dart";

//

part "client.dart";

const //
net__web__method__get = "GET",
    net__web__method__post = "POST",
    net__web__scheme__fix__pre = "http",
    net__web__scheme__secure__fix__pre = (net__web__scheme__fix__pre + "s");

enum net__request__results {
  //informational,
  success,
  //re_direction,
  failure /* client-side issue */,
  failure__internal /* non-{client-side} issue ,like communicat-ion ,{internal|server}-side */,
  other,
}

net__request__results //
net__web__status__code__convert__summary(
  final INT status__code,
) {
  if ((status__code == /*HttpStatus.ok*/ 200) || ((status__code > 200) && (status__code < 300))) {
    return net__request__results.success;
  } else if ((status__code == 400) || ((status__code > 400) && (status__code < 500))) {
    return net__request__results.failure;
  } else if ((status__code == 500) || ((status__code > 500) && (status__code < 600))) {
    return net__request__results.failure__internal;
  } else {
    return net__request__results.other;
  }
}
