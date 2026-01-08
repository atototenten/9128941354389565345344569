part of "_.dart";

BOOL base__environment__theme__colors__ground__back__contrast__dark___ok() {
  return (ui.PlatformDispatcher.instance.platformBrightness == Brightness.dark);
}

final base__app__life_cycle__state__channel = //
base__value__mutation__event__channel__broadcast(
  AppLifecycleState.detached,
);

BOOL _PlatformDispatcher__onError(
  final Object error,
  final StackTrace trace,
) {
  base__error__handle(
    error,
    trace,
  );

  return TRUE;
}

void _FlutterError__onError(
  final FlutterErrorDetails details,
) {
  base__error__handle(
    details.exception,
    (details.stack ?? StackTrace.current),
  );
}

void base__app__run //
<entity__type extends gui__base__entity__page___protocol>({
  required final entity__type Function(
    value__asyn<void> init_ion__asyn /*
indicates the fully init.ion ,of the meta-framework ,and the flutter-framework */,
  )
  init,
  //required final gui__base__widget__major__build__function__format< entity__type> page__first__build,
})
/*
abstracts `runApp`
inspired by `flutter/lib/src/material/app.dart`::`MaterialApp` */
{
  {
    ui.PlatformDispatcher.instance.onError = _PlatformDispatcher__onError;

    FlutterError.onError = _FlutterError__onError;
  }

  WidgetsFlutterBinding.ensureInitialized();

  final init_ion__promise = value__asyn__meta<void>();
  {
    var count___raw = 2;
    void _success__handle() {
      count___raw -= 1;
      if (count___raw == 0) {
        init_ion__promise.complete();
      }
    }

    void _failure__handle(
      final Object e,
      final StackTrace t,
    ) {
      init_ion__promise.completeError(e, t);
    }

    base__platform__init_().handle(
      (final _) => _success__handle(),
      _failure__handle,
    );

    base__storage__init_().handle(
      (final _) => _success__handle(),
      _failure__handle,
    );

    /*SystemChannels.lifecycle.setMessageHandler((final message) async {
      final AppLifecycleState state;

      switch (message) {
        case "AppLifecycleState.resumed":
          state = AppLifecycleState.resumed;
        case "AppLifecycleState.inactive":
          state = AppLifecycleState.inactive;
        case "AppLifecycleState.hidden":
          state = AppLifecycleState.hidden;
        case "AppLifecycleState.paused":
          state = AppLifecycleState.paused;
        case "AppLifecycleState.detached":
          state = AppLifecycleState.detached;

        default:
          throw "un-known `AppLifecycleState`, $message";
      }

      if (base__printing___ok) {
        state.name.representation__text().print("app__state__life_cycle");
      }

      if (state != app__state__life_cycle) {
        app__state__life_cycle__broadcast.message__announce(
          (app__state__life_cycle = state),
        );
      }
    }); /*
  forked
    from `flutter/src/services/binding.dart`::`mixin ServicesBinding`
      ::`value__asyn<String?> _handleLifecycleMessage(String?)`
      ::`void initInstances()` */*/

    /*SystemChannels.keyEvent.setMessageHandler((final message) async {
      final key___raw = RawKeyEvent.fromMessage(message as Map<string, Object?>);

      if (base__printing___ok) {
        report__Object(key___raw, "app__key.key__raw");

        reporting__indent();

        report__text__null_able(key___raw.character, "..character");
        report__Object__null_able(key___raw.character?.codeUnits, "..character.codeUnits");
        report__bool((key___raw is RawKeyDownEvent), "..isRawKeyDownEvent");
        report__bool((key___raw is RawKeyUpEvent), "..isRawKeyUpEvent");

        final data = key___raw.data;

        report__text(data.keyLabel, "..keyLabel");

        report__bool(data.isShiftPressed, "..isShiftPressed");
        report__bool(data.isControlPressed, "..isControlPressed");
        report__bool(data.isAltPressed, "..isAltPressed");
        report__bool(data.isMetaPressed, "..isMetaPressed");

        /*report__bool((data.physicalKey == PhysicalKeyboardKey.keyA), "..physicalKey.isA");
              report__bool((data.logicalKey == LogicalKeyboardKey.keyA), ".logicalKey.isA");*/

        reporting__de_indent();
      }

      if /* un-likely */ ((key___raw is RawKeyDownEvent) && //
          (key___raw.data.logicalKey == LogicalKeyboardKey.goBack)) //
        navigate__back(
          app__navigation__manager,
        );
      else //
        app__key__broadcast.message__announce(
          key___raw,
        );

      return <string, bool>{"handled" /*b__handled*/ : TRUE};
    }); /*
  forked
    from `flutter/src/services/binding.dart`::`mixin ServicesBinding`
      ::`void _initKeyboard()`
      ::`void initInstances()` */*/

    /*SystemChannels.navigation.setMethodCallHandler((final call) async {
      if (base__printing___ok) //
        base__function__call__print__arguments__void(
          "SystemChannels.navigation",
        );

      switch (call.method) {
        case "popRoute":
          navigate__back(
            app__navigation__manager,
          );

          return;
        case "pushRoute":
          final //
              route = (call.arguments as text),
              route__info = RouteInformation(
                uri: Uri.parse(route),
              );

          reporting__indent();
          if (base__printing___ok) {
            report__text(route, "route");
            report__Object(route__info, "route__info");
          }
          reporting__de_indent();

          return;
        case "pushRouteInformation":
          final //
              route__args = (call.arguments as Map<Object, Object?>),
              route__info = RouteInformation(
                uri: Uri.parse(route__args["location"] as text),
                state: route__args["state"],
              );

          reporting__indent();
          if (base__printing___ok) {
            report__Object(route__args, "route__args");
            report__Object(route__info, "route__info");
          }
          reporting__de_indent();

          return;

        default:
          throw "un-known call, $call";
      }
    }); /*
  forked
    from `flutter/src/widgets/binding.dart`::`mixin WidgetsBinding`
      ::`value__asyn<dynamic> _handleNavigationInvocation(MethodCall)`
      ::`void initInstances()` */*/

    /*PlatformDispatcher.instance
      ..onMetricsChanged = () {
        if (base__printing___ok) //
          base__function__call__print__arguments__void(
            "PlatformDispatcher.onMetricsChanged",
          );

        {
          final //
              binding = RendererBinding.instance,
              views = binding.renderViews;

          BOOL force_frame = FALSE;

          for (final RenderView view in views) {
            force_frame = (force_frame || (view.child != null));

            final //
                view_ = view.flutterView,
                devicePixelRatio = view_.devicePixelRatio;

            view.configuration = ViewConfiguration(
              constraints: (view_.physicalConstraints / devicePixelRatio),
              devicePixelRatio: devicePixelRatio,
            );
          }

          if (force_frame) //
            binding.scheduleForcedFrame();
        } /*
  forked
    from `flutter/src/rendering/binding.dart`::`mixin RendererBinding`
      ::`ViewConfiguration createViewConfigurationFor(RenderView)`
      ::`void handleMetricsChanged()`
      ::`void initInstances()` */

        reporting__indent();
        if (base__printing___ok) //
          ui.PlatformDispatcher.instance.views.forEach((final view) {
            report__Object(view, "view");

            reporting__indent();
            report__Object(view.physicalSize, "..physicalSize");
            report__APPROX(view.devicePixelRatio, "..devicePixelRatio");
            reporting__de_indent();
          });
        reporting__de_indent();

        app__size__set();

        app__build__re();
      }
      ..onPlatformBrightnessChanged = () {
        if (base__printing___ok) //
          base__function__call__print__arguments__void(
            "PlatformDispatcher.onPlatformBrightnessChanged",
          );

        reporting__indent();
        if (base__printing___ok) //
          report__Object(
            ui.PlatformDispatcher.instance.platformBrightness,
            "PlatformDispatcher.platformBrightness",
          );
        reporting__de_indent();

        app__color__set();
        app__color__broadcast.message__announce(null);
        app__build__re();
      };*/
  }

  final entity = init(
    init_ion__promise.future,
  );

  base__app__size__set(
    view: NIL,
  ); /*
called at last ,to allow ,the slow environments (like android) ,some extra time, for proper init. */

  runApp(
    Directionality(
      textDirection: TextDirection.ltr,
      child: Localizations(
        locale: base__app__locale,
        delegates: base__app__localizations__delegates,
        child: base__app__gui__base__widget(
          child__build: entity.widget__build,
        ),
      ),
    ),
  );
}

