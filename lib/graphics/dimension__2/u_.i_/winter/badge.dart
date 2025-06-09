part of "_.dart";

gui__base__widget winter__badge__demo__reference({
  final NEMR? width__min_,
  NEMR? offset,
  required final gui__base__widget /*base__text*/ child,
}) /*
must be in a `stack__widget` */
{
  return Positioned(
    top: -(offset ??= 6.px()),
    right: -offset,
    child: DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8.px()),
        ),
        color: flutter__material__colors.white,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: (width__min_ ?? 16.px()),
        ),
        child: Center(
          child: child,
        ),
      ),
    ),
  );
}
