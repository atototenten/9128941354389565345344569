part of "../_.dart";

widget___protocol winter__button__icon__circled(
  final IconData icon,
  final VoidCallback on_press,
) =>
    GestureDetector(
      child: DecoratedBox(
        decoration: ShapeDecoration(
          shape: StadiumBorder(
            side: BorderSide(
              color: color__foreground__dimmest,
              width: 1.px(),
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(2.px()),
          child: icon(
            icon,
            color: color__foreground__dim,
          ),
        ),
      ),
      onTap: on_press,
    );

/*widget___protocol winter__listing__item__expandable({
  final BorderRadius? border__radius,
  BOOL b__expanded = FALSE,
  final widget? collapsed__leading,
  final void Function(procedure__empty collapse)? expand__handle,
  final void Function(procedure__empty expand)? collapse__handle,
  required final widget___protocol collapsed__body,
  required final widget___protocol Function(widget___protocol trailing) expanded__widget,
}) {
  procedure__empty__format? build__re;

  void expand() {
    b__expanded = TRUE;
    build__re?.call();
  }

  void collapse() {
    b__expanded = FALSE;
    build__re?.call();
  }

  return widget__build__definitive(
    init_: (final context) {
      build__re = context.build__re;
    },
    de_init_: (final context) {
      build__re = NIL;
    },
    build: (_) {
      return (b__expanded
          ? expanded__widget(
              button__icon__circled(
                flutter__icon__collapse,
                () {
                  collapse();
                  collapse__handle?.call(expand);
                },
              ),
            )
          : GestureDetector(
              child: listing__item(
                border__radius: border__radius,
                leading: collapsed__leading,
                body: collapsed__body,
                trailing: icon(flutter__icon__expand),
                padding__trailing: size__pixel__padding__horizontal__double,
              ),
              onTap: () {
                expand();
                expand__handle?.call(collapse);
              },
            ));
    },
  );
} */
