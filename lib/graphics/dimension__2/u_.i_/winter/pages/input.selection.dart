part of "../_.dart";

/* gui__base__widget pages__input__selection__page({
  required final base__scrolling scroll__manager,
  required final gui__base__widget page__title,
  required final NIMR item__array__count,
  final array<NIMR>? selection__array__initial,
  final ({NIMR min, NIMR max}) selection__array__constraints = (min: 1 /* 0, to allow submit-ing anytime, without even a single selection */, max: NI1__max),
  required final gui__base__listing__item__build__function__format listing__item__body__build,
  final IconData? submit__button__icon = flutter__icon__done,
  final string__raw submit__button__title = "Submit",
  required final void Function(array<NIMR> selection__id__array) submit__handle,
}) {
  final selection__accumulation = base__accumulation__linear__basic__definitive<NIMR>();

  if (selection__array__initial != null) {
    selection__array__initial.iterate__basic(
      (final _, final item__id) {
        selection__accumulation.add(
          item__id,
        );
      },
    );
  }

  var //
      button__flush__show__ok = selection__accumulation.empty__not(),
      button__submit__show__ok = (NOT(selection__accumulation.elements__count() < selection__array__constraints.min) && //
          NOT(selection__accumulation.elements__count() > selection__array__constraints.max));

  procedure__empty__format? //
      listing__build__re,
      button__build__re,
      count__build__re;

  Key listing__key = gui__base__widget__key__unique();

  BOOL select__ok(
    final NIMR item__id,
  ) {
    if (selection__accumulation.elements__count() < selection__array__constraints.max) {
      selection__accumulation.add(
        item__id,
      );

      if ((selection__accumulation.elements__count() < selection__array__constraints.min) || button__submit__show__ok) {
        if (button__flush__show__ok) //
          count__build__re?.call();
        else {
          button__flush__show__ok = OK;

          button__build__re?.call();
        }
      } else {
        if (!button__submit__show__ok) //
          button__submit__show__ok = OK;

        if (!button__flush__show__ok) //
          button__flush__show__ok = OK;

        button__build__re?.call();
      }

      return OK;
    }

    return NO;
  }

  BOOL de_select__ok(
    final NIMR item__id,
  ) {
    selection__accumulation.remove__element(
      item__id,
      base__value__same__ok,
    );

    BOOL button__build__re__ok = NO;

    if (selection__accumulation.empty__ok()) {
      button__flush__show__ok = NO;
      button__build__re__ok = OK;
    }

    if ((selection__accumulation.elements__count() < selection__array__constraints.min) && //
        button__submit__show__ok) {
      button__submit__show__ok = NO;

      if (NOT(button__build__re__ok)) {
        button__build__re__ok = OK;
      }
    }

    if ((!(selection__accumulation.elements__count() < selection__array__constraints.min) && //
            !(selection__accumulation.elements__count() > selection__array__constraints.max)) && //
        !button__submit__show__ok) {
      button__submit__show__ok = OK;

      if (!button__build__re__ok) {
        button__build__re__ok = OK;
      }
    }

    if (button__build__re__ok) {
      button__build__re?.call();
    } else {
      count__build__re?.call();
    }

    return OK;
  }

  void flush__handle() {
    selection__accumulation.flush();

    if (selection__array__constraints.min != 0) //
      button__submit__show__ok = NO;

    button__flush__show__ok = NO;

    listing__key = gui__base__widget__key__unique();
    listing__build__re?.call();
  }

  return page__foundation(
    RepaintBoundary(
      child: gui__base__widget__build__definitive(
        init_: (final state) => //
            (listing__build__re = state.build__re),
        de_init_: () => //
            (listing__build__re = NIL),
        build: (final context) => //
            base__list_ing__generat_ed(
          context: context,
          scroll__manager: scroll__manager,
          page__title: page__title,
          item__array__count: item__array__count,
          item__build: (final build__context, final item__id) => //
              gui__base__listing__item__select_able(
            key: listing__key,
            selected__ok: selection__accumulation.present__ok(
              item__id,
            ),
            body: listing__item__body__build(build__context, item__id),
            selection__handle: (final _) async => select__ok(item__id),
            de_selection__handle: (final _) async => de_select__ok(item__id),
          ),
          floating: RepaintBoundary(
            child: gui__base__widget__build__definitive(
              init_: (final state_) => //
                  (button__build__re = state_.build__re),
              de_init_: () => //
                  (button__build__re = NIL),
              build: (final _) => //
                  ((button__submit__show__ok || button__flush__show__ok)
                      ? gui__base__stack__widget(
                          children: <gui__base__widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                top: 8.px(),
                                right: 8.px(),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (button__flush__show__ok) //
                                    base__button__floating(
                                      scale: 1.25,
                                      border__radius: BorderRadius.horizontal(
                                        left: Radius.circular(12.px()),
                                        right: (button__submit__show__ok //
                                            ? Radius.circular(4.px())
                                            : Radius.circular(12.px())),
                                      ),
                                      icon: flutter__icon__clear,
                                      title: "Clear",
                                      press__handle: flush__handle,
                                    ),
                                  if (button__submit__show__ok) //
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 4.px(),
                                      ),
                                      child: base__button__floating(
                                        scale: 1.25,
                                        border__radius: BorderRadius.horizontal(
                                          left: Radius.circular(4.px()),
                                          right: Radius.circular(12.px()),
                                        ),
                                        selected__ok: OK,
                                        icon: submit__button__icon,
                                        title: submit__button__title,
                                        press__handle: () => //
                                            submit__handle(selection__accumulation.convert__array()),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: RepaintBoundary(
                                child: gui__base__widget__build__definitive(
                                  init_: (final state__) => //
                                      (count__build__re = state__.build__re),
                                  de_init_: () => //
                                      (count__build__re = NIL),
                                  build: (final _) => //
                                      gui__base__box__floating(
                                    border__radius: BorderRadius.all(Radius.circular(12.px())),
                                    child: Padding(
                                      padding: EdgeInsets.all(4.px()),
                                      child: ConstrainedBox(
                                        constraints: BoxConstraints(
                                          minWidth: 14.px(),
                                          minHeight: 14.px(),
                                        ),
                                        child: Center(
                                          child: gui__base__box__text__widget(
                                            selection__accumulation.elements__count.toString(),
                                            font__size: 12.px(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : gui__base__empty__widget),
            ),
          ),
        ),
      ),
    ),
  );
} */
