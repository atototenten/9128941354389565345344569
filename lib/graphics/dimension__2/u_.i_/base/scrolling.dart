part of "_.dart";

typedef gui__base__widget__sliver = gui__base__widget;

typedef gui__base__widget__sliver__build__function__format = //
    gui__base__widget__sliver Function(
      gui__base__widget__building__context context,
    );

typedef base__scrolling__axis__direction = ({AxisDirection main, AxisDirection cross});

const //
base__app__scroll__behavior = _scroll__behavior(),
    //
    base__scrolling__physics__clamping = ClampingScrollPhysics(
      parent: RangeMaintainingScrollPhysics(),
    ),
    base__scrolling__physics__natural = BouncingScrollPhysics(
      parent: RangeMaintainingScrollPhysics(),
    ),
    base__scrolling__physics__natural__fast = BouncingScrollPhysics(
      decelerationRate: ScrollDecelerationRate.fast,
      parent: RangeMaintainingScrollPhysics(),
    ),
    base__scrolling__physics__natural__always = BouncingScrollPhysics(
      parent: AlwaysScrollableScrollPhysics(),
    ),
    //
    base__scrolling__axis__direction__vertical = (
      main: AxisDirection.down,
      cross: AxisDirection.right,
    ),
    base__scrolling__axis__direction__vertical__reverse = (
      main: AxisDirection.up,
      cross: AxisDirection.right,
    ),
    base__scrolling__axis__direction__horizontal = (
      main: AxisDirection.right,
      cross: AxisDirection.down,
    ),
    base__scrolling__axis__direction__horizontal__reverse = (
      main: AxisDirection.left,
      cross: AxisDirection.down,
    );

const //
gui__base__scrolling__offset__default = 0.0;

class gui__base__scrolling__children___record {
  const gui__base__scrolling__children___record({
    required this.slivers__build,
  });

  final array<gui__base__widget__sliver__build__function__format> slivers__build;
}

class gui__base__scrolling //
    implements gui__base__entity__component___protocol<gui__base__scrolling__children___record> {
  factory gui__base__scrolling({
    required final base__scrolling__axis__direction axis__direction,
    required final ScrollPhysics physics,
    final NFP caching__extent = 0,
    final NFP offset = gui__base__scrolling__offset__default,
  }) {
    late final gui__base__scrolling value;

    value = gui__base__scrolling._(
      axis__direction: axis__direction,
      physics: physics,
      caching__extent: caching__extent,
      control___raw: ScrollController(
        initialScrollOffset: offset,
        keepScrollOffset: NO,
        onAttach: (final position) {
          final offset = value.offset();

          position. /*jumpTo*/ correctPixels(
            offset,
          );

          value.offset___raw = NIL;
        },
        onDetach: (final position) {
          value.offset___raw = position.pixels;
        },
      ),
      offset___raw: offset,
    );

    return value;
  }

  gui__base__scrolling._({
    required this.axis__direction,
    required this.physics,
    required this.caching__extent,
    required this.control___raw,
    this.offset___raw,
  });

  final base__scrolling__axis__direction axis__direction;
  final ScrollPhysics physics;
  final NFP caching__extent;

  final ScrollController control___raw;

  NFP? offset___raw;

  NFP offset() {
    return (offset___raw ?? gui__base__scrolling__offset__default);
  }

  BOOL? offset__min___ok() {
    return switch (offset___raw) {
      NIL => NIL,
      gui__base__scrolling__offset__default => OK,
      _ => NO,
    };
  }

  ({NFP current, NFP min, NFP max})? offset__range() {
    final position = position___raw();

    if (position == null) {
      return NIL;
    }

    return (
      current: position.pixels,
      min: position.minScrollExtent,
      max: position.maxScrollExtent,
    );
  }

  BOOL scroll__position__begin({
    final NI duration__seconds__milli = /*(1000 ~/ 3)*/ 96,
    final Curve curve = Curves.ease,
  }) {
    final position = position___raw();

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

  BOOL scroll__instant({
    required final NFP offset,
  }) {
    final position = position___raw();

    if (position == null) {
      return NO;
    }

    position.jumpTo(
      offset,
    );

    return OK;
  }

  BOOL? position__min__ok___raw() {
    final position = position___raw();

    if (position == null) {
      return NIL;
    }

    return (position.pixels == position.minScrollExtent);
  }

  ScrollPosition? position___raw() {
    final v = control___raw.positions;

    if (v.empty___ok()) {
      return NIL;
    }

    return v.first;
  }

  base__text__representation offset__range__text__representation() {
    final offset__range_1 = offset__range();

    if (offset__range_1 == null) {
      return Null__text__representation;
    }

    return base__compo__text__representation(
      name: "scrolling.offset__range",
      members: {
        "current": offset__range_1.current.text__representation(),
        "min": offset__range_1.min.text__representation(),
        "max": offset__range_1.max.text__representation(),
      },
    );
  }

  @override
  gui__base__widget widget__build(
    final gui__base__widget__building__context context, {
    required final gui__base__scrolling__children___record children,
  }) {
    return Scrollable(
      axisDirection: axis__direction.main,
      controller: control___raw,
      physics: physics,
      scrollBehavior: base__app__scroll__behavior,
      viewportBuilder: (final context, final offset) {
        return Viewport(
          axisDirection: axis__direction.main,
          crossAxisDirection: axis__direction.cross,
          offset: offset,
          cacheExtent: caching__extent,
          slivers: children.slivers__build.convert(
            (final sliver__build) {
              return sliver__build(
                context,
              );
            },
          ).convert__array(),
        );
      },
    );
  }

  @override
  void dispose() {
    control___raw.dispose();
  }
}

class _scroll__behavior extends ScrollBehavior {
  const _scroll__behavior();

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
  ) => ( /*kDebugMode //
          ? RawScrollbar(
              controller: details.controller,
              child: child,
            )
          :*/ child);

  @override
  gui__base__widget buildOverscrollIndicator(
    final BuildContext context,
    final gui__base__widget child,
    final ScrollableDetails details,
  ) => StretchingOverscrollIndicator(
    axisDirection: details.direction,
    child: child,
  );

  @override
  GestureVelocityTrackerBuilder velocityTrackerBuilder(final BuildContext context) => //
      (final PointerEvent event) => //
          IOSScrollViewFlingVelocityTracker(event.kind);

  @override
  ScrollPhysics getScrollPhysics(final BuildContext context) => //
      base__scrolling__physics__natural;
}
