part of "_.dart";

class gui__base__scrolling___compo //
    implements base__dispose___protocol {
  static const //
  scrolling__behavior = _scrolling__behavior___compo(),
          //
          scrolling__axis__main__direction__vertical =
          AxisDirection.down,
      scrolling__axis__main__direction__vertical__reverse = AxisDirection.up,
      scrolling__axis__main__direction__horizontal = AxisDirection.right,
      scrolling__axis__main__direction__horizontal__reverse = AxisDirection.left,
      //
      scrolling__physics__clamping = ClampingScrollPhysics(
        parent: RangeMaintainingScrollPhysics(),
      ),
      scrolling__physics__natural = BouncingScrollPhysics(
        parent: RangeMaintainingScrollPhysics(),
      ),
      scrolling__physics__natural__fast = BouncingScrollPhysics(
        decelerationRate: ScrollDecelerationRate.fast,
        parent: RangeMaintainingScrollPhysics(),
      ),
      scrolling__physics__natural__always = BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
          //
          children__caching__extent__default =
          .5,
          offset__default =
          0.0;

  gui__base__scrolling___compo({
    required this.scrolling__axis__main__direction,
    required this.scrolling__physics,
    required this.children__caching__extent,
    final APPROX offset = offset__default,
  }) : _offset = offset {
    _controlling = ScrollController(
      initialScrollOffset: _offset,
      keepScrollOffset: NO,
      onAttach: (final position) {
        position. /*jumpTo*/ correctPixels(_offset);
      },
      onDetach: (final position) {
        _offset = position.pixels;
      },
    );
  }

  final AxisDirection scrolling__axis__main__direction;
  final ScrollPhysics scrolling__physics;
  final APPROX children__caching__extent;

  late final ScrollController _controlling;

  APPROX _offset;

  @override
  void dispose() {
    _controlling.dispose();
  }

  BOOL? position__min__ok() {
    final position__details_1 = position__details();

    if (position__details_1 == null) {
      return NIL;
    }

    return (position__details_1.offset == position__details_1.min);
  }

  ({APPROX offset, APPROX min, APPROX max__estimation})? position__details() {
    final position = _position();

    if (position == null) {
      return NIL;
    }

    return (
      offset: position.pixels,
      min: position.minScrollExtent,
      max__estimation: position.maxScrollExtent,
    );
  }

  BOOL position__scroll__min({
    final INT duration__seconds__milli = /*(1000 ~/ 3)*/ 96,
    final Curve curve = Curves.ease,
  }) {
    final position = _position();

    if (position == null) {
      return NO;
    }

    if (position.pixels > position.minScrollExtent) {
      position.jumpTo(position.minScrollExtent);
    } else {
      position.animateTo(
        (position.minScrollExtent - 16),
        duration: Duration(
          milliseconds: duration__seconds__milli,
        ),
        curve: curve,
      );
    }

    return OK;
  }

  BOOL position__scroll__instant({
    required final APPROX offset,
  }) {
    final position = _position();

    if (position == null) {
      return NO;
    }

    position.jumpTo(offset);

    return OK;
  }

  ScrollPosition? _position() {
    final v = _controlling.positions;

    if (v.empty___ok()) {
      return NIL;
    }

    return v.first;
  }

  gui__base__widget widget__build(
    final gui__base__widget__building__context context, {
    final EdgeInsetsGeometry? padding,
    final gui__base__widget? children__separation,
    required final INT children__count,
    required final gui__base__widget Function(
      gui__base__widget__building__context building__context,
      INT child__id,
    )
    child__build,
  }) => //
  Scrollable(
    axisDirection: scrolling__axis__main__direction,
    controller: _controlling,
    physics: scrolling__physics,
    scrollBehavior: scrolling__behavior,
    viewportBuilder:
        (final context, final offset) => //
        Viewport(
          axisDirection: scrolling__axis__main__direction,
          crossAxisDirection: switch (scrolling__axis__main__direction) {
            (AxisDirection.up || AxisDirection.down) => AxisDirection. /*towards_*/ right /*_from_left*/,
            (AxisDirection.left || AxisDirection.right) => AxisDirection.down /* from up towards down */,
          },
          offset: offset,
          cacheExtent: children__caching__extent,
          cacheExtentStyle: CacheExtentStyle.viewport,
          clipBehavior: Clip.none,
          slivers: () {
            final sliver =
                ((children__separation == null) //
                ? SliverList(
                    delegate: SliverChildBuilderDelegate(
                      addAutomaticKeepAlives: NO,
                      addRepaintBoundaries: NO,
                      addSemanticIndexes: NO,
                      //
                      childCount: ((children__count * 2) - 1),
                      (final context, final child__id) {
                        if (child__id.isOdd) {
                          return children__separation;
                        }

                        return RepaintBoundary(
                          child: child__build(
                            context,
                            (child__id ~/ 2),
                          ),
                        );
                      },
                    ),
                  )
                : SliverList(
                    delegate: SliverChildBuilderDelegate(
                      addAutomaticKeepAlives: NO,
                      addSemanticIndexes: NO,
                      //
                      addRepaintBoundaries: OK,
                      //
                      childCount: children__count,
                      child__build,
                    ),
                  ));

            if (padding == null) {
              return [sliver];
            }

            return [
              SliverPadding(
                padding: padding,
                sliver: sliver,
              ),
            ];
          }(),
        ),
  );
}

class _scrolling__behavior___compo extends ScrollBehavior {
  const _scrolling__behavior___compo();

  @override
  Set<ui.PointerDeviceKind> get dragDevices => //
  <ui.PointerDeviceKind>{
    ui.PointerDeviceKind.touch,
    ui.PointerDeviceKind.stylus,
    ui.PointerDeviceKind.trackpad,
    ui.PointerDeviceKind.mouse,
  };

  @override
  gui__base__widget buildScrollbar(
    final BuildContext context,
    final gui__base__widget child,
    final ScrollableDetails details,
  ) => //
  ( /*base__program__compilation__debug___ok //
      ? RawScrollbar(
          controller: details.controller,
          child: child,
        ):*/ child);

  @override
  gui__base__widget buildOverscrollIndicator(
    final BuildContext context,
    final gui__base__widget child,
    final ScrollableDetails details,
  ) => //
  StretchingOverscrollIndicator(
    axisDirection: details.direction,
    child: child,
  );

  @override
  GestureVelocityTrackerBuilder velocityTrackerBuilder(final BuildContext context) => //
      (final PointerEvent event) => //
          IOSScrollViewFlingVelocityTracker(event.kind);

  @override
  ScrollPhysics getScrollPhysics(final BuildContext context) => //
      gui__base__scrolling___compo.scrolling__physics__natural;
}
