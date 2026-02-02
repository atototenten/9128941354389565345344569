part of "_.dart";

const //
    navigation__top__bubble__padding = 24.0,
    navigation__top__bubble__button__icon__size = 24.0,
    navigation__top__bubble__button__padding = 12.0,
    navigation__top__bubble__button__size__estimated = //
        (navigation__top__bubble__button__icon__size + //
            (2 * navigation__top__bubble__button__padding));

widget___protocol winter__navigation__top__button({
  required final IconData icon,
  required final procedure__empty__format press__handle,
}) {
  return winter__box__button__floating(
    border__radius: BorderRadius.all(Radius.circular(32)).px(),
    blur: image__filter__blur(
      image__filter__blur__crucial,
    ),
    child: child__padded__widget(
      padding: navigation__top__bubble__button__padding,
      child: icon(
        icon,
        size: navigation__top__bubble__button__icon__size,
        color: ,
      ),
    ),
    onSinglePress: press__handle,
  );
}

widget___protocol winter__navigation__top({
  final widget? left,
  final widget? right,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <widget___protocol>[
      (left ?? empty__widget),
      Spacer(),
      (right ?? empty__widget),
    ],
  );
}
