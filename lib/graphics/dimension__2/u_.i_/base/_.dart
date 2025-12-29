import "package:base/base/_.dart";
import "package:base/service.authority/_.dart";

import "package:base/graphics/dimension__2/u_.i_/flutter/_.dart";
import "package:base/graphics/dimension__2/u_.i_/apple.cupertino/_.dart" //
    show DefaultCupertinoLocalizations;
import "package:base/graphics/dimension__2/u_.i_/google.material/_.dart" //
    show
        DefaultMaterialLocalizations,
        DialogRoute,
        MaterialApp,
        MaterialPageRoute,
        ModalBottomSheetRoute,
        //
        Typography,
        Material,
        TextField;

import "dart:math" as math;
import "dart:ui" as ui;

import "package:flutter/foundation.dart" //
    show kDebugMode, kIsWasm, kIsWeb, defaultTargetPlatform, TargetPlatform;

import "package:flutter/services.dart" //
    show
        RawKeyDownEvent,
        RawKeyUpEvent,
        PhysicalKeyboardKey,
        LogicalKeyboardKey,
        Clipboard,
        //
        SystemChannels,
        MethodChannel,
        MethodCall,
        SystemNavigator,
        rootBundle,
        //
        DeviceOrientation,
        Brightness,
        SystemChrome,
        SystemUiOverlayStyle,
        SystemUiMode,
        //
        TextInputFormatter,
        FilteringTextInputFormatter,
        LengthLimitingTextInputFormatter,
        TextInputAction,
        MaxLengthEnforcement,
        //
        debugPrintKeyboardEvents,
        ApplicationSwitcherDescription;

import "package:flutter/widgets.dart";

import "package:flutter/gestures.dart" //
    show
        GestureRecognizer,
        TapGestureRecognizer,
        //
        GestureVelocityTrackerBuilder,
        IOSScrollViewFlingVelocityTracker,
        //
        DragStartBehavior,
        //
        debugPrintMouseHoverEvents,
        debugPrintHitTestResults;

import "package:flutter/rendering.dart" //
    show
        RendererBinding,
        RenderView,
        ViewConfiguration,
        CacheExtentStyle,
        //
        debugPaintSizeEnabled,
        debugPaintPointersEnabled,
        debugRepaintRainbowEnabled,
        debugRepaintTextRainbowEnabled,
        debugPaintLayerBordersEnabled,
        debugDisableClipLayers;

import "package:path_provider/path_provider.dart" as path_provider;

part "1.dart";
part "app.dart";
part "asyn.dart";
part "widget.building.dart";
part "button.dart";
part "color.dart";
part "colors.dart";
part "entity.dart";
part "event.dart";
part "icon.dart";
part "indicator.scroll.horizontal.dart";
part "inet.dart";
part "input.text.dart";
part "list.create.dart";
part "listing.dart";
part "navigation.bottom.dart";
part "navigation.dart";
part "overlay.dart";
part "page.dart";
part "platform.dart";
part "scrolling.dart";
part "service.authority.dart";
part "size.dart";
part "storage.dart";
part "text.dart";
part "text.rich.dart";
part "theme.dart";
part "wall.dart";

const //
base__program__compilation__debug___ok = kDebugMode;

final base__program__compilation__platform /* should be avoided ,as much as possible */ = //
    (kIsWeb //
    ? base__program__compilation__platforms.web
    : (kIsWasm
          ? base__program__compilation__platforms.web__assembly
          : switch (defaultTargetPlatform) {
              TargetPlatform.fuchsia => base__program__compilation__platforms.fuchsia,
              TargetPlatform.linux => base__program__compilation__platforms.linux,
              TargetPlatform.android => base__program__compilation__platforms.android,
              TargetPlatform.windows => base__program__compilation__platforms.windows,
              TargetPlatform.iOS => base__program__compilation__platforms.apple__hand_held,
              TargetPlatform.macOS => base__program__compilation__platforms.apple__desktop,
            }));

