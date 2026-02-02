part of "../_.dart";

widget___protocol winter__listing__shell__title({
  final widget? leading,
  required final string primary__text,
  final string? secondary__text,
  final widget? trailing,
}) {
  final widget___protocol //
      primary__text = box__text__widget(
        primary__text,
        font__size: 20.px(),
        font__weight: FontWeight.w700,
        font__family: font__families[font__family__interface__title],
      ),
      texts = ((secondary__text == null)
          ? primary__text
          : Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <widget___protocol>[
                primary__text,
                box__text__widget(
                  secondary__text,
                  font__color: color__foreground__dim,
                  font__size: 16.px(),
                  font__weight: FontWeight.w600,
                  font__family: font__families[font__family__interface__sub_title],
                ),
              ],
            )),
      child;

  if ((leading != null) || ((trailing != null))) {
    child = Row(
      children: <widget___protocol>[
        Padding(
          padding: EdgeInsets.only(
            left: size__pixel__padding__horizontal,
            right: ((leading == null) //
                ? 0
                : size__pixel__padding__horizontal),
          ),
          child: leading,
        ),
        Expanded(
          child: texts,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 4.px(),
            right: ((trailing == null) //
                ? 0
                : 6.px()),
          ),
          child: trailing,
        ),
      ],
    );
  } else {
    child = Padding(
      padding: EdgeInsets.only(
        left: size__pixel__padding__horizontal__double,
      ),
      child: texts,
    );
  }

  return Padding(
    padding: EdgeInsets.only(
      top: 2.px(),
      bottom: 4.px(),
    ),
    child: child,
  );
}

widget___protocol winter__listing__shell({
  final BorderRadius? border__radius,
  required final ARRAY<widget___protocol> items,
}) =>
    winter__box__base(
      border__radius: border__radius,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size__pixel__padding__horizontal,
          vertical: size__pixel__padding__vertical,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: items,
        ),
      ),
    );
