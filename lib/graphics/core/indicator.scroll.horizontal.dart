part of "_.dart";

/*
const ARRAY<Color> //
    _pictures__present__colors = <Color>[
      Color.fromARGB(191 /* ((0.75 * 256) -1) */, 0, 0, 0),
      Color.fromARGB(127, 0, 0, 0),
      Color.fromARGB(63, 0, 0, 0),
      Color.fromARGB(31, 0, 0, 0),
      Color.fromARGB(15, 0, 0, 0),
      Color.fromARGB(7, 0, 0, 0),
      color__transparent__dark,
    ],
    _pictures__present__colors__empty = <Color>[
      color__transparent__dark,
      color__transparent__dark,
    ];

widget___protocol indicator__scroll__horizontal({
  required final ScrollController controller,
  final APPROX? height /* required for list-view_s */,
  final APPROX? width /* required to decide the need, for the indicator(a persistent stacked widget) */,
  required final widget___protocol child /* should be, scrollable, horizontally */,
}) {
  var //
      colors__left = _pictures__present__colors__empty,
      colors__right = _pictures__present__colors,
      observer = empty__procedure__empty;

  final overlay = widget__build__definitive(
    init_: (final state) {
      void observer_() {
        final position = controller.position
            /*..pixels.representation__text().print("pos")
                  ..minScrollExtent.representation__text().print("min")
                  ..maxScrollExtent.representation__text().print("max")*/
            ;

/* TASK:
  animate the following `setState`s */

        BOOL b__build__re = FALSE;

        if ((position.pixels == position.minScrollExtent) && //
            (colors__left == _pictures__present__colors)) {
          colors__left = _pictures__present__colors__empty;

          //print__info("atMin");

          b__build__re = TRUE;
        } else if ((position.pixels == position.maxScrollExtent) && //
            (colors__right == _pictures__present__colors)) {
          colors__right = _pictures__present__colors__empty;

          //print__info("atMax");

          b__build__re = TRUE;
        }

        if ((position.pixels > position.minScrollExtent) && //
            (colors__left != _pictures__present__colors)) {
          colors__left = _pictures__present__colors;

          if (!b__build__re) {
            b__build__re = TRUE;
          }
        }

        if ((position.pixels < position.maxScrollExtent) && //
            (colors__right != _pictures__present__colors)) {
          colors__right = _pictures__present__colors;

          if (!b__build__re) {
            b__build__re = TRUE;
          }
        }

        if (b__build__re) {
          state.build__re();
        }
      }

      controller.addListener(observer = observer_);
    },
    de_init_: () => //
        controller.removeListener(observer),
    build: (final state) => //
        Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <widget___protocol>[
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: colors__left,
            ),
          ),
          child: SizedBox(
            width: 64.px(),
            height: height,
          ),
        ),
        const Spacer(),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: colors__right,
            ),
          ),
          child: SizedBox(
            width: 64.px(),
            height: height,
          ),
        ),
      ],
    ),
  );

  return ((width !=  null)
      ? LayoutBuilder(
          builder: (
            final context,
            final constraints,
          ) =>
              ((width > constraints.maxWidth)
                  ? stack___widget(
                      children: [
                        child,
                        overlay,
                      ],
                    )
                  : child),
        )
      : stack___widget(
          children: [
            child,
            overlay,
          ],
        ));
} */
