part of "_.dart";

typedef dictionary /*
terminology
  dictionary is preferred over map
    ,because
      the latter feels like a graph-of-points(due to geographical-graph ,of locations) ,or one-to-many relation ,which is completely in-correct
        ,while the former feels like a one-to-one(specifically word-to-sentence) relation ,which are both correct
          ,because an integer(key's hash) is a word ,while a composite(a collection of words) is a sentence
      `map` is an well-established and conventional name for element-conversion function ,in most of the relevant-lang.s
  associative-array is fundamentally defective ,due to not being contiguous
  table is in-correct ,because its not merely key-value ,but any number of columns
  object is possibly correct ,but has a very different meaning in relevant lang.s ,and is un-related to the english meaning */
    <key__type, value__type>
    = //
    Map<key__type, value__type>;

dictionary<key__type, value__type> //
    dictionary__generate //
    <key__type, value__type>(
  final NI count,
  final ({
    key__type key,
    value__type value,
  })
          Function(NI)
      generate,
) {
  final result = <key__type, value__type>{};

  base__iterate__basic(count, (final i) {
    final kv = generate(i);
    result[kv.key] = kv.value;
  });

  return result;
}

extension dictionary__extension<key__type, value__type> //
    on dictionary<key__type, value__type> {
  NI get elements__count => //
      length;

  BOOL empty___ok() => //
      (this.elements__count == 0);

  BOOL empty__not() => //
      (this.elements__count != 0);
}
