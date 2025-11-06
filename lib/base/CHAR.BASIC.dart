part of "_.dart";

typedef CHAR = INT;
typedef CHAR__ASCII = INT;
typedef CHAR__UNICODE = INT;

const //
    CHAR__size = INT__07__size,
    CHAR__width = (BS1__width - 1),
    CHAR__limit = (INT__1__limit >> 1),
    CHAR__max = (CHAR__limit - 1),
//
    CHAR__UNICODE__size = INT__3__size;

const //
    CHAR__number__zero = 0,
    CHAR__number__one = 1,
    CHAR__number__two = 2,
    CHAR__number__three = 3,
    CHAR__number__four = 4,
    CHAR__number__five = 5,
    CHAR__number__six = 6,
    CHAR__number__seven = 7,
    CHAR__number__eight = 8,
    CHAR__number__nine = 9,
//
    CHAR__space = (1 + CHAR__number__nine),
    CHAR__comma = (1 + CHAR__space),
    CHAR__quote__single = (1 + CHAR__comma),
    CHAR__dash = (1 + CHAR__quote__single),
    CHAR__under_score = (1 + CHAR__dash),
    CHAR__slash__forward = (1 + CHAR__under_score),
    CHAR__bracket__round__open = (1 + CHAR__slash__forward),
    CHAR__bracket__round__close = (1 + CHAR__bracket__round__open),
    CHAR__dot = (1 + CHAR__bracket__round__close),
    CHAR__colon__semi = (1 + CHAR__dot),
    CHAR__colon = (1 + CHAR__colon__semi),
    CHAR__quote__double = (1 + CHAR__question),
    CHAR__question = (1 + CHAR__colon),
    CHAR__exclamation = (1 + CHAR__quote__double),
//
    CHAR__alphabet__case__lower__a = (1 + CHAR__exclamation),
    CHAR__alphabet__case__lower__b = (1 + CHAR__alphabet__case__lower__a),
    CHAR__alphabet__case__lower__c = (1 + CHAR__alphabet__case__lower__b),
    CHAR__alphabet__case__lower__d = (1 + CHAR__alphabet__case__lower__c),
    CHAR__alphabet__case__lower__e = (1 + CHAR__alphabet__case__lower__d),
    CHAR__alphabet__case__lower__f = (1 + CHAR__alphabet__case__lower__e),
    CHAR__alphabet__case__lower__g = (1 + CHAR__alphabet__case__lower__f),
    CHAR__alphabet__case__lower__h = (1 + CHAR__alphabet__case__lower__g),
    CHAR__alphabet__case__lower__i = (1 + CHAR__alphabet__case__lower__h),
    CHAR__alphabet__case__lower__j = (1 + CHAR__alphabet__case__lower__i),
    CHAR__alphabet__case__lower__k = (1 + CHAR__alphabet__case__lower__j),
    CHAR__alphabet__case__lower__l = (1 + CHAR__alphabet__case__lower__k),
    CHAR__alphabet__case__lower__m = (1 + CHAR__alphabet__case__lower__l),
    CHAR__alphabet__case__lower__n = (1 + CHAR__alphabet__case__lower__m),
    CHAR__alphabet__case__lower__o = (1 + CHAR__alphabet__case__lower__n),
    CHAR__alphabet__case__lower__p = (1 + CHAR__alphabet__case__lower__o),
    CHAR__alphabet__case__lower__q = (1 + CHAR__alphabet__case__lower__p),
    CHAR__alphabet__case__lower__r = (1 + CHAR__alphabet__case__lower__q),
    CHAR__alphabet__case__lower__s = (1 + CHAR__alphabet__case__lower__r),
    CHAR__alphabet__case__lower__t = (1 + CHAR__alphabet__case__lower__s),
    CHAR__alphabet__case__lower__u = (1 + CHAR__alphabet__case__lower__t),
    CHAR__alphabet__case__lower__v = (1 + CHAR__alphabet__case__lower__u),
    CHAR__alphabet__case__lower__w = (1 + CHAR__alphabet__case__lower__v),
    CHAR__alphabet__case__lower__x = (1 + CHAR__alphabet__case__lower__w),
    CHAR__alphabet__case__lower__y = (1 + CHAR__alphabet__case__lower__x),
    CHAR__alphabet__case__lower__z = (1 + CHAR__alphabet__case__lower__y),
