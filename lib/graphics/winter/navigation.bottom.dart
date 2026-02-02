part of "_.dart";

typedef navigation__bottom__item___compo = ({
  IconData icon,
  procedure__empty__format press__handle,
});

/*widget___protocol navigation__bottom__my_bmw__stored({
  required final ARRAY<navigation__bottom__item__compo> page__array /*
  prefer, to keep the `(count < 4)`
    to avoid looking bloated, or congested */
  ,
  final INT page__chosen__initial__id = 0,
}) /*
  design was copied from "My BMW"(`http://play.google.com/store/apps/details?id=de.bmw.connected.mobile20.row`) app,
    got reference to app, from `flutter.dart`'s web homepage */
{
  final //
      page__array__count = page__array.elements__count,
      build__re__array = array__new__filled<procedure__empty__format?>(
        page__array__count,
         null,
      );

  INT page__chosen__id = page__chosen__initial__id;

  late final ARRAY<widget___protocol> items;

  void page__switch(
    final INT page__id,
  ) {
    items[page__chosen__id] = _button__un_selected(
      page__array[page__chosen__id].icon,
      () => page__switch(page__chosen__id),
    );
    build__re__array[page__chosen__id]!();

    items[page__chosen__id = page__id] = _button__selected(
      page__array[page__id].icon,
    );
    build__re__array[page__id]!();

    page__array[page__id].press__handle();
  }

  items = ARRAY<widget___protocol>.generate(
    page__array__count,
    (final page__id) {
      return RepaintBoundary(
        child: widget__build__definitive(
          init_: (final state) => //
              (build__re__array[page__id] = state.build__re___raw),
          de_init_: () => //
              (build__re__array[page__id] =  null),
          build: (_) => //
              ((page__id == page__chosen__id)
                  ? _button__selected(
                      page__array[page__id].icon,
                    )
                  : _button__un_selected(
                      page__array[page__id].icon,
                      () => page__switch(page__id),
                    )),
        ),
      );
    },
    growable: FALSE,
  );

  return box__floating(
    border__radius: BorderRadius.zero,
    blur: image__filter__blur__crucial,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <widget___protocol>[
        ColoredBox(
          color: color__background__base,
          child: SizedBox(
            width: screen__size().width,
            height: 1.px(),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: array__new__generated(
            page__array__count,
            (final page__id) => //
                Expanded(
              child: items[page__id],
            ),
          ),
        ),
        SizedBox(
          height: screen__padding.bottom,
        ),
      ],
    ),
  );
} */

widget___protocol _button__un_selected(
  final IconData icon,
  final VoidCallback onPress,
) =>
    GestureDetector(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 4.px(),
        ),
        child: icon(
          icon,
          size: 28.px(),
          color: color__foreground__dim,
        ),
      ),
      onTap: onPress,
    );

widget___protocol _button__selected(final IconData icon) => //
    Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 4.px(),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <widget___protocol>[
          widget__separat_or__vertical,
          icon(
            icon,
            size: 28.px(),
          ),
          SizedBox(
            height: 2.px(),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              color: color__foreground__dim,
              borderRadius: BorderRadius.all(Radius.circular(2.px())),
            ),
            child: SizedBox(
              width: 20.px(),
              height: 4.px(),
            ),
          ),
          widget__separat_or__vertical,
        ],
      ),
    );
