part of "_.dart";

class gui__base__input__text___compo /*
- focussing("FocusNode") has not been exposed intentionally
    due to it being defective
      and pressing-region("TapRegion") being the better approach ,to handle focussing */ //
    implements base__dispose___protocol {
  static final //
  text__filtering__basic___formatting = FilteringTextInputFormatter(
        r"[ -~]",
        allow: OK,
      ),
      text__filtering__full___formatting =
          FilteringTextInputFormatter(
            r"[\x00-\x09\x0B-\x1F\x7F\x80-\x9F]",
            allow: NO,
          ) /*
ASCII
  `web://upload.wikimedia.org/wikipedia/commons/d/dd/ASCII-Table.svg`
Unicode
  `web://en.wikipedia.org/wiki/List_of_Unicode_characters`,
  `web://en.wikipedia.org/wiki/Unicode_control_characters`,
  `web://en.wikipedia.org/wiki/C0_and_C1_control_codes`
  `web://unicode.org/reports/tr36/` */;

  static TextInputFormatter characters__count__limiting___formatting({
    final INT max /*
in Unicode's Grapheme-clusters */ =
        INT__1__max,
  }) {
    return LengthLimitingTextInputFormatter(
      max,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
    );
  }

  gui__base__input__text___compo({
    final string value = empty__string,
  }) : _value___channel = base__event__channel__broadcast(),
       _controlling = TextEditingController(text: value) {
    _controlling.addListener(_controlling__event__handle);
  }

  final base__event__channel__broadcast _value___channel;

  final TextEditingController _controlling;

  @override
  void dispose() {
    _controlling.removeListener(_controlling__event__handle);
    _controlling.dispose();

    _value___channel.dispose();
  }

  void _controlling__event__handle() {
    _value___channel.event__dispatch();
  }

  base__event__channel__broadcast___protocol value___channel() => //
      _value___channel;

  string value() => //
      _controlling.value.text;

  void value__assign(
    final string value__new,
  ) {
    _controlling.text = value__new; /*
will invoke `channel.event__announce` */
  }

  gui__base__widget widget__build /*
de-focus-ing is not auto. 
  ,prefer invok-ing `store.focus__remove` ,in `submit__handle`
FIX :
  input, with number(s), as first(of input) char, instead of an alphabet, is receiv-ed through `app__key__broadcast`
    but (strangely) in-between numbers are directly(and correctly) receiv-ed, into input, and NOT through key broadcast
      ,most probably a {flutter-side}-issue */ (
    final gui__base__widget__building__context context, {
    final TextInputType type = TextInputType.text,
    final BOOL secret___ok = NO,
    required final TextStyle text__style,
    required final Color cursor__color,
    final TextCapitalization capitalization = TextCapitalization.none,
    final array<TextInputFormatter>? formatting,
    final ({
      INT /*
valid range : 1 to ".lines__max" */
      min,
      INT? /*
valid values
  - NIL : no limit
  - 1 : horizontally scrolling single-line
  - 2 to INT.MAX : vertically scrolling multiple-lines */
      max,
    })?
    height__lines = (
      min: 1,
      max: 3,
    ),
  }) {
    return Material(
      color:
          (base__app__theme__colors__ground__back__contrast__dark___ok //
          ? base__color__transparent__dark
          : base__color__transparent__light),
      child: TextField(
        controller: _controlling,
        focusNode: NIL,
        autofocus: OK /*
intentional ,because wrapping with boolean-based transitioning ,with a default-state ,is recommended approach */,
        decoration: NIL,
        style: text__style,
        cursorOpacityAnimates: NO,
        cursorColor: cursor__color,
        cursorRadius: Radius.circular(1.px()),
        cursorWidth: 2.px(),
        keyboardType: type,
        textInputAction:
            ((type == TextInputType.multiline) //
            ? TextInputAction.newline
            : TextInputAction.done) /*
behavior-standardization to prevent ambiguity
  between keyboard-close and form-submission
  induced by the users */,
        textCapitalization: capitalization,
        textAlignVertical: TextAlignVertical.center,
        textDirection: TextDirection.ltr,
        obscureText: secret___ok,
        autocorrect: secret___ok.not,
        enableSuggestions: secret___ok.not,
        enableIMEPersonalizedLearning: secret___ok.not,
        scrollPadding: EdgeInsets.zero,
        clipBehavior: Clip.none,
        expands: (height__lines == null),
        maxLines: height__lines?.max,
        minLines: height__lines?.min,
        inputFormatters: formatting,
        keyboardAppearance:
            (base__app__theme__colors__ground__back__contrast__dark___ok //
            ? Brightness.dark
            : Brightness.light),
        scrollPhysics: gui__base__scrolling___compo.scrolling__physics__clamping,
      ),
    );
  }
}
