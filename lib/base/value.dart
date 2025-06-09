part of "_.dart";

extension base__value__disposal__extension //
<value__type extends Object> //
    on value__type {
  void dispose() {}
}

class base__value__lazy__compo<value___type> {
  base__value__lazy__compo({
    required this.value__fetch,
  }) : value___raw = base__value__optional__absent__compo();

  final value___type Function() value__fetch;

  base__value__optional___union<value___type> value___raw;

  value___type value() {
    final value = value___raw;

    return switch (value) {
      base__value__optional__present__compo<value___type>() => value.value,
      base__value__optional__absent__compo<value___type>() => value__fetch(),
    };
  }

  void flush() {
    value___raw = base__value__optional__absent__compo();
  }
}

//

class base__value__optional__present__compo<value___type> //
    implements
        base__value__optional___union<value___type> {
  const base__value__optional__present__compo(
    this.value,
  );

  final value___type value;
}

class base__value__optional__absent__compo<value___type> //
    implements
        base__value__optional___union<value___type> {
  const base__value__optional__absent__compo();
}

sealed class base__value__optional___union<value___type> {}

//

abstract class base__value__equality__check___protocol {
  BOOL equal__ok /*
prefer `value__nilable__equal__ok` for nil-able values */
      (
    final base__value__equality__check___protocol /*
not generic-type (`value__type`)
  ,just because of the dart-lang.'s deficiency
    ,of not allowing accessing the current-type's introspection
must be same as the impl.ion itself */
        other,
  );
}

extension base__value__equality__check__extension //
    <value__type extends base__value__equality__check___protocol> //
    on value__type? {
  BOOL value__nilable__equal__ok(
    final value__type? other,
  ) {
    final value = this;

    /*if ((value == null) && //
        (other == null)) {
      return OK;
    }

    if /*(((value == null) && (other != null)) || ((value != null) && (other == null)))*/ //
        ((value == null) || //
            (other == null)) {
      return NO;
    }*/

    if (value == null) {
      return (other == null);
    } else if (other == null) {
      return NO;
    }

    return value.equal__ok(
      other,
    );
  }
}

class base__value__proxy /*
like c[++]'s pointer */ //
    <value__type extends Object?> {
  base__value__proxy(this.value);

  value__type value;
}

typedef base__value__equal__ok__function__format //
    <value__type, value__other__type>
    = BOOL Function(
  value__type value,
  value__other__type other,
);

BOOL base__value__same__ok //
    <value__type>(
  final value__type value,
  final value__type other,
) {
  return identical(
    value,
    other,
  );
}

BOOL base__value__equal__ok //
    <value__type extends Object>(
  final value__type value,
  final value__type other,
) {
  return (value == other);
}

BOOL base__value__nilable__equal__ok //
    <value__type extends Object>(
  final value__type? value,
  final value__type? other, {
  final base__value__equal__ok__function__format<value__type, value__type>? value__equal__ok,
}) {
  if ((value == null) && //
      (other == null)) {
    return OK;
  }

  if /*(((value == null) && (other != null)) || ((value != null) && (other == null)))*/ //
      ((value == null) || //
          (other == null)) {
    return NO;
  }

  if /*F*/ (value__equal__ok == null) {
    return (value == other);
  }

  return value__equal__ok(
    value,
    other,
  );
}

base__text__representation //
    base__value__convert__text__representation //
    <value__type extends Object>(
  final value__type value,
) {
  return value.text__representation();
}

base__text__representation //
    base__value__nilable__convert__text__representation //
    <value__type extends Object?>(
  final value__type value,
) {
  return value.text__representation();
}

//

abstract class base__value__mutation__event__channel___protocol //
    <value__type> //
    implements
        base__event__channel___protocol {
  value__type value();

  void value__mutate(
    final value__type value__new,
  );

  void value__mutation__dispatch(
    final value__type value__new,
  );
}

//

abstract class base__value__mutation__event__channel__unicast__dispose___protocol //
    <value__type> //
    implements
        base__value__mutation__event__channel___protocol<value__type>,
        base__event__channel__unicast__dispose___protocol {}

class base__value__mutation__event__channel__unicast //
    <value__type> /*
`observer` management is all direct */ //
    extends base__event__channel__unicast //
    implements
        base__value__mutation__event__channel__unicast__dispose___protocol<value__type> {
  base__value__mutation__event__channel__unicast(
    this.value__raw,
    /*{ super.debug__name, }*/
  );

  value__type value__raw;

  @override
  value__type value() {
    return value__raw;
  }

  @override
  void value__mutate(
    final value__type value__new,
  ) {
    value__raw = value__new;
  }

  @override
  void value__mutation__dispatch(
    final value__type value__new,
  ) {
    value__mutate(
      value__new,
    );

    event__dispatch();
  }
}

//

abstract class base__value__mutation__event__channel__broadcast__dispose___protocol //
    <value__type> //
    implements
        base__value__mutation__event__channel___protocol<value__type>,
        base__event__channel__broadcast__dispose___protocol {}

class base__value__mutation__event__channel__broadcast //
    <value__type> /*
like `dart:flutter:ValueNotifier` */ //
    extends base__event__channel__broadcast //
    implements
        base__value__mutation__event__channel__broadcast__dispose___protocol<value__type> {
  base__value__mutation__event__channel__broadcast(
    this.value__raw, {
    super.debug__name,
  });

  value__type value__raw;

  @override
  value__type value() {
    return value__raw;
  }

  @override
  void value__mutate(
    final value__type value__new,
  ) {
    value__raw = value__new;
  }

  @override
  void value__mutation__dispatch(
    final value__type value__new,
  ) {
    value__mutate(
      value__new,
    );

    event__dispatch();
  }
}

typedef base__value__channel__broadcast__handling__format<value__type> = //
    base__value__single__procedure__format<value__type>;

class base__value__channel__broadcast<value__type> //
    implements
        base__dispose___protocol {
  base__value__channel__broadcast() //
      : handlings__raw = base__accumulation__linear__basic();

  final base__accumulation__linear__basic<base__value__channel__broadcast__handling__format<value__type>> handlings__raw;

  void value__handle(
    final base__value__channel__broadcast__handling__format<value__type> handle,
  ) {
    handlings__raw.add__ending(
      handle,
    );
  }

  void value__dispatch(
    final value__type value,
  ) {
    handlings__raw.iterate(
      (final id, final handle) {
        handle(
          value,
        );

        return OK;
      },
    );
  }

  @override
  void dispose() {
    handlings__raw.dispose();
  }
}

//

/* extension base__value__mutation__event__channel__broadcast__extension //
    on base__value__mutation__event__channel__broadcast<string__raw, NIMR> {
  void test() {
    void announce(
      final string__raw value,
    ) {
      value__alter__and__announce__safe(value);
      "announc-ed $value".print();
    }

    procedure__empty__format proc_(
      final string__raw title,
      final NIMR id,
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

  void f(final _) => print__info(0);
  broadcast.observer__add(f);

  print_();

  void f1(final _) => print__info(1);
  broadcast.observer__add(f1);

  void f2(final _) => print__info(2);
  broadcast.observer__add(f2);

  void f3(final _) => print__info(3);
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