//
    CHAR__hash = (1 + CHAR__alphabet__case__lower__z),
    CHAR__currency = (1 + CHAR__hash),
    CHAR__percent = (1 + CHAR__currency),
    CHAR__ampersand = (1 + CHAR__percent),
    CHAR__asterisk = (1 + CHAR__ampersand),
    CHAR__addition = (1 + CHAR__asterisk),
    CHAR__bracket__angle__open = (1 + CHAR__addition),
    CHAR__bracket__angle__close = (1 + CHAR__bracket__angle__open),
    CHAR__equal = (1 + CHAR__bracket__angle__close),
    CHAR__at = (1 + CHAR__equal),
    CHAR__bracket__square__open = (1 + CHAR__at),
    CHAR__bracket__square__close = (1 + CHAR__bracket__square__open),
    CHAR__slash__backward = (1 + CHAR__bracket__square__close),
    CHAR__caret__up = (1 + CHAR__slash__backward),
    CHAR__caret__down /*
also called `caret:reverse`
falls back to `⋁`(logical-or ,unicode char-code/code-point 0x22C1) 
  ,if the target view-er ,has no-support */
    = (1 + CHAR__caret__up),
    CHAR__tilde = (1 + CHAR__caret__down),
    CHAR__bracket__curly__open = (1 + CHAR__tilde),
    CHAR__bracket__curly__close = (1 + CHAR__bracket__curly__open),
    CHAR__pipe = (1 + CHAR__bracket__curly__close),
    CHAR__quote__back = (1 + CHAR__pipe),
//
    CHAR__alphabet__case__upper__a = (1 + CHAR__quote__back),
    CHAR__alphabet__case__upper__b = (1 + CHAR__alphabet__case__upper__a),
    CHAR__alphabet__case__upper__c = (1 + CHAR__alphabet__case__upper__b),
    CHAR__alphabet__case__upper__d = (1 + CHAR__alphabet__case__upper__c),
    CHAR__alphabet__case__upper__e = (1 + CHAR__alphabet__case__upper__d),
    CHAR__alphabet__case__upper__f = (1 + CHAR__alphabet__case__upper__e),
    CHAR__alphabet__case__upper__g = (1 + CHAR__alphabet__case__upper__f),
    CHAR__alphabet__case__upper__h = (1 + CHAR__alphabet__case__upper__g),
    CHAR__alphabet__case__upper__i = (1 + CHAR__alphabet__case__upper__h),
    CHAR__alphabet__case__upper__j = (1 + CHAR__alphabet__case__upper__i),
    CHAR__alphabet__case__upper__k = (1 + CHAR__alphabet__case__upper__j),
    CHAR__alphabet__case__upper__l = (1 + CHAR__alphabet__case__upper__k),
    CHAR__alphabet__case__upper__m = (1 + CHAR__alphabet__case__upper__l),
    CHAR__alphabet__case__upper__n = (1 + CHAR__alphabet__case__upper__m),
    CHAR__alphabet__case__upper__o = (1 + CHAR__alphabet__case__upper__n),
    CHAR__alphabet__case__upper__p = (1 + CHAR__alphabet__case__upper__o),
    CHAR__alphabet__case__upper__q = (1 + CHAR__alphabet__case__upper__p),
    CHAR__alphabet__case__upper__r = (1 + CHAR__alphabet__case__upper__q),
    CHAR__alphabet__case__upper__s = (1 + CHAR__alphabet__case__upper__r),
    CHAR__alphabet__case__upper__t = (1 + CHAR__alphabet__case__upper__s),
    CHAR__alphabet__case__upper__u = (1 + CHAR__alphabet__case__upper__t),
    CHAR__alphabet__case__upper__v = (1 + CHAR__alphabet__case__upper__u),
    CHAR__alphabet__case__upper__w = (1 + CHAR__alphabet__case__upper__v),
    CHAR__alphabet__case__upper__x = (1 + CHAR__alphabet__case__upper__w),
    CHAR__alphabet__case__upper__y = (1 + CHAR__alphabet__case__upper__x),
    CHAR__alphabet__case__upper__z = (1 + CHAR__alphabet__case__upper__y),
