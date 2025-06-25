part of "_.dart";

extension unit__extension //
    on NI {
  magnitude__conversion__scale__faulty__result___union //
      magnitude__convert__scale__faulty() {
    final value = this;

    if (value < units__scale.kilo.magnitude) {
      return magnitude__conversion__scale__faulty__result__moot();
    }

    if (value < units__scale.mega.magnitude) {
      return magnitude__conversion__scale__faulty__result__success(
        magnitude: (value ~/ units__scale.kilo.magnitude),
        scale: units__scale.kilo,
      );
    } else if (value < units__scale.giga.magnitude) {
      return magnitude__conversion__scale__faulty__result__success(
        magnitude: (value ~/ units__scale.mega.magnitude),
        scale: units__scale.mega,
      );
    } else if (value < units__scale.tera.magnitude) {
      return magnitude__conversion__scale__faulty__result__success(
        magnitude: (value ~/ units__scale.giga.magnitude),
        scale: units__scale.giga,
      );
    } else if (value < units__scale.peta.magnitude) {
      return magnitude__conversion__scale__faulty__result__success(
        magnitude: (value ~/ units__scale.tera.magnitude),
        scale: units__scale.tera,
      );
    } else if (value < units__scale.exa.magnitude) {
      return magnitude__conversion__scale__faulty__result__success(
        magnitude: (value ~/ units__scale.peta.magnitude),
        scale: units__scale.peta,
      );
    }

    return magnitude__conversion__scale__faulty__result__failure();
  }
}

class magnitude__conversion__scale__faulty__result__success //
    implements
        magnitude__conversion__scale__faulty__result___union {
  const magnitude__conversion__scale__faulty__result__success({
    required this.magnitude,
    required this.scale,
  });

  final NI magnitude;
  final units__scale scale;

  string convert__text({
    required final unit unit,
    required final string Function(
      units__scale scale,
    ) scale__prefix,
    required final string Function(
      string magnitude,
      string scale__prefix,
      string scale__suffix,
    ) convert,
  }) {
    return convert(
      magnitude.toString(),
      scale__prefix(
        scale,
      ),
      ((magnitude > 1) //
          ? (unit.plural ?? "${unit.singular}s")
          : unit.singular),
    );
  }
}

class magnitude__conversion__scale__faulty__result__failure /*
the scale is immense
  beyond measurable ,either currently ,or absolutely */ //
    implements
        magnitude__conversion__scale__faulty__result___union {
  const magnitude__conversion__scale__faulty__result__failure();
}

class magnitude__conversion__scale__faulty__result__moot /*
the re-scaling is un-necessary
  due to the magnitude being less than the smallest scale */ //
    implements
        magnitude__conversion__scale__faulty__result___union {
  const magnitude__conversion__scale__faulty__result__moot();
}

sealed class magnitude__conversion__scale__faulty__result___union {}

const //
    units__information__bit = unit(
      singular: "bit",
      plural: NIL,
    ),
    units__information__byte = unit(
      singular: "byte",
      plural: NIL,
    );

class unit {
  const unit({
    required this.singular,
    required this.plural /* ?? `join(singular ,"s")` */,
  });

  final string singular;
  final string? plural;
}

enum units__scale /*
"Prefixes" at `web://en.wikipedia.org/wiki/International_System_of_Units` */
{
  kilo(1000),
  mega(1000 * 1000),
  giga(1000 * 1000 * 1000),
  tera(1000 * 1000 * 1000 * 1000),
  peta(1000 * 1000 * 1000 * 1000 * 1000),
  exa(1000 * 1000 * 1000 * 1000 * 1000 * 1000)
  /*,zetta
  ,yotta
  ,ronna
  ,quetta*/
  ;

  const units__scale(
    this.magnitude,
  );

  final NI magnitude;
}
