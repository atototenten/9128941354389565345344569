part of "_.dart";

const CHAR //
    CHAR__ASCII__non_printable__null = 0,
    CHAR__ASCII__non_printable__tab__horizontal = 9,
    CHAR__ASCII__non_printable__line_feed = 10,
    CHAR__ASCII__non_printable__tab__vertical = 11,
    CHAR__ASCII__non_printable__carriage_return = 13,
    CHAR__ASCII__non_printable__escape = 27,
    CHAR__ASCII__non_printable__separator__file = 28,
    CHAR__ASCII__non_printable__separator__group = 29,
    CHAR__ASCII__non_printable__separator__record = 30,
    CHAR__ASCII__non_printable__separator__unit = 31,
    CHAR__ASCII__non_printable__delete = 127,
//
    CHAR__ASCII__space = 32,
    CHAR__ASCII__exclamation = 33,
    CHAR__ASCII__quote__double = 34,
    CHAR__ASCII__hash = 35,
    CHAR__ASCII__dollar = 36,
    CHAR__ASCII__percent = 37,
    CHAR__ASCII__ampersand = 38,
    CHAR__ASCII__quote__single = 39,
    CHAR__ASCII__bracket__round__open = 40,
    CHAR__ASCII__bracket__round__close = 41,
    CHAR__ASCII__asterisk = 42,
    CHAR__ASCII__plus = 43,
    CHAR__ASCII__comma = 44,
    CHAR__ASCII__dash = 45,
    CHAR__ASCII__dot = 46,
    CHAR__ASCII__slash__forward = 47,
//
    CHAR__ASCII__number__zero = 48,
    CHAR__ASCII__number__one = 49,
    CHAR__ASCII__number__two = 50,
    CHAR__ASCII__number__three = 51,
    CHAR__ASCII__number__four = 52,
    CHAR__ASCII__number__five = 53,
    CHAR__ASCII__number__six = 54,
    CHAR__ASCII__number__seven = 55,
    CHAR__ASCII__number__eight = 56,
    CHAR__ASCII__number__nine = 57,
//
    CHAR__ASCII__colon = 58,
    CHAR__ASCII__colon__semi = 59,
    CHAR__ASCII__bracket__angle__open = 60,
    CHAR__ASCII__equal = 61,
    CHAR__ASCII__bracket__angle__close = 62,
    CHAR__ASCII__question = 63,
    CHAR__ASCII__at = 64,
//
    CHAR__ASCII__alphabet__case__upper__a = 65,
    CHAR__ASCII__alphabet__A = CHAR__ASCII__alphabet__case__upper__a,
    CHAR__ASCII__alphabet__case__upper__b = 66,
    CHAR__ASCII__alphabet__B = CHAR__ASCII__alphabet__case__upper__b,
    CHAR__ASCII__alphabet__case__upper__c = 67,
    CHAR__ASCII__alphabet__C = CHAR__ASCII__alphabet__case__upper__c,
    CHAR__ASCII__alphabet__case__upper__d = 68,
    CHAR__ASCII__alphabet__D = CHAR__ASCII__alphabet__case__upper__d,
    CHAR__ASCII__alphabet__case__upper__e = 69,
    CHAR__ASCII__alphabet__E = CHAR__ASCII__alphabet__case__upper__e,
    CHAR__ASCII__alphabet__case__upper__f = 70,
    CHAR__ASCII__alphabet__F = CHAR__ASCII__alphabet__case__upper__f,
    CHAR__ASCII__alphabet__case__upper__g = 71,
    CHAR__ASCII__alphabet__G = CHAR__ASCII__alphabet__case__upper__g,
    CHAR__ASCII__alphabet__case__upper__h = 72,
    CHAR__ASCII__alphabet__H = CHAR__ASCII__alphabet__case__upper__h,
    CHAR__ASCII__alphabet__case__upper__i = 73,
    CHAR__ASCII__alphabet__I = CHAR__ASCII__alphabet__case__upper__i,
    CHAR__ASCII__alphabet__case__upper__j = 74,
    CHAR__ASCII__alphabet__J = CHAR__ASCII__alphabet__case__upper__j,
    CHAR__ASCII__alphabet__case__upper__k = 75,
    CHAR__ASCII__alphabet__K = CHAR__ASCII__alphabet__case__upper__k,
    CHAR__ASCII__alphabet__case__upper__l = 76,
    CHAR__ASCII__alphabet__L = CHAR__ASCII__alphabet__case__upper__l,
    CHAR__ASCII__alphabet__case__upper__m = 77,
    CHAR__ASCII__alphabet__M = CHAR__ASCII__alphabet__case__upper__m,
    CHAR__ASCII__alphabet__case__upper__n = 78,
    CHAR__ASCII__alphabet__N = CHAR__ASCII__alphabet__case__upper__n,
    CHAR__ASCII__alphabet__case__upper__o = 79,
    CHAR__ASCII__alphabet__O = CHAR__ASCII__alphabet__case__upper__o,
    CHAR__ASCII__alphabet__case__upper__p = 80,
    CHAR__ASCII__alphabet__P = CHAR__ASCII__alphabet__case__upper__p,
    CHAR__ASCII__alphabet__case__upper__q = 81,
    CHAR__ASCII__alphabet__Q = CHAR__ASCII__alphabet__case__upper__q,
    CHAR__ASCII__alphabet__case__upper__r = 82,
    CHAR__ASCII__alphabet__R = CHAR__ASCII__alphabet__case__upper__r,
    CHAR__ASCII__alphabet__case__upper__s = 83,
    CHAR__ASCII__alphabet__S = CHAR__ASCII__alphabet__case__upper__s,
    CHAR__ASCII__alphabet__case__upper__t = 84,
    CHAR__ASCII__alphabet__T = CHAR__ASCII__alphabet__case__upper__t,
    CHAR__ASCII__alphabet__case__upper__u = 85,
    CHAR__ASCII__alphabet__U = CHAR__ASCII__alphabet__case__upper__u,
    CHAR__ASCII__alphabet__case__upper__v = 86,
    CHAR__ASCII__alphabet__V = CHAR__ASCII__alphabet__case__upper__v,
    CHAR__ASCII__alphabet__case__upper__w = 87,
    CHAR__ASCII__alphabet__W = CHAR__ASCII__alphabet__case__upper__w,
    CHAR__ASCII__alphabet__case__upper__x = 88,
    CHAR__ASCII__alphabet__X = CHAR__ASCII__alphabet__case__upper__x,
    CHAR__ASCII__alphabet__case__upper__y = 89,
    CHAR__ASCII__alphabet__Y = CHAR__ASCII__alphabet__case__upper__y,
    CHAR__ASCII__alphabet__case__upper__z = 90,
    CHAR__ASCII__alphabet__Z = CHAR__ASCII__alphabet__case__upper__z,
