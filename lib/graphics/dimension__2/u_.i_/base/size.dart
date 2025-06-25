part of "_.dart";

const //
    base__screen__ample__width__min_ = 320,
    base__screen__ample__width__limit = 480,
    base__screen__large__width = 1280;

const //
    base__screen__ample__size__default = Size(
      400,
      888 /* .8... if display is 9:20(portrait 20:9) */,
    ) /*
expect to be emulated, almost always
sample
  - apple.phone.flagship :390
  - google.phone.flagship :411 */
    ,
    base__screen__large__size__default = Size(
      1024,
      1366,
    ) /*
apple.tablet.pro.2023 */
    ;

var _screen__size = base__screen__ample__size__default;

Size base__screen__size() {
  return _screen__size;
}

var //
    _screen__padding__permanent = EdgeInsets.zero,
    _screen__padding__temporary = EdgeInsets.zero;

EdgeInsets base__screen__padding__permanent /*
always covered, by device's hardware, like camera hole */
    () {
  return _screen__padding__permanent;
}

EdgeInsets base__screen__padding__temporary /*
covered temporarily, by some software, like virtual keyboard */
    () {
  return _screen__padding__temporary;
}

EdgeInsets base__screen__padding /*
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
  NFP px() {
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

var base__screen__size__category = base__screen__size__categories.medium;

enum base__screen__size__categories /*
more categories are un-necessary
  ,based on human-body's capabilities ,and needs */
{
  small /* watch */,
  medium /* phone */,
  large /* tablet */,
  huge /* desktop/workstation monitor ,television */,
}

NFP base__wall__width() {
  return switch (base__screen__size__category) {
    (base__screen__size__categories.medium || base__screen__size__categories.small) => _screen__size.width,
    base__screen__size__categories.large => base__screen__ample__width__limit.toDouble(),
    base__screen__size__categories.huge => base__screen__large__width.toDouble(),
  };
}

final base__app__size__alter__channel = base__event__channel__broadcast();

BOOL /*
app:build__re:ok */
    base__app__size__set({
  required ui.FlutterView? view,
}) {
  view ??= ui.PlatformDispatcher.instance.implicitView!;

  {
    var result = NO;

    if (view.physicalSize.isEmpty) {
      if (base__printing___ok) {
        "screen:size:new:empty:ok".print();
      }

      if (_screen__size != base__screen__ample__size__default) {
        _screen__size = base__screen__ample__size__default;
        result = OK;
      }
    } else {
      final screen__size__new = (view.physicalSize / view.devicePixelRatio);

      if (base__printing___ok) {
        screen__size__new //
            .text__representation()
            .print("screen:size:new");
      }

      if (screen__size__new != _screen__size) {
        _screen__size = screen__size__new;
        result = OK;
      }
    }

    {
      final screen__padding__permanent__new = EdgeInsets.fromViewPadding(
        view.viewPadding,
        view.devicePixelRatio,
      );

      if (base__printing___ok) {
        screen__padding__permanent__new //
            .text__representation()
            .print("screen:padding:permanent:new");
      }

      if (screen__padding__permanent__new != _screen__padding__permanent) {
        _screen__padding__permanent = screen__padding__permanent__new;

        if (result.not) {
          result = OK;
        }
      }
    }

    {
      final screen__padding__temporary__new = EdgeInsets.fromViewPadding(
        view.viewInsets,
        view.devicePixelRatio,
      );

      if (base__printing___ok) {
        screen__padding__temporary__new //
            .text__representation()
            .print("screen:padding:temporary:new");
      }

      if (screen__padding__temporary__new != _screen__padding__temporary) {
        _screen__padding__temporary = screen__padding__temporary__new;

        if (result.not) {
          result = OK;
        }
      }
    }

    if (result.not) {
      return NO;
    }
  }

  /*if (screen__size.height < (.8 * (2 * screen__width)) /*
  example: for `base__screen__ample__size__default`(400w * 888h), is 640(800 * 0.8) */)
    { throw "host(or machine, or device)'s screen's height, ${screen__size.height}, is in-sufficient to properly display the app"; }*/

  base__screen__size__category = ((_screen__size.width < base__screen__ample__width__limit) //
      ? ((_screen__size.width > base__screen__ample__width__min_) //
          ? base__screen__size__categories.medium
          : base__screen__size__categories.small)
      : ((_screen__size.width < base__screen__large__width) //
          ? base__screen__size__categories.large
          : base__screen__size__categories.huge));

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
        ..text__representation().print("size:pixel:new");

  base__wall__width().text__representation().print("wall:width:new");

  /*base__screen__padding /*      */ = /*(base__screen__padding__temporary + base__screen__padding__permanent)*/ EdgeInsets.fromViewPadding(view.padding, view.devicePixelRatio);*/

  /*{
    screen__size.text__representation().print("screen__size");
    base__wall__width.text__representation().print("base__wall__width");

    _size__pixel.text__representation().print("_size__pixel");
    8.px().text__representation().print("8.px()");
    16.px().text__representation().print("16.px()");
    96.px().text__representation().print("64.px()");

    Radius.circular(2.px()).text__representation().print("Radius.circular(2.px())");
    Radius.circular(4.px()).text__representation().print("Radius.circular(4.px())");
    Radius.circular(8.px()).text__representation().print("Radius.circular(8.px())");
    Radius.circular(16.px()).text__representation().print("Radius.circular(16.px())");
    Radius.circular(32.px()).text__representation().print("Radius.circular(32.px())");
  }*/

  base__app__size__alter__channel.event__dispatch();

  return OK;
}
