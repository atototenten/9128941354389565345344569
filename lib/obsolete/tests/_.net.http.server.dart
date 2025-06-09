part of "../_.dart";

const //
    _address__default = "127.0.0.1",
    _port__default = 8192;

void main /*
arg.s :
  - "address"(optional) 
    ,used for listen-ing 
    ,by default "127.0.0.1"
  - "port"(optional) 
    ,used for listen-ing 
    ,by default "8192"
  - "app__:address"(optional) 
    ,used for CORS 
    ,like "xyz.app/abc" 
    ,by default ,dynamic ,"request.headers.origin"
sends only 3 status-codes ,as response ,200/OK ,400/bad-request/client-issue ,500/{internal|server}-issue */
    (
  final array<string__raw> info__,
) async {
  info__.text__representation().print("information");

  final string__raw address;
  if (info__.isNotEmpty) {
    address = info__[0];
  } else {
    /*throw "address ,is required ,as 1st argument";*/
    address = _address__default;
  }

  final uu port;
  if (info__.length < 2) {
    /*throw "port ,is required ,as the 2nd argument";*/
    port = _port__default;
  } else {
    try {
      port = uu.parse(info__[1]);
    } catch (e) {
      throw "encountered error ,while parsing the port";
    }
  }

  final string__raw? app__origin;
  if (info__.length < 3) {
    app__origin =  null;
  } else {
    app__origin = info__[2];
  }

  final server = await HttpServer.bind(
    address,
    port,
  );

  server.listen(
    (final request) async {
      value__asyn<void> request__close() async {
        await request.response.flush();
        await request.response.close();
        print("\n---\n\n");
      }

      void request__response__write__java_script__object(
        final dynamic java_script__object,
      ) async {
        final result = string__convert__utf_8__bytes(
          java_script__object__convert__string(
            java_script__object,
          ),
        );

        request.response
          ..headers.add(HttpHeaders.contentLengthHeader, result.length)
          ..headers.add(HttpHeaders.contentTypeHeader, "application/json")
          ..add(result);
      }

      request.method.text__representation().print("request.method");
      request.requestedUri.text__representation().print("request.requested_uri");
      request.uri.text__representation().print("request.uri");
      print("request.headers :");
      request.headers.forEach(net__web__header__print);
      request.headers.contentType.text__representation().print("request.headers.content_type");
      request.headers.contentLength.text__representation().print("request.headers.content_length");
      request.contentLength.text__representation().print("request.content_length");
      request.coOKies.text__representation().print("request.coOKies");

      final string__raw request__body;
      try {
        (request__body = await utf_8__Stream__byte__array__convert__string(request)).text__representation().print("request.body");
      } catch (e) {
        request.response.statusCode = HttpStatus.badRequest;
        await request__close();
        return;
      }

      if (request.method == "POST") {
        final dynamic request__body_;
        try {
          (request__body_ = string__convert__java_script__object(request__body)).toString().text__representation().print("request.body.java_script:object");
        } catch (e) {
          request.response.statusCode = HttpStatus.badRequest;
          await request__close();
          return;
        }

        switch (request.uri.pathSegments[0]..text__representation().print("path:segments:first")) {
          default:
            {
              request__response__write__java_script__object(
                request__body_,
              );
            }
            break;
        }
      } else if (request.method == "OPTIONS") {
        final origin = request.headers.value("origin");
        if (origin !=  null) {
          request.response.headers
            ..add(HttpHeaders.accessControlAllowOriginHeader, (app__origin ?? origin) /* better than "*" */)
            ..add(HttpHeaders.accessControlAllowMethodsHeader, ["GET", "POST"])
            ..add(HttpHeaders.accessControlAllowHeadersHeader, HttpHeaders.contentTypeHeader);
        } else {
          request.response.statusCode = HttpStatus.badRequest;
        }
      } else {
        request.response.statusCode = HttpStatus. /*methodNotAllowed*/ badRequest;
      }

      print("request.response.headers :");
      request.response.headers.forEach(net__web__header__print);

      await request__close();
    },
  );

  "http://$address:$port".text__representation().print("listen-ing");
}

void base__net__web__header__print(
  final string__raw name,
  final List<string__raw> values,
) {
  print("  - \"$name\": \"${values.join("\",\"")}\"");
}
