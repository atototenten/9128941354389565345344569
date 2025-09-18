part of "_.dart";

const //
base__input__text__filtering__basic = base__input__text__filtering(
      r"[ -~]",
    ),
    base__input__text__filtering__full =
        base__input__text__filtering(
          r"[\x00-\x09\x0B-\x1F\x7F\x80-\x9F]",
          allow___ok: NO,
        ) /*
ASCII
  `web://upload.wikimedia.org/wikipedia/commons/d/dd/ASCII-Table.svg`
Unicode
  `web://en.wikipedia.org/wiki/List_of_Unicode_characters`,
  `web://en.wikipedia.org/wiki/Unicode_control_characters`,
  `web://en.wikipedia.org/wiki/C0_and_C1_control_codes`
  `web://unicode.org/reports/tr36/` */;

class gui__base__input__text //
    implements base__dispose___protocol {
  gui__base__input__text({
    this.type = TextInputType.text,
    this.line__breaking___ok = NO,
    required this.text__style,
    required this.cursor__color,
    this.capitalization = TextCapitalization.none,
    this.characters__count__limit = NI1__max,
    this.filtering = base__input__text__filtering__basic,
    this.lines__max = 3,
    this.lines__min = 1,
    final string value__initial = empty__string,
  }) : value__channel = base__value__mutation__event__channel__broadcast(
         value__initial,
       ),
       controlling___raw = TextEditingController(
         text: value__initial,
       ),
       focussing___raw = FocusNode() {
    controlling___raw.addListener(
      controlling__event__handle___raw,
    );
  }

  final TextInputType type;
  final BOOL line__breaking___ok;
  final TextStyle text__style;
  final Color cursor__color;
  final TextCapitalization capitalization;
  final INT characters__count__limit /*
wide-char.s */;
  final base__input__text__filtering filtering;
  final INT? lines__max;
  final INT lines__min;

  final base__value__mutation__event__channel__broadcast<string> value__channel;

  final TextEditingController controlling___raw;
  final FocusNode focussing___raw;

  @override
  void dispose() {
    controlling___raw.removeListener(
      controlling__event__handle___raw,
    );

    focussing___raw.dispose();
    controlling___raw.dispose();

    value__channel.dispose();
  }

  void controlling__event__handle___raw() {
    value__channel.value__mutation__dispatch(
      controlling___raw.text,
    );
  }

  string value() /*{ return value___raw; }*/ {
    return controlling___raw.value.text;
  }

  void value__assign(
    final string value__new,
  ) /*{
    value___raw = value__new;
    channel.event__announce();
  }*/ {
    controlling___raw.text = value__new; /*
will invoke `channel.event__announce` */
  }

  BOOL focussed___ok() {
    return focussing___raw.hasFocus;
  }

  void focus() {
    if (focussed___ok()) {
      return;
    }

    focussing___raw.requestFocus();
  }

  void focus_de() {
    if (focussed___ok().not) {
      return;
    }

    focussing___raw.unfocus();
  }

  gui__base__widget widget__build /*
de-focus-ing is not auto. 
  ,prefer invok-ing `store.focus__remove` ,in `submit__handle`
FIX :
  input, with number(s), as first(of input) char, instead of an alphabet, is receiv-ed through `app__key__broadcast`
    but (strangely) in-between numbers are directly(and correctly) receiv-ed, into input, and NOT through key broadcast
      ,most probably a {flutter-side}-issue */ (
    final gui__base__widget__building__context context, {
    required final gui__base__widget__build__function__format child__build /*
un-focus-ed */,
    required final gui__base__widget__build__function__format? characters__count__indication__build,
  }) {
    return ListenableBuilder(
      listenable: focussing___raw,
      builder: (final context, final _) {
        if (focussed___ok().not) {
          return child__build(
            context,
          );
        }

        return Material(
          color: base__color__transparent,
          child: TextField(
            decoration: NIL,
            controller: controlling___raw,
            focusNode: focussing___raw,
            style: text__style,
            cursorOpacityAnimates: NO,
            cursorColor: cursor__color,
            cursorRadius: Radius.circular(1.px()),
            keyboardType: type,
            textInputAction:
                (line__breaking___ok //
                ? TextInputAction.newline
                : TextInputAction.done) /*
because of ambiguity with done-key ,between keyboard-close and form-submission */,
            textCapitalization: capitalization,
            autofocus: focussing___raw.hasFocus,
            maxLines: lines__max,
            minLines: lines__min,
            inputFormatters: <TextInputFormatter>[
              LengthLimitingTextInputFormatter(
                characters__count__limit,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
              ),
              FilteringTextInputFormatter(
                RegExp(filtering.reg_ex),
                allow: filtering.allow___ok,
              ),
            ],
            keyboardAppearance:
                (base__app__theme__colors__ground__back__contrast__dark___ok //
                ? Brightness.dark
                : Brightness.light),
            scrollPhysics: base__scrolling__physics__clamping,
            buildCounter:
                ((characters__count__indication__build == null) //
                ? null
                : (
                    final context, {
                    required final currentLength,
                    required final maxLength,
                    required final isFocused,
                  }) {
                    return characters__count__indication__build(
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
    this.allow___ok = OK,
  });

  final string reg_ex;
  final BOOL allow___ok;
}
