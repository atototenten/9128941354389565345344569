part of "_.dart";

widget___protocol winter__badge__demo__reference({
  final APPROX? width__min_,
  APPROX? offset,
  required final widget___protocol child /*text*/,
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
