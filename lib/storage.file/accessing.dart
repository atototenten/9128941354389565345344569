part of "_.dart";

storage__file__accessing__aligned__meta___union //
storage__file__accessing__auto({
  required final storage__file__alignment___compo alignment,
  required INT length,
  required INT offset,
}) {
  if (printing___ok) {
    function__call__print(
      "storage__file__accessing__auto",
    );

    length.representation__text().print("length");
    offset.representation__text().print("offset");
  }

  printing__indentation__increase();

  final storage__file__accessing__aligned__meta___union result;

  if /*F*/ (length == 0) {
    if (printing___ok) {
      "(length = 0)".print();
    }

    result = storage__file__accessing__aligned__none__meta();
  } else {
    final //
    offset__aligned___ok = INT__aligned___ok(
          offset,
          alignment.size,
        ),
        offset__aligned___compo = storage__file__offset__aligned(
          offset,
          alignment,
        ),
        block__id = INT__aligned__alignment__count(
          offset__aligned___compo.offset__aligned,
          alignment.shift__count,
        );

    if /*F*/ (offset__aligned___ok.NOT && //
        ((length + offset__aligned___compo.buffer__offset) < alignment.size)) /*
branch is required
  because `block__partial__begin__meta` implies `(length = block__bytes__count\alignment__size\)`
example :`
        |   ---  |        |
`
aligned equivalent case (`offset__aligned__ok`)
  is covered by `result.end` */ {
      if (printing___ok) {
        "block__single__ok".print();
      }

      result = storage__file__accessing__aligned__simple__meta(
        block__id: block__id,
        value: storage__file__block__single__partial__meta(
          length: length,
          offset: offset__aligned___compo.buffer__offset,
        ),
      );

      /*length -= length*/
      length = 0;
    } else {
      final storage__file__block__single__partial__beginning__meta? beginning;
      final storage__file__block__multiple__full__meta? middle;
      final storage__file__block__single__partial__ending__meta? ending;

      if /*T*/ (offset__aligned___ok) {
        if (offset__aligned___compo.buffer__offset != 0) {
          throw "exception";
        }

        beginning = NIL;
      } else {
        if (printing___ok) {
          "offset__aligned__not".print();
        }

        beginning = storage__file__block__single__partial__beginning__meta(
          offset: offset__aligned___compo.buffer__offset,
        );

        length -= (alignment.size - offset__aligned___compo.buffer__offset);
        offset = (alignment.size + offset__aligned___compo.offset__aligned);
      }

      final length__aligned = storage__file__offset__aligned(
        length,
        alignment,
      );

      if /*F*/ (length == 0) {
        if (printing___ok) {
          "(length  =  0)".print();
        }

        middle = NIL;
      } else {
        final blocks__count = INT__aligned__alignment__count(
          length__aligned.offset__aligned,
          alignment.shift__count,
        );

        if /*F*/ (blocks__count == 0) {
          if (printing___ok) {
            "(blocks__count = 0)".print();
          }

          middle = NIL;
        } else {
          middle = storage__file__block__multiple__full__meta(
            blocks__count: blocks__count,
          );

          final blocks__bytes__count = (blocks__count * alignment.size);

          length -= blocks__bytes__count;
          offset += blocks__bytes__count;
        }
      }

      if /*F*/ (length == 0) {
        if (printing___ok) {
          "(length   =   0)".print();
        }

        ending = NIL;
      } else {
        final //
        length__aligned___ok = INT__aligned___ok(
              length,
              alignment.size,
            ),
            block__bytes__count = length__aligned
                .buffer__offset /*
"length__aligned.offset__aligned" can become outdated
  but ".buffer__offset" is valid
  due to "middle"-case's "length -= blocks__bytes__count" */;

        if /*F*/ (length__aligned___ok) {
          if (block__bytes__count != 0) {
            throw "exception";
          }

          ending = NIL;
        } else {
          if (printing___ok) {
            "length__aligned__not".print();
          }

          ending = storage__file__block__single__partial__ending__meta(
            length: block__bytes__count,
          );

          length -= block__bytes__count;
        }
      }

      result = storage__file__accessing__aligned__complex__meta(
        block__id: block__id,
        beginning: beginning,
        middle: middle,
        ending: ending,
      );
    }
  }

  if (length != 0) {
    throw "exception : `($length\length\ ~= 0)`";
  }

  printing__indentation__decrease();

  return result;
}

class storage__file__accessing__aligned__none__meta //
    implements storage__file__accessing__aligned__meta___union {
  const storage__file__accessing__aligned__none__meta();

  @override
  INT blocks__count() {
    return 0;
  }

  @override
  BOOL equal___ok(final storage__file__accessing__aligned__meta___union other) {
    return (other is storage__file__accessing__aligned__none__meta);
  }

  @override
  BOOL operator ==(final Object other) {
    return ((other is storage__file__accessing__aligned__meta___union) && //
        equal___ok(other));
  }
}