//
    CHAR__non_printable__line__break /* new-line */ = (1 + CHAR__alphabet__case__upper__z),
    CHAR__non_printable__switch__alternate /*tab:horizontal*/ = (1 + CHAR__non_printable__line__break),
    CHAR__non_printable__escape = (1 +
        CHAR__non_printable__switch__alternate); /*
BTE/basic-text-encoding
  "basic" means(here) single-byte
vis-ual/graph-ical/pic-torial represent-ation is called character
numerical(integer-number) represent-ation is called char-code
  ,like code-point in unicode
inspired by ASCII
0..9(10) :
  numbers/numerical-digits (0-9)
10..23 (14) :
  - most used char.s 
    ,like space char.
  - usually all from english-lang. 
    ,except under-score 
      ,which is omni-present ,in program-ing
24..49 (26) :
  lower-case alphabets (a-z)
50..69 (20) :
  all the ,remain-ing ,visible/print-able symbols 
    ,which are present in ASCII 
      ,except `caret:down` ,which was ,usually ,imitat-ed ,through `v`-char.(a lower-case alphabet) 
      ,although ,with changed ,order
70..95 (26) :
  upper-case alphabets (A-Z)
96..98 (3):
  not-always needed char.s 
    ,like :
      - `escape`
      - `switch:alternate` 
        ,to instruct the {view|render}-er ,to prefer ,the alternate edition/version ,of the next char. 
          ,like fixed-width/`tab:horizontal` for `space` char. 
            ,useful in command-line based programs
          ,source-code manipulat-ion programs ,should avoid it 
            ,instead ,interpret ,all the ,first ,space-char.s ,of the line ,for indent-ation control
      - `line:break` 
        ,like ASCII's line-feed char.
        ,less useful ,for graphical user-interfaces
99..127 (29) :
  - free ,available for general use 
    ,like de-limit-ers ,control-codes ,escape-codes ,...
128..255 (128) :
  - reserved for multi-byte chain-ing 
    ,otherwise free */

const //
    CHAR__pointer__CHAR__ASCII__array = [
      CHAR__ASCII__number__zero,
      CHAR__ASCII__number__one,
      CHAR__ASCII__number__two,
      CHAR__ASCII__number__three,
      CHAR__ASCII__number__four,
      CHAR__ASCII__number__five,
      CHAR__ASCII__number__six,
      CHAR__ASCII__number__seven,
      CHAR__ASCII__number__eight,
      CHAR__ASCII__number__nine,
//
      CHAR__ASCII__space,
      CHAR__ASCII__comma,
      CHAR__ASCII__quote__single,
      CHAR__ASCII__dash,
      CHAR__ASCII__under_score,
      CHAR__ASCII__slash__forward,
      CHAR__ASCII__bracket__round__open,
      CHAR__ASCII__bracket__round__close,
      CHAR__ASCII__dot,
      CHAR__ASCII__colon__semi,
      CHAR__ASCII__colon,
      CHAR__ASCII__quote__double,
      CHAR__ASCII__question,
      CHAR__ASCII__exclamation,
//
      CHAR__ASCII__alphabet__case__lower__a,
      CHAR__ASCII__alphabet__case__lower__b,
      CHAR__ASCII__alphabet__case__lower__c,
      CHAR__ASCII__alphabet__case__lower__d,
      CHAR__ASCII__alphabet__case__lower__e,
      CHAR__ASCII__alphabet__case__lower__f,
      CHAR__ASCII__alphabet__case__lower__g,
      CHAR__ASCII__alphabet__case__lower__h,
      CHAR__ASCII__alphabet__case__lower__i,
      CHAR__ASCII__alphabet__case__lower__j,
      CHAR__ASCII__alphabet__case__lower__k,
      CHAR__ASCII__alphabet__case__lower__l,
      CHAR__ASCII__alphabet__case__lower__m,
      CHAR__ASCII__alphabet__case__lower__n,
      CHAR__ASCII__alphabet__case__lower__o,
      CHAR__ASCII__alphabet__case__lower__p,
      CHAR__ASCII__alphabet__case__lower__q,
      CHAR__ASCII__alphabet__case__lower__r,
      CHAR__ASCII__alphabet__case__lower__s,
      CHAR__ASCII__alphabet__case__lower__t,
      CHAR__ASCII__alphabet__case__lower__u,
      CHAR__ASCII__alphabet__case__lower__v,
      CHAR__ASCII__alphabet__case__lower__w,
      CHAR__ASCII__alphabet__case__lower__x,
      CHAR__ASCII__alphabet__case__lower__y,
      CHAR__ASCII__alphabet__case__lower__z,
//
      CHAR__ASCII__hash,
      CHAR__ASCII__dollar,
      CHAR__ASCII__percent,
      CHAR__ASCII__ampersand,
      CHAR__ASCII__asterisk,
      CHAR__ASCII__plus,
      CHAR__ASCII__bracket__angle__open,
      CHAR__ASCII__bracket__angle__close,
      CHAR__ASCII__equal,
      CHAR__ASCII__at,
      CHAR__ASCII__bracket__square__open,
      CHAR__ASCII__bracket__square__close,
      CHAR__ASCII__slash__backward,
      CHAR__ASCII__caret,
      CHAR__ASCII__non_printable__tab__vertical /* in-correct */,
      CHAR__ASCII__tilde,
      CHAR__ASCII__bracket__curly__open,
      CHAR__ASCII__bracket__curly__close,
      CHAR__ASCII__pipe,
      CHAR__ASCII__quote__back,
//
      CHAR__ASCII__alphabet__case__upper__a,
      CHAR__ASCII__alphabet__case__upper__b,
      CHAR__ASCII__alphabet__case__upper__c,
      CHAR__ASCII__alphabet__case__upper__d,
      CHAR__ASCII__alphabet__case__upper__e,
      CHAR__ASCII__alphabet__case__upper__f,
      CHAR__ASCII__alphabet__case__upper__g,
      CHAR__ASCII__alphabet__case__upper__h,
      CHAR__ASCII__alphabet__case__upper__i,
      CHAR__ASCII__alphabet__case__upper__j,
      CHAR__ASCII__alphabet__case__upper__k,
      CHAR__ASCII__alphabet__case__upper__l,
      CHAR__ASCII__alphabet__case__upper__m,
      CHAR__ASCII__alphabet__case__upper__n,
      CHAR__ASCII__alphabet__case__upper__o,
      CHAR__ASCII__alphabet__case__upper__p,
      CHAR__ASCII__alphabet__case__upper__q,
      CHAR__ASCII__alphabet__case__upper__r,
      CHAR__ASCII__alphabet__case__upper__s,
      CHAR__ASCII__alphabet__case__upper__t,
      CHAR__ASCII__alphabet__case__upper__u,
      CHAR__ASCII__alphabet__case__upper__v,
      CHAR__ASCII__alphabet__case__upper__w,
      CHAR__ASCII__alphabet__case__upper__x,
      CHAR__ASCII__alphabet__case__upper__y,
      CHAR__ASCII__alphabet__case__upper__z,
//
      CHAR__ASCII__non_printable__line_feed,
      CHAR__ASCII__non_printable__tab__horizontal,
      CHAR__ASCII__non_printable__escape,
    ],
