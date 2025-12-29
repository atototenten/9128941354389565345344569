part of "../_.dart";

gui__base__widget winter__input__text({
  required final string title,
  final string? sub_title,
  final string? info_,
  required final gui__base__widget input__text /*base__input__text__base*/,
}) {
  final //
      border__radius = BorderRadius.all(
    Radius.circular(12.px()),
  );

  return winter__box__base(
    child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size__pixel__padding__horizontal,
        vertical: size__pixel__padding__vertical,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <gui__base__widget>[
          Padding(
            padding: EdgeInsets.only(
              top: size__pixel__padding__vertical,
              left: size__pixel__padding__horizontal__double,
            ),
            child: winter__box__text__primary__secondary__auto(
              primary__text: title,
              secondary__text: sub_title,
            ),
          ),
          gui__base__widget__separat_or__vertical,
          SizedBox(
            width: APPROX.maxFinite,
            child: winter__box__non_button /* for `color__background__nested` bg */ (
              border__radius: border__radius,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size__pixel__padding__horizontal__double,
                ),
                child: input__text,
              ),
            ),
          ),
          if (info_ != null) ...[
            gui__base__widget__separat_or__vertical,
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              children: <gui__base__widget>[
                SizedBox(
                  width: size__pixel__padding__horizontal,
                ),
                base__icon(
                  flutter__icon__hint,
                  size: 18.px(),
                  color: color__foreground__dimmer,
                ),
                SizedBox(width: 4.px()),
                winter__box__text__secondary(
                  info_,
                ),
              ],
            ),
          ],
        ],
      ),
    ),
  );
}

gui__base__widget winter__input__text__search({
  required final gui__base__widget body /*base__input__text__search__body*/,
}) /*
should be wrap-ed in a `GestureDetector` ,to navigate to a new page(or maybe an overlay)
  which has a `base__input__text__base` */
{
  return winter__listing__item(
    border__radius: BorderRadius.all(
      Radius.circular(12.px()),
    ),
    padding__vertical: size__pixel__padding__vertical,
    padding__leading: size__pixel__padding__horizontal,
    leading: base__icon(
      flutter__icon__search,
      color: color__foreground__dim,
    ),
    body: body,
  );
}

gui__base__widget winter__input__text__search__body({
  final string hint__title = "Search for",
  required final ARRAY<string> hint__items,
}) =>
    Wrap(
      children: <gui__base__widget>[
        gui__base__box__text__widget(
          hint__title,
          font__color: color__foreground__dim,
        ),
        SizedBox(
          width: 4.px(),
        ),
        gui__base__box__text__widget(
          hint__items.join(", "),
        ),
      ],
    );
