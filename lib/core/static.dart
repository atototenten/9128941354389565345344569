part of "_.dart";

const CHAR__UNICODE //
CHAR__UNICODE__bullet = 8226,
    CHAR__UNICODE__currency__rupee = 8377 /* symbol of Indian National Rupee */;

final string //
char__bullet = string.fromCharCode(CHAR__UNICODE__bullet),
    char__currency__rupee = string.fromCharCode(CHAR__UNICODE__currency__rupee);

const //
chars__line_feed___string = '\n',
//
chars__space___string = ' ', chars__exclamation___string = '!', chars__quote__double___string = '"', chars__hash___string = '#', chars__dollar___string = r'$', chars__percent___string = '%', chars__ampersand___string = '&', chars__quote__single___string = '\'', chars__bracket__round__open___string = '(', chars__bracket__round__close___string = ')', chars__asterisk___string = '*', chars__plus___string = '+', chars__comma___string = ',', chars__dash___string = '-', chars__dot___string = '.', chars__slash__forward___string = '/',
//
chars__number__zero___string = '0', chars__number__one___string = '1', chars__number__two___string = '2', chars__number__three___string = '3', chars__number__four___string = '4', chars__number__five___string = '5', chars__number__six___string = '6', chars__number__seven___string = '7', chars__number__eight___string = '8', chars__number__nine___string = '9',
//
chars__colon___string = ':', chars__colon__semi___string = ';', chars__less_than___string = '<', chars__equal___string = '=', chars__more_than___string = '>', chars__question___string = '?', chars__at___string = '@',
//
chars__alphabet__case__upper__a___string = 'A', chars__alphabet__case__upper__b___string = 'B', chars__alphabet__case__upper__c___string = 'C', chars__alphabet__case__upper__d___string = 'D', chars__alphabet__case__upper__e___string = 'E', chars__alphabet__case__upper__f___string = 'F', chars__alphabet__case__upper__g___string = 'G', chars__alphabet__case__upper__h___string = 'H', chars__alphabet__case__upper__i___string = 'I', chars__alphabet__case__upper__j___string = 'J', chars__alphabet__case__upper__k___string = 'K', chars__alphabet__case__upper__l___string = 'L', chars__alphabet__case__upper__m___string = 'M', chars__alphabet__case__upper__n___string = 'N', chars__alphabet__case__upper__o___string = 'O', chars__alphabet__case__upper__p___string = 'P', chars__alphabet__case__upper__q___string = 'Q', chars__alphabet__case__upper__r___string = 'R', chars__alphabet__case__upper__s___string = 'S', chars__alphabet__case__upper__t___string = 'T', chars__alphabet__case__upper__u___string = 'U', chars__alphabet__case__upper__v___string = 'V', chars__alphabet__case__upper__w___string = 'W', chars__alphabet__case__upper__x___string = 'X', chars__alphabet__case__upper__y___string = 'Y', chars__alphabet__case__upper__z___string = 'Z',
//
chars__bracket__square__open___string = '[', chars__slash__backward___string = r'\', chars__bracket__square__close___string = ']', chars__caret___string = '^', chars__underscore___string = '_', chars__quote__back___string = '`',
//
chars__alphabet__case__lower__a___string = 'a', chars__alphabet__case__lower__b___string = 'b', chars__alphabet__case__lower__c___string = 'c', chars__alphabet__case__lower__d___string = 'd', chars__alphabet__case__lower__e___string = 'e', chars__alphabet__case__lower__f___string = 'f', chars__alphabet__case__lower__g___string = 'g', chars__alphabet__case__lower__h___string = 'h', chars__alphabet__case__lower__i___string = 'i', chars__alphabet__case__lower__j___string = 'j', chars__alphabet__case__lower__k___string = 'k', chars__alphabet__case__lower__l___string = 'l', chars__alphabet__case__lower__m___string = 'm', chars__alphabet__case__lower__n___string = 'n', chars__alphabet__case__lower__o___string = 'o', chars__alphabet__case__lower__p___string = 'p', chars__alphabet__case__lower__q___string = 'q', chars__alphabet__case__lower__r___string = 'r', chars__alphabet__case__lower__s___string = 's', chars__alphabet__case__lower__t___string = 't', chars__alphabet__case__lower__u___string = 'u', chars__alphabet__case__lower__v___string = 'v', chars__alphabet__case__lower__w___string = 'w', chars__alphabet__case__lower__x___string = 'x', chars__alphabet__case__lower__y___string = 'y', chars__alphabet__case__lower__z___string = 'z',
//
chars__bracket__curly__open___string = '{', chars__pipe___string = '|', chars__bracket__curly__close___string = '}', chars__tilde___string = '~';

const //
number__ordinal__static__sting__array = <string>[
      "First",
      "Second",
      "Third",
      "Fourth",
      "Fifth",
      "Sixth",
      "Seventh",
      "Eighth",
      "Ninth",
      "Tenth",
      "Eleventh",
      "Twelfth",
      "Thirteenth",
      "Fourteenth",
      "Fifteenth",
      "Sixteenth",
      "Seventeenth",
      "Eighteenth",
      "Nineteenth",
      "Twentieth",
      "Twenty-first",
      "Twenty-second",
      "Twenty-third",
      "Twenty-fourth",
      "Twenty-fifth",
      "Twenty-sixth",
      "Twenty-seventh",
      "Twenty-eighth",
      "Twenty-ninth",
      "Thirtieth",
      "Thirty-first",
      "Thirty-second",
      "Thirty-third",
    ],
    //
    calendar__gregorian__month__static__text__array = <string>[
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ],
    calendar__gregorian__week__day__static__text__array = <string>[
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday",
    ],
        //
        file__type__array__count__size =
        INT__2__size,
    file__type__static__text__graphic__image = "image",
    file__type__static__text__graphic__symbol = "symbol",
    file__type__static__text__array = <string>[
      (file__type__static__text__graphic__image + chars__colon___string + "png"),
      (file__type__static__text__graphic__symbol + chars__colon___string + "svg"),
    ];

final //
currencies =
    <
      ({
        INT code,
        string char,
        string title,
      })
    >[
      (
        code: CHAR__UNICODE__currency__rupee,
        char: char__currency__rupee,
        title: "Indian Rupees",
      ),
    ];

const //
char__s = 's',
    chars__es = ('e' + char__s),
    //
    static__text__english__array = [
      "Add",
      "All",
    ],
    static__text__array = //
        static__text__english__array;

string get static__text__add => static__text__array[0];
string get static__text__all => static__text__array[1];

const //
language__hindi__numbers__count = 10,
    language__latin__english__alphabets__count = 26;

string text__count__convert__plural(
  final StringBuffer buffer,
  final INT count,
  final string word, [
  final BOOL suffix__s___ok /* {'s'|"es"} */ = TRUE,
]) {
  final buffer = StringBuffer();

  buffer
    ..write(count)
    ..write(chars__space___string)
    ..write(word);

  if (count != 1) {
    buffer.write(
      suffix__s___ok //
          ? "s"
          : "es",
    );
  }

  return buffer.toString();
}
