part of "_.dart";

base__error__handle__proc_ base__error__handle = base__error__print;

typedef base__error__handle__proc_ = //
    void Function(
      Object /*
generic-type `error__type extends Object` cannot be used
  ,due to exception-throwing being non-deterministic
    ,due to call-graph being random ,in almost-all cases */
      error,
      StackTrace trace /*=StackTrace.current*/ /*
call-sequence of the proc.-calls 
  ,including the code's {library-name ,relative-{file-path} ,line-id.} */,
    );

class error__reference__access__valid__in___error {
  static BOOL ok(final Object error) {
    final error__string = error.toString();

    return (error__string.contains("Null") && //
        error__string.contains("is not a subtype of"));
  }

  const error__reference__access__valid__in___error();
}

class error__reference__assertion__valid__in___error {
  static BOOL ok(final Object error) {
    return (error.toString() == "Null check operator used on a null value");
  }

  const error__reference__assertion__valid__in___error();
}

BOOL base__error__fatal___ok //
/*exception|error:serious|panic*/ /* un-recoverable ,possible in-valid usage */ (
  final Object error,
) {
  if (error is Error) {
    return NO;
  }

  if (error is Exception) {
    return OK;
  }

  return OK /* default/most-likely */;
}

string //
base__error__code(
  final BOOL error__fatal___ok,
) {
  return (error__fatal___ok //
      ? char__alphabet__case__upper__f /* Fatal */
      : char__alphabet__case__upper__e /* Error */ );
}

void base__error__print(
  final Object error,
  final StackTrace? trace, [
  final string? label,
]) {
  base__print__blank(16);

  base__error__print__concise(
    error,
    trace,
    label,
  );

  base__print__blank(16);
}

void base__error__print__concise(
  final Object error,
  final StackTrace? trace, [
  final string? label,
]) {
  error //
      .representation__text()
      .print(
        base__error__code(
          base__error__fatal___ok(error),
        ),
        label,
      );

  (trace ?? StackTrace.current) //
      .representation__text()
      .print(label);
}
