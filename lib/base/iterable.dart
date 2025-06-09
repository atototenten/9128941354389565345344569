part of "_.dart";

extension Iterable__extension<T> on Iterable<T> {
  BOOL empty__ok() => //
      isEmpty;

  Iterable<T>? get empty__not__else__null => //
      (empty__ok().not ? this :  null);
}