void base__app__run__simple /*
config. :
  `environment__phone___ok`
  `behavior__correct__ok`

tasks.long:
  - add app-splash, as black seems bad */ //
<entity__type extends gui__base__entity__page___protocol>({
  required final string app__title,
  required final service__authority__base service__authority,
  required final value__asyn<entity__type> Function() entity /*
`debug`* global properties ,like `debugPaintSizeEnabled` ,`debugPaintPointersEnabled` ,`debugRepaintRainbowEnabled` ,`debugRepaintTextRainbowEnabled` ,`debugPaintLayerBordersEnabled` ,`debugDisableClipLayers` ,`debugPrintRebuildDirtyWidgets` ,`debugPrintMouseHoverEvents` ,`debugPrintHitTestResults` ,`debugPrintKeyboardEvents` ,can be set inside
`theme__colors__set` proc. should be called in the proc.
wrap every page/overlay ,to handle `base__app__theme__change__channel`
  ,and preferably the child with `ValueKey(app__theme__id)`(or simply `ValueKey(base__app__theme__colors__ground__back__contrast__dark___ok)` if merely a day/night theme is needed) as `key` (to not re-use ,the tree's existing widgets)
    ,because the framework's `base__app__build__re` is not definitive
  ,because handling above(in tree-node's position or hierarchy) `MaterialApp` ,would re-set the whole app (including navigation[-stack] ,and current page/overlay)
    ,while handling below(as its child) ,would be overridden with page/overlay navigation
`storage` is available at this point
to return non-future value ,prefer using `value__asyn.value` */,
  required final gui__base__widget__build__function__format splash__build /*
must not depend on the meta-framework */,
}) {
  service__authority
      .handle() /*
un-"await"-ed to allow the app to normally function ,for non-denial cases */;

  base__app__theme__colors__ground__back__follow__system___ok = TRUE;

  base__app__run(
    init: (final init_ion__status) {
      return gui__base__app__running__simple<entity__type>(
        app__title: app__title,
        init_ion__status__asyn: init_ion__status,
        entity: entity,
        splash__build: splash__build,
      );
    },
  );
}

