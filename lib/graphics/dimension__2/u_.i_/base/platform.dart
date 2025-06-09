part of "_.dart";

void base__platform__web__support__not__throw() {
  switch (base__program__compilation__platform) {
    case base__program__compilation__platforms.web:
      throw UnsupportedError("web platform not supported");

    default:
      return;
  }
}

value__asyn<void> base__platform__init_() async {
  if (base__printing__ok) {
    base__program__compilation__platform.text__representation().print("base__program__compilation__platform");
  }

  switch (base__program__compilation__platform) {
    default:
      return;
  }
}
