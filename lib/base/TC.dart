part of "_.dart";

typedef TC = INT;
typedef TCW = INT;

const //
    TC__size = INT__07__size,
    TC__width = (BS1__width - 1),
    TC__limit = (INT__1__limit >> 1),
    TC__max = (TC__limit - 1),
//
    TCW__size = INT__3__size;

const //
    TC__number__zero = 0,
    TC__number__one = 1,
    TC__number__two = 2,
    TC__number__three = 3,
    TC__number__four = 4,
    TC__number__five = 5,
    TC__number__six = 6,
    TC__number__seven = 7,
    TC__number__eight = 8,
    TC__number__nine = 9,
//
    TC__space = (1 + TC__number__nine),
    TC__comma = (1 + TC__space),
    TC__quote__single = (1 + TC__comma),
    TC__dash = (1 + TC__quote__single),
    TC__under_score = (1 + TC__dash),
    TC__slash__forward = (1 + TC__under_score),
    TC__bracket__round__open = (1 + TC__slash__forward),
    TC__bracket__round__close = (1 + TC__bracket__round__open),
    TC__dot = (1 + TC__bracket__round__close),
    TC__colon__semi = (1 + TC__dot),
    TC__colon = (1 + TC__colon__semi),
    TC__quote__double = (1 + TC__question),
    TC__question = (1 + TC__colon),
    TC__exclamation = (1 + TC__quote__double),
//
    TC__alphabet__case__lower__a = (1 + TC__exclamation),
    TC__alphabet__case__lower__b = (1 + TC__alphabet__case__lower__a),
    TC__alphabet__case__lower__c = (1 + TC__alphabet__case__lower__b),
    TC__alphabet__case__lower__d = (1 + TC__alphabet__case__lower__c),
    TC__alphabet__case__lower__e = (1 + TC__alphabet__case__lower__d),
    TC__alphabet__case__lower__f = (1 + TC__alphabet__case__lower__e),
    TC__alphabet__case__lower__g = (1 + TC__alphabet__case__lower__f),
    TC__alphabet__case__lower__h = (1 + TC__alphabet__case__lower__g),
    TC__alphabet__case__lower__i = (1 + TC__alphabet__case__lower__h),
    TC__alphabet__case__lower__j = (1 + TC__alphabet__case__lower__i),
    TC__alphabet__case__lower__k = (1 + TC__alphabet__case__lower__j),
    TC__alphabet__case__lower__l = (1 + TC__alphabet__case__lower__k),
    TC__alphabet__case__lower__m = (1 + TC__alphabet__case__lower__l),
    TC__alphabet__case__lower__n = (1 + TC__alphabet__case__lower__m),
    TC__alphabet__case__lower__o = (1 + TC__alphabet__case__lower__n),
    TC__alphabet__case__lower__p = (1 + TC__alphabet__case__lower__o),
    TC__alphabet__case__lower__q = (1 + TC__alphabet__case__lower__p),
    TC__alphabet__case__lower__r = (1 + TC__alphabet__case__lower__q),
    TC__alphabet__case__lower__s = (1 + TC__alphabet__case__lower__r),
    TC__alphabet__case__lower__t = (1 + TC__alphabet__case__lower__s),
    TC__alphabet__case__lower__u = (1 + TC__alphabet__case__lower__t),
    TC__alphabet__case__lower__v = (1 + TC__alphabet__case__lower__u),
    TC__alphabet__case__lower__w = (1 + TC__alphabet__case__lower__v),
    TC__alphabet__case__lower__x = (1 + TC__alphabet__case__lower__w),
    TC__alphabet__case__lower__y = (1 + TC__alphabet__case__lower__x),
    TC__alphabet__case__lower__z = (1 + TC__alphabet__case__lower__y),
//
    TC__hash = (1 + TC__alphabet__case__lower__z),
    TC__currency = (1 + TC__hash),
    TC__percent = (1 + TC__currency),
    TC__ampersand = (1 + TC__percent),
    TC__asterisk = (1 + TC__ampersand),
    TC__addition = (1 + TC__asterisk),
    TC__bracket__angle__open = (1 + TC__addition),
    TC__bracket__angle__close = (1 + TC__bracket__angle__open),
    TC__equal = (1 + TC__bracket__angle__close),
    TC__at = (1 + TC__equal),
    TC__bracket__square__open = (1 + TC__at),
    TC__bracket__square__close = (1 + TC__bracket__square__open),
    TC__slash__backward = (1 + TC__bracket__square__close),
    TC__caret__up = (1 + TC__slash__backward),
    TC__caret__down /*
also called `caret:reverse`
falls back to `⋁`(logical-or ,unicode char-code/code-point 0x22C1) 
  ,if the target view-er ,has no-support */
    = (1 + TC__caret__up),
    TC__tilde = (1 + TC__caret__down),
    TC__bracket__curly__open = (1 + TC__tilde),
    TC__bracket__curly__close = (1 + TC__bracket__curly__open),
    TC__pipe = (1 + TC__bracket__curly__close),
    TC__quote__back = (1 + TC__pipe),
