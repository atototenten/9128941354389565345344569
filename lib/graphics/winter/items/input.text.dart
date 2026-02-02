part of "../_.dart";

widget___protocol winter__input__text({
  required final string title,
  final string? sub_title,
  final string? info_,
  required final widget___protocol input__text /*input__text__base*/,
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
        children: <widget___protocol>[
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
          widget__separat_or__vertical,
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
            widget__separat_or__vertical,
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              children: <widget___protocol>[
                SizedBox(
                  width: size__pixel__padding__horizontal,
                ),
                icon(
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

widget___protocol winter__input__text__search({
  required final widget___protocol body /*input__text__search__body*/,
}) /*
should be wrap-ed in a `GestureDetector` ,to navigate to a new page(or maybe an overlay)
  which has a `input__text__base` */
{
  return winter__listing__item(
    border__radius: BorderRadius.all(
      Radius.circular(12.px()),
    ),
    padding__vertical: size__pixel__padding__vertical,
    padding__leading: size__pixel__padding__horizontal,
    leading: icon(
      flutter__icon__search,
      color: color__foreground__dim,
    ),
    body: body,
  );
}

widget___protocol winter__input__text__search__body({
  final string hint__title = "Search for",
  required final ARRAY<string> hint__items,
}) =>
    Wrap(
      children: <widget___protocol>[
        box__text__widget(
          hint__title,
          font__color: color__foreground__dim,
        ),
        SizedBox(
          width: 4.px(),
        ),
        box__text__widget(
          hint__items.join(", "),
        ),
      ],
    );
