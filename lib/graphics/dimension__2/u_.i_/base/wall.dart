part of "_.dart";

Size base__wall__size__default() {
  return Size(
    /*.width=*/ base__wall__width(),
    /*.height=*/ _screen__size.height,
  );
}

gui__base__widget base__wall__base(
  final gui__base__widget__building__context context, {
  required final Size size,
  required final gui__base__widget__build__function__format child__build,
}) {
  return Center(
    child: base__app__size__alter__channel.handling__widget__build(
      context,
      children: gui__base__event__channel__handling__children___record(
        child__build: (final context) {
          return gui__base__child__constrained__tight__widget(
            width: size.width,
            height: size.height,
            child: base__app__theme__change__channel.handling__widget__build(
              context,
              children: gui__base__event__channel__handling__children___record(
                child__build: child__build,
              ),
            ),
          );
        },
      ),
    ),
  );
}
