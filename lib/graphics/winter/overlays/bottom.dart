part of "../_.dart";

widget___protocol overlay__bottom__alert(
  final widget__building__context___compo context, {
  required final string title,
  required final string sub_title,
  final string dismiss__button__title = "OK",
}) =>
    winter__overlay__bottom__menu(
      context,
      title: title,
      sub_title: sub_title,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <widget___protocol>[
          winter__overlay__bottom__button__dismiss(
            context,
            title: dismiss__button__title,
          ),
          SizedBox(height: 64.px()),
        ],
      ),
    );

widget___protocol overlay__bottom__confirm__item({
  final BorderRadius? border__radius,
  final BOOL action__destructive___ok = FALSE,
  required final string title,
  final string? sub_title,
  final widget? trailing,
}) =>
    winter__listing__item(
      border__radius: border__radius,
      body: winter__box__text__primary__secondary__auto(
        primary__text: title,
        primary__color: (action__destructive___ok //
            ? color__red
            : color__foreground__default),
        secondary__text: sub_title,
      ),
      trailing: trailing,
    );

widget___protocol overlay__bottom__confirm(
  final widget__building__context___compo context, {
  required final BOOL action__destructive___ok,
  required final string title,
  required final string sub_title,
  required final procedure__empty__format proceed__handle,
  final string proceed__title = "OK",
  final string? proceed__sub_title,
  final string cancel__title = "Cancel",
  final string? cancel__sub_title,
}) =>
    winter__overlay__bottom__menu(
      context,
      dismiss__swipe__indication___ok: FALSE,
      button__close___ok: FALSE,
      title: title,
      sub_title: sub_title,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size__pixel__padding__horizontal__double,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <widget___protocol>[
            gesture__detection__widget(
              press__handle: () {
                context.navigation().backward();
                proceed__handle();
              },
              child: overlay__bottom__confirm__item(
                border__radius:
                    listing__item__position__top__border__radius(),
                action__destructive___ok: action__destructive___ok,
                title: proceed__title,
                sub_title: proceed__sub_title,
                trailing: icon(
                  flutter__icon__press_able,
                ),
              ),
            ),
            widget__separat_or__vertical,
            gesture__detection__widget(
              press__handle: () => context.navigation().backward(),
              child: winter__listing__item(
                border__radius:
                    listing__item__position__bottom__border__radius(),
                selected___ok: TRUE,
                body: winter__box__text__primary__secondary__auto(
                  primary__text: cancel__title,
                  secondary__text: cancel__sub_title,
                ),
                trailing: icon(
                  flutter__icon__press_able,
                ),
              ),
            ),
            SizedBox(height: 64.px()),
          ],
        ),
      ),
    );

widget___protocol overlay__bottom__options(
  final widget__building__context___compo context, {
  required final string title,
  final string? sub_title,
  required final ARRAY<widget___protocol>
      option__array /*
prefer `listing__item`
  with position-based `border__radius`, and in-between `widget__separat_or__vertical`
  suggestion: prefer removing sub_title, if space is (almost) exceeded, because the list is non-scrollable */
  ,
}) =>
    winter__overlay__bottom__menu(
      context,
      back_ground__filter: image__filter__blur__default,
      title: title,
      sub_title: sub_title,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size__pixel__padding__horizontal,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: option__array,
        ),
      ),
    );