class storage__file__accessing__aligned__simple__meta //
    extends
        storage__file__accessing__aligned__meta__base //
    implements storage__file__accessing__aligned__meta___union {
  const storage__file__accessing__aligned__simple__meta({
    required super.block__id,
    required this.value,
  });

  final storage__file__block__single__partial__meta value;

  @override
  INT blocks__count() {
    return 1;
  }

  @override
  BOOL equal___ok(final storage__file__accessing__aligned__meta___union other) {
    return ((other is storage__file__accessing__aligned__simple__meta) && //
        value.equal___ok(other.value));
  }

  @override
  BOOL operator ==(final Object other) {
    return ((other is storage__file__accessing__aligned__meta___union) && //
        equal___ok(other));
  }
}

class storage__file__accessing__aligned__complex__meta //
    extends
        storage__file__accessing__aligned__meta__base //
    implements storage__file__accessing__aligned__meta___union {
  const storage__file__accessing__aligned__complex__meta({
    required super.block__id,
    required this.beginning,
    required this.middle,
    required this.ending,
  });

  final storage__file__block__single__partial__beginning__meta? beginning;
  final storage__file__block__multiple__full__meta? middle;
  final storage__file__block__single__partial__ending__meta? ending;

  @override
  INT blocks__count() {
    var blocks__count = ((beginning != null) /*F*/ ? 1 : 0);

    if (ending != null) {
      blocks__count += 1;
    }

    final middle_1 = middle;

    if /*F*/ (middle_1 == null) {
      return blocks__count;
    }

    return (middle_1.blocks__count + blocks__count);
  }

  @override
  BOOL equal___ok(final storage__file__accessing__aligned__meta___union other) {
    return ((other is storage__file__accessing__aligned__complex__meta) && //
        value__nilable__equal___ok(beginning, other.beginning) && //
        value__nilable__equal___ok(middle, other.middle) && //
        value__nilable__equal___ok(ending, other.ending));
  }

  @override
  BOOL operator ==(final Object other) {
    return ((other is storage__file__accessing__aligned__meta___union) && //
        equal___ok(other));
  }
}

abstract class storage__file__accessing__aligned__meta__base {
  const storage__file__accessing__aligned__meta__base({
    required this.block__id,
  });

  final INT block__id;
}

sealed class storage__file__accessing__aligned__meta___union {
  INT blocks__count();

  BOOL equal___ok(final storage__file__accessing__aligned__meta___union other);
}

//

class storage__file__block__multiple__full__meta //
    implements storage__file__block__meta___union {
  const storage__file__block__multiple__full__meta({
    required this.blocks__count,
  });

  final INT blocks__count;

  @override
  BOOL equal___ok(final storage__file__block__meta___union other) {
    return ((other is storage__file__block__multiple__full__meta) && //
        (blocks__count == other.blocks__count));
  }

  @override
  BOOL operator ==(final Object other) {
    return ((other is storage__file__block__meta___union) && //
        equal___ok(other));
  }
}

class storage__file__block__single__partial__meta //
    implements storage__file__block__meta___union {
  const storage__file__block__single__partial__meta({
    required this.length,
    required this.offset,
  });

  final INT //
  length,
      offset /* in block */;

  @override
  BOOL equal___ok(final storage__file__block__meta___union other) {
    return ((other is storage__file__block__single__partial__meta) && //
        (length == other.length) && //
        (offset == other.offset));
  }

  @override
  BOOL operator ==(final Object other) {
    return ((other is storage__file__block__meta___union) && //
        equal___ok(other));
  }
}

class storage__file__block__single__partial__beginning__meta //
    implements storage__file__block__meta___union {
  const storage__file__block__single__partial__beginning__meta({
    required this.offset,
  });

  final INT offset /* in block */;

  INT length(
    final storage__file__alignment___compo alignment,
  ) {
    return (alignment.size - offset);
  }

  @override
  BOOL equal___ok(final storage__file__block__meta___union other) {
    return ((other is storage__file__block__single__partial__beginning__meta) && //
        (offset == other.offset));
  }

  @override
  BOOL operator ==(final Object other) {
    return ((other is storage__file__block__meta___union) && //
        equal___ok(other));
  }
}

