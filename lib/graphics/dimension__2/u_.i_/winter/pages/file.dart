part of "../_.dart";

/*const file__segment__size = 8;

gui__base__widget pages__file__page(
  final gui__base__widget__building__context context, {
  required final base__scrolling scroll__manager,
  required final string title,
  required final BS1__array Function(
    NI count,
    NI position,
  ) fetch,
  required final NI count,
  final NI offset = 0,
}) /*
  file is a collection of bytes, so the page is actually general purpose
  TASK: currently, limited, to `io__buffer__size__default` */
{
  final BS1__array file__bytes;

  final NI //
      segments__count,
      bytes__un_aligned__count;

  if (count > io__buffer__size__default) {
    file__bytes = fetch(io__buffer__size__default, offset);

    segments__count = (io__buffer__size__default ~/ file__segment__size);
    bytes__un_aligned__count = 0;
  } else {
    file__bytes = fetch(count, offset);

    segments__count = (count ~/ file__segment__size);
    bytes__un_aligned__count = ((count != io__buffer__size__default) //
        ? (count % file__segment__size)
        : 0);
  }

  BOOL b__aligned(final NI segment__counter) => //
      ((bytes__un_aligned__count == 0) || (segment__counter < segments__count));

  return page__foundation(
    base__list_ing__generat_ed(
      context: context,
      scroll__manager: scroll__manager,
      page__title: base__page__title__aligned__center(
        primary__text: file__path__convert__name(title),
        secondary__text: (count.toString() + " bytes"),
      ),
      page__briefing: Padding(
        padding: EdgeInsets.only(
          left: size__pixel__padding__horizontal,
          right: size__pixel__padding__horizontal,
          bottom: size__pixel__padding__vertical,
        ),
        child: gui__base__listing__item__info(
          body: gui__base__box__text__primary("Press to switch, between, raw, and ASCII encoding"),
        ),
      ),
      item__array__count: ((bytes__un_aligned__count > 0) //
          ? (segments__count + 1)
          : segments__count),
      item__build: (final _, final segment__counter) {
        final //
            b__aligned_ = b__aligned(segment__counter);

        final BS1__array bytes;
        final array<string> text__binary;

        if (b__aligned_) {
          bytes = file__bytes.view__partial(
            (file__segment__size * segment__counter),
            file__segment__size,
          );

          text__binary = array<string>.generate(
            file__segment__size,
            (final i) => //
                bytes[i].toString(),
            growable: NO,
          );
        } else {
          bytes = file__bytes.view__partial(
            (file__segment__size * segment__counter),
            bytes__un_aligned__count,
          );

          text__binary = array<string>.filled(
            file__segment__size,
            empty__string,
            growable: NO,
          );

          base__iterate__basic(
              bytes__un_aligned__count,
              (final i) => //
                  (text__binary[i] = bytes[i].toString()));
        }

        array<string> text__current = text__binary;

        BOOL b__binary = OK;

        array<string>? text__ascii;

        return Row(
          children: <gui__base__widget>[
            Expanded(
              flex: 2,
              child: gui__base__box__non_button(
                border__radius: BorderRadius.all(Radius.circular(8.px())),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 8.px(),
                    left: 1.px(),
                    right: 2.px(),
                    bottom: 8.px(),
                  ),
                  child: gui__base__box__text__widget(
                    (segment__counter + 1).toString(),
                    font__weight: FontWeight.w700,
                    text__align: TextAlign.center,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 4.px(),
            ),
            Expanded(
              flex: file__segment__size,
              child: gui__base__widget__build__definitive(
                build: (final state) {
                  final array<gui__base__widget> row__children;

                  if (b__aligned_) //
                    row__children = array<gui__base__widget>.generate(
                      file__segment__size,
                      (final i) => //
                          Expanded(
                        child: gui__base__box__text__widget(
                          text__current[i],
                          font__size: 14.px(),
                          text__align: TextAlign.end,
                        ),
                      ),
                      growable: NO,
                    );
                  else {
                    row__children = array<gui__base__widget>.filled(
                      file__segment__size,
                      const Expanded(
                        child: gui__base__empty__widget,
                      ),
                      growable: NO,
                    );

                    base__iterate__basic(
                        bytes__un_aligned__count,
                        (final i) => //
                            (row__children[i] = Expanded(
                              child: gui__base__box__text__widget(
                                text__current[i],
                                font__size: 14.px(),
                                text__align: TextAlign.end,
                              ),
                            )));
                  }

                  return GestureDetector(
                    child: gui__base__listing__item(
                      padding__leading: size__pixel__padding__horizontal,
                      body: Row(
                        children: row__children,
                      ),
                      padding__trailing: size__pixel__padding__horizontal,
                    ),
                    onTap: () {
                      if (b__binary) {
                        text__current = //
                            (text__ascii ??= //
                                array<string>.generate(
                          (b__aligned_ //
                              ? file__segment__size
                              : bytes__un_aligned__count),
                          (final i) {
                            final c = bytes[i];

                            return (TC__ascii__valid__and__printable___ok(c) //
                                ? string.fromCharCode(c)
                                : ((c == TC__ascii__non_printable__line_feed) //
                                    ? r"\n"
                                    : text__binary[i]));
                          },
                          growable: NO,
                        ));

                        b__binary = NO;
                      } else {
                        text__current = text__binary;

                        b__binary = OK;
                      }

                      state.build__re();
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    ),
  );
}*/
