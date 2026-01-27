part of "_.dart";

typedef VENDING<element___type> = Iterable<element___type>;

typedef VENDING__SESSION /*
  respective "VENDING"'s snap-shot ,at the time */ <element___type> = Iterator<element___type>;

extension VENDING___extension<element___type> //
    on VENDING<element___type> {
  VENDING<element__new___type> //
  /*bundle*/ fuse /*
    - excessive elements of {either "this" ,or "other"} are ignored
    - example
      - [[0 ,5] ,[1 ,6] ,[2 ,7]]
        <- [0 ,1 ,2 ,3] .fuse [5 ,6 ,7]
        <- [0 ,1 ,2] .fuse [5 ,6 ,7 ,8]
        <- [0 ,1 ,2] .fuse [5 ,6 ,7]
    - "de_fuse" is not supported */ <element__new___type, element__other___type> //
  (
    final VENDING<element__other___type> other,
    final element__new___type Function(element___type, element__other___type) operate,
  ) sync* {
    final //
    session = this.iterator,
        session__other = other.iterator;

    if (session.moveNext().NOT || //
        session__other.moveNext().NOT) {
      return;
    }

    do {
      yield operate(
        session.current,
        session__other.current,
      );
    } while (session.moveNext() && //
        session__other.moveNext());
  }

  VENDING<element__new___type> //
  convert__recursive /*
  - test : {
      print([1, 2, 3, 4, 5].convert__recursive((e, p) => (e, switch (p) { present() => p.value.toString(), absent() => "-" })).convert__array());
    } -> {
      [(1, -), (2, 1), (3, 2), (4, 3), (5, 4)]
    } */ <element__new___type> //
  (
    final element__new___type Function(
      element___type current,
      base__value__optional___union<element___type> previous /*
      absent only for the first invocation/iteration
        otherwise always present */,
    )
    operate,
  ) sync* {
    final session = this.iterator;

    if (session.moveNext().NOT) {
      return;
    }

    base__value__optional___union<element___type> previous = base__value__optional__absent__compo<element___type>();

    do {
      final e = session.current;

      yield operate(e, previous);

      previous = base__value__optional__present__compo<element___type>(e);
    } while (session.moveNext());
  }

  VENDING<element__new___type> //
  convert__enumerated /*
  - test : {
      print([1, 2, 3, 4, 5].convert__enumerated((e, i) => (e, i)).convert__array());
    } -> {
      [(1, 0), (2, 1), (3, 2), (4, 3), (5, 4)]
    } */ <element__new___type> //
  (final element__new___type Function(element___type, INT) operate) sync* {
    final session = this.iterator;

    if (session.moveNext().NOT) {
      return;
    }

    INT i = 0;

    do {
      yield operate(session.current, i);

      i += 1;
    } while (session.moveNext());
  }

  VENDING<element__new__type> //
  convert<element__new__type> //
  (final element__new__type Function(element___type) operate) {
    return map<element__new__type>(operate);
  }

  ARRAY<element___type> //
  convert__array() {
    return toList(growable: FALSE);
  }

  VENDING<element___type> //
  select //
  (final BOOL Function(element___type) operate) {
    return where(operate);
  }

  BOOL empty___ok() {
    return isEmpty;
  }
}

VENDING<element___type> base__elements__generate<element___type>(
  final INT elements__count /*
excluding "separation"s */,
  final element___type separation,
  final element___type Function(INT element__id) element,
) sync* {
  if (elements__count < 0) {
    throw "exception : in-valid \"elements__count\"(${elements__count})";
  }

  if (elements__count == 0) {
    return;
  }

  final elements__separated__generation = base__array__elements__separated__generation__meta___compo(
    elements__count: elements__count,
  );

  for (
    var element__id__adjusted = 0; //
    element__id__adjusted < elements__separated__generation.elements__count__adjusted; //
    element__id__adjusted += 1
  ) {
    final element__id = elements__separated__generation.element__id(
      element__id__adjusted: element__id__adjusted,
    );
    if (element__id == null) {
      yield separation;

      continue;
    }

    yield element(element__id);
  }
}

