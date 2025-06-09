part of "_.dart";

abstract class base__event__channel___protocol {
  void event__dispatch /* event__announce */ ();
}

abstract class base__event__handling___protocol {
  void event__handle /* event__invoke */ ();
}

//

abstract class base__event__channel__unicast___protocol /*
`description` is needed
  ,because ,otherwise `procedure__empty__format` is the implicit and only `description`
    ,and the channel can invoke only it ,because it does not accept any arg.
  one-of-the-most prominent use-case of description is `widget:tree:node:::base:graphics:dimension:2:u_:i_::build:again` */ //
    extends base__event__channel___protocol {
  BOOL description__assign(
    final event__handle__procedure__format description,
  );

  void description__assign__raw(
    final event__handle__procedure__format description,
  );

  BOOL description__equal__ok(
    final event__handle__procedure__format description,
  );

  BOOL description__remove(
    final event__handle__procedure__format description,
  );

  void description__remove__raw();
}

abstract class base__event__channel__unicast__dispose___protocol //
    extends
        base__event__channel__unicast___protocol //
    implements base__dispose___protocol {}

//

class base__event__channel__unicast //
    implements base__event__channel__unicast__dispose___protocol {
  event__handle__procedure__format? description__raw;

  @override
  BOOL description__assign(
    final event__handle__procedure__format description,
  ) {
    if (description__raw != NIL) {
      return NO;
    }

    description__assign__raw(
      description,
    );

    return OK;
  }

  @override
  void description__assign__raw(
    final event__handle__procedure__format description,
  ) {
    description__raw = description;
  }

  @override
  void event__dispatch() {
    description__raw?.call();
  }

  @override
  BOOL description__equal__ok(
    final event__handle__procedure__format description,
  ) {
    return (description == description__raw);
  }

  @override
  BOOL description__remove(
    final event__handle__procedure__format description,
  ) {
    if (description__equal__ok(
      description,
    ).not) {
      return NO;
    }

    description__remove__raw();

    return OK;
  }

  @override
  void description__remove__raw() {
    description__raw = NIL;
  }

  @override
  void dispose() {
    description__remove__raw();
  }
}

//

abstract class base__event__channel__broadcast___protocol /*
`description` is needed
  ,because ,otherwise `procedure__empty__format` is the implicit and only `description`
    ,and the channel can invoke only it ,because it does not accept any arg.
  one-of-the-most prominent use-case of description is `widget:tree:node:::base:graphics:dimension:2:u_:i_::build:again` */ //
    extends base__event__channel___protocol {
  BOOL descriptions__present__ok(
    final event__handle__procedure__format description,
  );

  void descriptions__add(final event__handle__procedure__format description);

  void descriptions__remove(final event__handle__procedure__format description);

  void descriptions__flush();
}

abstract class base__event__channel__broadcast__dispose___protocol //
    extends
        base__event__channel__broadcast___protocol //
    implements base__dispose___protocol {}

//

class base__event__channel__broadcast //
    implements base__event__channel__broadcast__dispose___protocol {
  base__event__channel__broadcast({
    this.debug__name,
  }) : descriptions__raw = base__accumulation__linear__definitive();

  final base__accumulation__linear__definitive<event__handle__procedure__format> descriptions__raw;

  final string__raw? debug__name;

  @override
  void descriptions__add(
    final event__handle__procedure__format description,
  ) {
    descriptions__raw.add__ending(
      description,
    );
  }

  @override
  BOOL descriptions__present__ok(
    final event__handle__procedure__format description,
  ) {
    var result = NO;

    descriptions__raw.iterate(
      (final id, final e) {
        if (description != e) {
          return OK;
        }

        result = OK;

        return NO;
      },
    );

    return result;
  }

  NIMR descriptions__count__raw() {
    return descriptions__raw.elements__count();
  }

  @override
  void descriptions__remove(
    final event__handle__procedure__format description,
  ) {
    descriptions__raw.iterate(
      (final id, final e) {
        if (description != e) {
          return OK;
        }

        descriptions__raw.remove__raw(
          id,
        );

        return NO;
      },
    );
  }

  @override
  void descriptions__flush() {
    descriptions__raw.flush();
  }

  @override
  void event__dispatch() {
    descriptions__raw.iterate(
      (final id, final description) {
        try {
          description();
        } catch (_, _) {}

        return OK;
      },
    );
  }

  @override
  void dispose() {
    descriptions__raw.dispose();
  }
}

