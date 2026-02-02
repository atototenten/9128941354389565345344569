part of "_.dart";

abstract class event__channel___protocol {
  void event__dispatch /* announce */ ();
}

/*abstract class event__handling___protocol {
  void event__handle /* invoke */ ();
}*/

//

typedef event__basic__handle___procedure__format = procedure__empty__format;

abstract class event__channel__unicast___protocol /*
`description` is needed
  ,because ,otherwise `procedure__empty__format` is the implicit and only `description`
    ,and the channel can invoke only it ,because it does not accept any arg.
  one-of-the-most prominent use-case of description is `widget:tree:node:::base:graphics:dimension:2:u_:i_::build:again` */ //
    extends event__channel___protocol {
  BOOL description__assign(
    final event__basic__handle___procedure__format description,
  );

  void description__assign___raw(
    final event__basic__handle___procedure__format description,
  );

  BOOL description__equal___ok(
    final event__basic__handle___procedure__format description,
  );

  BOOL description__remove(
    final event__basic__handle___procedure__format description,
  );

  void description__remove___raw();
}

abstract class event__channel__unicast__dispose___protocol //
    extends
        event__channel__unicast___protocol //
    implements dispose___protocol {}

//

class event__channel__unicast //
    implements event__channel__unicast__dispose___protocol {
  event__basic__handle___procedure__format? description___raw;

  @override
  BOOL description__assign(
    final event__basic__handle___procedure__format description,
  ) {
    if (description___raw != NIL) {
      return FALSE;
    }

    description__assign___raw(
      description,
    );

    return TRUE;
  }

  @override
  void description__assign___raw(
    final event__basic__handle___procedure__format description,
  ) {
    description___raw = description;
  }

  @override
  void event__dispatch() {
    description___raw?.call();
  }

  @override
  BOOL description__equal___ok(
    final event__basic__handle___procedure__format description,
  ) {
    return (description == description___raw);
  }

  @override
  BOOL description__remove(
    final event__basic__handle___procedure__format description,
  ) {
    if (description__equal___ok(
      description,
    ).NOT) {
      return FALSE;
    }

    description__remove___raw();

    return TRUE;
  }

  @override
  void description__remove___raw() {
    description___raw = NIL;
  }

  @override
  void dispose() {
    description__remove___raw();
  }
}

//

abstract class event__channel__broadcast___protocol /*
`description` is needed
  ,because ,otherwise `procedure__empty__format` is the implicit and only `description`
    ,and the channel can invoke only it ,because it does not accept any arg.
  one-of-the-most prominent use-case of description is `widget:tree:node:::base:graphics:dimension:2:u_:i_::build:again` */ //
    extends event__channel___protocol {
  BOOL descriptions__present___ok(
    final event__basic__handle___procedure__format description,
  );

  void descriptions__add(final event__basic__handle___procedure__format description);

  void descriptions__remove(final event__basic__handle___procedure__format description);

  void descriptions__flush();
}

abstract class event__channel__broadcast__dispose___protocol //
    extends
        event__channel__broadcast___protocol //
    implements dispose___protocol {}

//

class event__channel__broadcast //
    implements event__channel__broadcast__dispose___protocol {
  event__channel__broadcast({
    this.debug__name,
  }) : descriptions___raw = accumulation__linear__definitive___compo();

  final accumulation__linear__definitive___compo<event__basic__handle___procedure__format> descriptions___raw;

  final string? debug__name;

  @override
  void descriptions__add(
    final event__basic__handle___procedure__format description,
  ) {
    descriptions___raw.add__ending(
      description,
    );
  }

  @override
  BOOL descriptions__present___ok(
    final event__basic__handle___procedure__format description,
  ) {
    var result = FALSE;

    descriptions___raw.iterate(
      (final id, final e) {
        if (description != e) {
          return TRUE;
        }

        result = TRUE;

        return FALSE;
      },
    );

    return result;
  }

  INT descriptions__count___raw() {
    return descriptions___raw.elements__count();
  }

  @override
  void descriptions__remove(
    final event__basic__handle___procedure__format description,
  ) {
    descriptions___raw.iterate(
      (final id, final e) {
        if (description != e) {
          return TRUE;
        }

        descriptions___raw.remove(id);

        return FALSE;
      },
    );
  }

  @override
  void descriptions__flush() {
    descriptions___raw.flush();
  }

  @override
  void event__dispatch() {
    descriptions___raw.iterate(
      (final id, final description) {
        try {
          description();
        } catch (_) {}

        return TRUE;
      },
    );
  }

  @override
  void dispose() {
    descriptions___raw.dispose();
  }
}

