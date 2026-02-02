part of "_.dart";

extension value__disposal__extension //
<value___type extends Object> //
    on value___type {
  void dispose() {
    final value = this;
    if (value is dispose___protocol) {
      value.dispose();
    }
  }
}

class value__lazy___compo<value___type> {
  value__lazy___compo({
    required this.value__fetch,
  }) : _value = value__optional__absent__compo<value___type>();

  final value___type Function() value__fetch;

  value__optional___union<value___type> _value;

  value___type value() {
    final value = _value;

    switch (value) {
      case value__optional__present__compo<value___type>():
        return value.value;

      case value__optional__absent__compo<value___type>():
        {
          final value = value__fetch();

          _value = value__optional__present__compo(value);

          return value;
        }
    }
  }

  void flush() {
    _value = value__optional__absent__compo<value___type>();
  }
}

class value__lazy__compact___compo<value___type> {
  value__lazy__compact___compo({
    required final value___type Function() value__fetch,
  }) : _value__fetch = value__fetch;

  value___type Function()? _value__fetch;
  late final value___type _value;

  value___type value() {
    final value__fetch = _value__fetch;

    if (value__fetch == null) {
      return _value;
    }

    _value = value__fetch();

    _value__fetch = NIL;

    return _value;
  }
}

//

class value__optional__present__compo<value___type> //
    implements value__optional___union<value___type> {
  const value__optional__present__compo(
    this.value,
  );

  final value___type value;
}

class value__optional__absent__compo<value___type> //
    implements value__optional___union<value___type> {
  const value__optional__absent__compo();
}

sealed class value__optional___union<value___type> {}

//

abstract class value__equality__check___protocol {
  BOOL equal___ok /*
prefer `value__nilable__equal__ok` for nil-able values */ (
    final value__equality__check___protocol /*
not generic-type (`value__type`)
  ,just because of the dart-lang.'s deficiency
    ,of not allowing accessing the current-type's introspection
must be same as the impl.ion itself */
    other,
  );
}

extension value__equality__check__extension //
<value___type extends value__equality__check___protocol> //
    on value___type? {
  BOOL value__nilable__equal___ok(final value___type? other) {
    final value = this;

    /*if ((value == null) && //
        (other == null)) {
      return TRUE;
    }

    if /*(((value == null) && (other != null)) || ((value != null) && (other == null)))*/ //
        ((value == null) || //
            (other == null)) {
      return FALSE;
    }*/

    if (value == null) {
      return (other == null);
    } else if (other == null) {
      return FALSE;
    }

    return value.equal___ok(
      other,
    );
  }
}

class value__proxy /*
like c[++]'s pointer */ //
<value___type extends Object?> {
  value__proxy(this.value);

  value___type value;
}

typedef value__equality__function__closure__format<value___type> = //
    BOOL Function(value___type);

typedef value__equality__function__format //
<value___type, value__other__type> =
    BOOL Function(
      value___type value,
      value__other__type other,
    );

BOOL value__same___ok //
<value___type>(
  final value___type value,
  final value___type other,
) {
  return identical(value, other);
}

BOOL value__equal__deep___ok(
  final Object__nilable value,
  final Object__nilable other,
) {
  return DeepCollectionEquality().equals(value, other);
}

BOOL value__equal___ok //
<value___type extends Object>(
  final value___type value,
  final value___type other,
) {
  return (value == other);
}

BOOL value__nilable__equal___ok //
<value___type extends Object>(
  final value___type? value,
  final value___type? other, {
  final value__equality__function__format<value___type, value___type>? value__equal___ok,
}) {
  if ((value == null) && //
      (other == null)) {
    return TRUE;
  }

  if /*(((value == null) && (other != null)) || ((value != null) && (other == null)))*/ //
  ((value == null) || //
      (other == null)) {
    return FALSE;
  }

  if /*F*/ (value__equal___ok == null) {
    return (value == other);
  }

  return value__equal___ok(value, other);
}

representation__text___compo //
value__convert__representation__text___compo //
<value___type extends Object>(
  final value___type value,
) {
  return value.representation__text();
}

representation__text___compo //
value__nilable__convert__representation__text___compo //
<value___type extends Object?>(
  final value___type value,
) {
  return value.representation__text();
}

//

abstract class value__mutation__event__channel___protocol //
<value___type> //
    implements event__channel___protocol {
  value___type value();

  void value__mutate(
    final value___type value__new,
  );

  void value__mutation__dispatch(
    final value___type value__new,
  );
}

//

abstract class value__mutation__event__channel__unicast__dispose___protocol //
<value___type> //
    implements value__mutation__event__channel___protocol<value___type>, event__channel__unicast__dispose___protocol {}

