part of "_.dart";

typedef members___dictionary = //
    dictionary</*member.name*/ string, /*member.value*/ representation__text___compo>;

abstract class compo__members__dictionary___protocol {
  members___dictionary //
  member__dictionary();
}

representation__text___compo //
compo__representation__text({
  required final string name,
  required final members___dictionary members /*
for proxy/wrapping compo.s ,prefer "empty___string" as key for ".value" member */,
}) {
  final buffer = StringBuffer()
    ..write(name)
    ..write("(");

  if (members.empty___ok().NOT) {
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

  return representation__text___compo(result);
}
