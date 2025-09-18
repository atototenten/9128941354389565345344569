part of "_.dart";

late BoxDecoration _page__background__decoration;

gui__base__widget page__foundation(
  final gui__base__widget page,
) =>
    DecoratedBox(
      decoration: _page__background__decoration,
      child: Center(
        child: SizedBox(
          width: base__wall__width(),
          height: base__screen__size().height,
          child: page,
        ),
      ),
    );

class winter__page__base //
    implements gui__base__entity__component___protocol {
  final scrolling = base__scrolling();

  @override
  void dispose() {
    scrolling.dispose();
  }
}

extension winter__page__base__extension //
    on winter__page__base {
  gui__base__widget widget(
     final gui__base__widget__building__context context,{
    final BOOL scroll__direction__reverse___ok = NO,
    required final gui__base__widget heading,
    required final INT items__count,
    //final INT items__lanes__count = 1,
    required final gui__base__listing__item__build__function__format /* 2nd param. is `item__id_` */ item__build,
    final APPROX? items__separation__size,
    final gui__base__widget? floating,
  }) {
    /*final gui__base__widget scrollBar = CupertinoScrollbar(
    child: gui__base__empty__widget,
    controller: scrollController,
    thickness: 4.px(),
    thicknessWhileDragging: 8.px(),
    radius: Radius.circular(2.px()),
    radiusWhileDragging: Theming.radius4,
  );*/

    final items__separation = SizedBox(
      height: (items__separation__size ?? size__pixel__padding__vertical),
    );

    final sliver = SliverList(
      delegate: SliverChildBuilderDelegate(
        addAutomaticKeepAlives: NO,
        addRepaintBoundaries: NO,
        addSemanticIndexes: NO,
        childCount: ((items__count * 2) - 1),
        (final context, var item__id) {
          if (item__id.isOdd) {
            return items__separation;
          }

          item__id ~/= 2;

          return IndexedSemantics(
            index: item__id,
            child: RepaintBoundary(
              child: item__build(
                context,
                item__id,
              ),
            ),
          );
        },
      ),
    ); /*
`SliverGrid` cannot be used ,due to its `childAspectRatio` param. */

    final screen__padding = base__screen__padding();

    return gui__base__stack__widget(
      alignment: AlignmentDirectional.topCenter,
      children: <gui__base__widget>[
        gui__base__child__constrained__tight__max__widget(
          child: scrolling.widget(
            axis__direction: (scroll__direction__reverse___ok /*F*/ //
                ? base__scrolling__axis__direction__vertical__reverse
                : base__scrolling__axis__direction__vertical),
            physics: base__scrolling__physics__natural__always,
            caching__extent: gui__base__listing__vertical__caching__extent__default,
            slivers: <gui__base__widget__sliver>[
              SliverList(
                delegate: SliverChildListDelegate(
                  <gui__base__widget>[
                    gui__base__child__constrained__tight__widget(
                      height: screen__padding.top,
                    ),
                    heading,
                    gui__base__widget__separat_or__vertical,
                  ],
                  addAutomaticKeepAlives: NO,
                  addRepaintBoundaries: NO,
                  addSemanticIndexes: NO,
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.only(
                  left: (size__pixel__padding__horizontal + screen__padding.left),
                  right: (size__pixel__padding__horizontal + screen__padding.right),
                  bottom: ((floating == null) //
                      ? size__pixel__padding__vertical__double
                      : (64.px() /* FIX.long.hard-code */ + size__pixel__padding__vertical__double)),
                ),
                sliver: sliver,
              ),
            ],
          ),
        ),
        if (floating != null)
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: (size__pixel__padding__vertical__double + screen__padding.bottom),
              ),
              child: floating,
            ),
          ),
        Padding(
          padding: EdgeInsets.only(
            top: (navigation__top__bubble__padding.px() + screen__padding.top),
            left: (navigation__top__bubble__padding.px() + screen__padding.left),
            right: (navigation__top__bubble__padding.px() + screen__padding.right),
          ),
          child: winter__navigation__top(
            left: (top__ok
                ? (context.navigation().backward___ok()
                    ? winter__navigation__top__button(
                        icon: flutter__icon__navigation__backward,
                        press__handle: () => context.navigation().backward(),
                      )
                    : NIL)
                : winter__navigation__top__button(
                    icon: flutter__icon__navigation__top,
                    press__handle: scrolling.scroll__min_,
                  ) /* (/*"Scroll"*/ "Back" " to Top") */),
            right: winter__navigation__top__button(
              icon: /*flutter__icon__hamburger*/ flutter__material__icons.menu_rounded,
              press__handle: options,
            ) /* (/*"Scroll"*/ "Back" " to Top") */,
          ),
        ),
        if (screen__padding != EdgeInsets.zero)
          ClipRect(
            child: BackdropFilter(
              filter: base__image__filter__blur(
                image__filter__blur__crucial,
              ),
              child: gui__base__child__constrained__tight__max__widget(
                height___ok: NO,
                child: gui__base__child__constrained__tight__widget(
                  height: screen__padding.top,
                ),
              ),
            ),
          ) /*
      TASK.long: add linear blur, blurring smoothly (blending), instead of a hard edge, 
        as given at: `https://github.com/flutter/flutter/issues/48212#issuecomment-592166594`
          (from `https://stackoverflow.com/a/62885475`)*/
        ,
      ],
    );
  }
}