//
    CHAR__ASCII__bracket__square__open = 91,
    CHAR__ASCII__slash__backward = 92,
    CHAR__ASCII__bracket__square__close = 93,
    CHAR__ASCII__caret = 94,
    CHAR__ASCII__under_score = 95,
    CHAR__ASCII__quote__back = 96,
//
    CHAR__ASCII__alphabet__case__lower__a = 97,
    CHAR__ASCII__alphabet__a = CHAR__ASCII__alphabet__case__lower__a,
    CHAR__ASCII__alphabet__case__lower__b = 98,
    CHAR__ASCII__alphabet__b = CHAR__ASCII__alphabet__case__lower__b,
    CHAR__ASCII__alphabet__case__lower__c = 99,
    CHAR__ASCII__alphabet__c = CHAR__ASCII__alphabet__case__lower__c,
    CHAR__ASCII__alphabet__case__lower__d = 100,
    CHAR__ASCII__alphabet__d = CHAR__ASCII__alphabet__case__lower__d,
    CHAR__ASCII__alphabet__case__lower__e = 101,
    CHAR__ASCII__alphabet__e = CHAR__ASCII__alphabet__case__lower__e,
    CHAR__ASCII__alphabet__case__lower__f = 102,
    CHAR__ASCII__alphabet__f = CHAR__ASCII__alphabet__case__lower__f,
    CHAR__ASCII__alphabet__case__lower__g = 103,
    CHAR__ASCII__alphabet__g = CHAR__ASCII__alphabet__case__lower__g,
    CHAR__ASCII__alphabet__case__lower__h = 104,
    CHAR__ASCII__alphabet__h = CHAR__ASCII__alphabet__case__lower__h,
    CHAR__ASCII__alphabet__case__lower__i = 105,
    CHAR__ASCII__alphabet__i = CHAR__ASCII__alphabet__case__lower__i,
    CHAR__ASCII__alphabet__case__lower__j = 106,
    CHAR__ASCII__alphabet__j = CHAR__ASCII__alphabet__case__lower__j,
    CHAR__ASCII__alphabet__case__lower__k = 107,
    CHAR__ASCII__alphabet__k = CHAR__ASCII__alphabet__case__lower__k,
    CHAR__ASCII__alphabet__case__lower__l = 108,
    CHAR__ASCII__alphabet__l = CHAR__ASCII__alphabet__case__lower__l,
    CHAR__ASCII__alphabet__case__lower__m = 109,
    CHAR__ASCII__alphabet__m = CHAR__ASCII__alphabet__case__lower__m,
    CHAR__ASCII__alphabet__case__lower__n = 110,
    CHAR__ASCII__alphabet__n = CHAR__ASCII__alphabet__case__lower__n,
    CHAR__ASCII__alphabet__case__lower__o = 111,
    CHAR__ASCII__alphabet__o = CHAR__ASCII__alphabet__case__lower__o,
    CHAR__ASCII__alphabet__case__lower__p = 112,
    CHAR__ASCII__alphabet__p = CHAR__ASCII__alphabet__case__lower__p,
    CHAR__ASCII__alphabet__case__lower__q = 113,
    CHAR__ASCII__alphabet__q = CHAR__ASCII__alphabet__case__lower__q,
    CHAR__ASCII__alphabet__case__lower__r = 114,
    CHAR__ASCII__alphabet__r = CHAR__ASCII__alphabet__case__lower__r,
    CHAR__ASCII__alphabet__case__lower__s = 115,
    CHAR__ASCII__alphabet__s = CHAR__ASCII__alphabet__case__lower__s,
    CHAR__ASCII__alphabet__case__lower__t = 116,
    CHAR__ASCII__alphabet__t = CHAR__ASCII__alphabet__case__lower__t,
    CHAR__ASCII__alphabet__case__lower__u = 117,
    CHAR__ASCII__alphabet__u = CHAR__ASCII__alphabet__case__lower__u,
    CHAR__ASCII__alphabet__case__lower__v = 118,
    CHAR__ASCII__alphabet__v = CHAR__ASCII__alphabet__case__lower__v,
    CHAR__ASCII__alphabet__case__lower__w = 119,
    CHAR__ASCII__alphabet__w = CHAR__ASCII__alphabet__case__lower__w,
    CHAR__ASCII__alphabet__case__lower__x = 120,
    CHAR__ASCII__alphabet__x = CHAR__ASCII__alphabet__case__lower__x,
    CHAR__ASCII__alphabet__case__lower__y = 121,
    CHAR__ASCII__alphabet__y = CHAR__ASCII__alphabet__case__lower__y,
    CHAR__ASCII__alphabet__case__lower__z = 122,
    CHAR__ASCII__alphabet__z = CHAR__ASCII__alphabet__case__lower__z,