class storage__file__block__single__partial__ending__meta //
    implements storage__file__block__meta___union {
  const storage__file__block__single__partial__ending__meta({
    required this.length,
  });

  final INT length;

  INT offset() {
    return 0;
  }

  @override
  BOOL equal___ok(final storage__file__block__meta___union other) {
    return ((other is storage__file__block__single__partial__ending__meta) && //
        (length == other.length));
  }

  @override
  BOOL operator ==(final Object other) {
    return ((other is storage__file__block__meta___union) && //
        equal___ok(other));
  }
}

sealed class storage__file__block__meta___union {
  BOOL equal___ok(storage__file__block__meta___union other);
}

void storage__file__accessing__auto__test() {
  const //
  generate___ok /*
disable `printing__ok` */ =
          FALSE,
          //
          alignment =
          alignment__modern__normal;

  final //
  length__aligned = alignment.size,
      length__aligned__double = (2 * length__aligned),
      length__aligned__triple = (3 * length__aligned),
      /*length__aligned__quintuple = (5 * length__aligned),
      length__aligned__octuple = (8 * length__aligned),*/
      //
      _expectations /*
formatted after generation */ = <ARRAY<storage__file__accessing__aligned__meta___union>>[
        [
          /* length :0 ,offset :0 ;end :0 */
          storage__file__accessing__aligned__none__meta(),
          /* length :1 ,offset :0 ;end :1 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 0,
            beginning: NIL,
            middle: NIL,
            ending: storage__file__block__single__partial__ending__meta(
              length: 1,
            ),
          ),
          /* length :262143 ,offset :0 ;end :262143 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 0,
            beginning: NIL,
            middle: NIL,
            ending: storage__file__block__single__partial__ending__meta(
              length: 262143,
            ),
          ),
          /* length :262144 ,offset :0 ;end :262144 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 0,
            beginning: NIL,
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 1,
            ),
            ending: NIL,
          ),
          /* length :262145 ,offset :0 ;end :262145 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 0,
            beginning: NIL,
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 1,
            ),
            ending: storage__file__block__single__partial__ending__meta(
              length: 1,
            ),
          ),
          /* length :524287 ,offset :0 ;end :524287 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 0,
            beginning: NIL,
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 1,
            ),
            ending: storage__file__block__single__partial__ending__meta(
              length: 262143,
            ),
          ),
          /* length :524288 ,offset :0 ;end :524288 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 0,
            beginning: NIL,
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 2,
            ),
            ending: NIL,
          ),
          /* length :524289 ,offset :0 ;end :524289 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 0,
            beginning: NIL,
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 2,
            ),
            ending: storage__file__block__single__partial__ending__meta(
              length: 1,
            ),
          ),
          /* length :786431 ,offset :0 ;end :786431 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 0,
            beginning: NIL,
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 2,
            ),
            ending: storage__file__block__single__partial__ending__meta(
              length: 262143,
            ),
          ),
          /* length :786432 ,offset :0 ;end :786432 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 0,
            beginning: NIL,
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 3,
            ),
            ending: NIL,
          ),
          /* length :786433 ,offset :0 ;end :786433 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 0,
            beginning: NIL,
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 3,
            ),
            ending: storage__file__block__single__partial__ending__meta(
              length: 1,
            ),
          ),
        ],
        [
          /* length :0 ,offset :1 ;end :1 */
          storage__file__accessing__aligned__none__meta(),
          /* length :1 ,offset :1 ;end :2 */
          storage__file__accessing__aligned__simple__meta(
            block__id: 0,
            value: storage__file__block__single__partial__meta(
              length: 1,
              offset: 1,
            ),
          ),
          /* length :262143 ,offset :1 ;end :262144 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 0,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 1,
            ),
            middle: NIL,
            ending: NIL,
          ),
          /* length :262144 ,offset :1 ;end :262145 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 0,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 1,
            ),
            middle: NIL,
            ending: storage__file__block__single__partial__ending__meta(
              length: 1,
            ),
          ),
          /* length :262145 ,offset :1 ;end :262146 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 0,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 1,
            ),
            middle: NIL,
            ending: storage__file__block__single__partial__ending__meta(
              length: 2,
            ),
          ),
          /* length :524287 ,offset :1 ;end :524288 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 0,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 1,
            ),
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 1,
            ),
            ending: NIL,
          ),
          /* length :524288 ,offset :1 ;end :524289 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 0,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 1,
            ),
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 1,
            ),
            ending: storage__file__block__single__partial__ending__meta(
              length: 1,
            ),
          ),
          /* length :524289 ,offset :1 ;end :524290 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 0,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 1,
            ),
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 1,
            ),
            ending: storage__file__block__single__partial__ending__meta(
              length: 2,
            ),
          ),
          /* length :786431 ,offset :1 ;end :786432 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 0,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 1,
            ),
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 2,
            ),
            ending: NIL,
          ),
          /* length :786432 ,offset :1 ;end :786433 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 0,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 1,
            ),
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 2,
            ),
            ending: storage__file__block__single__partial__ending__meta(
              length: 1,
            ),
          ),
          /* length :786433 ,offset :1 ;end :786434 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 0,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 1,
            ),
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 2,
            ),
            ending: storage__file__block__single__partial__ending__meta(
              length: 2,
            ),
          ),
        ],
        [
          /* length :0 ,offset :262143 ;end :262143 */
          storage__file__accessing__aligned__none__meta(),
          /* length :1 ,offset :262143 ;end :262144 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 0,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 262143,
            ),
            middle: NIL,
            ending: NIL,
          ),
          /* length :262143 ,offset :262143 ;end :524286 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 0,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 262143,
            ),
            middle: NIL,
            ending: storage__file__block__single__partial__ending__meta(
              length: 262142,
            ),
          ),
          /* length :262144 ,offset :262143 ;end :524287 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 0,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 262143,
            ),
            middle: NIL,
            ending: storage__file__block__single__partial__ending__meta(
              length: 262143,
            ),
          ),
          /* length :262145 ,offset :262143 ;end :524288 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 0,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 262143,
            ),
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 1,
            ),
            ending: NIL,
          ),
          /* length :524287 ,offset :262143 ;end :786430 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 0,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 262143,
            ),
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 1,
            ),
            ending: storage__file__block__single__partial__ending__meta(
              length: 262142,
            ),
          ),
          /* length :524288 ,offset :262143 ;end :786431 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 0,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 262143,
            ),
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 1,
            ),
            ending: storage__file__block__single__partial__ending__meta(
              length: 262143,
            ),
          ),
          /* length :524289 ,offset :262143 ;end :786432 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 0,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 262143,
            ),
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 2,
            ),
            ending: NIL,
          ),
          /* length :786431 ,offset :262143 ;end :1048574 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 0,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 262143,
            ),
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 2,
            ),
            ending: storage__file__block__single__partial__ending__meta(
              length: 262142,
            ),
          ),
          /* length :786432 ,offset :262143 ;end :1048575 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 0,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 262143,
            ),
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 2,
            ),
            ending: storage__file__block__single__partial__ending__meta(
              length: 262143,
            ),
          ),
          /* length :786433 ,offset :262143 ;end :1048576 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 0,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 262143,
            ),
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 3,
            ),
            ending: NIL,
          ),
        ],
        [
          /* length :0 ,offset :262144 ;end :262144 */
          storage__file__accessing__aligned__none__meta(),
          /* length :1 ,offset :262144 ;end :262145 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 1,
            beginning: NIL,
            middle: NIL,
            ending: storage__file__block__single__partial__ending__meta(
              length: 1,
            ),
          ),
          /* length :262143 ,offset :262144 ;end :524287 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 1,
            beginning: NIL,
            middle: NIL,
            ending: storage__file__block__single__partial__ending__meta(
              length: 262143,
            ),
          ),
          /* length :262144 ,offset :262144 ;end :524288 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 1,
            beginning: NIL,
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 1,
            ),
            ending: NIL,
          ),
          /* length :262145 ,offset :262144 ;end :524289 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 1,
            beginning: NIL,
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 1,
            ),
            ending: storage__file__block__single__partial__ending__meta(
              length: 1,
            ),
          ),
          /* length :524287 ,offset :262144 ;end :786431 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 1,
            beginning: NIL,
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 1,
            ),
            ending: storage__file__block__single__partial__ending__meta(
              length: 262143,
            ),
          ),
          /* length :524288 ,offset :262144 ;end :786432 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 1,
            beginning: NIL,
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 2,
            ),
            ending: NIL,
          ),
          /* length :524289 ,offset :262144 ;end :786433 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 1,
            beginning: NIL,
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 2,
            ),
            ending: storage__file__block__single__partial__ending__meta(
              length: 1,
            ),
          ),
          /* length :786431 ,offset :262144 ;end :1048575 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 1,
            beginning: NIL,
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 2,
            ),
            ending: storage__file__block__single__partial__ending__meta(
              length: 262143,
            ),
          ),
          /* length :786432 ,offset :262144 ;end :1048576 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 1,
            beginning: NIL,
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 3,
            ),
            ending: NIL,
          ),
          /* length :786433 ,offset :262144 ;end :1048577 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 1,
            beginning: NIL,
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 3,
            ),
            ending: storage__file__block__single__partial__ending__meta(
              length: 1,
            ),
          ),
        ],
        [
          /* length :0 ,offset :262145 ;end :262145 */
          storage__file__accessing__aligned__none__meta(),
          /* length :1 ,offset :262145 ;end :262146 */
          storage__file__accessing__aligned__simple__meta(
            block__id: 1,
            value: storage__file__block__single__partial__meta(
              length: 1,
              offset: 1,
            ),
          ),
          /* length :262143 ,offset :262145 ;end :524288 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 1,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 1,
            ),
            middle: NIL,
            ending: NIL,
          ),
          /* length :262144 ,offset :262145 ;end :524289 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 1,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 1,
            ),
            middle: NIL,
            ending: storage__file__block__single__partial__ending__meta(
              length: 1,
            ),
          ),
          /* length :262145 ,offset :262145 ;end :524290 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 1,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 1,
            ),
            middle: NIL,
            ending: storage__file__block__single__partial__ending__meta(
              length: 2,
            ),
          ),
          /* length :524287 ,offset :262145 ;end :786432 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 1,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 1,
            ),
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 1,
            ),
            ending: NIL,
          ),
          /* length :524288 ,offset :262145 ;end :786433 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 1,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 1,
            ),
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 1,
            ),
            ending: storage__file__block__single__partial__ending__meta(
              length: 1,
            ),
          ),
          /* length :524289 ,offset :262145 ;end :786434 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 1,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 1,
            ),
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 1,
            ),
            ending: storage__file__block__single__partial__ending__meta(
              length: 2,
            ),
          ),
          /* length :786431 ,offset :262145 ;end :1048576 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 1,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 1,
            ),
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 2,
            ),
            ending: NIL,
          ),
          /* length :786432 ,offset :262145 ;end :1048577 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 1,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 1,
            ),
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 2,
            ),
            ending: storage__file__block__single__partial__ending__meta(
              length: 1,
            ),
          ),
          /* length :786433 ,offset :262145 ;end :1048578 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 1,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 1,
            ),
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 2,
            ),
            ending: storage__file__block__single__partial__ending__meta(
              length: 2,
            ),
          ),
        ],
        [
          /* length :0 ,offset :524287 ;end :524287 */
          storage__file__accessing__aligned__none__meta(),
          /* length :1 ,offset :524287 ;end :524288 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 1,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 262143,
            ),
            middle: NIL,
            ending: NIL,
          ),
          /* length :262143 ,offset :524287 ;end :786430 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 1,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 262143,
            ),
            middle: NIL,
            ending: storage__file__block__single__partial__ending__meta(
              length: 262142,
            ),
          ),
          /* length :262144 ,offset :524287 ;end :786431 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 1,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 262143,
            ),
            middle: NIL,
            ending: storage__file__block__single__partial__ending__meta(
              length: 262143,
            ),
          ),
          /* length :262145 ,offset :524287 ;end :786432 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 1,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 262143,
            ),
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 1,
            ),
            ending: NIL,
          ),
          /* length :524287 ,offset :524287 ;end :1048574 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 1,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 262143,
            ),
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 1,
            ),
            ending: storage__file__block__single__partial__ending__meta(
              length: 262142,
            ),
          ),
          /* length :524288 ,offset :524287 ;end :1048575 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 1,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 262143,
            ),
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 1,
            ),
            ending: storage__file__block__single__partial__ending__meta(
              length: 262143,
            ),
          ),
          /* length :524289 ,offset :524287 ;end :1048576 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 1,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 262143,
            ),
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 2,
            ),
            ending: NIL,
          ),
          /* length :786431 ,offset :524287 ;end :1310718 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 1,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 262143,
            ),
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 2,
            ),
            ending: storage__file__block__single__partial__ending__meta(
              length: 262142,
            ),
          ),
          /* length :786432 ,offset :524287 ;end :1310719 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 1,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 262143,
            ),
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 2,
            ),
            ending: storage__file__block__single__partial__ending__meta(
              length: 262143,
            ),
          ),
          /* length :786433 ,offset :524287 ;end :1310720 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 1,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 262143,
            ),
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 3,
            ),
            ending: NIL,
          ),
        ],
        [
          /* length :0 ,offset :524288 ;end :524288 */
          storage__file__accessing__aligned__none__meta(),
          /* length :1 ,offset :524288 ;end :524289 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 2,
            beginning: NIL,
            middle: NIL,
            ending: storage__file__block__single__partial__ending__meta(
              length: 1,
            ),
          ),
          /* length :262143 ,offset :524288 ;end :786431 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 2,
            beginning: NIL,
            middle: NIL,
            ending: storage__file__block__single__partial__ending__meta(
              length: 262143,
            ),
          ),
          /* length :262144 ,offset :524288 ;end :786432 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 2,
            beginning: NIL,
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 1,
            ),
            ending: NIL,
          ),
          /* length :262145 ,offset :524288 ;end :786433 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 2,
            beginning: NIL,
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 1,
            ),
            ending: storage__file__block__single__partial__ending__meta(
              length: 1,
            ),
          ),
          /* length :524287 ,offset :524288 ;end :1048575 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 2,
            beginning: NIL,
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 1,
            ),
            ending: storage__file__block__single__partial__ending__meta(
              length: 262143,
            ),
          ),
          /* length :524288 ,offset :524288 ;end :1048576 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 2,
            beginning: NIL,
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 2,
            ),
            ending: NIL,
          ),
          /* length :524289 ,offset :524288 ;end :1048577 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 2,
            beginning: NIL,
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 2,
            ),
            ending: storage__file__block__single__partial__ending__meta(
              length: 1,
            ),
          ),
          /* length :786431 ,offset :524288 ;end :1310719 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 2,
            beginning: NIL,
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 2,
            ),
            ending: storage__file__block__single__partial__ending__meta(
              length: 262143,
            ),
          ),
          /* length :786432 ,offset :524288 ;end :1310720 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 2,
            beginning: NIL,
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 3,
            ),
            ending: NIL,
          ),
          /* length :786433 ,offset :524288 ;end :1310721 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 2,
            beginning: NIL,
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 3,
            ),
            ending: storage__file__block__single__partial__ending__meta(
              length: 1,
            ),
          ),
        ],
        [
          /* length :0 ,offset :524289 ;end :524289 */
          storage__file__accessing__aligned__none__meta(),
          /* length :1 ,offset :524289 ;end :524290 */
          storage__file__accessing__aligned__simple__meta(
            block__id: 2,
            value: storage__file__block__single__partial__meta(
              length: 1,
              offset: 1,
            ),
          ),
          /* length :262143 ,offset :524289 ;end :786432 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 2,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 1,
            ),
            middle: NIL,
            ending: NIL,
          ),
          /* length :262144 ,offset :524289 ;end :786433 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 2,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 1,
            ),
            middle: NIL,
            ending: storage__file__block__single__partial__ending__meta(
              length: 1,
            ),
          ),
          /* length :262145 ,offset :524289 ;end :786434 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 2,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 1,
            ),
            middle: NIL,
            ending: storage__file__block__single__partial__ending__meta(
              length: 2,
            ),
          ),
          /* length :524287 ,offset :524289 ;end :1048576 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 2,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 1,
            ),
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 1,
            ),
            ending: NIL,
          ),
          /* length :524288 ,offset :524289 ;end :1048577 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 2,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 1,
            ),
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 1,
            ),
            ending: storage__file__block__single__partial__ending__meta(
              length: 1,
            ),
          ),
          /* length :524289 ,offset :524289 ;end :1048578 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 2,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 1,
            ),
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 1,
            ),
            ending: storage__file__block__single__partial__ending__meta(
              length: 2,
            ),
          ),
          /* length :786431 ,offset :524289 ;end :1310720 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 2,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 1,
            ),
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 2,
            ),
            ending: NIL,
          ),
          /* length :786432 ,offset :524289 ;end :1310721 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 2,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 1,
            ),
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 2,
            ),
            ending: storage__file__block__single__partial__ending__meta(
              length: 1,
            ),
          ),
          /* length :786433 ,offset :524289 ;end :1310722 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 2,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 1,
            ),
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 2,
            ),
            ending: storage__file__block__single__partial__ending__meta(
              length: 2,
            ),
          ),
        ],
        [
          /* length :0 ,offset :786431 ;end :786431 */
          storage__file__accessing__aligned__none__meta(),
          /* length :1 ,offset :786431 ;end :786432 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 2,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 262143,
            ),
            middle: NIL,
            ending: NIL,
          ),
          /* length :262143 ,offset :786431 ;end :1048574 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 2,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 262143,
            ),
            middle: NIL,
            ending: storage__file__block__single__partial__ending__meta(
              length: 262142,
            ),
          ),
          /* length :262144 ,offset :786431 ;end :1048575 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 2,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 262143,
            ),
            middle: NIL,
            ending: storage__file__block__single__partial__ending__meta(
              length: 262143,
            ),
          ),
          /* length :262145 ,offset :786431 ;end :1048576 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 2,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 262143,
            ),
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 1,
            ),
            ending: NIL,
          ),
          /* length :524287 ,offset :786431 ;end :1310718 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 2,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 262143,
            ),
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 1,
            ),
            ending: storage__file__block__single__partial__ending__meta(
              length: 262142,
            ),
          ),
          /* length :524288 ,offset :786431 ;end :1310719 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 2,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 262143,
            ),
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 1,
            ),
            ending: storage__file__block__single__partial__ending__meta(
              length: 262143,
            ),
          ),
          /* length :524289 ,offset :786431 ;end :1310720 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 2,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 262143,
            ),
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 2,
            ),
            ending: NIL,
          ),
          /* length :786431 ,offset :786431 ;end :1572862 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 2,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 262143,
            ),
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 2,
            ),
            ending: storage__file__block__single__partial__ending__meta(
              length: 262142,
            ),
          ),
          /* length :786432 ,offset :786431 ;end :1572863 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 2,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 262143,
            ),
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 2,
            ),
            ending: storage__file__block__single__partial__ending__meta(
              length: 262143,
            ),
          ),
          /* length :786433 ,offset :786431 ;end :1572864 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 2,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 262143,
            ),
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 3,
            ),
            ending: NIL,
          ),
        ],
        [
          /* length :0 ,offset :786432 ;end :786432 */
          storage__file__accessing__aligned__none__meta(),
          /* length :1 ,offset :786432 ;end :786433 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 3,
            beginning: NIL,
            middle: NIL,
            ending: storage__file__block__single__partial__ending__meta(
              length: 1,
            ),
          ),
          /* length :262143 ,offset :786432 ;end :1048575 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 3,
            beginning: NIL,
            middle: NIL,
            ending: storage__file__block__single__partial__ending__meta(
              length: 262143,
            ),
          ),
          /* length :262144 ,offset :786432 ;end :1048576 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 3,
            beginning: NIL,
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 1,
            ),
            ending: NIL,
          ),
          /* length :262145 ,offset :786432 ;end :1048577 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 3,
            beginning: NIL,
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 1,
            ),
            ending: storage__file__block__single__partial__ending__meta(
              length: 1,
            ),
          ),
          /* length :524287 ,offset :786432 ;end :1310719 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 3,
            beginning: NIL,
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 1,
            ),
            ending: storage__file__block__single__partial__ending__meta(
              length: 262143,
            ),
          ),
          /* length :524288 ,offset :786432 ;end :1310720 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 3,
            beginning: NIL,
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 2,
            ),
            ending: NIL,
          ),
          /* length :524289 ,offset :786432 ;end :1310721 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 3,
            beginning: NIL,
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 2,
            ),
            ending: storage__file__block__single__partial__ending__meta(
              length: 1,
            ),
          ),
          /* length :786431 ,offset :786432 ;end :1572863 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 3,
            beginning: NIL,
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 2,
            ),
            ending: storage__file__block__single__partial__ending__meta(
              length: 262143,
            ),
          ),
          /* length :786432 ,offset :786432 ;end :1572864 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 3,
            beginning: NIL,
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 3,
            ),
            ending: NIL,
          ),
          /* length :786433 ,offset :786432 ;end :1572865 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 3,
            beginning: NIL,
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 3,
            ),
            ending: storage__file__block__single__partial__ending__meta(
              length: 1,
            ),
          ),
        ],
        [
          /* length :0 ,offset :786433 ;end :786433 */
          storage__file__accessing__aligned__none__meta(),
          /* length :1 ,offset :786433 ;end :786434 */
          storage__file__accessing__aligned__simple__meta(
            block__id: 3,
            value: storage__file__block__single__partial__meta(
              length: 1,
              offset: 1,
            ),
          ),
          /* length :262143 ,offset :786433 ;end :1048576 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 3,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 1,
            ),
            middle: NIL,
            ending: NIL,
          ),
          /* length :262144 ,offset :786433 ;end :1048577 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 3,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 1,
            ),
            middle: NIL,
            ending: storage__file__block__single__partial__ending__meta(
              length: 1,
            ),
          ),
          /* length :262145 ,offset :786433 ;end :1048578 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 3,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 1,
            ),
            middle: NIL,
            ending: storage__file__block__single__partial__ending__meta(
              length: 2,
            ),
          ),
          /* length :524287 ,offset :786433 ;end :1310720 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 3,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 1,
            ),
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 1,
            ),
            ending: NIL,
          ),
          /* length :524288 ,offset :786433 ;end :1310721 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 3,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 1,
            ),
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 1,
            ),
            ending: storage__file__block__single__partial__ending__meta(
              length: 1,
            ),
          ),
          /* length :524289 ,offset :786433 ;end :1310722 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 3,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 1,
            ),
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 1,
            ),
            ending: storage__file__block__single__partial__ending__meta(
              length: 2,
            ),
          ),
          /* length :786431 ,offset :786433 ;end :1572864 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 3,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 1,
            ),
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 2,
            ),
            ending: NIL,
          ),
          /* length :786432 ,offset :786433 ;end :1572865 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 3,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 1,
            ),
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 2,
            ),
            ending: storage__file__block__single__partial__ending__meta(
              length: 1,
            ),
          ),
          /* length :786433 ,offset :786433 ;end :1572866 */
          storage__file__accessing__aligned__complex__meta(
            block__id: 3,
            beginning: storage__file__block__single__partial__beginning__meta(
              offset: 1,
            ),
            middle: storage__file__block__multiple__full__meta(
              blocks__count: 2,
            ),
            ending: storage__file__block__single__partial__ending__meta(
              length: 2,
            ),
          ),
        ],
      ],
      cases = [
        0,
        1,
        (length__aligned - 1),
        length__aligned,
        (length__aligned + 1),
        (length__aligned__double - 1),
        length__aligned__double,
        (length__aligned__double + 1),
        (length__aligned__triple - 1),
        length__aligned__triple,
        (length__aligned__triple + 1),
        /*(length__aligned__quintuple - 1),
        length__aligned__quintuple,
        (length__aligned__quintuple + 1),
        (length__aligned__octuple - 1),
        length__aligned__octuple,
        (length__aligned__octuple + 1),*/
      ];

  if (generate___ok) {
    "const _expectations = <ARRAY<storage__file__accessing__aligned__meta___union>>[".print___raw();
  }

  ARRAY__generated(
    cases.elements__count,
    (final offset__id) {
      return ARRAY__generated(
        cases.elements__count,
        (final length__id) {
          return (
            length: cases[length__id],
            offset: cases[offset__id],
          );
        },
      );
    },
  ).iterate__basic(
    (final offset__id, final e) {
      if (generate___ok) {
        "[".print___raw();
      }

      e.iterate__basic(
        (final length__id, final e) {
          final file__accessing = storage__file__accessing__auto(
            alignment: alignment,
            length: e.length,
            offset: e.offset,
          );

          if (generate___ok) {
            final string text__segment = "/* length :${e.length} ,offset :${e.offset} ;end :${e.length + e.offset} */\n";

            (switch (file__accessing) {
              storage__file__accessing__aligned__none__meta() => //
              "${text__segment}base__storage__file__accessing__aligned__none__meta(),",
              storage__file__accessing__aligned__simple__meta() => //
              "${text__segment}base__storage__file__accessing__aligned__simple__meta(block__id:${file__accessing.block__id},value:base__storage__file__block__single__partial__meta(length:${file__accessing.value.length},offset:${file__accessing.value.offset},),),",
              storage__file__accessing__aligned__complex__meta() => //
              "${text__segment}base__storage__file__accessing__aligned__complex__meta(block__id:${file__accessing.block__id},beginning:${file__accessing.beginning.convert__if((final beginning) => "storage__file__block__single__partial__beginning__meta(offset:${beginning.offset},)") ?? Null__value__text},middle:${file__accessing.middle.convert__if((final middle) => "storage__file__block__multiple__full__meta(blocks__count:${middle.blocks__count},)") ?? Null__value__text},ending:${file__accessing.ending.convert__if((final ending) => "storage__file__block__single__partial__ending__meta(length:${ending.length},)") ?? Null__value__text},),",
            }).print___raw();
          } else {
            switch (file__accessing) {
              case storage__file__accessing__aligned__none__meta():
                {
                  if (e.length != 0) {
                    throw "$offset__id.$length__id : expected empty length";
                  }
                }
                break;
              case storage__file__accessing__aligned__simple__meta():
                {
                  if (file__accessing.value.length != e.length) {
                    throw "$offset__id.$length__id : ${file__accessing.value.length}\\file__accessing.value.length\\ is not equal to ${e.length}\\e.length\\";
                  }
                }
                break;
              case storage__file__accessing__aligned__complex__meta():
                {
                  var length__total = (file__accessing.beginning?.length(alignment) ?? 0);

                  {
                    final middle = file__accessing.middle;

                    if (middle != null) {
                      length__total += (middle.blocks__count * alignment.size);
                    }
                  }

                  {
                    final ending = file__accessing.ending;

                    if (ending != null) {
                      length__total += ending.length;
                    }
                  }

                  if (length__total != e.length) {
                    throw "$offset__id.$length__id : $length__total\\length__total\\ is not equal to ${e.length}\\e.length\\";
                  }
                }
                break;
            }

            {
              final expectation = _expectations[offset__id][length__id];

              if (file__accessing.equal___ok(expectation)) {
                "$offset__id.$length__id : OK".print();
              } else {
                throw "$offset__id.$length__id : $file__accessing ~= $expectation";
              }
            }
          }
        },
      );

      if (generate___ok) {
        "],".print___raw();
      }
    },
  );

  if (generate___ok) {
    "];".print___raw();
  }
}/*
FIX
  - test with "offset : 100 ; till/length : 1000 ; alignment : 512"
    edge-case suggested by gemini-2.5-pro */
