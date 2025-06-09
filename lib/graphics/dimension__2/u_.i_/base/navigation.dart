part of "_.dart";

extension navigation__extension //
    on
        gui__base__widget__building__context /*
{`dismiss`|`depart_ure`|`de_init_`|`dispose`}`:handle` can be achieved by ,`::handle`-ing the `navigate:forward:`* `return`-ed `async_:value` ,then calling the proc. */ {
  value__asyn<void> //
  navigate__forward__overlay /*
application :en-large-ing an image */ //
  <entity__type extends gui__base__entity__overlay___compo>({
    final BOOL navigation__root__ok = NO,
    final Color background__color = _overlay__background__color,
    final BOOL background__press__dismiss__ok = OK,
    final BOOL transition__instant__ok = NO,
    required final entity__type entity,
  }) {
    return _entity__overlay__handle(
      entity,
      _navigate__forward(
        navigation__root__ok,
        _overlay(
          background__color: background__color,
          background__press__dismiss__ok: background__press__dismiss__ok,
          transition__instant__ok: transition__instant__ok,
          entity: entity,
        ),
      ),
    );
  }

  value__asyn<void> //
  navigate__forward__replace__overlay //
  <entity__type extends gui__base__entity__overlay___compo>({
    final BOOL navigation__root__ok = NO,
    final Color background__color = _overlay__background__color,
    final BOOL background__press__dismiss__ok = OK,
    final BOOL transition__instant__ok = NO,
    required final entity__type entity,
  }) {
    return _entity__overlay__handle(
      entity,
      _navigate__forward__replace(
        navigation__root__ok,
        _overlay(
          background__color: background__color,
          background__press__dismiss__ok: background__press__dismiss__ok,
          transition__instant__ok: transition__instant__ok,
          entity: entity,
        ),
      ),
    );
  }

  Route<void> //
  _overlay //
  <entity__type extends gui__base__entity__overlay___compo>({
    required final Color background__color,
    required final BOOL background__press__dismiss__ok,
    required final BOOL transition__instant__ok,
    required final entity__type entity,
  }) {
    return ( /*F*/ transition__instant__ok
        ? RawDialogRoute<void>(
            pageBuilder: (final context, _, __) {
              return entity.widget__build(
                context,
              );
            },
            barrierColor: background__color,
            barrierDismissible: background__press__dismiss__ok,
            barrierLabel: empty__text,
            transitionDuration: Duration.zero,
            transitionBuilder: (final context, _, __, ___) {
              return entity.widget__build(
                context,
              );
            },
          )
        : DialogRoute<void>(
            context: this,
            builder: entity.widget__build,
            barrierColor: background__color,
            barrierDismissible: background__press__dismiss__ok,
            barrierLabel: empty__text,
            useSafeArea: NO,
          ));
  }

  value__asyn<void> //
  navigate__forward__overlay__bottom /*
application :(modal) bottom sheet */ //
  <entity__type extends gui__base__entity__overlay___compo>({
    final BOOL navigation__root__ok = NO,
    final Color background__color = _overlay__background__color,
    final BOOL background__press__dismiss__ok = OK,
    final BOOL drag__bottom__dismiss__ok = OK,
    required final entity__type entity,
  }) {
    return _entity__overlay__handle(
      entity,
      _navigate__forward(
        navigation__root__ok,
        _overlay__bottom(
          background__color,
          background__press__dismiss__ok,
          drag__bottom__dismiss__ok,
          NIL,
          entity,
        ),
      ),
    );
  }

  value__asyn<void> //
  navigate__forward__replace__overlay__bottom //
  <entity__type extends gui__base__entity__overlay___compo>({
    final BOOL navigation__root__ok = NO,
    final Color background__color = _overlay__background__color,
    final BOOL background__press__dismiss__ok = OK,
    final BOOL drag__bottom__dismiss__ok = OK,
    required final entity__type entity,
  }) {
    return _entity__overlay__handle(
      entity,
      _navigate__forward__replace(
        navigation__root__ok,
        _overlay__bottom(
          background__color,
          background__press__dismiss__ok,
          drag__bottom__dismiss__ok,
          NIL,
          entity,
        ),
      ),
    );
  }

  value__asyn<void> //
  navigate__forward__overlay__bottom__transition__instant //
  <entity__type extends gui__base__entity__overlay___compo>({
    final BOOL navigation__root__ok = NO,
    final Color background__color = _overlay__background__color,
    final BOOL background__press__dismiss__ok = OK,
    final BOOL drag__bottom__dismiss__ok = OK,
    required final TickerProvider vsync,
    required final entity__type entity,
  }) {
    return _entity__overlay__handle(
      entity,
      _navigate__instant(
        vsync,
        (final transition__control) {
          return _navigate__forward(
            navigation__root__ok,
            _overlay__bottom(
              background__color,
              background__press__dismiss__ok,
              drag__bottom__dismiss__ok,
              transition__control,
              entity,
            ),
          );
        },
      ),
    );
  }

  value__asyn<void> //
  navigate__forward__replace__overlay__bottom__transition__instant //
  <entity__type extends gui__base__entity__overlay___compo>({
    final BOOL navigation__root__ok = NO,
    final Color background__color = _overlay__background__color,
    final BOOL background__press__dismiss__ok = OK,
    final BOOL drag__bottom__dismiss__ok = OK,
    required final TickerProvider vsync,
    required final entity__type entity,
  }) {
    return _entity__overlay__handle(
      entity,
      _navigate__instant(
        vsync,
        (final transition__control) {
          return _navigate__forward__replace(
            navigation__root__ok,
            _overlay__bottom(
              background__color,
              background__press__dismiss__ok,
              drag__bottom__dismiss__ok,
              transition__control,
              entity,
            ),
          );
        },
      ),
    );
  }

  value__asyn<void> //
  _navigate__instant(
    final TickerProvider vsync,
    final value__asyn<void> Function(
      AnimationController transition__control,
    )
    value__asyn,
  ) async {
    final transition__control = AnimationController(
      vsync: vsync,
      duration: Duration.zero,
      reverseDuration: Duration.zero,
    );

    await value__asyn(
      transition__control,
    );

    transition__control.dispose();
  }

  Route<void> //
  _overlay__bottom //
  <entity__type extends gui__base__entity__overlay___compo>(
    final Color background__color,
    final BOOL background__press__dismiss__ok,
    final BOOL drag__bottom__dismiss__ok,
    final AnimationController? transition__control,
    final entity__type entity,
  ) {
    return ModalBottomSheetRoute<void>(
      builder: entity.widget__build,
      isScrollControlled: OK,
      backgroundColor:
          (base__app__theme__colors__ground__back__contrast__dark__ok //
          ? base__color__transparent__dark
          : base__color__transparent__light),
      elevation: 0,
      clipBehavior: Clip.none,
      constraints: BoxConstraints.tight(
        base__wall__size__default(),
      ),
      isDismissible: background__press__dismiss__ok,
      modalBarrierColor: background__color,
      barrierLabel: empty__text,
      enableDrag: drag__bottom__dismiss__ok,
      showDragHandle: NO,
      transitionAnimationController: transition__control,
      useSafeArea: NO,
    );
  }

  value__asyn<void> //
  _entity__overlay__handle //
  <entity__type extends gui__base__entity__overlay___compo>(
    final entity__type entity,
    final value__asyn<void> future,
  ) async {
    await future;

    entity.dispose();
  }

  value__asyn<void> //
  navigate__forward__page /*
push ,next */ //
  <entity__type extends gui__base__entity__page___protocol>({
    final BOOL navigation__root__ok = NO,
    final BOOL transition__instant__ok = NO,
    required final entity__type entity,
  }) {
    return _entity__page__handle(
      entity,
      _navigate__forward(
        navigation__root__ok,
        _page__route(
          transition__instant__ok,
          entity.widget__build,
        ),
      ),
    );
  }

  value__asyn<void> /*
completes ,when the `route` is de-navigat-ed */
  _navigate__forward(
    final BOOL navigation__root__ok,
    final Route<void> route,
  ) {
    return _navigator_state(
      root__ok: navigation__root__ok,
    ).push<void>(
      route,
    );
  }

  value__asyn<void> //
  navigate__forward__replace__page /*
efficient, than the, first calling `de_navigate`, then calling `navigate` */ //
  <entity__type extends gui__base__entity__page___protocol>({
    final BOOL navigation__root__ok = NO,
    final BOOL transition__instant__ok = NO,
    required final entity__type entity,
  }) {
    return _entity__page__handle(
      entity,
      _navigate__forward__replace(
        navigation__root__ok,
        _page__route(
          transition__instant__ok,
          entity.widget__build,
        ),
      ),
    );
  }

  value__asyn<void> //
  _navigate__forward__replace(
    final BOOL navigation__root__ok,
    final Route<void> route,
  ) {
    return _navigator_state(
      root__ok: navigation__root__ok,
    ).pushReplacement<void, void>(
      route,
    );
  }

  value__asyn<void> //
  navigate__forward__replace__full__page /*
{pop_until_and_push|{pop_all_and_push|re_set}} */ //
  <entity__type extends gui__base__entity__page___protocol>({
    final BOOL navigation__root__ok = NO,
    final NIMR? pages__count,
    final BOOL transition__instant__ok = NO,
    required final entity__type entity,
  }) {
    return _entity__page__handle(
      entity,
      _navigator_state(
        root__ok: navigation__root__ok,
      ).pushAndRemoveUntil<void>(
        _page__route(
          transition__instant__ok,
          entity.widget__build,
        ),
        _route__predicate(
          pages__count,
        ),
      ),
    );
  }

  value__asyn<void> //
  _entity__page__handle //
  <entity__type extends gui__base__entity__page___protocol>(
    final entity__type entity,
    final value__asyn<void> future,
  ) async {
    await future;

    entity.dispose();
  }

  BOOL navigate__backward__ok({
    final BOOL navigation__root__ok = NO,
  }) {
    return _navigator_state(
      root__ok: navigation__root__ok,
    ).canPop();
  }

  void navigate__backward /*
{{pop|back}|exit}
call-ing multiple times ,would act multiple times 
  ,even exit-ing the app
  ,even on same `context`
    ,on further(than the first) calls ,acts on `context` ,of parent(in hierarchy)[s]  */ ({
    final BOOL navigation__root__ok = NO,
  }) {
    if /*F*/ (navigate__backward__ok().not /*exit__ok*/ ) {
      base__app__exit();
    } else {
      _navigator_state(
        root__ok: navigation__root__ok,
      ).pop<void>();
    }
  }

  /*void navigate__back()
    { return navigate__backward(); }*/

  void navigate__backward__full /*
{pop_until|{pop_all|re_set}} */ ({
    final BOOL navigation__root__ok = NO,
    final NIMR? pages__count,
  }) {
    return _navigator_state(
      root__ok: navigation__root__ok,
    ).popUntil(
      _route__predicate(
        pages__count,
      ),
    );
  }

  RoutePredicate //
  _route__predicate(
    final NIMR? pages__count /*
cases :
  NIL :remove all previous pages
  0 :remove all previous pages ,until/except/exclud-ing the first page
  >0 :
    remove `pages:count` number ,of previous pages
    no issue ,if `pages:count` exceeds the {navigat-ion}-stack's depth/elements:count */,
  ) {
    if (pages__count == null) {
      return (final _) => NO;
    }

    if /*F*/ (pages__count == 0) {
      return (final route) => route.isFirst;
    }

    var _pages__count = pages__count;

    return (final _) {
      if /*F*/ (_pages__count == 0) {
        return OK;
      }

      _pages__count -= 1;

      return NO;
    };
  }

  NavigatorState //
  _navigator_state({
    final BOOL root__ok /*
useful for `overlay`s
run-time expensive op. */ =
        NO,
  }) {
    return Navigator.of(
      this,
      rootNavigator: root__ok,
    );
  }

  static Route<void> _page__route(
    final BOOL transition__instant__ok,
    final gui__base__widget__build__function__format page__build,
  ) {
    return ( /*iff*/ transition__instant__ok
        ? PageRouteBuilder<void>(
            pageBuilder: (final context, final _, final __) {
              return page__build(
                context,
              );
            },
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          )
        : /*CupertinoPageRoute<void>*/ MaterialPageRoute<void>(
            builder: page__build,
            maintainState: NO,
          ));
  }

  static const _overlay__background__color = /*base__color__transparent__dark*/ Color(0xBB000000);
}

