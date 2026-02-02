part of "../_.dart";

/*widget___protocol pages__input__selection__page({
  required final scrolling scroll__manager,
  required final widget___protocol page__title,
  required final INT item__array__count,
  final ARRAY<INT>? selection__array__initial,
  final ({INT min, INT max}) selection__array__constraints = (min: 1 /* 0, to allow submit-ing anytime, without even a single selection */, max: INT__1__max),
  required final listing__item__build__function__format listing__item__body__build,
  final IconData? submit__button__icon = flutter__icon__done,
  final string submit__button__title = "Submit",
  required final void Function(ARRAY<INT> selection__id__array) submit__handle,
}) {
  final selection__accumulation = accumulation__linear__basic__definitive___compo<INT>();

  if (selection__array__initial != null) {
    selection__array__initial.iterate__basic(
      (_, final item__id) {
        selection__accumulation.add(
          item__id,
        );
      },
    );
  }

  var //
      button__flush__show___ok = selection__accumulation.empty___ok().NOT,
      button__submit__show___ok = (NOT(selection__accumulation.elements__count() < selection__array__constraints.min) && //
          NOT(selection__accumulation.elements__count() > selection__array__constraints.max));

  procedure__empty__format? //
      listing__build__re,
      button__build__re,
      count__build__re;

  Key listing__key = widget__key__unique();

  BOOL select___ok(
    final INT item__id,
  ) {
    if (selection__accumulation.elements__count() < selection__array__constraints.max) {
      selection__accumulation.add(
        item__id,
      );

      if ((selection__accumulation.elements__count() < selection__array__constraints.min) || button__submit__show___ok) {
        if (button__flush__show___ok) //
          count__build__re?.call();
        else {
          button__flush__show___ok = TRUE;

          button__build__re?.call();
        }
      } else {
        if (!button__submit__show___ok) //
          button__submit__show___ok = TRUE;

        if (!button__flush__show___ok) //
          button__flush__show___ok = TRUE;

        button__build__re?.call();
      }

      return TRUE;
    }

    return FALSE;
  }

  BOOL de_select___ok(
    final INT item__id,
  ) {
    selection__accumulation.remove__element(
      item__id,
      value__same___ok,
    );

    BOOL button__build__re___ok = FALSE;

    if (selection__accumulation.empty___ok()) {
      button__flush__show___ok = FALSE;
      button__build__re___ok = TRUE;
    }

    if ((selection__accumulation.elements__count() < selection__array__constraints.min) && //
        button__submit__show___ok) {
      button__submit__show___ok = FALSE;

      if (NOT(button__build__re___ok)) {
        button__build__re___ok = TRUE;
      }
    }

    if ((!(selection__accumulation.elements__count() < selection__array__constraints.min) && //
            !(selection__accumulation.elements__count() > selection__array__constraints.max)) && //
        !button__submit__show___ok) {
      button__submit__show___ok = TRUE;

      if (!button__build__re___ok) {
        button__build__re___ok = TRUE;
      }
    }

    if (button__build__re___ok) {
      button__build__re?.call();
    } else {
      count__build__re?.call();
    }

    return TRUE;
  }

  void flush__handle() {
    selection__accumulation.flush();

    if (selection__array__constraints.min != 0) //
      button__submit__show___ok = FALSE;

    button__flush__show___ok = FALSE;

    listing__key = widget__key__unique();
    listing__build__re?.call();
  }

  return page__foundation(
    RepaintBoundary(
      child: widget__build__definitive(
        init_: (final state) => //
            (listing__build__re = state.build__re),
        de_init_: () => //
            (listing__build__re = NIL),
        build: (final context) => //
            list_ing__generat_ed(
          context: context,
          scroll__manager: scroll__manager,
          page__title: page__title,
          item__array__count: item__array__count,
          item__build: (final context, final item__id) => //
              listing__item__select_able(
            key: listing__key,
            selected___ok: selection__accumulation.present___ok(
              item__id,
            ),
            body: listing__item__body__build(context, item__id),
            selection__handle: (_) async => select___ok(item__id),
            de_selection__handle: (_) async => de_select___ok(item__id),
          ),
          floating: RepaintBoundary(
            child: widget__build__definitive(
              init_: (final state_) => //
                  (button__build__re = state_.build__re),
              de_init_: () => //
                  (button__build__re = NIL),
              build: (_) => //
                  ((button__submit__show___ok || button__flush__show___ok)
                      ? stack___widget(
                          children: <widget___protocol>[
                            Padding(
                              padding: EdgeInsets.only(
                                top: 8.px(),
                                right: 8.px(),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (button__flush__show___ok) //
                                    button__floating(
                                      scale: 1.25,
                                      border__radius: BorderRadius.horizontal(
                                        left: Radius.circular(12.px()),
                                        right: (button__submit__show___ok //
                                            ? Radius.circular(4.px())
                                            : Radius.circular(12.px())),
                                      ),
                                      icon: flutter__icon__clear,
                                      title: "Clear",
                                      press__handle: flush__handle,
                                    ),
                                  if (button__submit__show___ok) //
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 4.px(),
                                      ),
                                      child: button__floating(
                                        scale: 1.25,
                                        border__radius: BorderRadius.horizontal(
                                          left: Radius.circular(4.px()),
                                          right: Radius.circular(12.px()),
                                        ),
                                        selected___ok: TRUE,
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
                                child: widget__build__definitive(
                                  init_: (final state__) => //
                                      (count__build__re = state__.build__re),
                                  de_init_: () => //
                                      (count__build__re = NIL),
                                  build: (_) => //
                                      box__floating(
                                    border__radius: BorderRadius.all(Radius.circular(12.px())),
                                    child: Padding(
                                      padding: EdgeInsets.all(4.px()),
                                      child: ConstrainedBox(
                                        constraints: BoxConstraints(
                                          minWidth: 14.px(),
                                          minHeight: 14.px(),
                                        ),
                                        child: Center(
                                          child: box__text__widget(
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
                      : empty__widget),
            ),
          ),
        ),
      ),
    ),
  );
} */
