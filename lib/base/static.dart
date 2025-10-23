part of "_.dart";

const CHAR__UNICODE //
    CHAR__UNICODE__bullet = 8226,
    CHAR__UNICODE__currency__rupee = 8377 /* symbol of Indian National Rupee */;

final string //
    char__bullet = string.fromCharCode(CHAR__UNICODE__bullet),
    char__currency__rupee = string.fromCharCode(CHAR__UNICODE__currency__rupee);

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
    file__type__array__count__size = INT__2__size,
    file__type__static__text__graphic__image = "image",
    file__type__static__text__graphic__symbol = "symbol",
    file__type__static__text__array = <string>[
      (file__type__static__text__graphic__image + char__colon + "png"),
      (file__type__static__text__graphic__symbol + char__colon + "svg"),
    ];

final //
    currencies = <({
  INT code,
  string char,
  string title,
})>[
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
