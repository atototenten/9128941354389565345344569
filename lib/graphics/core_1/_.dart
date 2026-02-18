import "../../../../core/_.dart";

import "../core/_.dart";
import "../flutter/_.dart";

part "scrolling.dart";

void app__focus__remove() /*
de-focus ,ir-respective of the widget */ {
  FocusManager.instance.primaryFocus?.unfocus();
}

ASYN<void> orientation__assign__portrait___asyn() {
  return SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

ASYN<void> orientation__assign__landscape___asyn() {
  return SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
}

extension WidgetsBinding___extension //
    on WidgetsBinding {
  void task__rendering__frame__current__after__schedule(final void___procedure__format delegatee) {
    addPostFrameCallback((_) {
      return delegatee();
    });
  }

  void task__rendering__frame__next__before__schedule(final void___procedure__format delegatee) {
    scheduleFrameCallback(
      (_) {
        return delegatee();
      },
      scheduleNewFrame: TRUE,
    );
  }
}
