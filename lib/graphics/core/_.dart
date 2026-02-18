import "package:foundation/core/_.dart";
import "package:foundation/service.authority/_.dart";

import "package:foundation/graphics/flutter/_.dart";
import "package:foundation/graphics/apple.cupertino/_.dart" //
    show DefaultCupertinoLocalizations;
import "package:foundation/graphics/google.material/_.dart" //
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

import "dart:math" as dart__math;
import "dart:ui" as dart__ui;

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
program__compilation__debug___ok = kDebugMode;

final program__compilation__platform /* should be avoided ,as much as possible */ = //
    (kIsWeb //
    ? program__compilation__platforms.web
    : (kIsWasm
          ? program__compilation__platforms.web__assembly
          : switch (defaultTargetPlatform) {
              TargetPlatform.fuchsia => program__compilation__platforms.fuchsia,
              TargetPlatform.linux => program__compilation__platforms.linux,
              TargetPlatform.android => program__compilation__platforms.android,
              TargetPlatform.windows => program__compilation__platforms.windows,
              TargetPlatform.iOS => program__compilation__platforms.apple__hand_held,
              TargetPlatform.macOS => program__compilation__platforms.apple__desktop,
            }));

enum program__compilation__platforms {
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
    locale__latin__english__america = Locale(
      "en",
      "US",
    ),
    app__locale = locale__latin__english__america,
    //
    app__localizations__delegates = <LocalizationsDelegate<Object>>[
      DefaultWidgetsLocalizations.delegate,
      DefaultMaterialLocalizations.delegate,
      DefaultCupertinoLocalizations.delegate,
    ];

typedef widget___protocol = Widget;

typedef widget__building__context___compo = BuildContext;

/*late widget__building__context___compo _app__context;*/

typedef widget__build___procedure__format = //
    widget___protocol Function(widget__building__context___compo context);

typedef widget__advanced__build___procedure__format<storage___type> = //
    widget___protocol Function(widget__building__context___compo context, storage___type storage);

typedef widget__detach___procedure__format<storage___type> = //
    void Function(storage___type storage);

typedef widget__attach___procedure__format<storage___type> = //
    storage___type Function(widget__building__context___compo context);

typedef event__handle___procedure__format = //
    void Function(widget__building__context___compo);

void app__re_build()
/*{ _app__context.re_build__recursive(); }*/
{
  final //
  binding = WidgetsBinding.instance,
      element__root = binding.rootElement;

  if (element__root != null) {
    binding.buildOwner?.reassemble(element__root);
  }
} /*
forked
  from `flutter/src/widgets/binding.dart`::`mixin WidgetsBinding`::`ASYN<void> _forceRebuild()` */

Key widget__key__unique() /*
needed to prevent the flutter-framework ,from re-using the old widget ,from the tree
  similar to in-validating the cache
should be avoided ,in favor of a reliable (consistently reproducible) value (like `ValueKey("$category:$item")`) ,to not waste resources ,on un-necessary build calls ,and improve efficiency */ => //
    /*/* must not be `const` */ ValueKey(Object())*/ UniqueKey();

ASYN<string?> //
environment__clip_board__text___asyn() async {
  return ((await Clipboard.hasStrings()) //
      ? (await Clipboard.getData(
          Clipboard.kTextPlain,
        ))?.text
      : NIL);
}

ASYN<void> environment__clip_board__text__assign___asyn({
  required final string value,
}) {
  return Clipboard.setData(
    ClipboardData(
      text: value,
    ),
  );
}

void environment__assign__phone() {
  print__handle = debugPrint;
}

void _element__re_build(
  final Element element,
) {
  element.re_build();
}

extension on Element {
  void re_build() {
    markNeedsBuild();
    visitChildren(
      _element__re_build,
    );
  }
}

extension widget__building__context__extension //
    on widget__building__context___compo {
  Element element___raw() {
    return (this as Element);
  }

  void re_build__recursive() {
    element___raw().visitChildren(
      _element__re_build,
    );
  }

  void re_build() {
    if (valid___ok()) {
      re_build___raw();
    }
  }

  void re_build___raw /*
should not be called ,after asyn.-gap */ () {
    element___raw().markNeedsBuild();
  }

  BOOL valid___ok() {
    return mounted;
  }
}
