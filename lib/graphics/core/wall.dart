part of "_.dart";

Size wall__size__default() {
  return Size(
    /*.width=*/ wall__width(),
    /*.height=*/ _screen__size.height,
  );
}

widget___protocol wall__base(
  final widget__building__context___compo context, {
  required final Size size,
  required final widget__build__function__format child__build,
}) {
  return Center(
    child: app__size__alter__channel.handling__widget__build(
      context,
      child__build: (final context) {
        return SizedBox(
          width: size.width,
          height: size.height,
          child: app__theme__change__channel.handling__widget__build(
            context,
            child__build: child__build,
          ),
        );
      },
    ),
  );
}