class gui__base__app__running__simple //
<entity__type extends gui__base__entity__page___protocol> //
    implements gui__base__entity__page___protocol {
  gui__base__app__running__simple({
    required this.app__title,
    required final value__asyn<void> init_ion__status__asyn,
    required final value__asyn<entity__type> Function() entity,
    required this.splash__build,
  }) {
    final entity__promise = value__asyn__meta<entity__type>();

    void _failure__handle(
      final Object error,
      final StackTrace trace,
    ) {
      entity__promise.completeError(
        error,
        trace,
      );
    }

    init_ion__status__asyn.handle(
      (final _) {
        base__app__theme__colors__ground__back__contrast__dark___ok = base__environment__theme__colors__ground__back__contrast__dark___ok();

        entity().handle(
          (final entity) {
            entity__promise.complete(
              entity,
            );
          },
          _failure__handle,
        );
      },
      _failure__handle,
    );

    _init_ion__asyn = /*base__value__asyn__definitive<entity__type>(*/ entity__promise.future /*,)*/;
  }

  final string app__title;
  late final value__asyn<entity__type> /*
    TASK : move to "base__value__asyn__definitive"
      once re-starting works
        in arethos-tracking app. */
  _init_ion__asyn;
  final gui__base__widget__build__function__format splash__build;

  @override
  void dispose() {
    _init_ion__asyn.dispose();
  }

  @override
  gui__base__widget widget__build(final gui__base__widget__building__context context) {
    return _init_ion__asyn.handling__widget__build(
      context,
      child__state__waiting__build: splash__build,
      child__state__completion__failure__build: gui__base__widget__error__default__build,
      child__state__completion__success__build: (final context, final entity_1) {
        return MaterialApp(
          showPerformanceOverlay: FALSE,
          debugShowCheckedModeBanner: FALSE,
          /*checkerboardRasterCacheImages: TRUE,
          checkerboardOffscreenLayers: TRUE,*/
          home: gui__base__widget__build(
            child__build: (final context) {
              return entity_1.widget__build(
                context,
              );
            },
          ),
          title: app__title,
          color: const Color.fromARGB(INT__1__max, 191, 191, 191),
          locale: base__app__locale,
          localizationsDelegates: base__app__localizations__delegates,
          supportedLocales: const <Locale>[base__app__locale],
          scrollBehavior: gui__base__scrolling___compo.scrolling__behavior,
          themeAnimationStyle: AnimationStyle.noAnimation,
        );
      },
    );
  }
}

