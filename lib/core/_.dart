import "dart:core" /*as dart__core*/;

import "dart:isolate" as dart__isolate;
import "dart:typed_data" as dart__typed_data;
import "dart:async" as dart__async;
import "dart:convert" as dart__convert;
import "dart:math" as dart__math;

import "package:collection/collection.dart" as package__collection;

//

part "accumulation/_.dart";
part "accumulation/byte.array.dart";
part "accumulation/chained.dart";
part "accumulation/conservative.iteration.meta.dart";
part "accumulation/linear.dart";
part "accumulation/linked.dart";
part "ARRAY.dart";
part "ASYN.dart";
part "math.dart";
part "BOOL.dart";
part "byte__string.dart";
part "byte__array.dart";
part "CHAR.ASCII.dart";
part "CHAR.dart";
part "compo.dart";
part "java_script.dart";
part "fetching__caching.dart";
part "date_time.dart";
part "DateTime.dart";
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
part "number/floating-point.dart";
part "number/fixed-point.dart";
part "CAPSULE.dart";
part "VENDING.dart";
part "ITERATE.dart";
part "printing.dart";
part "procedure.dart";
part "queue.dart";
part "stack.dart";
part "static.dart";
part "STREAM.dart";
part "string.dart";
part "representation__text.dart";
part "union.dart";
part "unit.dart";
part "value.dart";
part "Object__nilable.dart";
part "UNICODE.dart";

/*
  `(Object? == (Object | Null))`
  `(FutureOr<void> == (ASYN<void> | void))`
    any function, marked `async`, or using `await` in body, MUST return `Future`, NOT `FutureOr` */

const //
printing___ok = TRUE,
        //
        environment__phone__android___ok =
        TRUE,
    environment__phone__apple___ok = FALSE,
    environment__phone___ok = (environment__phone__android___ok || environment__phone__apple___ok),
    environment__work_station__unix___ok /*BSD|GNU|Linux*/ = !environment__phone___ok,
    environment__work_station___ok = environment__work_station__unix___ok;

const Null NIL = null;

const //
Null__value__text = "NIL";

const //
bytes__count__decimal__shift__count = 10,
    bytes__count__kibi = /*(1 << bytes__count__decimal__shift__count)*/ (INT__1__limit << 2),
    bytes__count__mebi = (bytes__count__kibi << bytes__count__decimal__shift__count),
    bytes__count__gibi = (bytes__count__mebi << bytes__count__decimal__shift__count),
    bytes__count__tebi = (bytes__count__gibi << bytes__count__decimal__shift__count),
    bytes__count__pebi = (bytes__count__tebi << bytes__count__decimal__shift__count),
    bytes__count__exbi = (bytes__count__pebi << bytes__count__decimal__shift__count),
    bytes__count__zebi = (bytes__count__exbi << bytes__count__decimal__shift__count),
    bytes__count__yobi = (bytes__count__zebi << bytes__count__decimal__shift__count);

const INT //
io__buffer__size__default = (bytes__count__kibi << 2);

enum results__basic {
  success,
  failure /* client-side issue */,
  failure__internal /* non-{client-side} issue ,like communicat-ion ,internal|server-side */,
}

extension results__basic__ensurance__extension //
    on results__basic {
  void ensure__success /*
`throw`s `results__basic.`{`failure`|`error`} */ () {
    final value = this;

    if (value == results__basic.success) {
      return;
    }

    throw value;
  }
}

const //
result__code__size = INT__1__size,
        //
        zero =
        "${0}", //
    one = "${1}",
    two = "${2}",
    three = "${3}",
        //
        static__indicate__truncat_ion =
        "...",
    static__indicate__short_en_ing = static__indicate__truncat_ion,
        //
        empty___string =
        "";

const //
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

late final random__safe = dart__math.Random.secure();

BOOL check__endian__host__little() {
  return ((BS2__array(1)..[0] = 256 /* because we want to check the index 0, not 1 */ ).buffer.asUint8List()[0] == 0);
}

void check__features() {
  if (check__endian__host__little().NOT) {
    throw "host, byte-order, in-compatible: refer `b__endian__host__little`";
  }
}

typedef copy__result___compo = ({
  INT dest__offset__new,
  INT src__offset__new,
});

//@attribute__function__inline
copy__result___compo copy<element___type>(
  final ARRAY<element___type> dest,
  final ARRAY<element___type> src, {
  final INT? /*src__*/ count,
  INT dest__offset = 0,
  INT src__offset = 0,
}) {
  final end =
      ((count == null) //
      ? (src.elements__count - src__offset)
      : (count + src__offset));

  if (true) {
    while (src__offset < end) {
      dest[dest__offset++] = src[src__offset++];
    }
  } else {
    dest.setRange(
      dest__offset,
      end,
      src,
      src__offset,
    );
  }

  return (
    dest__offset__new: dest__offset,
    src__offset__new: src__offset,
  );
}

abstract class dispose___protocol {
  void dispose();
}

abstract class dispose__asyn___protocol //
<error__type extends Enum> {
  ASYN<error__type?> //
  dispose__asyn();
}

abstract class dispose__asyn__basic___protocol {
  ASYN__BASIC<void> //
  dispose__asyn();
}

INT binarySearch(
  final ARRAY<INT> list,
  final INT element,
) {
  INT //
  min = 0,
      mid = 0 /* un-necessary assignment, to avoid the error, by dart's analyzer */,
      max = list.elements__count;

  while (min < max) {
    final _element = list[mid = ((min + max) >>> /* ~/ */ 2)];

    if (element < _element) //
      max = mid;
    else if (element > _element) //
      min =
          (mid += /*
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

extension INT__array__bits__extension //
    on ARRAY<INT> {
  string bits({
    final INT interval = 4,
  }) {
    final buffer = StringBuffer("[");

    this.iterate__forwards(
      (final e, final i) {
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

        return TRUE;
      },
    );

    buffer.write(" ]");

    final result = buffer.toString();

    buffer.clear();

    return result;
  }
}

extension text__separation__extension //
    on string {
  string separate({
    final string separation = chars__space___string,
    final INT interval = 3,
    final string? prefix,
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

    ITERATE__backwards(
      ((length_1 - offset) ~/ interval),
      (_) {
        buffer
          ..write(separation)
          ..write(
            substring(
              offset,
              (offset += interval),
            ),
          );

        return TRUE;
      },
    );

    return buffer.toString();
  }

  ARRAY<string> separate__array({
    final int interval = 3,
  }) {
    final length_1 = length;

    var offset = (length_1 % interval);

    final elements__count = ((length_1 - offset) ~/ interval);

    final result = ARRAY__filled<string>(
      elements__count,
      empty___string,
    );

    result.first = substring(
      0,
      offset,
    );

    ITERATE__backwards(
      (elements__count - 1),
      (final i) {
        result[i] = substring(
          offset,
          (offset += interval),
        );

        return TRUE;
      },
    );

    return result;
  }
}
