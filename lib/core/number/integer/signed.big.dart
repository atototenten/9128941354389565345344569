part of "../../_.dart";

typedef INT__NEG__BIG /* infinite */ = BigInt;

extension INT__NEG__BIG__extension on INT__NEG__BIG {
  BOOL value__zero___ok() {
    return ((bitLength == 0) && isNegative.NOT);
  }

  INT__NEG__BIG endian__little__convert__endian__big({
    required final INT digits__count,
    final INT digit__width = 1,
  }) {
    var //
    source = this,
        mask = ((INT__NEG__BIG.one << digit__width) - INT__NEG__BIG.one),
        destination = INT__NEG__BIG.zero;

    iterate__reverse(
      digits__count,
      (_) {
        final source__1 = (source & mask);
        if (source__1 != INT__NEG__BIG.zero) {
          destination = ((destination << digit__width) | source__1);
        } else {
          destination <<= digit__width;
        }

        source >>= digit__width;

        return TRUE;
      },
    );

    return destination;
  }
}
