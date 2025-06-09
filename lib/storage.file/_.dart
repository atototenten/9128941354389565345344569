import "package:base/base/_.dart";

part "accessing.dart";
part "caching.dart";
part "memory.dart";
part "memory.simple.dart";
part "basic.protocol.dart";

const //
    base__storage__file__path__separation__char /* must not change ,because ,is universal and heavily hard-coded */ = char__slash__forward;

typedef base__storage__file__blocks /*
each and every block' `.bytes__count` must be equal */
    = array<base__storage__file__block>;

class base__storage__file__block /*
required to allow single-copy and mandate alignment */
{
  const base__storage__file__block(
    this.value__raw,
  );

  final byte__array value__raw;

  byte__array /*
im-mutable and partial view
  of the storage block */
      value() {
    return value__raw.asUnmodifiableView();
  }
}

extension file__segment__array__joining__extension //
    on base__storage__file__blocks {
  byte__array /*
with ownership */
      convert__byte__array() {
    if (empty__ok()) {
      return empty__byte__array;
    }

    final //
        block__size = first.value__raw.bytes__count,
        result = byte__array(
          (elements__count * block__size),
        );

    var result__offset = 0;

    iterate__basic(
      (final i, final e) {
        base__copy(
          result,
          e.value__raw,
          count: block__size,
          dest__offset: result__offset,
        );

        result__offset += block__size;
      },
    );

    return result;
  }
}

string__raw file__path__convert__name(
  final string__raw file__path,
) {
  final char__id = text__search(
    file__path,
    base__storage__file__path__separation__char,
    reverse__ok: OK,
  );

  if (char__id == null) {
    throw "'$base__storage__file__path__separation__char' is not present in \"$file__path\"(file:path)";
  }

  return file__path.substring(
    (1 + char__id),
  );
}

string__raw file__name__convert__extension(
  final string__raw file__name,
) {
  final char__id = text__search(
    file__name,
    char__dot,
    reverse__ok: OK,
  );

  if (char__id == null) {
    return empty__text;
  }

  return file__name.substring(
    (1 + char__id),
  );
}

typedef base__storage__file__alignment___compo = ({
  NIMR shift__count,
  NIMR size,
});

const base__storage__file__alignment___compo //
    alignment__mem = (shift__count: 3, size: NI8__size),
    alignment__disk = (shift__count: 9, size: 512),
    alignment__flash = (shift__count: 12, size /* alignment */ : 4096),
    alignment__modern__normal /* 256 k. */ = (shift__count: 18, size: (256 * 1024)),
    base__storage__file__block__size /*
  `.size`
    SHOULD NOT change
    SHOULD be `>= (2 * data__base__position__size)`
    MUST be `>= data__base__position__size` */
    = alignment__flash;

typedef io__operation__read_write__function__format = void Function(
  BS1__array buffer,
  NIMR count,
  NIMR offset,
);

({
  NIMR offset__aligned,
  NIMR buffer__offset /* `__un_aligned` */,
}) base__storage__file__offset__aligned(
  final NIMR offset,
  final base__storage__file__alignment___compo block__meta,
) {
  final offset__aligned = NI__aligned(
    offset,
    block__meta.size,
    block__meta.shift__count,
  );

  return (
    offset__aligned: offset__aligned.value__aligned,
    buffer__offset: offset__aligned.remainder__un_aligned,
  );
}

NIMR base__storage__file__count__max /*
  equivalent of `storage__offset__aligned`, despite the in-appropriate name
  not `__aligned` because `count` is not aligned, but `(count +1)`, to get upper-limit, which is max, actually necessary */
    (
  final NIMR count,
  final NIMR buffer__offset, [
  final base__storage__file__alignment___compo block__size = base__storage__file__block__size,
]) {
  if (count == 0) //
    return 0;

  if (base__NI__aligned__ok(
    count,
    block__size.size,
  )) {
    return count;
  }

  return NI__aligned__basic(
    ((count + buffer__offset) /* reasoning available */ /* TASK: understand, then FIX, if any */ + block__size.size),
    block__size.shift__count,
  );
} /*
  reasons:
    `(count += buffer__offset)`:
      let `uu bk_sz/* block__size */ = 4096, count = 7000, offset = 14000;`
        hence `uu offset__aligned = (3 * bk_sz), count__max = (2 * bk_sz), offset__new = (5 * bk_sz)/* (count__max + offset__aligned) */;`
          which is in-correct; because `offset__new` should be `21000`, instead of `20480`(5 * bk_sz) */

void base__storage__file__io__check__aligned(
  final NIMR count,
  final NIMR offset,
  final base__storage__file__alignment___compo alignment,
) {
  if (base__printing__ok) {
    base__function__call__print(
      "storage__io__check__aligned",
    );

    count.text__representation().print("count");
    offset.text__representation().print("offset");
    alignment.size.text__representation().print("alignment__size");
  }

  if (base__NI__aligned__ok(count, alignment.size).not) {
    throw "`count` is NOT aligned";
  }

  if (base__NI__aligned__ok(offset, alignment.size).not) {
    throw "`offset` is NOT aligned";
  }
}