VENDING<element___type> base__elements__generate__definitive /*
- usage : {
    const //
        radius__outer = 16.0,
        radius__inner = 8.0;
  
    if (first___ok && last___ok) {
      return BorderRadius.all(Radius.circular(12));
    }
  
    if (first___ok) {
      return BorderRadius.vertical(
        top: Radius.circular(radius__outer),
        bottom: Radius.circular(radius__inner),
      );
    }
  
    if (last___ok) {
      return BorderRadius.vertical(
        top: Radius.circular(radius__inner),
        bottom: Radius.circular(radius__outer),
      );
    }
  
    return BorderRadius.all(Radius.circular(radius__inner));
  }
- testing : {
    const separation__leading__and__elements = 111;

    const separation__elements = 11111;

    const leading = 123;

    (INT, string, string) element(
      INT i,
      BOOL first___ok,
      BOOL last___ok,
    ) {
      return (
        i,
        (first___ok ? "FIRST" : "-"),
        (last___ok ? "LAST" : "-"),
      );
    }

    print(base__elements__generate__definitive(elements__count: 5, separation__leading__and__elements: separation__leading__and__elements, separation__elements: separation__elements, leading: leading, element: element).convert__array());
    print(base__elements__generate__definitive(elements__count: 4, separation__leading__and__elements: separation__leading__and__elements, separation__elements: separation__elements, leading: leading, element: element).convert__array());
    print(base__elements__generate__definitive(elements__count: 3, separation__leading__and__elements: separation__leading__and__elements, separation__elements: separation__elements, leading: leading, element: element).convert__array());
    print(base__elements__generate__definitive(elements__count: 2, separation__leading__and__elements: separation__leading__and__elements, separation__elements: separation__elements, leading: leading, element: element).convert__array());
    print(base__elements__generate__definitive(elements__count: 1, separation__leading__and__elements: separation__leading__and__elements, separation__elements: separation__elements, leading: leading, element: element).convert__array());
    print(base__elements__generate__definitive(elements__count: 0, separation__leading__and__elements: separation__leading__and__elements, separation__elements: separation__elements, leading: leading, element: element).convert__array());
    print(base__elements__generate__definitive(elements__count: -1, separation__leading__and__elements: separation__leading__and__elements, separation__elements: separation__elements, leading: leading, element: element).convert__array());
  } -> {
    [123, 111, (0, FIRST, -), 11111, (1, -, -), 11111, (2, -, -), 11111, (3, -, -), 11111, (4, -, LAST)]
    [123, 111, (0, FIRST, -), 11111, (1, -, -), 11111, (2, -, -), 11111, (3, -, LAST)]
    [123, 111, (0, FIRST, -), 11111, (1, -, -), 11111, (2, -, LAST)]
    [123, 111, (0, FIRST, -), 11111, (1, -, LAST)]
    [123, 111, (0, FIRST, LAST)]
    [123]
  } */ <element___type>({
  required final INT elements__count /*
excluding {".title" ,".separation__title__and__element" ,and ".elements__separation"} */,
  final element___type? separation__leading__and__elements,
  required final element___type separation__elements,
  required final element___type leading,
  required final element___type Function(INT element__id, BOOL first___ok, BOOL last___ok) element /*
first/last elements do not have separate generation proc.s
  because an element can be both {first and last} ,if its the only element */,
}) sync* {
  if (elements__count < 0) {
    throw "exception : in-valid \"elements__count\"(${elements__count})";
  }

  if (elements__count == 0) {
    yield leading;

    return;
  }

  final separation__leading__and__elements_1 = (separation__leading__and__elements ?? separation__elements);

  yield leading;
  yield separation__leading__and__elements_1;

  if (elements__count == 1) {
    yield element(0, TRUE, TRUE);

    return;
  }

  yield element(0, TRUE, FALSE);
  yield separation__elements;

  if (elements__count == 2) {
    yield element(1, FALSE, TRUE);

    return;
  }

  /* 3+ elements : */

  {
    final elements__count_1 =
        (elements__count -
        2 /*
      adjusting for the {first ,and last} elements ,which are handled separately */ );

    for (var i = 0; i < elements__count_1; i += 1) {
      yield element(
        (i +
            1 /*
        to offset the first-element */ ),
        FALSE,
        FALSE,
      );

      yield separation__elements;
    }
  }

  yield element((elements__count - 1), FALSE, TRUE);
}
