part of "_.dart";

/*const //
    font__feature__math__tabular_figures = <FontFeature>[FontFeature.tabularFigures()],
    rich_text__text__alignment__options = /*<TextAlign>[
      TextAlign.center,
      TextAlign.right,
    ]*/
        <Alignment>[
      Alignment.center,
      Alignment.centerRight,
    ],
    rich_text__link___protocol__list = <string>[
      base__net__web__scheme__fix__pre,
      base__net__web__scheme__secure__fix__pre,
    ];

string rich_text__www__address__resolve(
  final INT protocol__id,
  final BS1__array address__bytes__buffer,
) {
  final address = (StringBuffer(rich_text__link___protocol__list[protocol__id])
        ..write("://")
        ..write(str__convert__text(address__bytes__buffer)))
      .toString();

  return address;
}

gui__base__widget rich_text__image({
  required final ScrollController controller,
  required final value__asyn<BS1__array> image__future,
  required final APPROX width,
  required final APPROX height,
}) {
  procedure__empty__format? build__re;

  BS1__array? image;

  final //
      image__widget = gui__base__value__asyn__handling__widget(
    future: image__future,
    success__handle: (final image_) {
      image = image_;
      build__re?.call();
    },
    error__indicate: (final _) => //
        SizedBox(
      width: width,
      height: height,
      child: winter__dis_connection__widget(),
    ),
    buffer_ing__indicate: () => //
        SizedBox(
      width: width,
      height: height,
      child: winter__waiting__widget(),
    ),
  );

  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: size__pixel__padding__vertical,
    ),
    child: Center(
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(8.px())),
        child: gui__base__widget__build__definitive(
          init: (final state) {
            build__re = state.build__re;
          },
          de_init_: () {
            build__re =  null;
          },
          build: (final state) {
            final image_ = image;

            return ((image_ ==  null)
                ? image__widget
                : base__indicator__scroll__horizontal(
                    controller: controller,
                    height: height,
                    width: width,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: scroll__physics__clamping,
                      controller: controller,
                      child: Image(
                        image: MemoryImage(
                          image_,
                        ),
                        width: width,
                        height: height,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ));
          },
        ),
      ),
    ),
  );
}

TextStyle base__text__rich__style__not() => //
    base__text__style(
      font__color: color__foreground__default,
      font__size: 16.px(),
      font__weight: FontWeight.normal,
      font__features: font__feature__math__tabular_figures,
      font__family: font__families[font__family__material__text],
    );

TextStyle base__text__rich__style__bold() => //
    base__text__style(
      font__color: color__foreground__default,
      font__size: 18.px(),
      font__weight: FontWeight.w600,
      font__features: font__feature__math__tabular_figures,
      font__family: font__families[font__family__material__text],
    );

TextStyle base__text__rich__style__title() => //
    base__text__style(
      font__color: color__foreground__almost,
      font__size: 28.px(),
      font__weight: FontWeight.bold,
      font__features: font__feature__math__tabular_figures,
      font__family: font__families[font__family__material__title],
    );

TextStyle base__text__rich__style__heading() => //
    base__text__style(
      font__color: color__foreground__default,
      font__size: 24.px(),
      font__weight: FontWeight.bold,
      font__features: font__feature__math__tabular_figures,
      font__family: font__families[font__family__material__title],
    );

TextStyle base__text__rich__style__sub_title() => //
    base__text__style(
      font__color: color__foreground__default,
      font__size: 24.px(),
      font__weight: FontWeight.w600,
      font__features: font__feature__math__tabular_figures,
      font__family: font__families[font__family__material__sub_title],
    );

TextStyle base__text__rich__style__sub_heading() => //
    base__text__style(
      font__color: color__foreground__dim,
      font__size: 20.px(),
      font__weight: FontWeight.w600,
      font__features: font__feature__math__tabular_figures,
      font__family: font__families[font__family__material__sub_title],
    );

TextStyle base__text__rich__style__fade() => //
    base__text__style(
      font__color: color__foreground__dim,
      font__size: 16.px(),
      font__weight: FontWeight.normal,
      font__features: font__feature__math__tabular_figures,
      font__family: font__families[font__family__material__text],
    );

TextStyle base__text__rich__style__code() => //
    base__text__style(
      font__color: color__foreground__default,
      font__size: 16.px(),
      font__weight: FontWeight.normal,
      font__features: font__feature__math__tabular_figures,
      font__family: font__families[font__family__material__code],
    );