//
    TC__alphabet__case__upper__a = (1 + TC__quote__back),
    TC__alphabet__case__upper__b = (1 + TC__alphabet__case__upper__a),
    TC__alphabet__case__upper__c = (1 + TC__alphabet__case__upper__b),
    TC__alphabet__case__upper__d = (1 + TC__alphabet__case__upper__c),
    TC__alphabet__case__upper__e = (1 + TC__alphabet__case__upper__d),
    TC__alphabet__case__upper__f = (1 + TC__alphabet__case__upper__e),
    TC__alphabet__case__upper__g = (1 + TC__alphabet__case__upper__f),
    TC__alphabet__case__upper__h = (1 + TC__alphabet__case__upper__g),
    TC__alphabet__case__upper__i = (1 + TC__alphabet__case__upper__h),
    TC__alphabet__case__upper__j = (1 + TC__alphabet__case__upper__i),
    TC__alphabet__case__upper__k = (1 + TC__alphabet__case__upper__j),
    TC__alphabet__case__upper__l = (1 + TC__alphabet__case__upper__k),
    TC__alphabet__case__upper__m = (1 + TC__alphabet__case__upper__l),
    TC__alphabet__case__upper__n = (1 + TC__alphabet__case__upper__m),
    TC__alphabet__case__upper__o = (1 + TC__alphabet__case__upper__n),
    TC__alphabet__case__upper__p = (1 + TC__alphabet__case__upper__o),
    TC__alphabet__case__upper__q = (1 + TC__alphabet__case__upper__p),
    TC__alphabet__case__upper__r = (1 + TC__alphabet__case__upper__q),
    TC__alphabet__case__upper__s = (1 + TC__alphabet__case__upper__r),
    TC__alphabet__case__upper__t = (1 + TC__alphabet__case__upper__s),
    TC__alphabet__case__upper__u = (1 + TC__alphabet__case__upper__t),
    TC__alphabet__case__upper__v = (1 + TC__alphabet__case__upper__u),
    TC__alphabet__case__upper__w = (1 + TC__alphabet__case__upper__v),
    TC__alphabet__case__upper__x = (1 + TC__alphabet__case__upper__w),
    TC__alphabet__case__upper__y = (1 + TC__alphabet__case__upper__x),
    TC__alphabet__case__upper__z = (1 + TC__alphabet__case__upper__y),
