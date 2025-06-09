part of "_.dart";

const //
    base__input__text__filtering__basic = base__input__text__filtering(
      r"[ -~]",
    ),
    base__input__text__filtering__full = base__input__text__filtering(
      r"[\x00-\x09\x0B-\x1F\x7F\x80-\x9F]",
      allow__ok: NO,
    ) /*
ASCII
  `web://upload.wikimedia.org/wikipedia/commons/d/dd/ASCII-Table.svg`
Unicode
  `web://en.wikipedia.org/wiki/List_of_Unicode_characters`,
  `web://en.wikipedia.org/wiki/Unicode_control_characters`,
  `web://en.wikipedia.org/wiki/C0_and_C1_control_codes`
  `web://unicode.org/reports/tr36/` */
    ;

class gui__base__input__text //
    implements gui__base__entity__component___protocol<gui__base__input__text__children___record> {
  gui__base__input__text({
    this.input__type = TextInputType.text,
    this.line__breaking__ok = NO,
    required this.input__text__style,
    required this.cursor__color,
    this.input__capitalization = TextCapitalization.none,
    this.input__characters__count__limit = NI1__max,
    this.input__filtering = base__input__text__filtering__basic,
    this.input__lines__max = 3,
    this.input__lines__min = 1,
    final string__raw value__initial = empty__text,
  })  : value__channel = base__value__mutation__event__channel__broadcast(
          value__initial,
        ),
        controlling__raw = TextEditingController(
          text: value__initial,
        ),
        focussing__raw = FocusNode() {
    controlling__raw.addListener(
      controlling__event__handle__raw,
    );
  }

  final TextInputType input__type;
  final BOOL line__breaking__ok;
  final TextStyle input__text__style;
  final Color cursor__color;
  final TextCapitalization input__capitalization;
  final NIMR input__characters__count__limit /*
wide-char.s */
      ;
  final base__input__text__filtering input__filtering;
  final NIMR? input__lines__max;
  final NIMR input__lines__min;

  final base__value__mutation__event__channel__broadcast<string__raw> value__channel;

  final TextEditingController controlling__raw;
  final FocusNode focussing__raw;

  void controlling__event__handle__raw() {
    value__channel.value__mutation__dispatch(
      controlling__raw.text,
    );
  }

  string__raw value() /*{ return value__raw; }*/ {
    return controlling__raw.value.text;
  }

  void value__assign(
    final string__raw value__new,
  ) /*{
    value__raw = value__new;
    channel.event__announce();
  }*/
  {
    controlling__raw.text = value__new; /*
will invoke `channel.event__announce` */
  }

  BOOL focussed__ok() {
    return focussing__raw.hasFocus;
  }

  void focus() {
    if (focussed__ok()) {
      return;
    }

    focussing__raw.requestFocus();
  }

  void focus_de() {
    if (focussed__ok().not) {
      return;
    }

    focussing__raw.unfocus();
  }

  @override
  void dispose() {
    controlling__raw.removeListener(
      controlling__event__handle__raw,
    );

    focussing__raw.dispose();
    controlling__raw.dispose();

    value__channel.dispose();
  }

  @override
  gui__base__widget widget__build /*
de-focus-ing is not auto. 
  ,prefer invok-ing `store.focus__remove` ,in `submit__handle`
FIX :
  input, with number(s), as first(of input) char, instead of an alphabet, is receiv-ed through `app__key__broadcast`
    but (strangely) in-between numbers are directly(and correctly) receiv-ed, into input, and NOT through key broadcast
      ,most probably a {flutter-side}-issue */
      (
    final gui__base__widget__building__context context, {
    required covariant final gui__base__input__text__children___record children,
  }) {
    final input__characters__count__indication__build = children.input__characters__count__indication__build;

    return ListenableBuilder(
      listenable: focussing__raw,
      builder: (final context, final _) {
        if (focussed__ok().not) {
          return children.child__build(
            context,
          );
        }

        return Material(
          color: base__color__transparent,
          child: TextField(
            decoration: NIL,
            controller: controlling__raw,
            focusNode: focussing__raw,
            style: input__text__style,
            cursorOpacityAnimates: NO,
            cursorColor: cursor__color,
            cursorRadius: Radius.circular(1.px()),
            keyboardType: input__type,
            textInputAction: (line__breaking__ok //
                ? TextInputAction.newline
                : TextInputAction.done) /*
because of ambiguity with done-key ,between keyboard-close and form-submission */
            ,
            textCapitalization: input__capitalization,
            autofocus: focussing__raw.hasFocus,
            maxLines: input__lines__max,
            minLines: input__lines__min,
            inputFormatters: <TextInputFormatter>[
              LengthLimitingTextInputFormatter(
                input__characters__count__limit,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
              ),
              FilteringTextInputFormatter(
                RegExp(input__filtering.reg_ex),
                allow: input__filtering.allow__ok,
              ),
            ],
            keyboardAppearance: (base__app__theme__colors__ground__back__contrast__dark__ok //
                ? Brightness.dark
                : Brightness.light),
            scrollPhysics: base__scrolling__physics__clamping,
            buildCounter: ((input__characters__count__indication__build == null) //
                ? null
                : (
                    final context, {
                    required final currentLength,
                    required final maxLength,
                    required final isFocused,
                  }) {
                    return input__characters__count__indication__build(
                      context,
                    );
                  }),
          ),
        );
      },
    );
  }
}

class base__input__text__filtering {
  const base__input__text__filtering(
    this.reg_ex, {
    this.allow__ok = OK,
  });

  final string__raw reg_ex;
  final BOOL allow__ok;
}

class gui__base__input__text__children___record {
  const gui__base__input__text__children___record({
    required this.child__build,
    this.input__characters__count__indication__build,
  });

  final gui__base__widget__build__function__format child__build /*
un-focus-ed */
      ;
  final gui__base__widget__build__function__format? input__characters__count__indication__build;
}
