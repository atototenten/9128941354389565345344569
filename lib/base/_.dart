import "dart:core";
import "dart:typed_data" as typed_data;

import "dart:async" as async;
import "dart:convert" as convert;
import "dart:math" as math;

//

part "accumulation/_.dart";
part "accumulation/byte.array.dart";
part "accumulation/chained.dart";
part "accumulation/conservative.iteration.meta.dart";
part "accumulation/linear.dart";
part "accumulation/linked.dart";
part "array.dart";
part "asyn.dart";
part "math.dart";
part "BOOL.dart";
part "byte.string.dart";
part "byte.array.dart";
part "ch.ascii.dart";
part "char.dart";
part "compo.dart";
part "java_script.dart";
part "fetching__caching.dart";
part "date_time.dart";
part "dictionary.dart";
part "Enum.dart";
part "error.dart";
part "event.dart";
part "exclusion__mutual.dart";
part "number/_.dart";
part "number/integer/_.dart";
part "number/integer/binary.dart";
part "number/integer/signed.dart";
part "number/integer/signed.big.dart";
part "number/exponential.dart";
part "number/real.dart";
part "image.dart";
part "input.text.buffering.dart";
part "iterable.dart";
part "iterate.dart";
part "language.english.dart";
part "list.dart";
part "message.dart";
part "printing.dart";
part "procedure.dart";
part "queue.dart";
part "stack.dart";
part "static.dart";
part "str.dart";
part "Stream.dart";
part "string.dart";
part "string.wide.dart";
part "text.representation.dart";
part "TC.dart";
part "union.dart";
part "unit.dart";
part "value.dart";
part "Object__nilable.dart";

/*
  `(Object? == (Object | Null))`
  `(FutureOr<void> == (value__asyn<void> | void))`
    any function, marked `async`, or using `await` in body, MUST return `Future`, NOT `FutureOr` */

const //
    base__printing__ok = OK,
    behavior__correct__ok /* prefer correct-ness, over, efficiency or performance; NO guarentee */ = OK,
//
    environment__phone__ok__android = OK,
    environment__phone__ok__apple = NO,
    environment__phone__ok = (environment__phone__ok__android || environment__phone__ok__apple),
    environment__work_station__ok__unix /*BSD|GNU|Linux*/ = !environment__phone__ok,
    environment__work_station__ok = environment__work_station__ok__unix;

const Null NIL = null;

const //
    Null__value__text = "NIL";

const //
    bytes__count__decimal__shift__count = 10,
    bytes__count__kibi = /*(1 << bytes__count__decimal__shift__count)*/
        (NI1__limit << 2),
    bytes__count__mebi = (bytes__count__kibi << bytes__count__decimal__shift__count),
    bytes__count__gibi = (bytes__count__mebi << bytes__count__decimal__shift__count),
    bytes__count__tebi = (bytes__count__gibi << bytes__count__decimal__shift__count),
    bytes__count__pebi = (bytes__count__tebi << bytes__count__decimal__shift__count),
    bytes__count__exbi = (bytes__count__pebi << bytes__count__decimal__shift__count),
    bytes__count__zebi = (bytes__count__exbi << bytes__count__decimal__shift__count),
    bytes__count__yobi = (bytes__count__zebi << bytes__count__decimal__shift__count);

const NIMR //
    io__buffer__size__default = (bytes__count__kibi << 2);

enum base__results__basic {
  success,
  failure /* client-side issue */,
  failure__internal /* non-{client-side} issue ,like communicat-ion ,internal|server-side */,
}

extension base__results__basic__ensurance__extension //
    on base__results__basic {
  void ensure__success /*
`throw`s `base__results__basic.`{`failure`|`error`} */
      () {
    final value = this;

    if (value == base__results__basic.success) {
      return;
    }

    throw value;
  }
}

const //
    result__code__size = NI1__size,
//
    zero = '${0}', //
    one = '${1}',
    two = '${2}',
    three = '${3}',
//
    static__indicate__truncat_ion = "...",
    static__indicate__short_en_ing = static__indicate__truncat_ion,
//
    empty__text = '',
    empty__array = <dynamic>[];

const TC //
    checksum__sha__256__size = 32;

const //
    attribute__function__inline = pragma("vm:prefer-inline");

