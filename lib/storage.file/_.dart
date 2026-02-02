import "package:foundation/core/_.dart";

part "accessing.dart";
part "caching.dart";
part "memory.dart";
part "memory.simple.dart";
part "basic.protocol.dart";

const //
    storage__file__path__separation__char /* must not change ,because ,is universal and heavily hard-coded */ = char__slash__forward;

typedef storage__file__blocks /*
each and every block' `.bytes__count` must be equal */
    = ARRAY<storage__file__block>;

class storage__file__block /*
required to allow single-copy and mandate alignment */
{
  const storage__file__block(
    this.value___raw,
  );

  final byte__array value___raw;

  byte__array /*
im-mutable and partial view
  of the storage block */
      value() {
    return value___raw.asUnmodifiableView();
  }
}

extension file__segment__array__joining__extension //
    on storage__file__blocks {
  byte__array /*
with ownership */
      convert__byte__array() {
    if (empty___ok()) {
      return empty__byte__array;
    }

    final //
        block__size = first.value___raw.bytes__count,
        result = byte__array(
          (elements__count * block__size),
        );

    var result__offset = 0;

    iterate__basic(
      (final i, final e) {
        copy(
          result,
          e.value___raw,
          count: block__size,
          dest__offset: result__offset,
        );

        result__offset += block__size;
      },
    );

    return result;
  }
}

string file__path__convert__name(
  final string file__path,
) {
  final char__id = text__search(
    file__path,
    storage__file__path__separation__char,
    reverse___ok: TRUE,
  );

  if (char__id == null) {
    throw "'$storage__file__path__separation__char' is not present in \"$file__path\"(file:path)";
  }

  return file__path.substring(
    (1 + char__id),
  );
}

string file__name__convert__extension(
  final string file__name,
) {
  final char__id = text__search(
    file__name,
    chars__dot___string,
    reverse___ok: TRUE,
  );

  if (char__id == null) {
    return empty___string;
  }

  return file__name.substring(
    (1 + char__id),
  );
}

typedef storage__file__alignment___compo = ({
  INT shift__count,
  INT size,
});

const storage__file__alignment___compo //
    alignment__mem = (shift__count: 3, size: INT__8__size),
    alignment__disk = (shift__count: 9, size: 512),
    alignment__flash = (shift__count: 12, size /* alignment */ : 4096),
    alignment__modern__normal /* 256 k. */ = (shift__count: 18, size: (256 * 1024)),
    storage__file__block__size /*
  `.size`
    SHOULD NOT change
    SHOULD be `>= (2 * data__base__position__size)`
    MUST be `>= data__base__position__size` */
    = alignment__flash;

typedef io__operation__read_write__function__format = void Function(
  BS1__array buffer,
  INT count,
  INT offset,
);

({
  INT offset__aligned,
  INT buffer__offset /* `__un_aligned` */,
}) storage__file__offset__aligned(
  final INT offset,
  final storage__file__alignment___compo block__meta,
) {
  final offset__aligned = INT__aligned(
    offset,
    block__meta.size,
    block__meta.shift__count,
  );

  return (
    offset__aligned: offset__aligned.value__aligned,
    buffer__offset: offset__aligned.remainder__un_aligned,
  );
}

INT storage__file__count__max /*
  equivalent of `storage__offset__aligned`, despite the in-appropriate name
  not `__aligned` because `count` is not aligned, but `(count +1)`, to get upper-limit, which is max, actually necessary */
    (
  final INT count,
  final INT buffer__offset, [
  final storage__file__alignment___compo block__size = storage__file__block__size,
]) {
  if (count == 0) //
    return 0;

  if (INT__aligned___ok(
    count,
    block__size.size,
  )) {
    return count;
  }

  return INT__aligned__basic(
    ((count + buffer__offset) /* reasoning available */ /* TASK: understand, then FIX, if any */ + block__size.size),
    block__size.shift__count,
  );
} /*
  reasons:
    `(count += buffer__offset)`:
      let `uu bk_sz/* block__size */ = 4096, count = 7000, offset = 14000;`
        hence `uu offset__aligned = (3 * bk_sz), count__max = (2 * bk_sz), offset__new = (5 * bk_sz)/* (count__max + offset__aligned) */;`
          which is in-correct; because `offset__new` should be `21000`, instead of `20480`(5 * bk_sz) */

void storage__file__io__check__aligned(
  final INT count,
  final INT offset,
  final storage__file__alignment___compo alignment,
) {
  if (printing___ok) {
    function__call__print(
      "storage__io__check__aligned",
    );

    count.representation__text().print("count");
    offset.representation__text().print("offset");
    alignment.size.representation__text().print("alignment__size");
  }

  if (INT__aligned___ok(count, alignment.size).NOT) {
    throw "`count` is NOT aligned";
  }

  if (INT__aligned___ok(offset, alignment.size).NOT) {
    throw "`offset` is NOT aligned";
  }
}