value__asyn<void> base__app__exit() {
  return SystemNavigator.pop();
}

extension navigation__indicate__extension //
    on gui__base__widget__building__context {
  value__asyn<type> navigate__forward__overlay__waiting<type>(
    final value__asyn<type> value /*
`value__asyn.sync` can be used for sync. actions
handles ,`value__asyn.value` ,and `value__asyn.delayed` ,also */, {
    required final gui__base__widget__build__function__format waiting__build,
  }) {
    final promise = value__asyn__meta<type>();

    gui__base__widget__building__context? context_1;

    void navigate__backward() {
      final context_2 = context_1;
      if ((context_2 != null) && context_2.valid__ok()) {
        context_2.navigate__backward();
      }
    }

    var complete__ok /*
needed to handle ,already completed ,and `value__asyn.value` creations */ =
        NO;

    value.handle(
      (final value) {
        complete__ok = OK;

        navigate__backward();

        promise.complete(value);
      },
      (final e, final t) {
        complete__ok = OK;

        navigate__backward();

        promise.completeError(e, t);
      },
    );

    var navigation__back__scheduled__ok = NO;

    navigate__forward__overlay(
      background__press__dismiss__ok: NO,
      entity: gui__base__entity__overlay___compo(
        dispose__handle: NIL,
        widget__build: (final context_2) {
          if (navigation__back__scheduled__ok) {
            return gui__base__empty__widget;
          }

          if (complete__ok) {
            navigation__back__scheduled__ok = OK;

            task__schedule(
              () {
                context_2.navigate__backward();
              },
            );

            return gui__base__empty__widget;
          }

          context_1 = context_2;

          return PopScope(
            canPop: NO,
            child: waiting__build(
              context_2,
            ),
          );
        },
      ),
    );

    return promise.future;
  }

  value__asyn<void> navigate__forward__overlay__notice({
    final Alignment notice__position = Alignment.center,
    final Duration? notice__duration /*
auto.-dismiss duration
values :
  NIL :permanent
  other :temporary */ = const Duration(
      seconds: 3,
    ),
    required final gui__base__widget__build__function__format notice__build,
  }) {
    return navigate__forward__overlay(
      entity: gui__base__entity__overlay___compo(
        dispose__handle: NIL,
        widget__build: (final context) {
          if (notice__duration != null) {
            delaying__asyn(
              notice__duration,
              () {
                if (context.valid__ok()) {
                  context.navigate__backward();
                }
              },
            );
          }

          return Align(
            alignment: notice__position,
            child: notice__build(
              context,
            ),
          );
        },
      ),
    );
  }
}