//
    CHAR__ASCII__pointer__ch__array = [
      CHAR__max,
      CHAR__max,
      CHAR__max,
      CHAR__max,
      CHAR__max,
      CHAR__max,
      CHAR__max,
      CHAR__max,
      CHAR__max,
      CHAR__max,
      CHAR__non_printable__line__break,
      CHAR__max,
      CHAR__max,
      CHAR__max,
      CHAR__max,
      CHAR__max,
      CHAR__max,
      CHAR__max,
      CHAR__max,
      CHAR__max,
      CHAR__max,
      CHAR__max,
      CHAR__max,
      CHAR__max,
      CHAR__max,
      CHAR__max,
      CHAR__max,
      CHAR__non_printable__escape,
      CHAR__max,
      CHAR__max,
      CHAR__max,
      CHAR__max,
//
      CHAR__space,
      CHAR__exclamation,
      CHAR__quote__double,
      CHAR__hash,
      CHAR__currency,
      CHAR__percent,
      CHAR__ampersand,
      CHAR__quote__single,
      CHAR__bracket__round__open,
      CHAR__bracket__round__close,
      CHAR__asterisk,
      CHAR__addition,
      CHAR__comma,
      CHAR__dash,
      CHAR__dot,
      CHAR__slash__forward,
//
      CHAR__number__zero,
      CHAR__number__one,
      CHAR__number__two,
      CHAR__number__three,
      CHAR__number__four,
      CHAR__number__five,
      CHAR__number__six,
      CHAR__number__seven,
      CHAR__number__eight,
      CHAR__number__nine,
//
      CHAR__colon,
      CHAR__colon__semi,
      CHAR__bracket__angle__open,
      CHAR__equal,
      CHAR__bracket__angle__close,
      CHAR__question,
      CHAR__at,
//
      CHAR__alphabet__case__upper__a,
      CHAR__alphabet__case__upper__b,
      CHAR__alphabet__case__upper__c,
      CHAR__alphabet__case__upper__d,
      CHAR__alphabet__case__upper__e,
      CHAR__alphabet__case__upper__f,
      CHAR__alphabet__case__upper__g,
      CHAR__alphabet__case__upper__h,
      CHAR__alphabet__case__upper__i,
      CHAR__alphabet__case__upper__j,
      CHAR__alphabet__case__upper__k,
      CHAR__alphabet__case__upper__l,
      CHAR__alphabet__case__upper__m,
      CHAR__alphabet__case__upper__n,
      CHAR__alphabet__case__upper__o,
      CHAR__alphabet__case__upper__p,
      CHAR__alphabet__case__upper__q,
      CHAR__alphabet__case__upper__r,
      CHAR__alphabet__case__upper__s,
      CHAR__alphabet__case__upper__t,
      CHAR__alphabet__case__upper__u,
      CHAR__alphabet__case__upper__v,
      CHAR__alphabet__case__upper__w,
      CHAR__alphabet__case__upper__x,
      CHAR__alphabet__case__upper__y,
      CHAR__alphabet__case__upper__z,
//
      CHAR__bracket__square__open,
      CHAR__slash__backward,
      CHAR__bracket__square__close,
      CHAR__caret__up,
      CHAR__under_score,
      CHAR__quote__back,
//
      CHAR__alphabet__case__lower__a,
      CHAR__alphabet__case__lower__b,
      CHAR__alphabet__case__lower__c,
      CHAR__alphabet__case__lower__d,
      CHAR__alphabet__case__lower__e,
      CHAR__alphabet__case__lower__f,
      CHAR__alphabet__case__lower__g,
      CHAR__alphabet__case__lower__h,
      CHAR__alphabet__case__lower__i,
      CHAR__alphabet__case__lower__j,
      CHAR__alphabet__case__lower__k,
      CHAR__alphabet__case__lower__l,
      CHAR__alphabet__case__lower__m,
      CHAR__alphabet__case__lower__n,
      CHAR__alphabet__case__lower__o,
      CHAR__alphabet__case__lower__p,
      CHAR__alphabet__case__lower__q,
      CHAR__alphabet__case__lower__r,
      CHAR__alphabet__case__lower__s,
      CHAR__alphabet__case__lower__t,
      CHAR__alphabet__case__lower__u,
      CHAR__alphabet__case__lower__v,
      CHAR__alphabet__case__lower__w,
      CHAR__alphabet__case__lower__x,
      CHAR__alphabet__case__lower__y,
      CHAR__alphabet__case__lower__z,
//
      CHAR__bracket__curly__open,
      CHAR__pipe,
      CHAR__bracket__curly__close,
      CHAR__tilde,
//
      CHAR__max,
    ];