//

class base__event__channels__broadcast //
    implements base__event__channel__broadcast__dispose___protocol {
  base__event__channels__broadcast(
    final array<base__event__channel__broadcast__dispose___protocol> channels,
  ) : channels__raw = channels;

  final array<base__event__channel__broadcast__dispose___protocol> channels__raw;

  void channels__iterate__raw(
    final void Function(
      base__event__channel__broadcast__dispose___protocol channel,
    )
    operate,
  ) {
    channels__raw.iterate__reverse__basic((final i, final e) => operate(e));
  }

  @override
  void descriptions__add(
    final event__handle__procedure__format description,
  ) {
    channels__iterate__raw(
      (final channel) => channel.descriptions__add(
        description,
      ),
    );
  }

  @override
  BOOL descriptions__present__ok(
    final event__handle__procedure__format description,
  ) {
    var result = NO;

    channels__iterate__raw(
      (final channel) {
        if (channel.descriptions__present__ok(
          description,
        )) {
          result = OK;
        }
      },
    );

    return result;
  }

  @override
  void descriptions__remove(
    final event__handle__procedure__format description,
  ) {
    channels__iterate__raw(
      (final channel) => channel.descriptions__remove(description),
    );
  }

  @override
  void descriptions__flush() {
    channels__iterate__raw(
      (final channel) => channel.descriptions__flush(),
    );
  }

  @override
  void event__dispatch() {
    channels__iterate__raw(
      (final channel) => channel.event__dispatch(),
    );
  }

  @override
  void dispose() {}
}

class base__event__channels__owned__broadcast //
    extends base__event__channels__broadcast {
  base__event__channels__owned__broadcast(
    super.channels,
  );

  @override
  void dispose() {
    channels__iterate__raw(
      (final channel) => channel.dispose(),
    );

    super.dispose();
  }
}

//

class base__event__channel__broadcast__periodic //
    extends base__event__channel__broadcast {
  factory base__event__channel__broadcast__periodic({
    required final NIMR time__unit__count,
    final NIMR time__interval /* in milli-seconds */ = Duration.millisecondsPerSecond,
    required final procedure__empty__format time__completion__handle /*
invoked after the saturation of `time__unit__count`
  ,like on 4th ,for 3 as `time__unit__count` */,
  }) {
    late final base__event__channel__broadcast__periodic result;

    result = base__event__channel__broadcast__periodic._(
      delay__raw: delaying__asyn.periodic(
        Duration(
          milliseconds: time__interval,
        ),
        (final _) {
          result.time__unit__count__current__raw += 1;
          if (result.time__unit__count__current__raw < time__unit__count) {
            result.event__dispatch();
          } else {
            result.delay__raw.cancel();
            time__completion__handle();
          }
        },
      ),
      time__unit__count__current__raw: 0,
    );

    return result;
  }

  base__event__channel__broadcast__periodic._({
    required this.delay__raw,
    required this.time__unit__count__current__raw,
  });

  final delaying__asyn delay__raw;

  NIMR time__unit__count__current__raw;

  NIMR time__unit__count__current() {
    return time__unit__count__current__raw;
  }

  BOOL time__unit__count__current__first__ok() {
    return (time__unit__count__current__raw == 0);
  }

  @override
  void dispose() {
    delay__raw.cancel();

    super.dispose();
  }
}
