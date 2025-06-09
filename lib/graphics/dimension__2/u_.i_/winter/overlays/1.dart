part of "../_.dart";

gui__base__widget winter__overlay__notice__basic({
  final IconData? icon = flutter__material__icons.info_outlined,
  required final string__raw title,
  final string__raw? body,
  final Color background__color = const Color(0xFFDDDDDD),
}) {
  final //
      separat_ion = SizedBox(height: 4.px()),
      body__ok = (body != null);

  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: 32.px(),
      vertical: 64.px(),
    ),
    child: DecoratedBox(
      decoration: BoxDecoration(
        color: background__color,
        borderRadius: BorderRadius.all(
          Radius.circular(24.px()),
        ),
      ),
      child: SizedBox(
        width: NEMR.maxFinite,
        child: Padding(
          padding: EdgeInsets.all(16.px()),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              separat_ion,
              if (icon != null) //
                ...[
                base__icon(
                  icon,
                  size: 64.px(),
                  color: color__foreground__dim,
                ),
                SizedBox(height: 12.px()),
              ],
              gui__base__box__text__widget(
                title,
                font__size: 16.px(),
                font__weight: (body__ok //
                    ? FontWeight.w600
                    : FontWeight.w400),
              ),
              if (body__ok) //
                ...[
                SizedBox(height: 8.px()),
                gui__base__box__text__widget(
                  body,
                  font__size: 16.px(),
                  font__color: color__foreground__dim,
                ),
              ],
              separat_ion,
            ],
          ),
        ),
      ),
    ),
  );
}

gui__base__widget winter__overlay__issue({
  final string__raw title = "Issue found",
  required final string__raw issue,
}) {
  return winter__overlay__notice__basic(
    icon: flutter__material__icons. /*report_outlined*/ warning_amber_outlined,
    title: title,
    body: issue,
  );
}
