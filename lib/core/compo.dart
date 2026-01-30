part of "_.dart";

typedef base__compo__member__dictionary = dictionary</*member.name*/ string, /*member.value*/ base__representation__text>;

abstract class base__compo__members__dictionary___protocol {
  base__compo__member__dictionary //
  members__dictionary();
}

abstract class base__compo__convert__representation__text__auto___protocol //
    implements base__compo__members__dictionary___protocol, base__convert__representation__text___protocol {
  @override
  base__representation__text //
  representation__text() {
    return compo__representation__text(
      members__dictionary(),
    );
  }
}

base__representation__text //
base__compo__representation__text({
  required final string name,
  required final base__compo__member__dictionary members,
}) {
  final buffer = StringBuffer()
    ..write(name)
    ..write("(");

  if (members.empty__not()) {
    var first___ok = TRUE;

    members.forEach(
      (
        final name,
        final value,
      ) {
        if (first___ok.NOT) {
          buffer.write(",");
        } else {
          first___ok = FALSE;
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

  return base__representation__text(
    result,
  );
}
