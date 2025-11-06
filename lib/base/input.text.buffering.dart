part of "_.dart";

const //
    CHAR__UNICODE__list__text__initial__size = INT__1__max;

INT CHAR__UNICODE__list__text__size__increased(
  final INT size,
) =>
    ((size << 1) | 1);

input__text__buffer___compo input__text__buffer({
  required final INT text__bytes__count__max,
  final string__wide? chars__initial,
}) {
  if (chars__initial == null) //
    return input__text__buffer___compo._(
      chars: string__wide(CHAR__UNICODE__list__text__initial__size),
      size__current: 0,
      bytes__count: 0,
      bytes__count__max: text__bytes__count__max,
    );

  final text__initial__size = chars__initial.elements__count;
  INT text__size = CHAR__UNICODE__list__text__initial__size;

  while (text__size < text__initial__size) //
    text__size = CHAR__UNICODE__list__text__size__increased(
      text__size,
    );

  final chars = string__wide(text__size);

  base__copy(
    chars,
    chars__initial,
    count: text__initial__size,
  );

  INT text__bytes__count = 0;

  chars__initial.iterate__basic(
    (final _, final wc) {
      text__bytes__count += CHAR__UNICODE__bytes__count(wc);
    },
  );

  return input__text__buffer___compo._(
    chars: chars,
    size__current: text__initial__size,
    bytes__count: text__bytes__count,
    bytes__count__max: text__bytes__count__max,
  );
}

class input__text__buffer___compo /*
  TASK
    in-between writ-ing
      whenever the user, moves the caret, using arrow keys; update `text__offset`
        only when, user presses, some key, copy(not view) the `text`, from `text__offset`, to `text__size`; into `text__secondary`, and update the `text__size`
          whenever the caret is moved, back to end, AND some key is pressed, write the `text__secondary`, to `text`, at `text__size` as offset, then assign `null` to `text__secondary` */
{
  input__text__buffer___compo._({
    required this.chars,
    required this.size__current,
    required this.bytes__count,
    required this.bytes__count__max,
  });

  string__wide chars;

  INT size__current;
  INT bytes__count;

  final INT bytes__count__max;

  /*wstr? text__secondary;
  INT? text__offset;*/

  INT get size => //
      chars.elements__count;

  BOOL empty___ok() => //
      (size__current == 0);

  BOOL get b__wide => //
      (size__current == bytes__count);

  BOOL $b__write(
    final INT ws__bytes__count,
  ) =>
      ((bytes__count + ws__bytes__count) > bytes__count__max).not /*
  partially writing `bytes`, until `text__bytes__count__max`'s breach
    could break, unicode's grapheme-cluster-s, and code-point-s
      like, 3-byte char's 2 bytes get written, while the last one is left out
        hence breaking, the whole text */
      ;

  void $grow__if__required(
    INT size__required,
  ) {
    size__required += size__current;

    final text__size_ = size;
    INT text__size__ = text__size_;

    while /* un-likely */ (text__size__ < size__required) //
      text__size__ = CHAR__UNICODE__list__text__size__increased(
        text__size__,
      );

    if (text__size__ != text__size_) {
      final chars__old = chars;

      base__copy(
        (chars = string__wide(text__size__)),
        chars__old,
        count: size__current,
      );
    }
  }

  BOOL write__append__TCW(
    final CHAR__UNICODE wc
  ) {
    final wc__bytes__count = CHAR__UNICODE__bytes__count(wc);

    if ($b__write(
      wc__bytes__count,
    )) {
      $grow__if__required(
        1,
      );

      chars[size__current++] = wc;

      bytes__count += wc__bytes__count;

      return TRUE;
    } else {
      return FALSE;
    }
  }

  BOOL write__append__string__wide(
    final string__wide ws,
  ) {
    var wstr__bytes__count = 0;

    ws.iterate__basic(
      (final _, final wc) {
        wstr__bytes__count += CHAR__UNICODE__bytes__count(wc);
      },
    );

    if ($b__write(
      wstr__bytes__count,
    )) {
      final ws__size = ws.elements__count;

      $grow__if__required(
        ws__size,
      );

      base__copy(
        chars,
        ws,
        dest__offset: size__current,
        count: ws__size,
      );

      size__current += ws__size;

      bytes__count += wstr__bytes__count;

      return TRUE;
    } else {
      return FALSE;
    }
  }

  BOOL backspace() {
    if (size__current != 0) {
      bytes__count -= CHAR__UNICODE__bytes__count(
        chars[(size__current -= 1)],
      );

      return TRUE;
    } else {
      return FALSE;
    }
  }

  string__wide read__full() => //
      (empty___ok().not
          ? chars.view__partial(
              0,
              size__current,
            )
          : string__wide(0));

  void clear() /*
  memory efficiency is NOT increased */
  {
    size__current = 0;
    bytes__count = 0;
  }

  string__wide convert__wstr__compact() {
    final result = string__wide(size__current);

    base__copy(
      result,
      chars,
      count: size__current,
    );

    return result;
  }

  void free() {
    clear();
    chars = string__wide(0);
  }
}
