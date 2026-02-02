import "dart:typed_data";

import "base/lib/_/_.dart";

class LinkedList {
  LinkedList();

  int _position = 0;
  final List<int> _list = <int>[];

  int? getElement() {
    if (_position == _list.length) {
      return  null;
    }

    return _list[_position++];
  }

  int getElementCount() {
    return _list.length;
  }

  void add(final int i) {
    _list.add(i);
  }

  void reSetPosition() {
    _position = 0;
  }

  @override
  string toString() {
    return _list.toString();
  }
}

class EnCodedString {
  const EnCodedString(
    this.charCodes,
  );

  final Uint8List charCodes;

  int get charCount {
    return charCodes.length;
  }

  @override
  string toString() {
    return charCodes.toString();
  }
}

const int BUCKET_COUNT = Ascii.CHAR_CODE_COUNT;

List<LinkedList> arrangeStrings(
  final List<EnCodedString> strings, [
  final int charCounter = 0,
]) {
  final List<LinkedList> result = List<LinkedList>.generate(BUCKET_COUNT, (_) {
    return LinkedList();
  }, growable: FALSE);

  final int stringCount = strings.length;
  for (int stringCounter = 0; stringCounter < stringCount; stringCounter += 1) {
    strings[stringCounter].charCodes.representation__text().print("arrangeStrings:strings[$stringCounter]");

    result[strings[stringCounter].charCodes[charCounter]].add(stringCounter /** stringId */);
  }

  return result;
}

List<LinkedList>? reArrangeStrings(
  final List<EnCodedString> strings,
  final LinkedList unSortedStrings,
  final int charCounter,
  final LinkedList sortedStrings,
) {
  final List<LinkedList> buckets = List<LinkedList>.generate(BUCKET_COUNT, (_) {
    return LinkedList();
  }, growable: FALSE);

  unSortedStrings.reSetPosition();

  BOOL isSorted = TRUE;

  int? stringId;
  while ((stringId = unSortedStrings.getElement()) !=  null) {
    stringId.representation__text().print("reArrangeStrings:stringId");

    final EnCodedString string = strings[stringId!];

    if (charCounter < text.charCount) {
      buckets[string.charCodes[charCounter]].add(stringId);

      if (isSorted) {
        isSorted = FALSE;
      }

      print__info("reArrangeStrings: adding to `buckets[${text.charCodes[charCounter]}]`");
    } else {
      sortedStrings.add(stringId);

      print__info("reArrangeStrings: adding to `sortedStrings`");
    }
  }

  buckets.representation__text().print("reArrangeStrings:buckets");

  return (isSorted ?  null : buckets);
}

void reCursor(
  final List<EnCodedString> strings,
  final List<LinkedList> buckets,
  final int charCounter,
  final LinkedList sortedStrings,
) {
  charCounter.representation__text().print("reCursor:charCounter");

  for (int bucketCounter = 0; bucketCounter < BUCKET_COUNT; bucketCounter += 1) {
    bucketCounter.representation__text().print("reCursor:bucketCounter");

    final List<LinkedList>? partiallySortedStrings = reArrangeStrings(
      strings,
      buckets[bucketCounter],
      charCounter,
      sortedStrings,
    )..representation__text().print("reCursor:partiallySortedStrings");

    if (partiallySortedStrings !=  null) {
      reCursor(
        strings,
        partiallySortedStrings,
        (charCounter + 1),
        sortedStrings,
      );
    } else {
      print__info("reCursor: `buckets[$bucketCounter]` isSorted.");
      sortedStrings.representation__text().print("sortedStrings");
    }
  }
}

/*List<string> sort(
  final List<string> strings,
) {
  final int stringCount;

  final List<EnCodedString> enCodedStrings = List<EnCodedString>.generate((stringCount = strings.length), (final int i) {
    return EnCodedString(str__ascii__convert__asciiAndDelimit(strings[i]));
  }, growable: FALSE);

  final List<string> result = List<string>.filled(stringCount, emptyString);

  final List<LinkedList> arrangement = arrangeStrings(enCodedStrings);

  for (int i = 0; i < MAX_CHAR_CODE; i += 1) {
    final List<LinkedList>? _arrangement = reArrangeStrings(enCodedStrings, arrangement[i], 1);
  }

  return result;
}*/

void main() {
  const List<string> strings = <string>[
    "abc",
    "aac",
    "acc",
    "aab",
    "xyz",
  ];

  final List<EnCodedString> enCodedStrings = List<EnCodedString>.generate(strings.length, (final int i) {
    return EnCodedString(str__ascii__convert__ascii(strings[i]));
  }, growable: FALSE);

  final LinkedList sortedStrings = LinkedList();

  reCursor(
    enCodedStrings,
    arrangeStrings(enCodedStrings)..representation__text().print("arrangeStrings(enCodedStrings)"),
    1,
    sortedStrings,
  );

  strings.length.representation__text().print("strings.length");
  int stringCounter = 0;
  strings.forEach((final string string) {
    text.representation__text().print("strings[${stringCounter++}]");
  });

  sortedStrings.getElementCount().representation__text().print("sortedStrings.getElementCount()");
  sortedStrings._list.forEach((final int stringId) {
    ascii__convert__str__ascii(enCodedStrings[stringId].charCodes).representation__text().print("strings[$stringId]");
  });

  if (sortedStrings.getElementCount() == enCodedStrings.length) {
    print__info("isSorted.");
  }
}
