part of "_.dart";

const TC //
    TC__ascii__non_printable__null = 0,
    TC__ascii__non_printable__tab__horizontal = 9,
    TC__ascii__non_printable__line_feed = 10,
    TC__ascii__non_printable__tab__vertical = 11,
    TC__ascii__non_printable__carriage_return = 13,
    TC__ascii__non_printable__escape = 27,
    TC__ascii__non_printable__separator__file = 28,
    TC__ascii__non_printable__separator__group = 29,
    TC__ascii__non_printable__separator___compo = 30,
    TC__ascii__non_printable__separator__unit = 31,
    TC__ascii__non_printable__delete = 127,
//
    TC__ascii__space = 32,
    TC__ascii__exclamation = 33,
    TC__ascii__quote__double = 34,
    TC__ascii__hash = 35,
    TC__ascii__dollar = 36,
    TC__ascii__percent = 37,
    TC__ascii__ampersand = 38,
    TC__ascii__quote__single = 39,
    TC__ascii__bracket__round__open = 40,
    TC__ascii__bracket__round__close = 41,
    TC__ascii__asterisk = 42,
    TC__ascii__plus = 43,
    TC__ascii__comma = 44,
    TC__ascii__dash = 45,
    TC__ascii__dot = 46,
    TC__ascii__slash__forward = 47,
//
    TC__ascii__number__zero = 48,
    TC__ascii__number__one = 49,
    TC__ascii__number__two = 50,
    TC__ascii__number__three = 51,
    TC__ascii__number__four = 52,
    TC__ascii__number__five = 53,
    TC__ascii__number__six = 54,
    TC__ascii__number__seven = 55,
    TC__ascii__number__eight = 56,
    TC__ascii__number__nine = 57,
//
    TC__ascii__colon = 58,
    TC__ascii__colon__semi = 59,
    TC__ascii__bracket__angle__open = 60,
    TC__ascii__equal = 61,
    TC__ascii__bracket__angle__close = 62,
    TC__ascii__question = 63,
    TC__ascii__at = 64,
//
    TC__ascii__alphabet__case__upper__a = 65,
    TC__ascii__alphabet__A = TC__ascii__alphabet__case__upper__a,
    TC__ascii__alphabet__case__upper__b = 66,
    TC__ascii__alphabet__B = TC__ascii__alphabet__case__upper__b,
    TC__ascii__alphabet__case__upper__c = 67,
    TC__ascii__alphabet__C = TC__ascii__alphabet__case__upper__c,
    TC__ascii__alphabet__case__upper__d = 68,
    TC__ascii__alphabet__D = TC__ascii__alphabet__case__upper__d,
    TC__ascii__alphabet__case__upper__e = 69,
    TC__ascii__alphabet__E = TC__ascii__alphabet__case__upper__e,
    TC__ascii__alphabet__case__upper__f = 70,
    TC__ascii__alphabet__F = TC__ascii__alphabet__case__upper__f,
    TC__ascii__alphabet__case__upper__g = 71,
    TC__ascii__alphabet__G = TC__ascii__alphabet__case__upper__g,
    TC__ascii__alphabet__case__upper__h = 72,
    TC__ascii__alphabet__H = TC__ascii__alphabet__case__upper__h,
    TC__ascii__alphabet__case__upper__i = 73,
    TC__ascii__alphabet__I = TC__ascii__alphabet__case__upper__i,
    TC__ascii__alphabet__case__upper__j = 74,
    TC__ascii__alphabet__J = TC__ascii__alphabet__case__upper__j,
    TC__ascii__alphabet__case__upper__k = 75,
    TC__ascii__alphabet__K = TC__ascii__alphabet__case__upper__k,
    TC__ascii__alphabet__case__upper__l = 76,
    TC__ascii__alphabet__L = TC__ascii__alphabet__case__upper__l,
    TC__ascii__alphabet__case__upper__m = 77,
    TC__ascii__alphabet__M = TC__ascii__alphabet__case__upper__m,
    TC__ascii__alphabet__case__upper__n = 78,
    TC__ascii__alphabet__N = TC__ascii__alphabet__case__upper__n,
    TC__ascii__alphabet__case__upper__o = 79,
    TC__ascii__alphabet__O = TC__ascii__alphabet__case__upper__o,
    TC__ascii__alphabet__case__upper__p = 80,
    TC__ascii__alphabet__P = TC__ascii__alphabet__case__upper__p,
    TC__ascii__alphabet__case__upper__q = 81,
    TC__ascii__alphabet__Q = TC__ascii__alphabet__case__upper__q,
    TC__ascii__alphabet__case__upper__r = 82,
    TC__ascii__alphabet__R = TC__ascii__alphabet__case__upper__r,
    TC__ascii__alphabet__case__upper__s = 83,
    TC__ascii__alphabet__S = TC__ascii__alphabet__case__upper__s,
    TC__ascii__alphabet__case__upper__t = 84,
    TC__ascii__alphabet__T = TC__ascii__alphabet__case__upper__t,
    TC__ascii__alphabet__case__upper__u = 85,
    TC__ascii__alphabet__U = TC__ascii__alphabet__case__upper__u,
    TC__ascii__alphabet__case__upper__v = 86,
    TC__ascii__alphabet__V = TC__ascii__alphabet__case__upper__v,
    TC__ascii__alphabet__case__upper__w = 87,
    TC__ascii__alphabet__W = TC__ascii__alphabet__case__upper__w,
    TC__ascii__alphabet__case__upper__x = 88,
    TC__ascii__alphabet__X = TC__ascii__alphabet__case__upper__x,
    TC__ascii__alphabet__case__upper__y = 89,
    TC__ascii__alphabet__Y = TC__ascii__alphabet__case__upper__y,
    TC__ascii__alphabet__case__upper__z = 90,
    TC__ascii__alphabet__Z = TC__ascii__alphabet__case__upper__z,
