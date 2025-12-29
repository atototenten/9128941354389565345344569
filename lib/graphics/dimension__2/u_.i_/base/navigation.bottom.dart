part of "_.dart";

class gui__base__navigation__bottom //
    implements base__dispose___protocol {
  gui__base__navigation__bottom({
    final INT chosen__id = 0,
    required this.items__press__handle,
  }) : chosen__id__channel = base__value__mutation__event__channel__broadcast(
         chosen__id,
       );

  final base__value__mutation__event__channel__broadcast<INT> chosen__id__channel;
  final ARRAY<bool /*switch__ok*/ Function()?> items__press__handle;

  @override
  void dispose() {
    chosen__id__channel.dispose();
  }

  gui__base__widget widget__build(
    final gui__base__widget__building__context context, {
    required final ARRAY<gui__base__widget Function(gui__base__widget__building__context context, BOOL chosen___ok)> items__build,
  }) {
    return chosen__id__channel.handling__widget__build(
      context,
      child__build: (final context) {
        final chosen__id = chosen__id__channel.value();

        return Row(
          /*mainAxisAlignment: MainAxisAlignment.spaceAround,*/
          /*
non-functional ,with `GestureDetector.behavior` ,being `HitTestBehavior.translucent`
  ,while wrap-ing each `children`'s element ,with `Expanded` ,has equal effect */
          children: array__new__generated(
            items__press__handle.elements__count,
            (final item__id) {
              return Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    if (item__id == chosen__id) {
                      return;
                    }

                    final press__handle = items__press__handle[item__id];

                    if (press__handle != null) {
                      final switch___ok = press__handle();

                      if (switch___ok.not) {
                        return;
                      }
                    }

                    chosen__id__channel.value__mutation__dispatch(
                      item__id,
                    );
                  },
                  child: items__build[item__id](
                    context,
                    (item__id == chosen__id),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
