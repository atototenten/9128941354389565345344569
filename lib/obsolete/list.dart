import "../_.dart";
import "../char.dart";

class _list__element__kampo<T> {
  _list__element__kampo(
    this.value, [
    this.next,
  ]);

  final T value;
  _list__element__kampo<T>? next;
}

//typedef list__element__old__kampo<T> = _list__element__kampo<T>;

class list__old__kampo<T> {
  list__old__kampo();

  uu count = 0;

  _list__element__kampo<T>? //
      first,
      last;

  bool empty___ok() => //
      (count == 0);

  void flush() {
    first = last =  null;
    count = 0;
  }

  void add(final T value) {
    final _list__element__kampo<T>? last_ = last;

    last = ((last_ !=  null) //
        ? last_.next = _list__element__kampo<T>(value)
        : first = _list__element__kampo<T>(value));

    count += 1;
  }

  void iterate(final bool Function(T element) function) {
    _list__element__kampo<T>? iterator = first;

    while (iterator !=  null) {
      if (!(function(iterator.value))) {
        break;
      }

      iterator = iterator.next;
    }
  }

  void iterate__basic(final void Function(T element) function) => //
      iterate((final T element) {
        function(element);
        return TRUE;
      });

  /*T? contained(final bool Function(T element) b__check) {
    T? result;

    this.iterate((final element_)
        /*=> ((element_ != element) || !(result = OK)));*/
        {
      if (b__check(element_)) {
        result = element_;
        return FALSE;
      }

      return TRUE;
    });

    return result;
  }

  bool b__contained(final bool Function(T element) b__check) => //
      (contained(b__check) !=  null);*/

  bool b__contained(
    final T element,
  ) {
    bool result = FALSE;

    this.iterate((final element_) => //
        ((element_ != element) || !(result = OK)));

    return result;
  }

  void remove(
    final T value,
  ) /*
  TASK
    consider simplification */
  {
    _list__element__kampo<T>? //
        iterator = first,
        previous;

    while ((iterator !=  null) && //
        (iterator.value != value)) {
      previous = iterator;
      iterator = iterator.next;
    }

    //iterator?.value.hashCode.representation__text().print("iter");

    if (iterator !=  null) /* `value` is contained; checked because, the `next` of last element is also `null`. */ {
      if (previous !=  null) /* element holding `value`, is neither the first(`== first`), nor the only element. */ {
        previous.next = iterator /* contains `value`. */ .next;

        final last_ = last;
        if ((last_ !=  null) && //
            (last_.value == value)) /* `value`'s element is the last element. */ {
          last = previous;
        }
      } else {
        if ((iterator = iterator.next) ==  null) /* `value`'s element is the only element. */ {
          last =  null;
        }

        first = iterator;
      }

      count -= 1;
    }
  }

  ARRAY<T> convert__array([
    final bool b__growable = FALSE,
  ]) {
    final result = ARRAY<T?>.filled(
      count,
       null,
      growable: FALSE,
    );

    {
      uu i = 0;
      this.iterate((final element) {
        result[i++] = element;
        return TRUE;
      });
    }

    return ARRAY<T>.generate(
      count,
      (final i) => result[i]!,
      growable: b__growable,
    );
  }

  string convert__string([
    final bool b_verbose = FALSE,
  ]) {
    final buffer = StringBuffer("count: ") //
      ..write(count);

    if (b_verbose) {
      buffer
        ..write(", first: ")
        ..write(first?.value.hashCode)
        ..write(", last: ")
        ..write(last?.value.hashCode)
        ..write("; elements: ");

      if (empty___ok) //
        buffer.write(null);
      else {
        buffer.write('{');

        uu iter = 0;
        iterate__basic((final e) => //
            buffer
              ..write(char__space)
              ..write(iter++)
              ..write(": ")
              ..write(e.hashCode)
              ..write(','));

        buffer.write(" }");
      }
    }

    return buffer.toString();
  }
}
