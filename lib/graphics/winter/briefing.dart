part of "_.dart";

/*
class Briefing extends Statelesswidget___compo {
  const Briefing({
    required this.texts,
    this.title = "Now",
  }) : super(key: key);

  final List<String> texts;
  final String title;

  @override
  widget___protocol build(final widget__building__context___compo context) {
    final widget___protocol separator = Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8.px(),
      ),
      child: Text(
        String.fromCharCode(bulletCharCode),
        style: TextStyle(
          color: color__foreground__dimmer,
          font__weight: FontWeight.w600,
        ),
      ),
    );

    final int widgetCount = ((texts.length * 2) - 1);

    final List<widget___protocol> children = List<widget___protocol>.filled(
      widgetCount,
      separator,
      growable: FALSE,
    );

    int widgetCounter = 0;

    final TextStyle briefingTextStyle = TextStyle(
      font__size: 18.px(),
      font__weight: FontWeight.w600,
    );

    final EdgeInsets briefingTextPadding = EdgeInsets.all(4.px());

    while (true) {
      children[widgetCounter++] = Padding(
        padding: briefingTextPadding,
        child: Text(
          texts[(widgetCounter ~/ 2)],
          style: briefingTextStyle,
        ),
      );

      if (widgetCounter < widgetCount) {
        children[widgetCounter++] = separator;
      } else {
        break;
      }
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        color: color__theme[color__background__light],
        borderRadius: BorderRadius.all(Radius.circular(12.px())),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8.px(),
          vertical: 4.px(),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <widget___protocol>[
            Padding(
              padding: EdgeInsets.only(
                right: 16.px(),
              ),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: color__theme[color__background__lighter],
                  borderRadius: BorderRadius.all(Radius.circular(8.px())),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.px(),
                    vertical: 4.px(),
                  ),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: color__foreground__default,
                    ),
                  ),
                ),
              ),
            ),
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: children,
            ),
          ],
        ),
      ),
    );
  }
}
*/
