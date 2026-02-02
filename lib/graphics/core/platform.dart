part of "_.dart";

void platform__web__support__not__throw() {
  switch (program__compilation__platform) {
    case program__compilation__platforms.web:
      throw UnsupportedError("web platform not supported");

    default:
      return;
  }
}

ASYN<void> platform__init_() async {
  if (printing___ok) {
    program__compilation__platform.representation__text().print("program__compilation__platform");
  }

  switch (program__compilation__platform) {
    default:
      return;
  }
}
