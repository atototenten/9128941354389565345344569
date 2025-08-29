part of "../_.dart";

string Size__convert__text(final Size size) => //
    ("Width: ${size.width}"
        "\n"
        "Height: ${size.height}");

string EdgeInsets__convert__text(final EdgeInsets edgeInsets) => //
    (((edgeInsets.top == 0) &&
            (edgeInsets.left == 0) && //
            (edgeInsets.right == 0) &&
            (edgeInsets.bottom == 0)) //
        ? "EdgeInsets.zero"
        : ("EdgeInsets("
            "top: ${edgeInsets.top.toStringAsFixed(1)}, "
            "left: ${edgeInsets.left.toStringAsFixed(1)}, "
            "right: ${edgeInsets.right.toStringAsFixed(1)}, "
            "bottom: ${edgeInsets.bottom.toStringAsFixed(1)})"));

class base__program__info__page__entity //
    implements gui__base__entity__component___protocol {
  base__program__info__page__entity() //
      : scroll__manager = base__scrolling();

  final base__scrolling scroll__manager;

  @override
  gui__base__widget widget(
    final gui__base__widget__building__context context,
  ) {
    final //
        border__radius = BorderRadius.all(Radius.circular(12.px())),
        mediaQueryData = MediaQuery.of(context),
        title_body__separator = SizedBox(
          height: 4.px(),
        ),
        items = <gui__base__widget>[
          base__list_ing__shell(
            items: <gui__base__widget>[
              base__list_ing__shell__title(
                primary__text: "Primary view's Sizes",
                secondary__text: "NOTE: All values, are wrong, due to, our low-level mods",
              ),
              title_body__separator,
              gui__base__listing__item(
                border__radius: border__radius,
                body: gui__base__box__text__primary__secondary(
                  mediaQueryData.devicePixelRatio.toString(),
                  "Screen's (Physical to Virtual) Pixel ratio",
                ),
              ),
              gui__base__widget__separat_or__vertical,
              gui__base__listing__item(
                border__radius: border__radius,
                body: gui__base__box__text__primary__secondary(
                  Size__convert__text(mediaQueryData.size),
                  "Emulated (or virtual) screen estate",
                ),
              ),
              gui__base__widget__separat_or__vertical,
              gui__base__listing__item(
                border__radius: border__radius,
                body: gui__base__box__text__primary__secondary(
                  Size__convert__text(mediaQueryData.size * mediaQueryData.devicePixelRatio),
                  "Real screen estate",
                ),
              ),
            ],
          ),
          base__list_ing__shell(
            items: <gui__base__widget>[
              base__list_ing__shell__title(
                primary__text: "Primary view's Paddings",
              ),
              title_body__separator,
              gui__base__listing__item(
                border__radius: border__radius,
                body: gui__base__box__text__primary__secondary(
                  mediaQueryData.viewPadding.toString(),
                  "Permanent",
                ),
              ),
              gui__base__widget__separat_or__vertical,
              gui__base__listing__item(
                border__radius: border__radius,
                body: gui__base__box__text__primary__secondary(
                  mediaQueryData.viewInsets.toString(),
                  "Temporary",
                ),
              ),
              gui__base__widget__separat_or__vertical,
              gui__base__listing__item(
                border__radius: border__radius,
                body: gui__base__box__text__primary__secondary(
                  mediaQueryData.padding.toString(),
                  "Combined",
                ),
              ),
            ],
          ),
          base__list_ing__shell(
            items: <gui__base__widget>[
              base__list_ing__shell__title(
                primary__text: "Platform preferences",
                secondary__text: "Completely ignored by our system",
              ),
              title_body__separator,
              gui__base__listing__item(
                border__radius: border__radius,
                body: gui__base__box__text__primary__secondary(
                  mediaQueryData.platformBrightness.toString().substring(11),
                  "Brightness",
                ),
              ),
              gui__base__widget__separat_or__vertical,
              gui__base__listing__item(
                border__radius: border__radius,
                body: gui__base__box__text__primary__secondary(
                  mediaQueryData.textScaler.scale(1).toString(),
                  "Text scale(or zoom) factor",
                ),
              ),
              gui__base__widget__separat_or__vertical,
              gui__base__listing__item(
                border__radius: border__radius,
                body: gui__base__box__text__primary__secondary(
                  mediaQueryData.boldText.toString(),
                  "Bold text",
                ),
              ),
              gui__base__widget__separat_or__vertical,
              gui__base__listing__item(
                border__radius: border__radius,
                body: gui__base__box__text__primary__secondary(
                  mediaQueryData.alwaysUse24HourFormat.toString(),
                  "Always use \"24 Hour\" format (instead of AM/PM)",
                ),
              ),
            ],
          ),
          gui__base__listing__item(
            body: gui__base__box__text__primary__secondary(
              program__compile__platform.representation__text().value,
              "Platform",
            ),
          ),
          gui__base__listing__item(
            body: gui__base__box__text__primary__secondary(
              program__compile__mode.representation__text().value,
              "Build",
            ),
          ),
          gui__base__listing__item(
            body: gui__base__box__text__primary__secondary(
              base__app__theme__colors__ground__back__contrast__dark__ok.toString(),
              "Dark interface switch\n"
              "Based on system time-of-day,\n"
              "And independent of user's preference",
            ),
          ),
          gui__base__listing__item(
            body: gui__base__box__text__primary__secondary(
              app__interface__b__simple.toString(),
              "Simple interface switch\n"
              "(Accessibility optimized,\n"
              "For elder people, and\n"
              "Not \"Divyang Jan\"(Hindi lang))",
            ),
          ),
          gui__base__listing__item(
            body: gui__base__box__text__primary__secondary(
              base__wall__width.toString(),
              "Page width (value based on Screen's virtual width)",
            ),
          ),
          gui__base__listing__item(
            body: gui__base__box__text__primary__secondary(
              1.px().toString(),
              "1 pixel(size) equivalent",
            ),
          ),
          gui__base__listing__item(
            body: gui__base__box__text__primary__secondary(
              ('"' + storage__directory__permanent__path() + '"'),
              "Permanent-storage directory",
            ),
          ),
          gui__base__listing__item(
            body: gui__base__box__text__primary__secondary(
              ('"' + storage__directory__cache__path() + '"'),
              "Cache-storage directory",
            ),
          ),
          gui__base__listing__item(
            body: gui__base__box__text__primary__secondary(
              ('"' + storage__directory__temporary__path() + '"'),
              "Temporary-storage directory",
            ),
          ),
          GestureDetector(
            child: gui__base__listing__item(
              body: gui__base__box__text__primary(
                "Explore file-system",
              ),
              trailing: base__icon(
                flutter__icon__navigation__forward,
              ),
            ),
            onTap: () {
              /*context.navigation().forward__overlay__bottom(
                    overlay__build: (final $context) => //
                        overlay__bottom__explorer__file_system(
                      context: $context,
                    ),
                  );*/ /* FIX */
            },
          ),
        ];

    return page__foundation(
      base__list_ing__generat_ed(
        context: context,
        scroll__manager: scroll__manager,
        page__title: base__page__title__aligned__center(
          primary__text: "Runtime Info.",
        ),
        item__array__count: items.length,
        item__build: (final _, final NI i) => //
            items[i],
      ),
    );
  }

  @override
  void dispose() {
    scroll__manager.dispose();
  }
}
