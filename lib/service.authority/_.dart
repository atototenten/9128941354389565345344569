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

  value__asyn</*service__authority__result*/ NIMR /* {deny|handle} ?? allow */> //
  resolve() /*
should be conservative ,towards allow-ing 
  ,like on error ,otherwise losing the `service__authority__source` will break the service */;
}

class service__authority__source__dummy //
    extends service__authority__source {
  const service__authority__source__dummy(
    this.data__fetch,
  );

  final NIMR Function() data__fetch;

  @override
  value__asyn<NIMR> //
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

  final string__raw world_wide_web__path;

  value__asyn<NIMR> //
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

    if ((response is! base__value__optional__present__compo<java_script__type>) || //
        (response.value is! NISR) || //
        (response.value as NISR).isNegative) {
      throw "in-valid status-code";
    }

    return (response.value as NIR);
  }

  @override
  value__asyn<NIMR> //
  resolve() async {
    return fetch();
  }
}

class service__authority__source__inet__file__git_hub //
    extends service__authority__source__inet__file {
  const service__authority__source__inet__file__git_hub(
    final string__raw user__name,
    final string__raw repository__name,
    final string__raw file__path,
  ) : super(
        "$base__net__web__scheme__fix__pre://raw.githubusercontent.com/$user__name/$repository__name/main/$file__path",
      );
}