enum base__program__compilation__platforms {
  fuchsia,
  linux,
  web__assembly,
  android,
  windows,
  web,
  apple__desktop,
  apple__hand_held /*phone|tablet*/,
}

const
    //
    base__locale__latin__english__america = Locale(
      "en",
      "US",
    ),
    base__app__locale = base__locale__latin__english__america,
    //
    base__app__localizations__delegates = <LocalizationsDelegate<Object>>[
      DefaultWidgetsLocalizations.delegate,
      DefaultMaterialLocalizations.delegate,
      DefaultCupertinoLocalizations.delegate,
    ];

typedef gui__base__widget = Widget;

typedef gui__base__widget__building__context = BuildContext;

/*late gui__base__widget__building__context _app__context;*/

typedef gui__base__widget__build__function__format = //
    gui__base__widget Function(gui__base__widget__building__context building__context);

typedef gui__base__widget__definitive__build__procedure__format<storage___type> = //
    gui__base__widget Function(gui__base__widget__building__context building__context, storage___type storage);

typedef gui__base__widget__detach__procedure__format<storage___type> = //
    void Function(storage___type storage);

typedef gui__base__widget__attach__procedure__format<storage___type> = //
    storage___type Function(gui__base__widget__building__context building__context);

typedef gui__base__event__handle__procedure__format = //
    void Function(gui__base__widget__building__context);

void base__app__build__re()
/*{ _app__context.build__re__recursive(); }*/
{
  final //
  binding = WidgetsBinding.instance,
      element__root = binding.rootElement;

  if (element__root != null) {
    binding.buildOwner?.reassemble(element__root);
  }
} /*
forked
  from `flutter/src/widgets/binding.dart`::`mixin WidgetsBinding`::`value__asyn<void> _forceRebuild()` */

Key gui__base__widget__key__unique() /*
needed to prevent the flutter-framework ,from re-using the old widget ,from the tree
  similar to in-validating the cache
should be avoided ,in favor of a reliable (consistently reproducible) value (like `ValueKey("$category:$item")`) ,to not waste resources ,on un-necessary build calls ,and improve efficiency */ => //
    /*/* must not be `const` */ ValueKey(Object())*/ UniqueKey();

value__asyn<string?> //
base__environment__clip_board__text() async {
  return ((await Clipboard.hasStrings()) //
      ? (await Clipboard.getData(
          Clipboard.kTextPlain,
        ))?.text
      : NIL);
}

value__asyn<void> //
base__environment__clip_board__set__text({
  required final string value,
}) {
  return Clipboard.setData(
    ClipboardData(
      text: value,
    ),
  );
}

void gui__base__app__focus__remove() /*
de-focus ,ir-respective of the widget */ {
  FocusManager.instance.primaryFocus?.unfocus();
}

void base__environment__set__phone() {
  base__print__handle = debugPrint;
}

value__asyn<void> //
base__orientation__set__portrait() {
  return SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

void gui__base__widget__tree__rendering__frame__current__post__register(
  final void Function(
    Duration time,
  )
  frame__current__post__handle,
) {
  WidgetsBinding.instance.addPostFrameCallback(
    frame__current__post__handle,
  );
}

void _element__build__re(
  final Element element,
) {
  element.build__re();
}

extension on Element {
  void build__re() {
    markNeedsBuild();
    visitChildren(
      _element__build__re,
    );
  }
}

extension gui__base__widget__building__context__extension //
    on gui__base__widget__building__context {
  Element element___raw() {
    return (this as Element);
  }

  void build__re__recursive() {
    element___raw().visitChildren(
      _element__build__re,
    );
  }

  void build__re() {
    if (valid___ok()) {
      build__re___raw();
    }
  }

  void build__re___raw /*
should not be called ,after asyn.-gap */ () {
    element___raw().markNeedsBuild();
  }

  BOOL valid___ok() {
    return mounted;
  }
}
