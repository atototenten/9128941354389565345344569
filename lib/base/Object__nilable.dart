part of "_.dart";

typedef Object__nilable = Object?;

extension base__Object__nilable__extension //
    <type extends Object__nilable> //
    on type {
  base__text__representation //
      text__representation /*
this(global/common/general `convert__text__representation`) is required due to the dart-lang.'s type-system being dynamic/late-deterministic */
      ({
    final NIMR elements__truncation__count__threshold /*
acts on the middle part
applicable on nested arrays and dictionaries
zero is special-case to disable truncation */
    = NI1__limit,
  }) {
    final value = this;

    if (value /*is Null*/ == null) {
      return Null__text__representation;
    }

    if (value is base__convert__text__representation___protocol) {
      value.text__representation();
    }

    {
      const elements__separation = ",";

      if (value is array<Object__nilable>) {
        final //
            buffer = StringBuffer(),
            elements__count = value.elements__count;

        buffer
          /*..write(/*value.element__type.toString()*/"Object__nilable",)*/
          ..write("array[")
          ..write(elements__count)
          ..write("](");

        if (value.empty__not()) {
          if (elements__count > elements__truncation__count__threshold) {
            final elements__truncation__count__threshold__half = (elements__truncation__count__threshold >> 1);

            value.iterate__basic(
              (final _, final value) {
                buffer
                  ..write(
                    value.text__representation(),
                  )
                  ..write(elements__separation);
              },
              count: elements__truncation__count__threshold__half,
            );

            buffer.write(static__indicate__short_en_ing);

            value.iterate__basic(
              (final _, final value) {
                buffer
                  ..write(elements__separation)
                  ..write(
                    value.text__representation(),
                  );
              },
              count: elements__truncation__count__threshold__half,
              offset: (elements__count - elements__truncation__count__threshold__half),
            );
          } else {
            buffer.write(
              value.first.text__representation(),
            );

            value.iterate__basic(
              (final _, final value) {
                buffer
                  ..write(elements__separation)
                  ..write(
                    value.text__representation(),
                  );
              },
              offset: 1,
            );
          }
        }

        buffer.write(")");

        final result = buffer.toString();

        buffer.clear();

        return base__text__representation(
          result,
        );
      }

      if (value is dictionary<Object__nilable, Object__nilable>) {
        final buffer = StringBuffer()
          ..write("dictionary[")
          ..write(value.elements__count)
          ..write("](");

        if (value.empty__not()) {
          var first__ok = OK;

          value.forEach(
            (
              final key,
              final value,
            ) {
              if (first__ok) {
                first__ok = NO;
              } else {
                buffer.write(elements__separation);
              }

              buffer
                ..write(key.text__representation())
                ..write("=")
                ..write(value.text__representation());
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
    }

    return base__text__representation(
      switch (value) {
        BOOL() => (value ? "OK" : "NO"),
        NIR() => value.toString(),
        //NISR() => "NISR(${value.toString()})",
        string__raw() => "\"${value.toString()}\"",
        Enum() => value.name,
        NER() => "NER(${value.toString()})",
        Type() => value.toString(),
        NISI() => "NISI(${value.toString()})",
        _ => "${value.runtimeType}(${value})",
      },
    );
  }

  base__text__representation //
      compo__text__representation(
    final base__compo__member__dictionary members /*
for proxy/wrapping compo.s ,`empty__text` as key for `.value` member */
    ,
  ) {
    return base__compo__text__representation(
      name: runtimeType.toString(),
      members: members,
    );
  }
}
