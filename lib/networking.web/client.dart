part of "_.dart";

typedef net__reliable__web__client = http.Client;

extension net__reliable__web__client__extension //
    on net__reliable__web__client {
  ASYN<value__optional___union<java_script__type> /*IF response.body.text.empty absent ELSE java_script.type*/> //
  communicate__basic /*
prefer adding a `.timeout` ,to the result */ ({
    required final string path /*
including protocol ,like "http://" ,service-path ,and the end-point */,
    final string? authorization,
    final net__reliable__web__client__communication__body___union? value,
  }) async {
    if (printing___ok) {
      path.representation__text().print("request.path");
      value.representation__text().print("request");
    }

    final headers = <String, String>{
      if (authorization != null) //
        "Authorization": authorization,
    };

    final Object? body;

    switch (value) {
      case null:
        {
          body = NIL;
          break;
        }

      case net__reliable__web__client__communication__body__json():
        {
          headers["Content-Type"] = "application/json";
          body = java_script__type__convert__text(
            value.value,
          );
          break;
        }

      case net__reliable__web__client__communication__body__form():
        {
          /*headers["Content-Type"] = "application/x-www-form-urlencoded";*/ /* implicit */
          body = value.value;
          break;
        }
    }

    final http.Response response;
    {
      final //
      path__parsed = Uri.parse(path),
          headers__argument =
              (headers
                  .empty___ok() //
              ? NIL
              : headers);

      response =
          await ((body == null)
              ? http.get(
                  path__parsed,
                  headers: headers__argument,
                )
              : http.post(
                  path__parsed,
                  headers: headers__argument,
                  body: body,
                )) /*
TASK :
  replace "http." with "this."
    once "ClientException: Connection closed before full header was received" errors are fixed ,by the dart-team */;
    }

    if (printing___ok) {
      response.statusCode.representation__text().print("response.status");
    }

    final status__code__summary = net__web__status__code__convert__summary(response.statusCode);

    if (status__code__summary != net__request__results.success) {
      throw status__code__summary;
    }

    final response__body = response.body;

    if (printing___ok) {
      response__body.representation__text().print("response.text");
    }

    if (response__body.empty___ok()) {
      return value__optional__absent__compo();
    }

    return value__optional__present__compo(
      /*Isolate.run(() => Utf8Decoder().fuse(JsonDecoder()).convert(response.bodyBytes))*/ text__convert__java_script__type(
        response__body,
      ),
    );
  }
}

class net__reliable__web__client__communication__body__json //
    implements net__reliable__web__client__communication__body___union {
  const net__reliable__web__client__communication__body__json(
    this.value,
  );

  final java_script__type value;
}

class net__reliable__web__client__communication__body__form //
    implements net__reliable__web__client__communication__body___union {
  const net__reliable__web__client__communication__body__form(
    this.value,
  );

  final dictionary<string, /*BOOL|APPROX|string*/ Object> value;
}

extension net__reliable__web__client__communication__body___union__extension //
    on net__reliable__web__client__communication__body___union? {
  representation__text___compo //
  representation__text() {
    final this_1 = this;

    if (this_1 == null) {
      return Null__representation__text;
    }

    return switch (this_1) {
      net__reliable__web__client__communication__body__json() => //
      compo__representation__text(
        name: "net__reliable__web__client__communication__body__json",
        members: {
          "value": this_1.value.representation__text(),
        },
      ),
      net__reliable__web__client__communication__body__form() => //
      compo__representation__text(
        name: "net__reliable__web__client__communication__body__form",
        members: {
          "value": this_1.value.representation__text(),
        },
      ),
    };
  }
}

sealed class net__reliable__web__client__communication__body___union {}
