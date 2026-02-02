part of "_.dart";

const //
    screen__ample__width__min_ = 320,
    screen__ample__width__limit = 480,
    screen__large__width = 1280;

const //
    screen__ample__size__default = Size(
      400,
      888 /* .8... if display is 9:20(portrait 20:9) */,
    ) /*
expect to be emulated, almost always
sample
  - apple.phone.flagship :390
  - google.phone.flagship :411 */
    ,
    screen__large__size__default = Size(
      1024,
      1366,
    ) /*
apple.tablet.pro.2023 */
    ;

var _screen__size = screen__ample__size__default;

Size screen__size() {
  return _screen__size;
}

var //
    _screen__padding__permanent = EdgeInsets.zero,
    _screen__padding__temporary = EdgeInsets.zero;

EdgeInsets screen__padding__permanent /*
always covered, by device's hardware, like camera hole */
    () {
  return _screen__padding__permanent;
}

EdgeInsets screen__padding__temporary /*
covered temporarily, by some software, like virtual keyboard */
    () {
  return _screen__padding__temporary;
}

EdgeInsets screen__padding /*
(temporary + permanent) */
    () {
  return (_screen__padding__temporary + _screen__padding__permanent);
}

var _size__pixel /*
is virtual ,not physical(which should be ignored ,to respect the user's preference)
can equal physical-pixel ,if the pixel-ratio is 1
mis-alignment between the virtual and physical ,can lead to blurring of edges
  ,which has no definitive solution (not even ,equating the both)
    ,because 3 widgets in 10 pixels of space ,would always be mis-aligned
  ,although can be reduced ,at layout and rendering ,levels/stages ,but quite computationally-expensive */
    = 1.0;

extension num__convert__pixel__size__scale__extension on num {
  APPROX px() {
    return (this * _size__pixel);
  }
}

extension EdgeInsets__scale__extension on EdgeInsets {
  EdgeInsets px() {
    return (this * _size__pixel);
  }
}

extension BorderRadius__scale__extension on BorderRadius {
  BorderRadius px() {
    return (this * _size__pixel);
  }
}

var screen__size__category = screen__size__categories.medium;

enum screen__size__categories /*
more categories are un-necessary
  ,based on human-body's capabilities ,and needs */
{
  small /* watch */,
  medium /* phone */,
  large /* tablet */,
  huge /* desktop/workstation monitor ,television */,
}

APPROX wall__width() {
  return switch (screen__size__category) {
    (screen__size__categories.medium || screen__size__categories.small) => _screen__size.width,
    screen__size__categories.large => screen__ample__width__limit.toDouble(),
    screen__size__categories.huge => screen__large__width.toDouble(),
  };
}

final app__size__alter__channel = event__channel__broadcast();

BOOL /*
app:build__re:ok */
    app__size__set({
  required ui.FlutterView? view,
}) {
  view ??= ui.PlatformDispatcher.instance.implicitView!;

  {
    var result = FALSE;

    if (view.physicalSize.isEmpty) {
      if (printing___ok) {
        "screen:size:new:empty:ok".print();
      }

      if (_screen__size != screen__ample__size__default) {
        _screen__size = screen__ample__size__default;
        result = TRUE;
      }
    } else {
      final screen__size__new = (view.physicalSize / view.devicePixelRatio);

      if (printing___ok) {
        screen__size__new //
            .representation__text()
            .print("screen:size:new");
      }

      if (screen__size__new != _screen__size) {
        _screen__size = screen__size__new;
        result = TRUE;
      }
    }

    {
      final screen__padding__permanent__new = EdgeInsets.fromViewPadding(
        view.viewPadding,
        view.devicePixelRatio,
      );

      if (printing___ok) {
        screen__padding__permanent__new //
            .representation__text()
            .print("screen:padding:permanent:new");
      }

      if (screen__padding__permanent__new != _screen__padding__permanent) {
        _screen__padding__permanent = screen__padding__permanent__new;

        if (result.NOT) {
          result = TRUE;
        }
      }
    }

    {
      final screen__padding__temporary__new = EdgeInsets.fromViewPadding(
        view.viewInsets,
        view.devicePixelRatio,
      );

      if (printing___ok) {
        screen__padding__temporary__new //
            .representation__text()
            .print("screen:padding:temporary:new");
      }

      if (screen__padding__temporary__new != _screen__padding__temporary) {
        _screen__padding__temporary = screen__padding__temporary__new;

        if (result.NOT) {
          result = TRUE;
        }
      }
    }

    if (result.NOT) {
      return FALSE;
    }
  }

  /*if (screen__size.height < (.8 * (2 * screen__width)) /*
  example: for `screen__ample__size__default`(400w * 888h), is 640(800 * 0.8) */)
    { throw "host(or machine, or device)'s screen's height, ${screen__size.height}, is in-sufficient to properly display the app"; }*/

  screen__size__category = ((_screen__size.width < screen__ample__width__limit) //
      ? ((_screen__size.width > screen__ample__width__min_) //
          ? screen__size__categories.medium
          : screen__size__categories.small)
      : ((_screen__size.width < screen__large__width) //
          ? screen__size__categories.large
          : screen__size__categories.huge));

  _size__pixel = (0.0025 *
          math.min(
            _screen__size.width,
            _screen__size.height,
          ) /*
considering the smallest
  ,because preventing truncation (of info.) is the ideal target of `_size__pixel` */
      ) /*
example
  phone.default :1
  phone.min :0.8
  tablet.limit :3.2
history
  invented to standardize the layout placements and constraints
    ,by converting all sizes to phone.default's equivalent
      ,and has equal result ,as `(screen.size.width / phone.default.width)`
  deviation from phone.default was considered ,but aborted
    ,due to lack of any gain ,because `(v/4)` is best
      ,among the alternatives
        `(v/2)`
        `(v/3)`
      ,because
        non-recurring ,unlike `(v/3)`
        perfect balance of detail
          small change in value ,not lead to big effect ,in pixel/size
          verbosity ,or value inflation */
        ..representation__text().print("size:pixel:new");

  wall__width().representation__text().print("wall:width:new");

  /*screen__padding /*      */ = /*(screen__padding__temporary + screen__padding__permanent)*/ EdgeInsets.fromViewPadding(view.padding, view.devicePixelRatio);*/

  /*{
    screen__size.representation__text().print("screen__size");
    wall__width.representation__text().print("wall__width");

    _size__pixel.representation__text().print("_size__pixel");
    8.px().representation__text().print("8.px()");
    16.px().representation__text().print("16.px()");
    96.px().representation__text().print("64.px()");

    Radius.circular(2.px()).representation__text().print("Radius.circular(2.px())");
    Radius.circular(4.px()).representation__text().print("Radius.circular(4.px())");
    Radius.circular(8.px()).representation__text().print("Radius.circular(8.px())");
    Radius.circular(16.px()).representation__text().print("Radius.circular(16.px())");
    Radius.circular(32.px()).representation__text().print("Radius.circular(32.px())");
  }*/

  app__size__alter__channel.event__dispatch();

  return TRUE;
}
