part of "_.dart";

gui__base__widget winter__box__text__primary(
  final string__raw s, {
  final Color? color,
}) =>
    gui__base__box__text__widget(
      s,
      font__color: color,
      font__weight: FontWeight.w600,
    );

gui__base__widget winter__box__text__secondary(
  final string__raw s, {
  final Color? color,
}) =>
    gui__base__box__text__widget(
      s,
      font__color: (color ?? color__foreground__dim),
      font__size: 14.px(),
    );

gui__base__widget winter__box__text__multi({
  required final gui__base__widget top,
  required final gui__base__widget bottom,
}) => //
    Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <gui__base__widget>[
        top,
        SizedBox(
          height: 4.px(),
        ),
        bottom,
      ],
    );

gui__base__widget winter__box__text__primary__secondary(
  final string__raw primary__text,
  final string__raw secondary__text, {
  final Color? primary__color,
  final Color? secondary__color,
}) => //
    gui__base__box__text__multi(
      top: gui__base__box__text__primary(
        primary__text,
        color: primary__color,
      ),
      bottom: gui__base__box__text__secondary(
        secondary__text,
        color: secondary__color,
      ),
    );

gui__base__widget winter__box__text__primary__secondary__auto({
  required final string__raw primary__text,
  final Color? primary__color,
  final string__raw? secondary__text,
  final Color? secondary__color,
}) => //
    ((secondary__text == null)
        ? gui__base__box__text__primary(
            primary__text,
            color: primary__color,
          )
        : gui__base__box__text__primary__secondary(
            primary__text,
            secondary__text,
            primary__color: primary__color,
            secondary__color: secondary__color,
          ));

gui__base__widget winter__box__text__secondary__primary({
  required final string__raw secondary__text,
  final Color? secondary__color,
  required final string__raw primary__text,
  final Color? primary__color,
}) => //
    gui__base__box__text__multi(
      top: gui__base__box__text__secondary(
        secondary__text,
        color: secondary__color,
      ),
      bottom: gui__base__box__text__primary(
        primary__text,
        color: primary__color,
      ),
    );

gui__base__widget winter__heading__top__widget({
  required final string__raw heading,
  final string__raw? heading__sub,
   final NEMR heading__size=28,
   final NEMR heading__sub__size=20,
  final NEMR padding__top=0,
   final NEMR padding__bottom=0,
}) {
  final title = gui__base__box__text__widget(
    heading,
    font__size: heading__size,
    font__weight: FontWeight.w700,
    font__family: font__families[font__family__interface__title],
    text__align: TextAlign.start,
  );

  return Padding(
    padding: EdgeInsets.only(
      top: (size__pixel__padding__vertical + padding__top),
      left: (size__pixel__padding__horizontal__double + base__screen__padding__permanent().left),
      right: (size__pixel__padding__horizontal__double + base__screen__padding__permanent().right),
      bottom: (size__pixel__padding__vertical+padding__bottom),
    ),
    child: ((heading__sub == null) //
        ? title
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <gui__base__widget>[
              title,
              gui__base__box__text__widget(
                heading__sub,
                font__color: color__foreground__dim,
                font__size: heading__sub__size,
                font__weight: FontWeight.w600,
                font__family: font__families[font__family__interface__sub_title],
                text__align: TextAlign.start,
              ),
            ],
          )),
  );
}
