part of "_.dart";

widget___protocol winter__widget__input__number__count({
  required final procedure__empty__format in_crement__handle,
  required final procedure__empty__format de_crement__handle,
}) =>
    Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        winter__widget__button__icon__small(
          flutter__icon__plus,
          in_crement__handle,
        ),
        SizedBox(
          height: 4.px(),
        ),
        winter__widget__button__icon__small(
          flutter__icon__minus,
          de_crement__handle,
        ),
      ],
    );

widget___protocol winter__widget__button__icon__small(
  final IconData icon,
  final procedure__empty__format press__handle,
) =>
    winter__box__button(
      border__radius: BorderRadius.all(
        Radius.circular(8.px()),
      ),
      child: Padding(
        padding: EdgeInsets.all(
          6.px(),
        ),
        child: icon(
          icon,
        ),
      ),
      onSinglePress: press__handle,
    );