//
    TC__non_printable__line__break /* new-line */ = (1 + TC__alphabet__case__upper__z),
    TC__non_printable__switch__alternate /*tab:horizontal*/ = (1 + TC__non_printable__line__break),
    TC__non_printable__escape = (1 +
        TC__non_printable__switch__alternate); /*
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
    TC__pointer__TC__ascii__array = [
      TC__ascii__number__zero,
      TC__ascii__number__one,
      TC__ascii__number__two,
      TC__ascii__number__three,
      TC__ascii__number__four,
      TC__ascii__number__five,
      TC__ascii__number__six,
      TC__ascii__number__seven,
      TC__ascii__number__eight,
      TC__ascii__number__nine,
//
      TC__ascii__space,
      TC__ascii__comma,
      TC__ascii__quote__single,
      TC__ascii__dash,
      TC__ascii__under_score,
      TC__ascii__slash__forward,
      TC__ascii__bracket__round__open,
      TC__ascii__bracket__round__close,
      TC__ascii__dot,
      TC__ascii__colon__semi,
      TC__ascii__colon,
      TC__ascii__quote__double,
      TC__ascii__question,
      TC__ascii__exclamation,
//
      TC__ascii__alphabet__case__lower__a,
      TC__ascii__alphabet__case__lower__b,
      TC__ascii__alphabet__case__lower__c,
      TC__ascii__alphabet__case__lower__d,
      TC__ascii__alphabet__case__lower__e,
      TC__ascii__alphabet__case__lower__f,
      TC__ascii__alphabet__case__lower__g,
      TC__ascii__alphabet__case__lower__h,
      TC__ascii__alphabet__case__lower__i,
      TC__ascii__alphabet__case__lower__j,
      TC__ascii__alphabet__case__lower__k,
      TC__ascii__alphabet__case__lower__l,
      TC__ascii__alphabet__case__lower__m,
      TC__ascii__alphabet__case__lower__n,
      TC__ascii__alphabet__case__lower__o,
      TC__ascii__alphabet__case__lower__p,
      TC__ascii__alphabet__case__lower__q,
      TC__ascii__alphabet__case__lower__r,
      TC__ascii__alphabet__case__lower__s,
      TC__ascii__alphabet__case__lower__t,
      TC__ascii__alphabet__case__lower__u,
      TC__ascii__alphabet__case__lower__v,
      TC__ascii__alphabet__case__lower__w,
      TC__ascii__alphabet__case__lower__x,
      TC__ascii__alphabet__case__lower__y,
      TC__ascii__alphabet__case__lower__z,
//
      TC__ascii__hash,
      TC__ascii__dollar,
      TC__ascii__percent,
      TC__ascii__ampersand,
      TC__ascii__asterisk,
      TC__ascii__plus,
      TC__ascii__bracket__angle__open,
      TC__ascii__bracket__angle__close,
      TC__ascii__equal,
      TC__ascii__at,
      TC__ascii__bracket__square__open,
      TC__ascii__bracket__square__close,
      TC__ascii__slash__backward,
      TC__ascii__caret,
      TC__ascii__non_printable__tab__vertical /* in-correct */,
      TC__ascii__tilde,
      TC__ascii__bracket__curly__open,
      TC__ascii__bracket__curly__close,
      TC__ascii__pipe,
      TC__ascii__quote__back,
//
      TC__ascii__alphabet__case__upper__a,
      TC__ascii__alphabet__case__upper__b,
      TC__ascii__alphabet__case__upper__c,
      TC__ascii__alphabet__case__upper__d,
      TC__ascii__alphabet__case__upper__e,
      TC__ascii__alphabet__case__upper__f,
      TC__ascii__alphabet__case__upper__g,
      TC__ascii__alphabet__case__upper__h,
      TC__ascii__alphabet__case__upper__i,
      TC__ascii__alphabet__case__upper__j,
      TC__ascii__alphabet__case__upper__k,
      TC__ascii__alphabet__case__upper__l,
      TC__ascii__alphabet__case__upper__m,
      TC__ascii__alphabet__case__upper__n,
      TC__ascii__alphabet__case__upper__o,
      TC__ascii__alphabet__case__upper__p,
      TC__ascii__alphabet__case__upper__q,
      TC__ascii__alphabet__case__upper__r,
      TC__ascii__alphabet__case__upper__s,
      TC__ascii__alphabet__case__upper__t,
      TC__ascii__alphabet__case__upper__u,
      TC__ascii__alphabet__case__upper__v,
      TC__ascii__alphabet__case__upper__w,
      TC__ascii__alphabet__case__upper__x,
      TC__ascii__alphabet__case__upper__y,
      TC__ascii__alphabet__case__upper__z,
//
      TC__ascii__non_printable__line_feed,
      TC__ascii__non_printable__tab__horizontal,
      TC__ascii__non_printable__escape,
    ],