late BOOL base__app__theme__colors__ground__back__follow__system___ok; /*
disabl-ing `app:size:follow:system` would be non-sense ,because the whole sub-system depends on it ,for dynamic siz-ing
  ,static siz-ing is the default ,hence can be imitated ,simply ,by avoid-ing `APPROX.px` */

class base__app__gui__base__widget extends StatefulWidget {
  const base__app__gui__base__widget({
    required this.child__build,
  });

  final gui__base__widget__build__function__format child__build;

  @override
  _app__gui__base__widget__state createState() {
    return _app__gui__base__widget__state();
  }
}

class _app__gui__base__widget__state //
    extends
        State<base__app__gui__base__widget> //
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(
      this,
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(
      this,
    );

    super.dispose();
  }

  @override
  void didChangeMetrics() {
    if (base__printing___ok) {
      base__printing__indentation__increase();
      for (final view in ui.PlatformDispatcher.instance.views) {
        view.representation__text().print("view");

        base__printing__indentation__increase();
        view.physicalSize.representation__text().print("..physicalSize");
        view.devicePixelRatio.representation__text().print("..devicePixelRatio");
        base__printing__indentation__decrease();
      }
      base__printing__indentation__decrease();
    }

    if (base__app__size__set(
      view: NIL,
    )) {
      if (base__printing___ok) {
        "app:size:set:re_fresh:ok".print();
      }

      context.build__re();
    }
  }

  @override
  void didChangePlatformBrightness() {
    if (base__printing___ok) {
      "app:colors:change".print();
    }

    if (base__app__theme__colors__ground__back__follow__system___ok.not) {
      return;
    }

    base__app__theme__colors__ground__back__contrast__dark___ok = base__environment__theme__colors__ground__back__contrast__dark___ok();

    base__app__theme__change__channel.event__dispatch();

    if (base__printing___ok) {
      "app:colors:set:re_fresh:ok".print();
    }

    context.build__re();
  }

  @override
  void didChangeAppLifecycleState(
    final AppLifecycleState state,
  ) {
    if (base__printing___ok) {
      state.representation__text().print("app:life_cycle:state:new");
    }

    if (state == base__app__life_cycle__state__channel.value()) {
      return;
    }

    base__app__life_cycle__state__channel.value__mutation__dispatch(
      state,
    );

    super.didChangeAppLifecycleState(
      state,
    );
  }

  @override
  Widget build(final _) {
    return widget.child__build(
      context,
    );
  }
}

extension FlutterErrorDetails__extension on FlutterErrorDetails {
  ({string error__text, StackTrace? trace}) convert__text() {
    final //
    buffer = (StringBuffer()
      ..write(
        "library"
        ":\"",
      )
      ..write(library)
      ..write(
        "\","
        "context"
        ":\"",
      )
      ..write(context)
      ..write(
        "\","
        "exception"
        ":\"",
      )
      ..write(exception)
      ..write(
        "\","
        "silent"
        ":\"",
      )
      ..write(silent));

    if (base__program__compilation__debug___ok) {
      buffer
        ..write(
          "\","
          "informationCollector"
          ":\"",
        )
        ..write(informationCollector);
    }

    final result = (buffer..write("\"")).toString();

    buffer.clear();

    return (
      error__text: result,
      trace: stack,
    );
  }
}
