part of "_.dart";

const gui__base__widget gui__base__empty__widget = SizedBox.shrink();

gui__base__widget gui__base__widget__empty__build(
  final gui__base__widget__building__context context,
) {
  return gui__base__empty__widget;
}

gui__base__widget gui__base__stack__widget({
  final AlignmentGeometry alignment = AlignmentDirectional.topStart,
  final StackFit fit = StackFit.loose,
  final Clip clipping = Clip.hardEdge,
  required final array<gui__base__widget> children,
}) {
  return Stack(
    alignment: alignment,
    textDirection: TextDirection.ltr,
    fit: fit,
    clipBehavior: clipping,
    children: children,
  );
}

gui__base__widget gui__base__gesture__press__handling__widget({
  final HitTestBehavior? behavior,
  required final procedure__empty__format press__handle,
  final void Function(TapDownDetails details)? press__down__handle,
  final void Function(TapUpDetails details)? press__up__handle,
  final procedure__empty__format? press__cancel__handle,
  required final gui__base__widget child,
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

//

gui__base__widget gui__base__child__keyed__widget /*
for ambiguity removal */
    ({
  required final Key key,
  required final gui__base__widget child,
}) {
  return SizedBox.shrink(
    key: key,
    child: child,
  );
}

gui__base__widget gui__base__child__padded__widget({
  required final APPROX padding,
  required final gui__base__widget child,
}) {
  return Padding(
    padding: EdgeInsets.all(
      padding.px(),
    ),
    child: child,
  );
}

gui__base__widget gui__base__child__padded__symmetric__widget({
  final APPROX padding__horizontal = 0,
  final APPROX padding__vertical = 0,
  required final gui__base__widget child,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: padding__horizontal.px(),
      vertical: padding__vertical.px(),
    ),
    child: child,
  );
}

gui__base__widget gui__base__child__padded__custom__widget({
  final APPROX padding__top = 0,
  final APPROX padding__left = 0,
  final APPROX padding__right = 0,
  final APPROX padding__bottom = 0,
  required final gui__base__widget child,
}) {
  return Padding(
    padding: EdgeInsets.only(
      top: padding__top.px(),
      left: padding__left.px(),
      right: padding__right.px(),
      bottom: padding__bottom.px(),
    ),
    child: child,
  );
}

gui__base__widget gui__base__child__constrained__widget({
  final APPROX width__min_ = 0,
  final APPROX width__max_ = APPROX.maxFinite,
  final APPROX height__min_ = 0,
  final APPROX height__max_ = APPROX.maxFinite,
  required final gui__base__widget child,
}) {
  return ConstrainedBox(
    constraints: BoxConstraints(
      minWidth: width__min_,
      maxWidth: width__max_,
      minHeight: height__min_,
      maxHeight: height__max_,
    ),
    child: child,
  );
}

gui__base__widget gui__base__child__constrained__tight__widget({
  final APPROX? width,
  final APPROX? height,
  required final gui__base__widget child,
}) {
  return SizedBox(
    width: width,
    height: height,
    child: child,
  );
}

gui__base__widget gui__base__child__constrained__tight__square__widget({
  required final APPROX dimension,
  required final gui__base__widget child,
}) =>
    SizedBox.square(
      dimension: dimension,
      child: child,
    );

gui__base__widget gui__base__child__constrained__tight__max__widget({
  final BOOL width___ok = OK,
  final BOOL height___ok = OK,
  required final gui__base__widget child,
}) =>
    SizedBox(
      width: (width___ok //
          ? APPROX.maxFinite
          : NIL),
      height: (height___ok //
          ? APPROX.maxFinite
          : NIL),
      child: child,
    );

gui__base__widget gui__base__child__rotated__wise__clock__widget(
  final INT rotation,
  final gui__base__widget child,
) {
  return RotatedBox(
    quarterTurns: rotation,
    child: child,
  );
}

gui__base__widget gui__base__child__rotated__wise__clock__reverse__widget(
  final INT rotation,
  final gui__base__widget child,
) {
  return RotatedBox(
    quarterTurns: (4 - rotation),
    child: child,
  );
}

//

gui__base__widget gui__base__box__widget({
  final APPROX? width,
  final APPROX? height,
}) {
  return SizedBox(
    width: width,
    height: height,
  );
}

gui__base__widget gui__base__box__square__widget({
  required final APPROX dimension,
}) =>
    SizedBox.square(
      dimension: dimension,
    );

gui__base__widget gui__base__box__expanded__widget({
  final BOOL width___ok = OK,
  final BOOL height___ok = OK,
}) =>
    SizedBox(
      width: (width___ok //
          ? APPROX.maxFinite
          : NIL),
      height: (height___ok //
          ? APPROX.maxFinite
          : NIL),
    );
