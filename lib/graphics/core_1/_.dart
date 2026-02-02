import "../../../../core/_.dart";

import "../core/_.dart";
import "../flutter/_.dart";

part "scrolling.dart";

void app__focus__remove() /*
de-focus ,ir-respective of the widget */ {
  FocusManager.instance.primaryFocus?.unfocus();
}

ASYN<void> //
orientation__assign__portrait___asyn() {
  return SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

ASYN<void> //
orientation__assign__landscape___asyn() {
  return SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
}

void widget__tree__rendering__frame__current__post__register(
  final void Function(
    Duration time,
  )
  frame__current__post__handle,
) {
  WidgetsBinding.instance.addPostFrameCallback(
    frame__current__post__handle,
  );
}
