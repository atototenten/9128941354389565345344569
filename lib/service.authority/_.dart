import "package:base/base/_.dart";
import "package:base/networking.web/_.dart";

/*abstract class service__authority__result {
  const service__authority__result();
}

class service__authority__result__allow //
    extends service__authority__result {
  const service__authority__result__allow();
}

class service__authority__result__deny //
    extends service__authority__result {
  const service__authority__result__deny(
    this.data,
  );

  final BS1__array data;
}*/

//

abstract class service__authority__source {
  const service__authority__source();

  value__asyn</*service__authority__result*/base__value__optional___union<java_script__type>/* {deny|handle} ?? allow */> //
  resolve() /*
should be conservative ,towards allow-ing 
  ,like on error ,otherwise losing the `service__authority__source` will break the service */;
}

class service__authority__source__dummy //
    extends service__authority__source {
  const service__authority__source__dummy(
    this.data__fetch,
  );

  final base__value__optional___union<java_script__type> Function() data__fetch;

  @override
  value__asyn<base__value__optional___union<java_script__type>> //
  resolve() {
    return value__asyn.value(
      data__fetch(),
    );
  }
}

class service__authority__source__inet__file //
    extends service__authority__source {
  const service__authority__source__inet__file(
    this.world_wide_web__path,
  );

  final string world_wide_web__path;

  value__asyn<base__value__optional___union<java_script__type>> //
  fetch() async {
    final base__value__optional___union<java_script__type> response;
    {
      final client = base__net__reliable__web__client();
      try {
        response = await client.communicate__basic(
          path: world_wide_web__path,
        );
      } finally {
        client.close();
        client.dispose();
      }
    }

    return response;
  }

  @override
  value__asyn<base__value__optional___union<java_script__type>> //
  resolve() async {
    return fetch();
  }
}

class service__authority__source__inet__file__git_hub //
    extends service__authority__source__inet__file {
  const service__authority__source__inet__file__git_hub(
    final string user__name,
    final string repository__name,
    final string file__path,
  ) : super(
        "$base__net__web__scheme__fix__pre://raw.githubusercontent.com/$user__name/$repository__name/main/$file__path",
      );
}
