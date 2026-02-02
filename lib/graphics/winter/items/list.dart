part of "../_.dart";

BorderRadius listing__item__position__top__border__radius([
  final BOOL b__nested = FALSE,
]) =>
    (!b__nested //
        ? BorderRadius.vertical(
            top: radius__full(),
            bottom: radius__half(),
          )
        : BorderRadius.vertical(
            top: radius__full(1),
            bottom: radius__half(1),
          ));

BorderRadius listing__item__position__middle__border__radius([
  final BOOL b__nested = FALSE,
]) =>
    (!b__nested //
        ? BorderRadius.all(
            radius__half(),
          )
        : BorderRadius.all(
            radius__half(1),
          ));

BorderRadius listing__item__position__bottom__border__radius([
  final BOOL b__nested = FALSE,
]) =>
    (!b__nested //
        ? BorderRadius.vertical(
            top: radius__half(),
            bottom: radius__full(),
          )
        : BorderRadius.vertical(
            top: radius__half(1),
            bottom: radius__full(1),
          ));

BorderRadius listing__item__border__radius(
  final INT item__id,
  final INT item__array__count, [
  final BOOL b__nested = FALSE,
]) =>
    ((item__id == (item__array__count - 1)) /* last item */ //
        ? listing__item__position__bottom__border__radius(b__nested)
        : ((item__id != 0) /* NOT first item */ //
            ? listing__item__position__middle__border__radius(b__nested)
            : listing__item__position__top__border__radius(b__nested)));

widget___protocol winter__listing__item__structure({
  final APPROX? padding__vertical,
  final APPROX? padding__leading,
  final widget? leading,
  required final widget___protocol body,
  final widget? trailing,
  final APPROX? padding__trailing,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: (padding__vertical ?? size__pixel__padding__vertical__double),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: <widget___protocol>[
        SizedBox(
          width: (padding__leading ?? size__pixel__padding__horizontal__double),
        ),
        if (leading != null) //
          Padding(
            padding: EdgeInsets.only(
              right: size__pixel__padding__horizontal,
            ),
            child: leading,
          ),
        Expanded(
          child: body,
        ),
        if (trailing != null) //
          Padding(
            padding: EdgeInsets.only(
              left: 2.px(),
            ),
            child: trailing,
          ),
        SizedBox(
          width: (padding__trailing ?? size__pixel__padding__horizontal),
        ),
      ],
    ),
  );
}

const //
    listing__item__position__middle = 0,
    listing__item__position__top = 1,
    listing__item__position__bottom = 2;

widget___protocol winter__listing__item({
  /*required final INT position,*/
  final BorderRadius? border__radius,
  final BOOL selected___ok = FALSE,
  final BOOL b__expand = TRUE,
  final APPROX? padding__vertical,
  final APPROX? padding__leading,
  final widget? leading,
  required final widget___protocol body,
  final widget? trailing,
  final APPROX? padding__trailing,
}) =>
    winter__box__base(
      border__radius: border__radius,
      b__highlight: selected___ok,
      child: winter__listing__item__structure(
        padding__vertical: padding__vertical,
        b_expand: b__expand,
        padding__leading: padding__leading,
        leading: leading,
        body: body,
        trailing: trailing,
        padding__trailing: padding__trailing,
      ),
    );

widget___protocol winter__listing__item__info__summary({
  final BorderRadius? border__radius,
  required final widget___protocol body,
  required final procedure__empty__format press__handle,
}) =>
    GestureDetector(
      onTap: press__handle,
      child: winter__box__base(
        border__radius: border__radius,
        b__highlight: FALSE,
        child: winter__listing__item__structure(
          padding__vertical: size__pixel__padding__vertical,
          padding__leading: size__pixel__padding__horizontal,
          leading: icon(
            flutter__icon__info,
          ),
          body: body,
          trailing: icon(
            flutter__icon__press_able,
          ),
          padding__trailing: size__pixel__padding__horizontal,
        ),
      ),
    );

widget___protocol winter__listing__item__info({
  required final widget___protocol body,
}) =>
    winter__listing__item__structure(
      padding__vertical: size__pixel__padding__vertical,
      padding__leading: size__pixel__padding__horizontal,
      leading: icon(
        flutter__icon__info,
      ),
      body: body,
      padding__trailing: size__pixel__padding__horizontal,
    );