extension nil__conversion__extension<type extends Object> on type? {
  result__type? convert__if<result__type>(
    final result__type Function(type) operate,
  ) {
    final this_1 = this;

    if (this_1 == null) {
      return NIL;
    }

    return operate(
      this_1,
    );
  }
}

late final base__random__safe = math.Random.secure();

BOOL base__check__endian__host__little() {
  return ((BS2__array(1)..[0] = 256 /* because we want to check the index 0, not 1 */).buffer.asUint8List()[0] == 0);
}

void base__check__features() {
  if (base__check__endian__host__little().not) {
    throw "host, byte-order, in-compatible: refer `b__endian__host__little`";
  }
}

typedef base__copy__result___compo = ({
  NIMR dest__offset__new,
  NIMR src__offset__new,
});

//@attribute__function__inline
base__copy__result___compo base__copy<T>(
  final array<T> dest,
  final array<T> src, {
  NIMR? /*src__*/ count,
  NIMR dest__offset = 0,
  NIMR src__offset = 0,
}) {
  count /* end/stop */ = ((count == null) //
      ? (src.elements__count - src__offset)
      : (count + src__offset));

  while (src__offset < count) //
    dest[dest__offset++] = src[src__offset++];

  return (
    dest__offset__new: dest__offset,
    src__offset__new: src__offset,
  );
}

abstract class base__dispose___protocol {
  void dispose();
}

abstract class base__dispose__asyn___protocol //
    <error__type extends Enum> {
  value__asyn<error__type?> //
      dispose__asyn();
}

abstract class base__dispose__asyn__basic___protocol {
  value__asyn__basic<void> //
      dispose__asyn();
}

NIMR binarySearch(
  final array<NIMR> list,
  final NIMR element,
) {
  NIMR //
      min = 0,
      mid = 0 /* un-necessary assignment, to avoid the error, by dart's analyzer */,
      max = list.elements__count;

  while (min < max) {
    final _element = list[mid = ((min + max) >>> /* ~/ */ 2)];

    if (element < _element) //
      max = mid;
    else if (element > _element) //
      min = (mid += /*
  if the `element` is NOT found,
    the assignment ensures that correct index(for insertion), hence correct `-mid`, is returned
      for all values, without the assignment, the negative-index is correct, for some values, but not all

  mere this trick has been copied from the source code of "gnu classpath",
    which was also, found to be highly in-efficient, than open-jdk's implementation, checkout later */
          1);
    else //
      return mid;
  }

  return -mid;
}

extension NI__array__bits__extension //
    on array<NIMR> {
  string__raw bits({
    final NIMR interval = 4,
  }) {
    final buffer = StringBuffer("[");

    iterate__basic(
      (final i, final e) {
        buffer
          ..write(" ")
          ..write(
            e //
                .toRadixString(2)
                .separate(
                  interval: interval,
                  prefix: '0',
                ),
          )
          ..write(",");
      },
    );

    buffer.write(" ]");

    final result = buffer.toString();

    buffer.clear();

    return result;
  }
}

extension text__separation__extension //
    on string__raw {
  string__raw separate({
    final string__raw separation = char__space,
    final NIMR interval = 3,
    final string__raw? prefix,
  }) {
    final length_1 = length;

    var offset = (length_1 % interval);

    final buffer = StringBuffer();

    if (offset > 0) {
      final prefix__chars__count = (interval - offset);
      if ((prefix != null) && (prefix__chars__count > 0)) {
        for (var i = 0; i < prefix__chars__count; i += 1) {
          buffer.write(
            prefix,
          );
        }
      }
    }

    buffer.write(
      substring(
        0,
        offset,
      ),
    );

    base__iterate__reverse__basic(
      ((length_1 - offset) ~/ interval),
      (final _) {
        buffer
          ..write(separation)
          ..write(
            substring(
              offset,
              (offset += interval),
            ),
          );
      },
    );

    return buffer.toString();
  }

  array<string__raw> separate__array({
    final int interval = 3,
  }) {
    final length_1 = length;

    var offset = (length_1 % interval);

    final elements__count = ((length_1 - offset) ~/ interval);

    final result = array__new__filled<string__raw>(
      elements__count,
      empty__text,
    )..first = substring(
        0,
        offset,
      );

    base__iterate__reverse__basic(
      (elements__count - 1),
      (final i) {
        result[i] = substring(
          offset,
          (offset += interval),
        );
      },
    );

    return result;
  }
}
