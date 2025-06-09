part of "_.dart";

typedef base__compo__member__dictionary = dictionary< /*member.name*/ string__raw, /*member.value*/ base__text__representation>;

abstract class base__compo__members__dictionary___protocol {
  base__compo__member__dictionary //
      members__dictionary();
}

abstract class base__compo__convert__text__representation__auto___protocol //
    implements
        base__compo__members__dictionary___protocol,
        base__convert__text__representation___protocol {
  @override
  base__text__representation //
      text__representation() {
    return compo__text__representation(
      members__dictionary(),
    );
  }
}

base__text__representation //
    base__compo__text__representation({
  required final string__raw name,
  required final base__compo__member__dictionary members,
}) {
  final buffer = StringBuffer()
    ..write(name)
    ..write("(");

  if (members.empty__not()) {
    var first__ok = OK;

    members.forEach(
      (
        final name,
        final value,
      ) {
        if (first__ok.not) {
          buffer.write(",");
        } else {
          first__ok = NO;
        }

        buffer
          ..write(".")
          ..write(name)
          ..write("=")
          ..write(value.value);
      },
    );
  }

  buffer.write(")");

  final result = buffer.toString();

  buffer.clear();

  return base__text__representation(
    result,
  );
}
