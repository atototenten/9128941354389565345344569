part of "_.dart";

typedef Object__nilable = Object?;

extension Object__nilable__extension //
<type extends Object__nilable> //
    on type {
  representation__text___compo //
  representation__text /*
this(global/common/general `convert__representation__text`) is required due to the dart-lang.'s type-system being dynamic/late-deterministic */ ({
    final INT elements__truncation__count__threshold /*
acts on the middle part
applicable on nested arrays and dictionaries
zero is special-case to disable truncation */ =
        INT__1__limit,
  }) {
    final value = this;

    if (value /*is Null*/ == null) {
      return Null__representation__text;
    }

    if (value is convert__representation__text___protocol) {
      value.representation__text();
    }

    {
      const elements__separation = ",";

      if (value is ARRAY<Object__nilable>) {
        final //
        buffer = StringBuffer(),
            elements__count = value.elements__count;

        buffer
          /*..write(/*value.element___type.toString()*/"Object__nilable",)*/
          ..write("array[")
          ..write(elements__count)
          ..write("](");

        if (value.empty___ok().NOT) {
          if (elements__count > elements__truncation__count__threshold) {
            final elements__truncation__count__threshold__half = (elements__truncation__count__threshold >> 1);

            value.iterate(
              (_, final value) {
                buffer
                  ..write(
                    value.representation__text(),
                  )
                  ..write(elements__separation);

                return TRUE;
              },
              count: elements__truncation__count__threshold__half,
            );

            buffer.write(static__indicate__short_en_ing);

            value.iterate(
              (_, final value) {
                buffer
                  ..write(elements__separation)
                  ..write(
                    value.representation__text(),
                  );

                return TRUE;
              },
              count: elements__truncation__count__threshold__half,
              offset: (elements__count - elements__truncation__count__threshold__half),
            );
          } else {
            buffer.write(
              value.first.representation__text(),
            );

            value.iterate(
              (_, final value) {
                buffer
                  ..write(elements__separation)
                  ..write(
                    value.representation__text(),
                  );

                return TRUE;
              },
              offset: 1,
            );
          }
        }

        buffer.write(")");

        final result = buffer.toString();

        buffer.clear();

        return representation__text___compo(result);
      }

      if (value is dictionary<Object__nilable, Object__nilable>) {
        final buffer = StringBuffer()
          ..write("dictionary[")
          ..write(value.elements__count)
          ..write("](");

        if (value.empty___ok().NOT) {
          var first___ok = TRUE;

          value.forEach(
            (
              final key,
              final value,
            ) {
              if (first___ok) {
                first___ok = FALSE;
              } else {
                buffer.write(elements__separation);
              }

              buffer
                ..write(key.representation__text())
                ..write("=")
                ..write(value.representation__text());
            },
          );
        }

        buffer.write(")");

        final result = buffer.toString();

        buffer.clear();

        return representation__text___compo(result);
      }
    }

    return representation__text___compo(
      switch (value) {
        BOOL() => (value ? "TRUE" : "FALSE"),
        INT__NEG() => "${value.isNegative.NOT ? "+" : empty___string}${value.toString()}",
        INT() => value.toString(),
        string() => "\"${value.toString()}\"",
        Enum() => value.name,
        APPROX() => "APPROX(${value.toString()})",
        Type() => value.toString(),
        INT__NEG__BIG() => "INT__NEG__BIG(${value.toString()})",
        _ => "${value.runtimeType}(${value})",
      },
    );
  }
}
