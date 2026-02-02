part of "_.dart";

const //
    _icon__close = flutter__icon__close__round;

widget___protocol winter__overlay__bottom__button__dismiss(
  final widget__building__context___compo context,{
  required final string title,
  final procedure__empty__format? dismiss__handle,
}) =>
    winter__button__floating__basic(
      body: box__text__widget(
        title,
        font__size: 18.px(),
        font__weight: FontWeight.w700,
        text__align: TextAlign.center,
      ),
      press__handle: (dismiss__handle ?? () => context.navigation().backward()),
    );

widget___protocol winter__overlay__bottom__dismiss__swipe__indication() /*
pill at sheet's top */
{
  final //
      height = 8.px(),
      width = (4 * height);

  return DecoratedBox(
    decoration: BoxDecoration(
      color: /*color__foreground__dim*/ color__transparent__dark /* FIX */,
      borderRadius: BorderRadius.all(Radius.circular(16.px())),
    ),
    child: SizedBox(
      width: width,
      height: height,
    ),
  );
}

widget___protocol winter__overlay__bottom__base({
  final ui.ImageFilter? back_ground__filter,
  final APPROX? padding__top /*(.25 * (screen__size().height - screen__padding.top))*/,
  final Color? back_ground__color,
  final Radius? border__top__radius,
  required final widget___protocol child,
}) =>
    Align(
      alignment: Alignment.bottomCenter,
      child: BackdropFilter(
        filter: (back_ground__filter ??
            image__filter__blur(
              image__filter__blur__default,
            )),
        child: Padding(
          padding: EdgeInsets.only(
            top: (padding__top ?? 0),
            left: page__padding__left,
            right: page__padding__right,
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: (back_ground__color ?? color__background__base),
              border: Border.all(
                color: color__border,
              ),
              borderRadius: BorderRadius.vertical(
                top: (border__top__radius ?? Radius.circular(32.px())),
              ),
            ),
            child: SizedBox(
              width: wall__width(),
              child: child,
            ),
          ),
        ),
      ),
    );

widget___protocol winter__overlay__bottom__menu(
  final widget__building__context___compo context, {
  final ui.ImageFilter? back_ground__filter,
  final APPROX? padding__top,
  final Color? back_ground__color,
  final Radius? border__top__radius,
  final BOOL dismiss__swipe__indication___ok = TRUE,
  final BOOL button__close___ok = TRUE,
  required final string title,
  final string? sub_title,
  required final widget? body /*
if `Column` ,`mainAxisSize` should be `MainAxisSize.min`
`overlay__bottom__button__dismiss` can also be used
if input:text is present ,prefer padding items ,through `SizedBox(height: screen__padding.bottom,)` */
  ,
}) =>
    winter__overlay__bottom__base(
      back_ground__filter: back_ground__filter,
      padding__top: padding__top,
      back_ground__color: back_ground__color,
      border__top__radius: border__top__radius,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: size__pixel__padding__vertical,
          ),
          stack___widget(
            alignment: Alignment.topCenter,
            children: [
              if (dismiss__swipe__indication___ok) //
                winter__overlay__bottom__dismiss__swipe__indication(),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size__pixel__padding__horizontal,
                ),
                child: winter__navigation__top(
                  left: winter__navigation__top__button(
                    icon: flutter__icon__navigation__backward,
                    press__handle: () => context.navigation().backward(),
                  ),
                  right: (button__close___ok //
                      ? winter__navigation__top__button(
                          icon: _icon__close,
                          press__handle: () => context.navigation().backward(),
                        )
                      : NIL),
                ),
              ),
            ],
          ),
          SizedBox(height: 4.px()),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size__pixel__padding__horizontal,
              ),
              child: winter__heading__top__widget(
                heading: title,
                heading__sub: sub_title,
                padding__top: (navigation__top__bubble__button__size__estimated + navigation__top__bubble__padding).px(),
              ),
            ),
          ),
          SizedBox(
            height: size__pixel__padding__vertical__double,
          ),
          if (body != null) //
            body,
        ],
      ),
    );
