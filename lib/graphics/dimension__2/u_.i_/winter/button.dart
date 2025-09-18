part of "_.dart";

gui__base__widget winter__button__structure({
  final APPROX scale = 1,
  final IconData? icon,
  final BOOL icon__trailing___ok = NO,
  required final string text,
}) {
  final //
      b__icon__available = (icon != null),
      padding__vertical = (8 * scale).px();

  var child = gui__base__box__text__widget(
    text,
    font__size: (16 * scale).px(),
    font__weight: FontWeight.w600,
    text__align: TextAlign.center,
  );

  if (b__icon__available) //
    child = Row(
      mainAxisSize: MainAxisSize.min,
      children: (!icon__trailing__ok
          ? <gui__base__widget>[
              base__icon(
                icon,
              ),
              SizedBox(
                width: (6 * scale).px(),
              ),
              child,
            ]
          : <gui__base__widget>[
              child,
              SizedBox(
                width: (6 * scale).px(),
              ),
              base__icon(
                icon,
              ),
            ]),
    );

  return Padding(
    padding: EdgeInsets.only(
      top: padding__vertical,
      left: (((b__icon__available && !icon__trailing___ok) //
                  ? 12
                  : 16) *
              scale)
          .px(),
      right: (((b__icon__available && icon__trailing___ok) //
                  ? 12
                  : 16) *
              scale)
          .px(),
      bottom: padding__vertical,
    ),
    child: child,
  );
}

typedef base__button___compo = gui__base__widget Function({
  APPROX scale,
  BorderRadius? border__radius,
  BOOL selected___ok,
  IconData? icon,
  BOOL iconAtEnding,
  required string text,
  APPROX? font__size,
  procedure__empty__format? press__handle,
  procedure__empty__format? press__long__handle,
});

gui__base__widget winter__button({
  final APPROX scale = 1,
  final BorderRadius? border__radius,
  final BOOL selected___ok = NO,
  final IconData? icon,
  final BOOL iconAtEnding = NO,
  required final string text,
  final procedure__empty__format? press__handle,
  final procedure__empty__format? press__long__handle,
}) =>
    winter__box__button(
      border__radius: (border__radius ?? BorderRadius.all(Radius.circular(12.px()) * scale)),
      b__highlight: selected___ok,
      child: winter__button__structure(
        scale: scale,
        icon: icon,
        icon__trailing___ok: iconAtEnding,
        text: text,
      ),
      onSinglePress: press__handle,
      onLongPress: press__long__handle,
    );

gui__base__widget winter__button__floating({
  final APPROX scale = 1,
  final BorderRadius? border__radius,
  final BOOL selected___ok = NO,
  final IconData? icon,
  final BOOL iconAtEnding = NO,
  required final string text,
  final procedure__empty__format? press__handle,
  final procedure__empty__format? press__long__handle,
}) =>
    winter__box__button__floating(
      border__radius: (border__radius ?? //
          BorderRadius.all(
            (Radius.circular(12.px()) * scale),
          )),
      b__highlight: selected___ok,
      child: winter__button__structure(
        scale: scale,
        icon: icon,
        icon__trailing___ok: iconAtEnding,
        text: text,
      ),
      onSinglePress: press__handle,
      onLongPress: press__long__handle,
    );

gui__base__widget winter__button__floating__basic({
  required final gui__base__widget body,
  final procedure__empty__format? press__handle,
  final procedure__empty__format? press__long__handle,
}) =>
    winter__box__button__floating(
      border__radius: BorderRadius.all(
        Radius.circular(32.px()),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.px(),
          vertical: 8.px(),
        ),
        child: body,
      ),
      onSinglePress: press__handle,
      onLongPress: press__long__handle,
    );
