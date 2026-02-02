part of "_.dart";

widget___protocol winter__box__text__primary(
  final string s, {
  final Color? color,
}) =>
    box__text__widget(
      s,
      font__color: color,
      font__weight: FontWeight.w600,
    );

widget___protocol winter__box__text__secondary(
  final string s, {
  final Color? color,
}) =>
    box__text__widget(
      s,
      font__color: (color ?? color__foreground__dim),
      font__size: 14.px(),
    );

widget___protocol winter__box__text__multi({
  required final widget___protocol top,
  required final widget___protocol bottom,
}) => //
    Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <widget___protocol>[
        top,
        SizedBox(
          height: 4.px(),
        ),
        bottom,
      ],
    );

widget___protocol winter__box__text__primary__secondary(
  final string primary__text,
  final string secondary__text, {
  final Color? primary__color,
  final Color? secondary__color,
}) => //
    box__text__multi(
      top: box__text__primary(
        primary__text,
        color: primary__color,
      ),
      bottom: box__text__secondary(
        secondary__text,
        color: secondary__color,
      ),
    );

widget___protocol winter__box__text__primary__secondary__auto({
  required final string primary__text,
  final Color? primary__color,
  final string? secondary__text,
  final Color? secondary__color,
}) => //
    ((secondary__text == null)
        ? box__text__primary(
            primary__text,
            color: primary__color,
          )
        : box__text__primary__secondary(
            primary__text,
            secondary__text,
            primary__color: primary__color,
            secondary__color: secondary__color,
          ));

widget___protocol winter__box__text__secondary__primary({
  required final string secondary__text,
  final Color? secondary__color,
  required final string primary__text,
  final Color? primary__color,
}) => //
    box__text__multi(
      top: box__text__secondary(
        secondary__text,
        color: secondary__color,
      ),
      bottom: box__text__primary(
        primary__text,
        color: primary__color,
      ),
    );

widget___protocol winter__heading__top__widget({
  required final string heading,
  final string? heading__sub,
   final APPROX heading__size=28,
   final APPROX heading__sub__size=20,
  final APPROX padding__top=0,
   final APPROX padding__bottom=0,
}) {
  final title = box__text__widget(
    heading,
    font__size: heading__size,
    font__weight: FontWeight.w700,
    font__family: font__families[font__family__interface__title],
    text__align: TextAlign.start,
  );

  return Padding(
    padding: EdgeInsets.only(
      top: (size__pixel__padding__vertical + padding__top),
      left: (size__pixel__padding__horizontal__double + screen__padding__permanent().left),
      right: (size__pixel__padding__horizontal__double + screen__padding__permanent().right),
      bottom: (size__pixel__padding__vertical+padding__bottom),
    ),
    child: ((heading__sub == null) //
        ? title
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <widget___protocol>[
              title,
              box__text__widget(
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
