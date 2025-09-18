part of "../_.dart";

gui__base__widget winter__indicate__progress__bar__widget({
  required final INT parts__count,
  required final base__value__mutation__event__channel__broadcast<NIMR, gui__base__widget__building__context__definitive> progress__channel /*
progress must be a multiple ,of `parts:count` */
  ,
  required final Color border__color,
  required final Color? progress__fill_ed__color /*
if not available ,`border__color` is used */
  ,
  required final Gradient? progress__fill_ed__gradient /*
`progress__fill_ed__color` has higher precedence ,hence if its available ,then given a preference */
  ,
}) {
  return DecoratedBox(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(12.px()),
      ),
      border: Border.all(
        color: border__color,
        width: 1.px(),
      ),
    ),
    child: base__event__channel__broadcast__handling__widget(
      channel: progress__channel,
      build: (final context) {
        final //
            progress__flex = progress__channel.value(),
            remain_ing__flex = (parts__count - progress__flex),
            remain__ing___ok = (remain_ing__flex > /* handles `progress > parts:count` case ,vs `!=` */ 0),
            child = SizedBox(
              height: 16.px(),
            );

        return Row(
          children: [
            if (progress__flex != 0) //
              Expanded(
                flex: progress__flex,
                child: ClipRRect(
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(12.px()),
                    right: (remain__ing___ok //
                        ? Radius.zero
                        : Radius.circular(12.px())),
                  ),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: progress__fill_ed__color,
                      gradient: progress__fill_ed__gradient,
                    ),
                    child: child,
                  ),
                ),
              ),
            if (remain__ing___ok) //
              Expanded(
                flex: remain_ing__flex,
                child: child,
              ),
          ],
        );
      },
    ),
  );
}

gui__base__widget winter__waiting__widget({
  final APPROX? radius__size,
}) {
  return Center(
    child: winter__waiting__widget__base(
      radius__size: radius__size,
    ),
  );
}

gui__base__widget winter__waiting__widget__base({
  final APPROX? radius__size /*size__half*/ /*dynamic*/,
}) {
  return CupertinoActivityIndicator(
    color: color__foreground__dim,
    radius: (radius__size ?? 24).px(),
  );
}

gui__base__widget winter__waiting__page() {
  return page__foundation(
    winter__waiting__widget(
      radius__size: 24.px(),
    ),
  );
}

gui__base__widget winter__dis_connection__widget({
  final APPROX? size,
}) {
  return Center(
    child: base__icon(
      flutter__material__icons.cloud_off_outlined /*flutter__material__icons.report_problem_outlined*/,
      size: size,
      color: color__foreground__dim,
    ),
  );
}

class winter__dis_connection__page extends StatelessWidget {
  const winter__dis_connection__page({
    required this.error,
    this.trace,
  });

  final Object error;
  final StackTrace? trace;

  @override
  gui__base__widget build(final BuildContext context) {
    return page__foundation(
      Column(
        children: <gui__base__widget>[
          Padding(
            padding: navigation__top__bubble__padding__insets(),
            child: base__navigation__top__bubble(
              left: (
                icon: flutter__icon__navigation__backward,
                on_press: () => context.navigation().backward(),
              ),
            ),
          ),
          const Expanded(
            child: gui__base__empty__widget,
          ),
          winter__dis_connection__widget(
            96.px(),
          ),
          gui__base__widget__separat_or__vertical,
          gui__base__box__text__widget(
            "Problem connecting\n" "to service\n" ":(",
            font__color: color__foreground__dim,
            font__size: 18.px(),
            font__weight: FontWeight.w600,
            text__align: TextAlign.center,
          ),
          gui__base__widget__separat_or__vertical,
          gui__base__box__text__widget(
            error.toString(),
            font__color: color__foreground__dimmest,
            text__align: TextAlign.center,
          ),
          const Expanded(
            child: gui__base__empty__widget,
          ),
        ],
      ),
    );
  }
}

/*class _DeficiencyIndicator extends StatelessWidget {
  const _DeficiencyIndicator({
    this.title = "No app found",
    this.subTitle = "to open item",
  });

  final string title, subTitle;

  @override
  gui__base__widget build(final BuildContext context) {
    return NonScrollableListingPage(
      children: <gui__base__widget>[
        base__icon(
          flutter__material__icons.app_blocking_outlined,
          font__size: 64.px(),
        ),
        SizedBox(
          height: 32.px(),
        ),
        Text(
          title,
          text__align: TextAlign.center,
          style: TextStyle(
            font__size: 20.px(),
            font__weight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 8.px(),
        ),
        Text(
          subTitle,
          text__align: TextAlign.center,
          style: TextStyle(
            font__size: 16.px(),
            font__weight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}*/
