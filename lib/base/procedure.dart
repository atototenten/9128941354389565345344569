part of "_.dart";

typedef procedure__format = Function;
typedef function__format = Function;

typedef procedure__empty__format = void Function();
typedef procedure__empty__asyn__format = value__asyn<void> Function();

typedef event__handle__procedure__format = procedure__empty__format;

typedef dispose__procedure__format = procedure__empty__format;
typedef dispose__asyn__procedure__format = procedure__empty__asyn__format;

void base__empty__procedure__empty() {}

void base__procedure__empty__invoke(
  final procedure__empty__format proc_,
) {
  proc_();
}

typedef base__value__single__procedure__format<value__type> //
    = void Function(value__type value);

void base__procedure__value__single__invoke<value__type>(
  final base__value__single__procedure__format<value__type> proc_,
  final value__type value,
) {
  proc_(
    value,
  );
}

class base__procedure__empty__complicated__meta /*
must be called ,just once ,at most ,if ever
invokation possibly leads to side-effects */
{
  base__procedure__empty__complicated__meta(
    final procedure__empty__format value,
  ) : value__raw = value;

  procedure__empty__format? value__raw;

  BOOL invoked__ok() {
    return (value__raw == NIL);
  }

  BOOL invoke() {
    final value = value__raw;

    if (value == null) {
      return NO;
    }

    value();

    value__raw = NIL;

    return OK;
  }
}

class base__procedure__empty__meta__definitive /*
`procedure__empty__container` 
  ,with `._value`-management ,like [un-]safe remov-al/replac-ment
app.s :widget(of graphical-user-interface)'s [de-]init ,etc. */ //
    implements
        base__dispose___protocol {
  base__procedure__empty__meta__definitive() //
      : assignment__id__raw = 0;

  NIMR assignment__id__raw /*
mutation/generation id.
needed for safe remov-al/re-place
should only used for intra-container equality ,not inter-container 
  ,because the id is container-level ,not program-level
`_id uu` is better than `_id Object` 
  ,because `uu` uses ,the whole NI8R space 
    ,while `Object` uses much less than `u48`-bits 
      ,also much more likeliness-of-conflict 
        ,due to memory re-alloc./re-use/re-cycle */
      ;

  ({
    NIMR id,
    procedure__empty__format proc,
  })? value__raw;

  NIMR? _value__id() => //
      value__raw?.id;

  procedure__empty__format? proc_() => //
      value__raw?.proc;

  NIMR re_place__un_safe(
    final procedure__empty__format procedure__new,
  ) {
    final $id = assignment__id__raw++;

    value__raw = (
      id: $id,
      proc: procedure__new,
    );

    return $id;
  }

  NIMR? re_place__safe(
    final NIMR procedure__id /*
of currently contain-ed proc. ,not `procedure:new` */
    ,
    final procedure__empty__format procedure__new,
  ) {
    if (procedure__id != _value__id()) {
      return NIL;
    }

    return re_place__un_safe(
      procedure__new,
    );
  }

  NIMR re_place(
    final procedure__empty__format procedure__new,
  ) =>
      re_place__un_safe(
        procedure__new,
      );

  void re_move__un_safe() {
    value__raw = NIL;
  }

  BOOL /*
`NO` for `(proc_()==NIL)` */
      re_move__safe(
    final NIMR procedure__id,
  ) {
    if (procedure__id != _value__id()) {
      return NO;
    }

    re_move__un_safe();

    return OK;
  }

  BOOL re_move(
    final NIMR procedure__id,
  ) =>
      re_move__safe(
        procedure__id,
      );

  BOOL invoke() /*
calls the `procedure` ,if available */
  {
    final $proc_ = proc_();

    if ($proc_ == null) {
      return NO;
    }

    $proc_();

    return OK;
  }

  @override
  void dispose() {
    re_move__un_safe();
    /* `_id = 0;` is not safe */
  }
}

void base__procedure__empty__meta__definitive__test() /*
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
  (empty:procedure:empty == empty:procedure:empty) :YES\` */
{
  void check(
    final BOOL condition,
    final string__raw title,
  ) =>
      "$title :${(condition ? "YES" : "NO")}".print();

  check(
    (base__empty__procedure__empty == base__empty__procedure__empty),
    "(empty:procedure:empty == empty:procedure:empty)",
  );
  check(
    (() {} == () {}),
    "((){} == (){})",
  );

  final //
      first = base__procedure__empty__meta__definitive(),
      second = base__procedure__empty__meta__definitive();

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
      })
        ..text__representation().print("first.re_place"),
      second__id = second.re_place(() {
        "2nd container".print();
      })
        ..text__representation().print("second.re_place");

  first
    ..invoke()
    ..re_move(first__id)
    ..invoke();
  second
    ..invoke()
    ..re_move(second__id)
    ..invoke();
}