//

class event__channels__broadcast //
    implements event__channel__broadcast__dispose___protocol {
  event__channels__broadcast(
    final ARRAY<event__channel__broadcast__dispose___protocol> channels,
  ) : _channels = channels;

  final ARRAY<event__channel__broadcast__dispose___protocol> _channels;

  @override
  void dispose() {}

  void channels__iterate___raw(
    final void Function(
      event__channel__broadcast__dispose___protocol channel,
    )
    operate,
  ) {
    _channels.iterate__reverse(
      (final i, final e) {
        operate(e);

        return TRUE;
      },
    );
  }

  @override
  void descriptions__add(
    final event__basic__handle___procedure__format description,
  ) {
    channels__iterate___raw(
      (final channel) => channel.descriptions__add(
        description,
      ),
    );
  }

  @override
  BOOL descriptions__present___ok(
    final event__basic__handle___procedure__format description,
  ) {
    var result = FALSE;

    channels__iterate___raw(
      (final channel) {
        if (channel.descriptions__present___ok(
          description,
        )) {
          result = TRUE;
        }
      },
    );

    return result;
  }

  @override
  void descriptions__remove(
    final event__basic__handle___procedure__format description,
  ) {
    channels__iterate___raw(
      (final channel) => channel.descriptions__remove(description),
    );
  }

  @override
  void descriptions__flush() {
    channels__iterate___raw(
      (final channel) => channel.descriptions__flush(),
    );
  }

  @override
  void event__dispatch() {
    channels__iterate___raw(
      (final channel) => channel.event__dispatch(),
    );
  }
}

class event__channels__owned__broadcast //
    extends event__channels__broadcast {
  event__channels__owned__broadcast(
    super.channels,
  );

  @override
  void dispose() {
    channels__iterate___raw(
      (final channel) => channel.dispose(),
    );

    super.dispose();
  }
}

//

class event__channel__broadcast__periodic //
    extends event__channel__broadcast {
  event__channel__broadcast__periodic({
    required this.time__unit__count,
    final INT time__interval /* in milli-seconds */ = date_time.duration__second__seconds__milli,
    required final procedure__empty__format completion__handle /*
invoked after the saturation of "time__unit__count"
  ,like on 4th ,for 3 as "time__unit__count" */,
  }) : _time__unit__count__current = time__unit__count {
    _delaying = DELAYING.periodic(
      Duration(
        milliseconds: time__interval,
      ),
      (_) {
        final valid___ok = (_time__unit__count__current > 0);
        _time__unit__count__current -= 1;

        if (valid___ok) {
          event__dispatch();
          return;
        }

        _delaying.cancel();
        completion__handle();
      },
    );
  }

  final INT time__unit__count;

  late final DELAYING _delaying;

  INT _time__unit__count__current;

  INT time__unit__count__remaining() {
    return _time__unit__count__current;
  }

  INT time__unit__count__current() {
    return (time__unit__count - _time__unit__count__current);
  }

  BOOL time__unit__count__current__final___ok() {
    return (_time__unit__count__current == 0);
  }

  @override
  void dispose() {
    _delaying.cancel();

    super.dispose();
  }
}
