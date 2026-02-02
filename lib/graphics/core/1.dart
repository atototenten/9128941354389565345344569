part of "_.dart";

const widget___protocol empty__widget = SizedBox.shrink();

widget___protocol widget__empty__build(
  final widget__building__context___compo context,
) {
  return empty__widget;
}

widget___protocol widget__building__boundary__build(
  final widget__building__context___compo context, {
  required final Key key,
  required final widget___protocol child,
}) {
  return SizedBox(
    key: key,
    child: child,
  );
}

widget___protocol widget__painting__boundary__build(
  final widget__building__context___compo context, {
  required final widget___protocol child,
}) {
  return RepaintBoundary(
    child: child,
  );
}

widget___protocol widget__sequence___widget(
  final widget__building__context___compo context, {
  final Axis direction = Axis.vertical,
  final axis__alignment___enum? axis__main__alignment /*
arg.'s presence leads to expansion (similar to "BOOL expand___ok = TRUE") */,
  final axis__alignment___enum axis__cross__alignment = axis__alignment___enum.center,
  final APPROX spacing = 0,
  required final ARRAY<widget___protocol> children,
}) {
  return Flex(
    direction: direction,
    mainAxisSize:
        ((axis__main__alignment == null) //
        ? MainAxisSize.min
        : MainAxisSize.max),
    mainAxisAlignment: switch (axis__main__alignment) {
      axis__alignment___enum.beginning => MainAxisAlignment.start,
      axis__alignment___enum.center => MainAxisAlignment.center,
      axis__alignment___enum.ending => MainAxisAlignment.end,
      null => /*NIL*/ MainAxisAlignment.start,
    },
    crossAxisAlignment: switch (axis__cross__alignment) {
      axis__alignment___enum.beginning => CrossAxisAlignment.start,
      axis__alignment___enum.center => CrossAxisAlignment.center,
      axis__alignment___enum.ending => CrossAxisAlignment.end,
    },
    clipBehavior: Clip.none,
    textDirection: TextDirection.ltr,
    verticalDirection: VerticalDirection.down,
    textBaseline: NIL,
    spacing: spacing,
    children: children,
  );
}

enum axis__alignment___enum {
  beginning,
  center,
  ending,
}

widget___protocol widget__stack___widget(
  final widget__building__context___compo context, {
  final AlignmentGeometry alignment = AlignmentDirectional.topStart,
  final StackFit fitting = StackFit.loose,
  required final ARRAY<widget___protocol> children,
}) {
  return Stack(
    alignment: alignment,
    textDirection: TextDirection.ltr,
    fit: fitting,
    clipBehavior: Clip.none,
    children: children,
  );
}

widget___protocol gesture__detection__widget({
  final HitTestBehavior? behavior,
  required final procedure__empty__format press__handle,
  final void Function(TapDownDetails details)? press__down__handle,
  final void Function(TapUpDetails details)? press__up__handle,
  final procedure__empty__format? press__cancel__handle,
  required final widget___protocol child,
}) {
  return GestureDetector(
    onTap: press__handle,
    onTapDown: press__down__handle,
    onTapUp: press__up__handle,
    onTapCancel: press__cancel__handle,
    behavior: behavior,
    child: child,
  );
}

widget___protocol gesture__detection__target__widget(
  final widget__building__context___compo context, {
  required final widget___protocol child,
}) {
  return ColoredBox(
    color: color__transparent,
    child: child,
  );
}

widget___protocol child__rotated__wise__clock__widget(
  final INT rotation,
  final widget___protocol child,
) {
  return RotatedBox(
    quarterTurns: rotation,
    child: child,
  );
}

widget___protocol child__rotated__wise__clock__reverse__widget(
  final INT rotation,
  final widget___protocol child,
) {
  return RotatedBox(
    quarterTurns: (4 - rotation),
    child: child,
  );
}

//

widget___protocol box__widget({
  final APPROX? width,
  final APPROX? height,
}) {
  return SizedBox(
    width: width,
    height: height,
  );
}

widget___protocol box__square__widget({
  required final APPROX dimension,
}) {
  return SizedBox.square(
    dimension: dimension,
  );
}

widget___protocol box__expanded__widget({
  final BOOL width___ok = TRUE,
  final BOOL height___ok = TRUE,
}) {
  return SizedBox(
    width:
        (width___ok //
        ? APPROX.maxFinite
        : NIL),
    height:
        (height___ok //
        ? APPROX.maxFinite
        : NIL),
  );
}