/*widget___protocol overlay__bottom__input__number(
 final widget__building__context___compo context,
{ required final string title,
  final string? sub_title,
  required final INT input__max,
  required final void Function(INT input) submit__handle,
}) {
  INT number = 0;
  void number__update(
    final INT number__new,
  ) {
    if (number__new > input__max) //
      return;

    number = number__new;
  }

  procedure__empty__format build__re = empty__procedure__empty;

  const //
      rows__count = 3,
      columns__count = 3;

  return overlay__bottom__menu(
    context,
    title: title,
    sub_title: sub_title,
    body: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size__pixel__padding__horizontal,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <widget___protocol>[
          Center(
            child: widget__build__definitive(
              init_: (final state) => //
                  (build__re = state.build__re___raw),
              de_init_: () => //
                  (build__re = empty__procedure__empty),
              build: (_) => //
                  box__text__widget(
                number.toString(),
                font__size: 28.px(),
              ),
            ),
          ),
          SizedBox(
            height: size__pixel__padding__vertical__double,
          ),
          SizedBox(
            height: (screen__size().height * 0.3),
            child: Column(
              children: <widget___protocol>[
                for (INT row__id = 0; row__id < rows__count; row__id += 1) //
                  Expanded(
                    child: Row(
                      children: array__new__generated(
                        columns__count,
                        (final column__id) {
                          final number_ = (((row__id * rows__count) + 1) + column__id);

                          return _input__number__button(
                            child: box__text__widget(
                              number_.toString(),
                              font__size: 24.px(),
                            ),
                            press__handle: () {
                              number__update((number * 10) + number_);
                              build__re();
                            },
                          );
                        },
                      ),
                    ),
                  ),
                Expanded(
                  child: Row(
                    children: [
                      _input__number__button(
                        child: box__text__widget(
                          "CLR",
                          font__size: 18.px(),
                        ),
                        press__handle: () {
                          if (number > 9) //
                            number ~/= 10;
                          else //
                            number = 0;

                          build__re();
                        },
                        press__long__handle: () {
                          number = 0;

                          build__re();
                        },
                      ),
                      _input__number__button(
                        child: box__text__widget(
                          0.toString(),
                          font__size: 24.px(),
                        ),
                        press__handle: () {
                          number__update(number * 10);
                          build__re();
                        },
                      ),
                      _input__number__button(
                        selected___ok: TRUE,
                        child: icon(
                          flutter__icon__done,
                          size: 24.px(),
                        ),
                        press__handle: () {
                          submit__handle(number);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size__pixel__padding__vertical__double,
          ),
        ],
      ),
    ),
  );
} */

widget___protocol _input__number__button({
  final BOOL selected___ok = FALSE,
  required final widget___protocol child,
  required final procedure__empty__format press__handle,
  final procedure__empty__format? press__long__handle,
}) =>
    Expanded(
      child: Padding(
        padding: EdgeInsets.all(2.px()),
        child: winter__box__button(
          b__highlight: selected___ok,
          child: child__constrained__tight__max__widget(
            Center(
              child: child,
            ),
          ),
          onSinglePress: press__handle,
          onLongPress: press__long__handle,
        ),
      ),
    );

/*widget___protocol overlay__bottom__explorer__file_system(
 final widget__building__context___compo context,
) =>
    overlay__bottom__menu(
      context: context,
      title: "Choose a directory, to explore",
      items__padding__horizontal: size__pixel__padding__horizontal,
      item__array: <widget___protocol>[
        GestureDetector(
          onTap: () {
            final $scroll__manager = scrolling.create();
            context
                .navigation().forward__replace__page(
                  page__build: (final $context) => //
                      pages__directory__page(
                    context: $context,
                    scroll__manager: $scroll__manager,
                    directory__path: '/',
                    choose__handle: (_) {},
                  ),
                )
                .then__result__ignore(
                  $scroll__manager.de_init_,
                );
          },
          child: listing__item(
            body: box__text__primary__secondary(
              "Root",
              "'/'",
            ),
            trailing: icon(
              flutter__icon__navigation__forward,
            ),
          ),
        ),
        widget__separat_or__vertical,
        GestureDetector(
          onTap: () {
            final $scroll__manager = scrolling.create();
            context
                .navigation().forward__replace__page(
                  page__build: (final $context) => //
                      pages__directory__page(
                    context: $context,
                    scroll__manager: $scroll__manager,
                    directory__path: storage__path,
                    choose__handle: (_) {},
                  ),
                )
                .then__result__ignore(
                  $scroll__manager.de_init_,
                );
          },
          child: listing__item(
            body: box__text__primary__secondary(
              "App's files",
              ("\"" + storage__path + '"'),
            ),
            trailing: icon(
              flutter__icon__navigation__forward,
            ),
          ),
        ),
      ],
    );*/