//
    TC__ascii__bracket__square__open = 91,
    TC__ascii__slash__backward = 92,
    TC__ascii__bracket__square__close = 93,
    TC__ascii__caret = 94,
    TC__ascii__under_score = 95,
    TC__ascii__quote__back = 96,
//
    TC__ascii__alphabet__case__lower__a = 97,
    TC__ascii__alphabet__a = TC__ascii__alphabet__case__lower__a,
    TC__ascii__alphabet__case__lower__b = 98,
    TC__ascii__alphabet__b = TC__ascii__alphabet__case__lower__b,
    TC__ascii__alphabet__case__lower__c = 99,
    TC__ascii__alphabet__c = TC__ascii__alphabet__case__lower__c,
    TC__ascii__alphabet__case__lower__d = 100,
    TC__ascii__alphabet__d = TC__ascii__alphabet__case__lower__d,
    TC__ascii__alphabet__case__lower__e = 101,
    TC__ascii__alphabet__e = TC__ascii__alphabet__case__lower__e,
    TC__ascii__alphabet__case__lower__f = 102,
    TC__ascii__alphabet__f = TC__ascii__alphabet__case__lower__f,
    TC__ascii__alphabet__case__lower__g = 103,
    TC__ascii__alphabet__g = TC__ascii__alphabet__case__lower__g,
    TC__ascii__alphabet__case__lower__h = 104,
    TC__ascii__alphabet__h = TC__ascii__alphabet__case__lower__h,
    TC__ascii__alphabet__case__lower__i = 105,
    TC__ascii__alphabet__i = TC__ascii__alphabet__case__lower__i,
    TC__ascii__alphabet__case__lower__j = 106,
    TC__ascii__alphabet__j = TC__ascii__alphabet__case__lower__j,
    TC__ascii__alphabet__case__lower__k = 107,
    TC__ascii__alphabet__k = TC__ascii__alphabet__case__lower__k,
    TC__ascii__alphabet__case__lower__l = 108,
    TC__ascii__alphabet__l = TC__ascii__alphabet__case__lower__l,
    TC__ascii__alphabet__case__lower__m = 109,
    TC__ascii__alphabet__m = TC__ascii__alphabet__case__lower__m,
    TC__ascii__alphabet__case__lower__n = 110,
    TC__ascii__alphabet__n = TC__ascii__alphabet__case__lower__n,
    TC__ascii__alphabet__case__lower__o = 111,
    TC__ascii__alphabet__o = TC__ascii__alphabet__case__lower__o,
    TC__ascii__alphabet__case__lower__p = 112,
    TC__ascii__alphabet__p = TC__ascii__alphabet__case__lower__p,
    TC__ascii__alphabet__case__lower__q = 113,
    TC__ascii__alphabet__q = TC__ascii__alphabet__case__lower__q,
    TC__ascii__alphabet__case__lower__r = 114,
    TC__ascii__alphabet__r = TC__ascii__alphabet__case__lower__r,
    TC__ascii__alphabet__case__lower__s = 115,
    TC__ascii__alphabet__s = TC__ascii__alphabet__case__lower__s,
    TC__ascii__alphabet__case__lower__t = 116,
    TC__ascii__alphabet__t = TC__ascii__alphabet__case__lower__t,
    TC__ascii__alphabet__case__lower__u = 117,
    TC__ascii__alphabet__u = TC__ascii__alphabet__case__lower__u,
    TC__ascii__alphabet__case__lower__v = 118,
    TC__ascii__alphabet__v = TC__ascii__alphabet__case__lower__v,
    TC__ascii__alphabet__case__lower__w = 119,
    TC__ascii__alphabet__w = TC__ascii__alphabet__case__lower__w,
    TC__ascii__alphabet__case__lower__x = 120,
    TC__ascii__alphabet__x = TC__ascii__alphabet__case__lower__x,
    TC__ascii__alphabet__case__lower__y = 121,
    TC__ascii__alphabet__y = TC__ascii__alphabet__case__lower__y,
    TC__ascii__alphabet__case__lower__z = 122,
    TC__ascii__alphabet__z = TC__ascii__alphabet__case__lower__z,