//
    CHAR__ASCII__bracket__curly__open = 123,
    CHAR__ASCII__pipe = 124,
    CHAR__ASCII__bracket__curly__close = 125,
    CHAR__ASCII__tilde = 126;

const //
    CHAR__ASCII__limit = CHAR__limit,
    CHAR__ASCII__max = CHAR__max;

BOOL CHAR__ASCII__valid___ok(final CHAR c) => //
    (c < CHAR__ASCII__limit);

BOOL CHAR__ASCII__valid__and__printable___ok(final CHAR c) => //
    ((c < CHAR__ASCII__max) && (c < CHAR__ASCII__space).not);

BOOL CHAR__ASCII__number__non__zero__not(final CHAR c) => //
    ((c < CHAR__ASCII__number__one) || (c > CHAR__ASCII__number__nine));

BOOL CHAR__ASCII__number__non__zero___ok(final CHAR c) => //
    CHAR__ASCII__number__non__zero__not(c).not;

BOOL CHAR__ASCII__number__not(final CHAR c) => //
    (CHAR__ASCII__number__non__zero__not(c) && (c != CHAR__ASCII__number__zero));

BOOL CHAR__ASCII__number___ok(final CHAR c) => //
    (CHAR__ASCII__number__non__zero___ok(c) || (c == CHAR__ASCII__number__zero));

BOOL CHAR__ASCII__alphabet__case__lower__not(final CHAR c) => //
    ((c < CHAR__ASCII__alphabet__case__lower__a) || (c > CHAR__ASCII__alphabet__case__lower__z));

BOOL CHAR__ASCII__alphabet__case__lower___ok(final CHAR c) => //
    CHAR__ASCII__alphabet__case__lower__not(c).not;

BOOL CHAR__ASCII__alphabet__case__upper__not(final CHAR c) => //
    ((c < CHAR__ASCII__alphabet__case__upper__a) || (c > CHAR__ASCII__alphabet__case__upper__z));

BOOL CHAR__ASCII__alphabet__case__upper___ok(final CHAR c) => //
    CHAR__ASCII__alphabet__case__upper__not(c).not;

BOOL CHAR__ASCII__alphabet__not(final CHAR c) => //
    (CHAR__ASCII__alphabet__case__lower__not(c) && //
        CHAR__ASCII__alphabet__case__upper__not(c));

BOOL CHAR__ASCII__alphabet___ok(final CHAR c) => //
    CHAR__ASCII__alphabet__not(c).not;

BOOL CHAR__ASCII__alphabet__case__upper__ok__basic(final CHAR c) => //
    (c < CHAR__ASCII__alphabet__case__lower__a);

BOOL CHAR__ASCII__alphabet__case__lower__ok__basic(final CHAR c) => //
    (c > CHAR__ASCII__alphabet__case__upper__z);

const CHAR //
    _convertion__case__value = (CHAR__limit >> 2);

CHAR CHAR__ASCII__alphabet__case__upper__convert__lower(final CHAR c) => //
    (c + _convertion__case__value);

CHAR CHAR__ASCII__alphabet__case__lower__convert__upper(final CHAR c) => //
    (c - _convertion__case__value);