//
    TC__ascii__pointer__ch__array = [
      TC__max,
      TC__max,
      TC__max,
      TC__max,
      TC__max,
      TC__max,
      TC__max,
      TC__max,
      TC__max,
      TC__max,
      TC__non_printable__line__break,
      TC__max,
      TC__max,
      TC__max,
      TC__max,
      TC__max,
      TC__max,
      TC__max,
      TC__max,
      TC__max,
      TC__max,
      TC__max,
      TC__max,
      TC__max,
      TC__max,
      TC__max,
      TC__max,
      TC__non_printable__escape,
      TC__max,
      TC__max,
      TC__max,
      TC__max,
//
      TC__space,
      TC__exclamation,
      TC__quote__double,
      TC__hash,
      TC__currency,
      TC__percent,
      TC__ampersand,
      TC__quote__single,
      TC__bracket__round__open,
      TC__bracket__round__close,
      TC__asterisk,
      TC__addition,
      TC__comma,
      TC__dash,
      TC__dot,
      TC__slash__forward,
//
      TC__number__zero,
      TC__number__one,
      TC__number__two,
      TC__number__three,
      TC__number__four,
      TC__number__five,
      TC__number__six,
      TC__number__seven,
      TC__number__eight,
      TC__number__nine,
//
      TC__colon,
      TC__colon__semi,
      TC__bracket__angle__open,
      TC__equal,
      TC__bracket__angle__close,
      TC__question,
      TC__at,
//
      TC__alphabet__case__upper__a,
      TC__alphabet__case__upper__b,
      TC__alphabet__case__upper__c,
      TC__alphabet__case__upper__d,
      TC__alphabet__case__upper__e,
      TC__alphabet__case__upper__f,
      TC__alphabet__case__upper__g,
      TC__alphabet__case__upper__h,
      TC__alphabet__case__upper__i,
      TC__alphabet__case__upper__j,
      TC__alphabet__case__upper__k,
      TC__alphabet__case__upper__l,
      TC__alphabet__case__upper__m,
      TC__alphabet__case__upper__n,
      TC__alphabet__case__upper__o,
      TC__alphabet__case__upper__p,
      TC__alphabet__case__upper__q,
      TC__alphabet__case__upper__r,
      TC__alphabet__case__upper__s,
      TC__alphabet__case__upper__t,
      TC__alphabet__case__upper__u,
      TC__alphabet__case__upper__v,
      TC__alphabet__case__upper__w,
      TC__alphabet__case__upper__x,
      TC__alphabet__case__upper__y,
      TC__alphabet__case__upper__z,
//
      TC__bracket__square__open,
      TC__slash__backward,
      TC__bracket__square__close,
      TC__caret__up,
      TC__under_score,
      TC__quote__back,
//
      TC__alphabet__case__lower__a,
      TC__alphabet__case__lower__b,
      TC__alphabet__case__lower__c,
      TC__alphabet__case__lower__d,
      TC__alphabet__case__lower__e,
      TC__alphabet__case__lower__f,
      TC__alphabet__case__lower__g,
      TC__alphabet__case__lower__h,
      TC__alphabet__case__lower__i,
      TC__alphabet__case__lower__j,
      TC__alphabet__case__lower__k,
      TC__alphabet__case__lower__l,
      TC__alphabet__case__lower__m,
      TC__alphabet__case__lower__n,
      TC__alphabet__case__lower__o,
      TC__alphabet__case__lower__p,
      TC__alphabet__case__lower__q,
      TC__alphabet__case__lower__r,
      TC__alphabet__case__lower__s,
      TC__alphabet__case__lower__t,
      TC__alphabet__case__lower__u,
      TC__alphabet__case__lower__v,
      TC__alphabet__case__lower__w,
      TC__alphabet__case__lower__x,
      TC__alphabet__case__lower__y,
      TC__alphabet__case__lower__z,
//
      TC__bracket__curly__open,
      TC__pipe,
      TC__bracket__curly__close,
      TC__tilde,
//
      TC__max,
    ];

BOOL TC__b__not__valid(final TC c) => //
    (c > TC__non_printable__escape);

BOOL TC__b__valid(final TC c) => //
    !TC__b__not__valid(c);

BOOL TC__b__not__printable(final TC c) => //
    (c > TC__alphabet__case__upper__z);

BOOL TC__b__printable(final TC c) => //
    !TC__b__not__printable(c);

BOOL TC__b__not__number(final TC c) => //
    (c > TC__number__nine);

BOOL TC__b__number(final TC c) => //
    !TC__b__not__number(c);

BOOL TC__alphabet__case__b__lower(final TC c) => //
    (c < TC__alphabet__case__upper__a);

BOOL TC__alphabet__case__b__upper(final TC c) => //
    (c > TC__alphabet__case__lower__z);

const TC //
    _ch__alphabet__case__convertion__value = (23 /* count, of `ch`es, between `low` and `up`, `case`, `alphabet`s */ + language__latin__english__alphabets__count);

TC TC__alphabet__case__lower__convert__upper(final TC c) => //
    (c - _ch__alphabet__case__convertion__value);

TC TC__alphabet__case__upper__convert__lower(final TC c) => //
    (c + _ch__alphabet__case__convertion__value);

BOOL TC__array__b__valid(
  final array<TC> s,
) {
  var count = s.elements__count;

  do {
    if (TC__b__valid(s[count -= 1])) {
      return NO;
    }
  } while (count != 0);

  return OK;
}

TC TC__convert__ch__ascii(final TC c) => //
    TC__pointer__TC__ascii__array[c];

TC TC__ascii__convert__ch(final TC c) => //
    TC__ascii__pointer__ch__array[c];