//
    TC__ascii__bracket__curly__open = 123,
    TC__ascii__pipe = 124,
    TC__ascii__bracket__curly__close = 125,
    TC__ascii__tilde = 126;

const //
    TC__ascii__limit = TC__limit,
    TC__ascii__max = TC__max;

BOOL TC__ascii__valid__ok(final TC c) => //
    (c < TC__ascii__limit);

BOOL TC__ascii__valid__ok__and__printable(final TC c) => //
    ((c < TC__ascii__max) && (c < TC__ascii__space).not);

BOOL TC__ascii__number__non__zero__not(final TC c) => //
    ((c < TC__ascii__number__one) || (c > TC__ascii__number__nine));

BOOL TC__ascii__number__non__zero__ok(final TC c) => //
    TC__ascii__number__non__zero__not(c).not;

BOOL TC__ascii__number__not(final TC c) => //
    (TC__ascii__number__non__zero__not(c) && (c != TC__ascii__number__zero));

BOOL TC__ascii__number__ok(final TC c) => //
    (TC__ascii__number__non__zero__ok(c) || (c == TC__ascii__number__zero));

BOOL TC__ascii__alphabet__case__lower__not(final TC c) => //
    ((c < TC__ascii__alphabet__case__lower__a) || (c > TC__ascii__alphabet__case__lower__z));

BOOL TC__ascii__alphabet__case__lower__ok(final TC c) => //
    TC__ascii__alphabet__case__lower__not(c).not;

BOOL TC__ascii__alphabet__case__upper__not(final TC c) => //
    ((c < TC__ascii__alphabet__case__upper__a) || (c > TC__ascii__alphabet__case__upper__z));

BOOL TC__ascii__alphabet__case__upper__ok(final TC c) => //
    TC__ascii__alphabet__case__upper__not(c).not;

BOOL TC__ascii__alphabet__not(final TC c) => //
    (TC__ascii__alphabet__case__lower__not(c) && //
        TC__ascii__alphabet__case__upper__not(c));

BOOL TC__ascii__alphabet__ok(final TC c) => //
    TC__ascii__alphabet__not(c).not;

BOOL TC__ascii__alphabet__case__upper__ok__basic(final TC c) => //
    (c < TC__ascii__alphabet__case__lower__a);

BOOL TC__ascii__alphabet__case__lower__ok__basic(final TC c) => //
    (c > TC__ascii__alphabet__case__upper__z);

const TC //
    _convertion__case__value = (TC__limit >> 2);

TC TC__ascii__alphabet__case__upper__convert__lower(final TC c) => //
    (c + _convertion__case__value);

TC TC__ascii__alphabet__case__lower__convert__upper(final TC c) => //
    (c - _convertion__case__value);
