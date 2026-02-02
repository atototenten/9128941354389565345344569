part of "_.dart";

error__handle__proc_ error__handle = error__print;

typedef error__handle__proc_ = //
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

BOOL error__fatal___ok //
/*exception|error:serious|panic*/ /* un-recoverable ,possible in-valid usage */ (
  final Object error,
) {
  if (error is Error) {
    return FALSE;
  }

  if (error is Exception) {
    return TRUE;
  }

  return TRUE /* default/most-likely */;
}

string //
error__code(
  final BOOL error__fatal___ok,
) {
  return (error__fatal___ok //
      ? chars__alphabet__case__upper__f___string /* Fatal */
      : chars__alphabet__case__upper__e___string /* Error */ );
}

void error__print(
  final Object error,
  final StackTrace? trace, [
  final string? label,
]) {
  print__blank(16);

  error__print__concise(
    error,
    trace,
    label,
  );

  print__blank(16);
}

void error__print__concise(
  final Object error,
  final StackTrace? trace, [
  final string? label,
]) {
  error //
      .representation__text()
      .print(
        error__code(
          error__fatal___ok(error),
        ),
        label,
      );

  (trace ?? StackTrace.current) //
      .representation__text()
      .print(label);
}