class value__mutation__event__channel__unicast //
<value___type> /*
`observer` management is all direct */ //
    extends
        event__channel__unicast //
    implements value__mutation__event__channel__unicast__dispose___protocol<value___type> {
  value__mutation__event__channel__unicast(
    this.value___raw,
    /*{ super.debug__name, }*/
  );

  value___type value___raw;

  @override
  value___type value() {
    return value___raw;
  }

  @override
  void value__mutate(
    final value___type value__new,
  ) {
    value___raw = value__new;
  }

  @override
  void value__mutation__dispatch(
    final value___type value__new,
  ) {
    value__mutate(
      value__new,
    );

    event__dispatch();
  }
}

//

abstract class value__mutation__event__channel__broadcast__dispose___protocol //
<value___type> //
    implements value__mutation__event__channel___protocol<value___type>, event__channel__broadcast__dispose___protocol {}

class value__mutation__event__channel__broadcast //
<value___type> /*
like `dart:flutter:ValueNotifier` */ //
    extends
        event__channel__broadcast //
    implements value__mutation__event__channel__broadcast__dispose___protocol<value___type> {
  value__mutation__event__channel__broadcast(
    this.value___raw, {
    super.debug__name,
  });

  value___type value___raw;

  @override
  value___type value() {
    return value___raw;
  }

  @override
  void value__mutate(
    final value___type value__new,
  ) {
    value___raw = value__new;
  }

  @override
  void value__mutation__dispatch(
    final value___type value__new,
  ) {
    value__mutate(
      value__new,
    );

    event__dispatch();
  }
}

typedef value__channel__broadcast__handling__format<value___type> = //
    value__single___procedure__format<value___type>;

abstract class value__channel__broadcast___protocol<value___type> {
  void value__handle(final value__channel__broadcast__handling__format<value___type> handle);

  void value__handling__cancel(final value__channel__broadcast__handling__format<value___type> handle);
}

class value__channel__broadcast<value___type> //
    implements
        value__channel__broadcast___protocol<value___type>, //
        dispose___protocol {
  value__channel__broadcast() //
    : _handlings = accumulation__linear__definitive___compo();

  final accumulation__linear__definitive___compo<value__channel__broadcast__handling__format<value___type>> _handlings;

  @override
  void dispose() {
    _handlings.dispose();
  }

  @override
  void value__handle(final value__channel__broadcast__handling__format<value___type> handle) {
    _handlings.add__ending(handle);
  }

  @override
  void value__handling__cancel(final value__channel__broadcast__handling__format<value___type> handle) {
    final element__id = _handlings.search(handle, value__equal___ok);

    if (element__id == null) {
      throw Exception();
    }

    _handlings.remove(element__id);
  }

  void value__dispatch(final value___type value) {
    _handlings.iterate(
      (final id, final handle) {
        handle(
          value,
        );

        return TRUE;
      },
    );
  }
}

//

/* extension value__mutation__event__channel__broadcast__extension //
    on value__mutation__event__channel__broadcast<string, NIMR> {
  void test() {
    void announce(
      final string value,
    ) {
      value__alter__and__announce__safe(value);
      "announc-ed $value".print();
    }

    procedure__empty__format proc_(
      final string title,
      final INT id,
    ) =>
        () => "$title:listen_er :listened ${value()}".print(id.toString());

    final //
        first__listen_er = procedure__empty__container__definitive(),
        second__listen_er = procedure__empty__container__definitive();

    descriptions__add(first__listen_er);
    descriptions__add(second__listen_er);

    final //
        first__id = first__listen_er.re_place(proc_("first", 0)),
        second__id = second__listen_er.re_place(proc_("second", 0));

    announce(111);

    final //
        $first__id = first__listen_er.re_place(proc_("first", 1)),
        $second__id = second__listen_er.re_place(proc_("second", 1));

    announce(333);

    first__listen_er.re_move(first__id);
    second__listen_er.re_move(second__id);

    announce(
        666); /*
NOTE :
  listen-ing was working as before ,and the `re_move` had no action
    ,because `*__id_` ,have been expired(become obsolete) ,and replaced with `$*__id_` */

    first__listen_er.re_move($first__id);
    second__listen_er.re_move($second__id);

    announce(999);

    descriptions__remove(first__listen_er);
    descriptions__remove(second__listen_er);

    announce(101010);
  }
} */

/*void broadcast__test() {
  final broadcast = broadcast<void>(
    error__handle,
    () => //
        print__info("broadcast.close()"),
  );

  void print_() => //
      broadcast.message__announce(null);

  print_();

  void f(_) => print__info(0);
  broadcast.observer__add(f);

  print_();

  void f1(_) => print__info(1);
  broadcast.observer__add(f1);

  void f2(_) => print__info(2);
  broadcast.observer__add(f2);

  void f3(_) => print__info(3);
  broadcast.observer__add(f3);

  print_();

  broadcast.observer__remove(f2 /* middle element */);
  print_();

  broadcast.observer__remove(f3 /* last element */);
  print_();

  broadcast.observer__remove(f /* first element */);
  print_();

  broadcast.observer__remove(f1 /* ONLY element */);
  print_();
}*/
