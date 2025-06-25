part of "../../_.dart";

typedef NISI /* infinite */ = BigInt;

extension NISI__extension on NISI {
  BOOL value__zero___ok() {
    return ((bitLength == 0) && isNegative.not);
  }

  NISI endian__little__convert__endian__big({
    required final NI digits__count,
    final NI digit__width = 1,
  }) {
    var //
        source = this,
        mask = ((NISI.one << digit__width) - NISI.one),
        destination = NISI.zero;

    base__iterate__reverse__basic(
      digits__count,
      (final _) {
        final source__1 = (source & mask);
        if (source__1 != NISI.zero) {
          destination = ((destination << digit__width) | source__1);
        } else {
          destination <<= digit__width;
        }

        source >>= digit__width;
      },
    );

    return destination;
  }
}
