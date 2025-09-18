part of "../../_.dart";

class base__number__binary__max /*
more patterns : `
1 | 2   -> 3   ->   (4 - 1)
2 | 4   -> 6   ->   (8 - 2)
4 | 8   -> 12   ->   (16 - 4)
8 | 16   -> 24   ->   (32 - 8)
1 | 2 | 4   -> 7   ->   (8 - 1)
1 | 2 | 4 | 8   ->   15   ->   (16 - 1)
1 | 2 | 4 | 8 | 16   ->   31   ->   (32 - 1)` */
{
  const base__number__binary__max(
    this.value,
  );

  final INT value;

  base__number__binary__max //
      add(
    final INT amount,
  ) {
    return base__number__binary__max(
      (value + amount),
    );
  }

  base__number__binary__max //
      subtract(
    final INT amount,
  ) {
    return base__number__binary__max(
      (value - amount),
    );
  }

  base__number__binary__max //
      multiply(
    final INT amount,
  ) {
    return base__number__binary__max(
      (value << amount),
    );
  }

  base__number__binary__max //
      divide(
    final INT amount,
  ) {
    return base__number__binary__max(
      (value >> amount),
    );
  }

  base__number__binary__max //
      remainder(
    final INT amount,
  ) {
    return base__number__binary__max(
      (value & amount),
    );
  }
}