ARRAY<gui__base__widget> str__wide__rich__bytes__convert({
  required final BS1__array str__wide__rich__bytes,
  required final void Function(text address) text__link__open,
  required final value__asyn<BS1__array> Function(INT file__id) file__fetch,
}) {
  report__BS1__array(
    str__wide__rich__bytes,
    "str__wide__rich__bytes",
  );

  final //
      section__control__size = INT__bytes__convert(
        str__wide__rich__bytes,
      ),
      section__control__bytes = bytes___compo(
        str__wide__rich__bytes.view__partial(
          section__control__size.count,
          section__control__size.value,
        ),
      ),
      section__text = wstr__bytes__convert(
        str__wide__rich__bytes.view(
          (section__control__size.value + section__control__size.count),
        ),
      ),
      widget__list /* lines, in-case of text */ = list<gui__base__widget>();

  var //
      text__segment__list /* could be, a word, words, sentences, or else, of text */ = list<InlineSpan>() /*ARRAY<InlineSpan>.filled(count,const TextSpan(),growable: FALSE)*/,
      section__text__offset = 0;

  Alignment text__alignment = Alignment.centerLeft;

  string section__text__read() {
    final //
        count = section__control__bytes.read__INT().value,
        result = wstr__convert__text(
          section__text.view__partial(
            section__text__offset,
            count,
          ),
        );

    section__text__offset += count;

    return result;
  }

  void widget__add() {
    if (!text__segment__list.empty___ok) {
      widget__list.add(
        Align(
          alignment: text__alignment,
          child: gui__base__box__text__widget(
            TextSpan(
              children: text__segment__list.convert__array(),
            ),
            text__align: TextAlign.left,
          ),
        ),
      );

      text__segment__list = list<InlineSpan>();
    }
  }

  while (section__control__bytes.iterate___ok) //
    switch (section__control__bytes.read__byte()) {
      case str__wide__rich__type__text__un_styl_ed:
        text__segment__list.add(
          TextSpan(
            text: section__text__read(),
            style: base__text__rich__style__not(),
          ),
        );
        break;

      case str__wide__rich__type__text:
        {
          TextStyle? style;

          switch (section__control__bytes.read__byte()) {
            case str__wide__rich__text__style__not:
              style = base__text__rich__style__not();
              break;
            case str__wide__rich__text__style__bold:
              style = base__text__rich__style__bold();
              break;
            case str__wide__rich__text__style__heading:
              style = base__text__rich__style__heading();
              break;
            case str__wide__rich__text__style__title:
              style = base__text__rich__style__title();
              break;
            case str__wide__rich__text__style__sub_heading:
              style = base__text__rich__style__sub_heading();
              break;
            case str__wide__rich__text__style__sub_title:
              style = base__text__rich__style__sub_title();
              break;
            case str__wide__rich__text__style__link:
              final address = section__text__read();
              text__segment__list.add(
                TextSpan(
                  text: section__text__read(),
                  style: base__text__style(
                    font__color: color__hyperlink,
                    font__size: 16.px(),
                    font__weight: FontWeight.normal,
                    font__features: font__feature__math__tabular_figures,
                    decoration: TextDecoration.underline,
                    font__family: font__families[font__family__material__text],
                  ),
                  recognizer: (TapGestureRecognizer()..onTap = () => text__link__open(address)),
                ),
              );
              break;
            case str__wide__rich__text__style__fade:
              style = base__text__rich__style__fade();
              break;
            case str__wide__rich__text__style__code:
              style = base__text__rich__style__code();
              break;
            case str__wide__rich__text__style__color:
              style = base__text__style();
              break;
            case str__wide__rich__text__style__super_script:
              style = base__text__style();
              break;
            case str__wide__rich__text__style__sub_script:
              style = base__text__style();
              break;
            case str__wide__rich__text__style__italic:
              style = base__text__style();
              break;
            case str__wide__rich__text__style__strike_through:
              style = base__text__style();
              break;

            default:
              throw Error();
          }

          if (style !=  null) //
            text__segment__list.add(
              TextSpan(
                text: section__text__read(),
                style: style,
              ),
            );
        }
        break;
    }

  widget__add(); /*
  if the ending break is omitted */

  return widget__list.convert__array();
}
/*
const _sample = (
  r"\ac"
  r"\st" "Section A" r"\"
    r"\ss" " (Unit 1)" r"\"
      r"\n"
  "1. "
    r"\se" "(13 marks)" r"\"
      "  What is Project Management ? Explain the role of Project Manager in Project Management."
        r"\n"
  "1. "
    r"\se" "(13)" r"\"
      "  Describe the principles of modern software development in detail."
        r"\n"
  r"\n"
//
  r"\ac"
  r"\st" "Section B" r"\"
    r"\ss" " (Unit 2)" r"\"
      r"\n"
  "3. "
    r"\se" "(13)" r"\"
      "  Explain the Project Management framework with the help of suitable examples."
        r"\n"
  "4. "
    r"\se" "(13)" r"\"
      "  What do you mean by Project integration ? Also explain project selection and Project management plans."
        r"\n"
  r"\n"
//
  r"\ac"
  r"\st" "Section C" r"\"
    r"\ss" " (Unit 3)" r"\"
      r"\n"
  "5. "
    r"\se" "(13)" r"\"
      "  Discuss the role and use of Project scope management in detail."
        r"\n"
  r"\n"
//
  r"\i" "512:256:f${(INT__4__max + INT__3__max)}"
  r"\i" "350:156:w${"http://src"}" r"\"
  r"\ar"
  r"\se" "- Someone (" r"\"
    r"\sl" "http://www.thisIsLink.co.coin" r"\"
      r"\se" ")" r"\"
        r"\n"
  r"\h" "4:xyz" r"\"
  r"\ac"
  r"\sc" "passwd123" r"\"
  ); */*/
