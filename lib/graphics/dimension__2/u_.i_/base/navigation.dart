part of "_.dart";

const //
gui__base__navigation__overlay__background__color = /*base__color__transparent__dark*/ Color.from(alpha: .5, red: 0, green: 0, blue: 0),
    gui__base__navigation__animation__duration__default = Duration(
      milliseconds: (date_time.duration__second__seconds__milli ~/ (3 * 2)),
    );

typedef gui__base__navigation___compo = NavigatorState;

extension gui__base__widget__building__context__navigation___extension
    on //
        gui__base__widget__building__context {
  gui__base__navigation___compo navigation({
    final BOOL root___ok /*
useful for `overlay`s
run-time expensive op. */ =
        FALSE,
  }) {
    return Navigator.of(
      this,
      rootNavigator: root___ok,
    );
  }
}

class _empty__widget extends StatelessWidget {
  const _empty__widget() : super(key: NIL);

  @override
  Widget build(final gui__base__widget__building__context context) {
    return gui__base__empty__widget;
  }
}

extension gui__base__navigation___extension
    on //
        gui__base__navigation___compo /*
{`dismiss`|`depart_ure`|`de_init_`|`dispose`}`:handle` can be achieved by ,`::handle`-ing the `navigate:forward:`* `return`-ed `async_:value` ,then calling the proc. */ {
  value__asyn<void> //
  forward__overlay //
  <entity__type extends gui__base__entity__overlay___compo>({
    final Color background__color = gui__base__navigation__overlay__background__color,
    final BOOL gesture__press__background__dismiss___ok = TRUE,
    final Duration animation__duration = gui__base__navigation__animation__duration__default,
    required final entity__type entity,
  }) {
    return _entity__overlay__handle(
      entity,
      _forward(
        _overlay(
          background__color: background__color,
          gesture__press__background__dismiss___ok: gesture__press__background__dismiss___ok,
          animation__duration: animation__duration,
          entity: entity,
        ),
      ),
    );
  }

  value__asyn<void> //
  forward__replace__overlay //
  <entity__type extends gui__base__entity__overlay___compo>({
    final Color background__color = gui__base__navigation__overlay__background__color,
    final BOOL gesture__press__background__dismiss___ok = TRUE,
    final Duration animation__duration = gui__base__navigation__animation__duration__default,
    required final entity__type entity,
  }) {
    return _entity__overlay__handle(
      entity,
      _forward__replace(
        _overlay(
          background__color: background__color,
          gesture__press__background__dismiss___ok: gesture__press__background__dismiss___ok,
          animation__duration: animation__duration,
          entity: entity,
        ),
      ),
    );
  }

  Route<void> //
  _overlay //
  <entity__type extends gui__base__entity__overlay___compo>({
    required final Color background__color,
    required final BOOL gesture__press__background__dismiss___ok,
    required final Duration animation__duration,
    required final entity__type entity,
  }) {
    if (animation__duration == Duration.zero) {
      RawDialogRoute<void>(
        pageBuilder: (final context, _, _) {
          return entity.widget__build(
            context,
          );
        },
        barrierDismissible: gesture__press__background__dismiss___ok,
        barrierColor: background__color,
        barrierLabel: empty__string,
        transitionDuration: Duration.zero,
        transitionBuilder: (final context, _, _, _) {
          return entity.widget__build(
            context,
          );
        },
        fullscreenDialog: TRUE,
      );
    }

    return DialogRoute<void>(
      context: StatelessElement(_empty__widget()),
      builder: entity.widget__build,
      barrierColor: background__color,
      barrierDismissible: gesture__press__background__dismiss___ok,
      barrierLabel: empty__string,
      useSafeArea: FALSE,
      fullscreenDialog: TRUE,
      animationStyle: AnimationStyle(
        duration: animation__duration,
        reverseDuration: animation__duration,
      ),
    );
  }

  value__asyn<void> //
  forward__overlay__bottom //
  <entity__type extends gui__base__entity__overlay___compo>({
    final Color background__color = gui__base__navigation__overlay__background__color,
    final BOOL gesture__press__background__dismiss___ok = TRUE,
    final BOOL gesture__drag__bottom__dismiss___ok = TRUE,
    required final entity__type entity,
  }) {
    return _entity__overlay__handle(
      entity,
      _forward(
        _overlay__bottom(
          background__color,
          gesture__press__background__dismiss___ok,
          gesture__drag__bottom__dismiss___ok,
          NIL,
          entity,
        ),
      ),
    );
  }

  /*value__asyn<void> //
  forward__overlay__bottom__transition__instant //
  <entity__type extends gui__base__entity__overlay___compo>({
    final Color background__color = gui__base__navigation__overlay__background__color,
    final BOOL gesture__press__background__dismiss___ok = TRUE,
    final BOOL gesture__drag__bottom__dismiss___ok = TRUE,
    required final TickerProvider vsync,
    required final entity__type entity,
  }) {
    return _entity__overlay__handle(
      entity,
      _instant(
        vsync,
        (final transition__control) {
          return _forward(
            _overlay__bottom(
              background__color,
              gesture__press__background__dismiss___ok,
              gesture__drag__bottom__dismiss___ok,
              transition__control,
              entity,
            ),
          );
        },
      ),
    );
  }*/

  value__asyn<void> //
  forward__replace__overlay__bottom //
  <entity__type extends gui__base__entity__overlay___compo>({
    final Color background__color = gui__base__navigation__overlay__background__color,
    final BOOL gesture__press__background__dismiss___ok = TRUE,
    final BOOL gesture__drag__bottom__dismiss___ok = TRUE,
    required final entity__type entity,
  }) {
    return _entity__overlay__handle(
      entity,
      _forward__replace(
        _overlay__bottom(
          background__color,
          gesture__press__background__dismiss___ok,
          gesture__drag__bottom__dismiss___ok,
          NIL,
          entity,
        ),
      ),
    );
  }

  /*value__asyn<void> //
  forward__replace__overlay__bottom__transition__instant //
  <entity__type extends gui__base__entity__overlay___compo>({
    final Color background__color = gui__base__navigation__overlay__background__color,
    final BOOL gesture__press__background__dismiss___ok = TRUE,
    final BOOL gesture__drag__bottom__dismiss___ok = TRUE,
    required final TickerProvider vsync,
    required final entity__type entity,
  }) {
    return _entity__overlay__handle(
      entity,
      _instant(
        vsync,
        (final transition__control) {
          return _forward__replace(
            _overlay__bottom(
              background__color,
              gesture__press__background__dismiss___ok,
              gesture__drag__bottom__dismiss___ok,
              transition__control,
              entity,
            ),
          );
        },
      ),
    );
  }*/

  Route<void> //
  _overlay__bottom //
  <entity__type extends gui__base__entity__overlay___compo>(
    final Color background__color,
    final BOOL gesture__press__background__dismiss___ok,
    final BOOL gesture__drag__bottom__dismiss___ok,
    final AnimationController? transition__control,
    final entity__type entity,
  ) {
    return ModalBottomSheetRoute<void>(
      builder: entity.widget__build,
      isScrollControlled: TRUE,
      backgroundColor:
          (base__app__theme__colors__ground__back__contrast__dark___ok //
          ? base__color__transparent__dark
          : base__color__transparent__light),
      elevation: 0,
      clipBehavior: Clip.none,
      constraints: () {
        final wall__size = base__wall__size__default();

        return BoxConstraints(
          maxWidth: wall__size.width,
          maxHeight: wall__size.height,
        );
      }(),
      isDismissible: gesture__press__background__dismiss___ok,
      modalBarrierColor: background__color,
      barrierLabel: empty__string,
      enableDrag: gesture__drag__bottom__dismiss___ok,
      showDragHandle: FALSE,
      transitionAnimationController: transition__control,
      useSafeArea: FALSE,
    );
  }

  /*value__asyn<void> //
  _instant(
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
  }*/

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
  forward__page /*
push ,next */ //
  <entity__type extends gui__base__entity__page___protocol>({
    final Duration animation__duration = gui__base__navigation__animation__duration__default,
    required final entity__type entity,
  }) {
    return _entity__page__handle(
      entity,
      _forward(
        _page__route(
          animation__duration,
          entity.widget__build,
        ),
      ),
    );
  }

  value__asyn<void> /*
completes ,when the "route" is de-navigated */
  _forward(
    final Route<void> route,
  ) {
    return push<void>(
      route,
    );
  }

  value__asyn<void> //
  forward__replace__page /*
efficient, than the, first calling `de_navigate`, then calling `navigate` */ //
  <entity__type extends gui__base__entity__page___protocol>({
    final Duration animation__duration = gui__base__navigation__animation__duration__default,
    required final entity__type entity,
  }) {
    return _entity__page__handle(
      entity,
      _forward__replace(
        _page__route(
          animation__duration,
          entity.widget__build,
        ),
      ),
    );
  }

  value__asyn<void> //
  _forward__replace(
    final Route<void> route,
  ) {
    return pushReplacement<void, void>(
      route,
    );
  }

  value__asyn<void> //
  forward__replace__full__page /*
{pop_until_and_push|{pop_all_and_push|re_set}} */ //
  <entity__type extends gui__base__entity__page___protocol>({
    final INT? pages__count,
    final Duration animation__duration = gui__base__navigation__animation__duration__default,
    required final entity__type entity,
  }) {
    return _entity__page__handle(
      entity,
      pushAndRemoveUntil<void>(
        _page__route(
          animation__duration,
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

  BOOL backward___ok() {
    return canPop();
  }

  void backward /*
{pop|back}
call-ing multiple times ,acts as many times */ () {
    pop<void>();
  }

  void backward__full /*
{pop_until|{pop_all|re_set}} */ ({
    final INT? pages__count,
  }) {
    return popUntil(
      _route__predicate(
        pages__count,
      ),
    );
  }

  RoutePredicate //
  _route__predicate(
    final INT? pages__count /*
cases :
  NIL :remove all previous pages
  0 :remove all previous pages ,until/except/exclud-ing the first page
  >0 :
    remove `pages:count` number ,of previous pages
    no issue ,if `pages:count` exceeds the {navigat-ion}-stack's depth/elements:count */,
  ) {
    if (pages__count == null) {
      return (final _) => FALSE;
    }

    if /*F*/ (pages__count == 0) {
      return (final route) => route.isFirst;
    }

    var _pages__count = pages__count;

    return (final _) {
      if /*F*/ (_pages__count == 0) {
        return TRUE;
      }

      _pages__count -= 1;

      return FALSE;
    };
  }

  static Route<void> _page__route(
    final Duration animation__duration,
    final gui__base__widget__build__function__format page__build,
  ) {
    if (animation__duration == Duration.zero) {
      return PageRouteBuilder<void>(
        pageBuilder: (final context, final _, final __) {
          return page__build(
            context,
          );
        },
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      );
    }

    return /*CupertinoPageRoute<void>*/ MaterialPageRoute<void>(
      builder: page__build,
      maintainState: FALSE,
    );
  }
}

value__asyn<void> gui__base__app__exit() {
  return SystemNavigator.pop();
}