BOOL CHAR__b__not__valid(final CHAR c) => //
    (c > CHAR__non_printable__escape);

BOOL CHAR__b__valid(final CHAR c) => //
    !CHAR__b__not__valid(c);

BOOL CHAR__b__not__printable(final CHAR c) => //
    (c > CHAR__alphabet__case__upper__z);

BOOL CHAR__b__printable(final CHAR c) => //
    !CHAR__b__not__printable(c);

BOOL CHAR__b__not__number(final CHAR c) => //
    (c > CHAR__number__nine);

BOOL CHAR__b__number(final CHAR c) => //
    !CHAR__b__not__number(c);

BOOL CHAR__alphabet__case__b__lower(final CHAR c) => //
    (c < CHAR__alphabet__case__upper__a);

BOOL CHAR__alphabet__case__b__upper(final CHAR c) => //
    (c > CHAR__alphabet__case__lower__z);

const CHAR //
    _ch__alphabet__case__convertion__value = (23 /* count, of `ch`es, between `low` and `up`, `case`, `alphabet`s */ + language__latin__english__alphabets__count);

CHAR CHAR__alphabet__case__lower__convert__upper(final CHAR c) => //
    (c - _ch__alphabet__case__convertion__value);

CHAR CHAR__alphabet__case__upper__convert__lower(final CHAR c) => //
    (c + _ch__alphabet__case__convertion__value);

BOOL CHAR__array__b__valid(
  final array<CHAR> s,
) {
  var count = s.elements__count;

  do {
    if (CHAR__b__valid(s[count -= 1])) {
      return FALSE;
    }
  } while (count != 0);

  return TRUE;
}

CHAR CHAR__convert__ch__ascii(final CHAR c) => //
    CHAR__pointer__CHAR__ASCII__array[c];

CHAR CHAR__ASCII__convert__ch(final CHAR c) => //
    CHAR__ASCII__pointer__ch__array[c];
