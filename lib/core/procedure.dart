part of "_.dart";

typedef procedure__format = Function;
typedef function__format = Function;

typedef void___procedure__format = void Function();

typedef dispose___procedure__format = void___procedure__format;

void empty__procedure__empty() {}

void procedure__empty__invoke(
  final void___procedure__format proc_,
) {
  proc_();
}

typedef value__single___procedure__format<value___type> //
= void Function(value___type value);

void procedure__value__single__invoke<value___type>(
  final value__single___procedure__format<value___type> proc_,
  final value___type value,
) {
  proc_(
    value,
  );
}

class procedure__empty__complicated__meta /*
must be called ,just once ,at most ,if ever
invokation possibly leads to side-effects */ {
  procedure__empty__complicated__meta(
    final void___procedure__format value,
  ) : _value = value;

  void___procedure__format? _value;

  BOOL invoked___ok() {
    return (_value == NIL);
  }

  BOOL invoke() {
    final value = _value;

    if (value == null) {
      return FALSE;
    }

    value();

    _value = NIL;

    return TRUE;
  }
}

class procedure__empty__meta__definitive /*
`procedure__empty__container`
  ,with `._value`-management ,like [un-]safe remov-al/replac-ment
app.s :widget(of graphical-user-interface)'s [de-]init ,etc. */ //
    implements dispose___protocol {
  procedure__empty__meta__definitive() //
    : _assignment__id = 0;

  INT _assignment__id /*
mutation/generation id.
needed for safe remov-al/re-place
should only used for intra-container equality ,not inter-container
  ,because the id is container-level ,not program-level
`_id uu` is better than `_id Object`
  ,because `uu` uses ,the whole INT__8 space
    ,while `Object` uses much less than `u48`-bits
      ,also much more likeliness-of-conflict
        ,due to memory re-alloc./re-use/re-cycle */;

  ({
    INT id,
    void___procedure__format proc,
  })?
  _value;

  INT? _value__id() => //
      _value?.id;

  void___procedure__format? proc_() => //
      _value?.proc;

  INT re_place__un_safe(
    final void___procedure__format procedure__new,
  ) {
    final assignment__id = _assignment__id;

    _value = (
      id: assignment__id,
      proc: procedure__new,
    );

    _assignment__id += 1;

    return assignment__id;
  }

  INT? re_place__safe(
    final INT procedure__id /*
of currently contain-ed proc. ,not `procedure:new` */,
    final void___procedure__format procedure__new,
  ) {
    if (procedure__id != _value__id()) {
      return NIL;
    }

    return re_place__un_safe(
      procedure__new,
    );
  }

  INT re_place(
    final void___procedure__format procedure__new,
  ) => re_place__un_safe(
    procedure__new,
  );

  void re_move__un_safe() {
    _value = NIL;
  }

  BOOL /*
"FALSE" for "(proc_() = NIL)" */
  re_move__safe(
    final INT procedure__id,
  ) {
    if (procedure__id != _value__id()) {
      return FALSE;
    }

    re_move__un_safe();

    return TRUE;
  }

  BOOL re_move(
    final INT procedure__id,
  ) => re_move__safe(
    procedure__id,
  );

  BOOL invoke() /*
calls the `procedure` ,if available */ {
    final $proc_ = proc_();

    if ($proc_ == null) {
      return FALSE;
    }

    $proc_();

    return TRUE;
  }

  @override
  void dispose() {
    re_move__un_safe();
    /* `_id = 0;` is not safe */
  }
}

void procedure__empty__meta__definitive__test() /*
latest run's result :`
  (empty:procedure:empty == empty:procedure:empty) :YES\
  (empty:procedure:empty == empty:procedure:empty) :NO\
  (empty:procedure:empty == empty:procedure:empty) :YES\
  (empty:procedure:empty == empty:procedure:empty) :NO\
  (empty:procedure:empty == empty:procedure:empty) :YES\
  first.re_place: <uu|ss>0\
  (empty:procedure:empty == empty:procedure:empty) :NO\
  second.re_place: <uu|ss>0\
  (empty:procedure:empty == empty:procedure:empty) :YES\
  1st container\
  2nd container\
  (empty:procedure:empty == empty:procedure:empty) :YES\` */ {
  void check(
    final BOOL condition,
    final string title,
  ) => "$title :${(condition ? "YES" : "NO")}".print();

  check(
    (empty__procedure__empty == empty__procedure__empty),
    "(empty:procedure:empty == empty:procedure:empty)",
  );
  check(
    (() {} == () {}),
    "((){} == (){})",
  );

  final //
  first = procedure__empty__meta__definitive(),
      second = procedure__empty__meta__definitive();

  check(
    (first == first),
    "(first == first)",
  );

  check(
    (first.invoke == first.invoke),
    "(first.invoke == first.invoke)",
  );

  check(
    (first == second),
    "(first == second)",
  );

  check(
    (first.invoke == second.invoke),
    "(first.invoke == second.invoke)",
  );

  final //
  first__id = first.re_place(() {
        "1st container".print();
      })..representation__text().print("first.re_place"),
      second__id = second.re_place(() {
        "2nd container".print();
      })..representation__text().print("second.re_place");

  first
    ..invoke()
    ..re_move(first__id)
    ..invoke();
  second
    ..invoke()
    ..re_move(second__id)
    ..invoke();
}
