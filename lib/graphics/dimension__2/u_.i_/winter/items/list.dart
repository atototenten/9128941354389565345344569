part of "../_.dart";

BorderRadius gui__base__listing__item__position__top__border__radius([
  final BOOL b__nested = NO,
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

BorderRadius gui__base__listing__item__position__middle__border__radius([
  final BOOL b__nested = NO,
]) =>
    (!b__nested //
        ? BorderRadius.all(
            radius__half(),
          )
        : BorderRadius.all(
            radius__half(1),
          ));

BorderRadius gui__base__listing__item__position__bottom__border__radius([
  final BOOL b__nested = NO,
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

BorderRadius gui__base__listing__item__border__radius(
  final NIMR item__id,
  final NIMR item__array__count, [
  final BOOL b__nested = NO,
]) =>
    ((item__id == (item__array__count - 1)) /* last item */ //
        ? gui__base__listing__item__position__bottom__border__radius(b__nested)
        : ((item__id != 0) /* NOT first item */ //
            ? gui__base__listing__item__position__middle__border__radius(b__nested)
            : gui__base__listing__item__position__top__border__radius(b__nested)));

gui__base__widget winter__listing__item__structure({
  final NEMR? padding__vertical,
  final NEMR? padding__leading,
  final gui__base__widget? leading,
  required final gui__base__widget body,
  final gui__base__widget? trailing,
  final NEMR? padding__trailing,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: (padding__vertical ?? size__pixel__padding__vertical__double),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: <gui__base__widget>[
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

gui__base__widget winter__listing__item({
  /*required final NI1R position,*/
  final BorderRadius? border__radius,
  final BOOL selected__ok = NO,
  final BOOL b__expand = OK,
  final NEMR? padding__vertical,
  final NEMR? padding__leading,
  final gui__base__widget? leading,
  required final gui__base__widget body,
  final gui__base__widget? trailing,
  final NEMR? padding__trailing,
}) =>
    winter__box__base(
      border__radius: border__radius,
      b__highlight: selected__ok,
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

gui__base__widget winter__listing__item__info__summary({
  final BorderRadius? border__radius,
  required final gui__base__widget body,
  required final procedure__empty__format press__handle,
}) =>
    GestureDetector(
      onTap: press__handle,
      child: winter__box__base(
        border__radius: border__radius,
        b__highlight: NO,
        child: winter__listing__item__structure(
          padding__vertical: size__pixel__padding__vertical,
          padding__leading: size__pixel__padding__horizontal,
          leading: base__icon(
            flutter__icon__info,
          ),
          body: body,
          trailing: base__icon(
            flutter__icon__press_able,
          ),
          padding__trailing: size__pixel__padding__horizontal,
        ),
      ),
    );

gui__base__widget winter__listing__item__info({
  required final gui__base__widget body,
}) =>
    winter__listing__item__structure(
      padding__vertical: size__pixel__padding__vertical,
      padding__leading: size__pixel__padding__horizontal,
      leading: base__icon(
        flutter__icon__info,
      ),
      body: body,
      padding__trailing: size__pixel__padding__horizontal,
    );
