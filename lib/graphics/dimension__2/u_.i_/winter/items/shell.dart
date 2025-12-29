part of "../_.dart";

gui__base__widget winter__listing__shell__title({
  final gui__base__widget? leading,
  required final string primary__text,
  final string? secondary__text,
  final gui__base__widget? trailing,
}) {
  final gui__base__widget //
      primary__text = gui__base__box__text__widget(
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
              children: <gui__base__widget>[
                primary__text,
                gui__base__box__text__widget(
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
      children: <gui__base__widget>[
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

gui__base__widget winter__listing__shell({
  final BorderRadius? border__radius,
  required final ARRAY<gui__base__widget> items,
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
