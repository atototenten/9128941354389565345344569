part of "_.dart";

typedef base__net__reliable__web__client = http.Client;

extension base__net__reliable__web__client__extension //
    on base__net__reliable__web__client {
  value__asyn<base__value__optional___union<java_script__type> /*IF response.body.text.empty absent ELSE java_script.type*/> //
  communicate__basic /*
prefer adding a `.timeout` ,to the result */ ({
    required final string__raw path /*
including protocol ,like "http://" ,service-path ,and the end-point */,
    final string__raw? authorization,
    final base__net__reliable__web__client__communication__body___union? value,
  }) async {
    if (base__printing__ok) {
      path.text__representation().print("request.path");
      value.text__representation().print("request");
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

      case base__net__reliable__web__client__communication__body__json():
        {
          headers["Content-Type"] = "application/json";
          body = java_script__object__convert__text(
            value.value,
          );
          break;
        }

      case base__net__reliable__web__client__communication__body__form():
        {
          /*headers["Content-Type"] = "application/x-www-form-urlencoded";*/ /* implicit */
          body = value.value;
          break;
        }
    }

    final //
    path__parsed = Uri.parse(
          path,
        ),
        response =
            await ((body == null)
                ? http.get(
                    path__parsed,
                  )
                : http.post(
                    path__parsed,
                    headers:
                        (headers
                            .empty__ok() //
                        ? NIL
                        : headers),
                    body: body,
                  )) /*
TASK :
  replace "http." with "this."
    once "ClientException: Connection closed before full header was received" errors are fixed */;

    if (base__printing__ok) {
      response.statusCode.text__representation().print("response.status");
    }

    final status__code__summary = base__net__web__status__code__convert__summary(
      response.statusCode,
    );

    if (status__code__summary != base__net__request__results.success) {
      throw status__code__summary;
    }

    final response__body = response.body;

    if (base__printing__ok) {
      response__body.text__representation().print("response.text");
    }

    if (response__body.empty__ok()) {
      return base__value__optional__absent__compo();
    }

    return base__value__optional__present__compo(
      text__convert__java_script__object(
        response__body,
      ),
    );
  }
}

class base__net__reliable__web__client__communication__body__json //
    implements base__net__reliable__web__client__communication__body___union {
  const base__net__reliable__web__client__communication__body__json(
    this.value,
  );

  final java_script__type value;
}

class base__net__reliable__web__client__communication__body__form //
    implements base__net__reliable__web__client__communication__body___union {
  const base__net__reliable__web__client__communication__body__form(
    this.value,
  );

  final dictionary<string__raw, /*BOOL|NE8R|string*/ Object> value;
}

extension base__net__reliable__web__client__communication__body___union__extension //
    on base__net__reliable__web__client__communication__body___union? {
  base__text__representation text__representation() {
    final this_1 = this;

    if (this_1 == null) {
      return Null__text__representation;
    }

    return switch (this_1) {
      base__net__reliable__web__client__communication__body__json() => //
      base__compo__text__representation(
        name: "base__net__reliable__web__client__communication__body__json",
        members: {
          "value": this_1.value.text__representation(),
        },
      ),
      base__net__reliable__web__client__communication__body__form() => //
      base__compo__text__representation(
        name: "base__net__reliable__web__client__communication__body__form",
        members: {
          "value": this_1.value.text__representation(),
        },
      ),
    };
  }
}

sealed class base__net__reliable__web__client__communication__body___union {}
