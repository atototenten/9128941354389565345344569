part of "_.dart";

abstract class base__storage__file__meta__basic___protocol /*
completely raw and un-cached
  with direct syn.ation ,instead of distinct
`offset`/`count` are based on block-id. (not byte-id.)
  to match the reality (of hardware) */ //
    implements
        base__dispose__asyn___protocol<base__storage__file__closure__error> {
  ASYN<base__storage__file__reading__result___union> //
      read__asyn /*
fetch data */
      ({
    required final INT count,
    required final INT offset,
  });

  ASYN<base__storage__file__writing__error?> //
      write__asyn /*
re-place data */
      (
    final base__storage__file__blocks value, {
    required final INT offset,
  });

  @override
  ASYN<base__storage__file__closure__error?> //
      dispose__asyn();
}

class base__storage__file__reading__result__success //
    implements
        base__storage__file__reading__result___union {
  const base__storage__file__reading__result__success(
    this.value,
  );

  final base__storage__file__blocks value;
}

class base__storage__file__reading__result__failure //
    implements
        base__storage__file__reading__result___union {
  const base__storage__file__reading__result__failure(
    this.value,
  );

  final base__storage__file__reading__error value;
}

enum base__storage__file__reading__error /*
<- base__storage__file__accessing__error__base */
{
  argument__valid__in /* derived */,
  memory__end /* derived */,
  destination__busy /* derived */,
  file__missing /* derived */,
  file__access__denied /* derived */,
  destination__end /* derived */,
//
  other,
}

sealed class base__storage__file__reading__result___union {}

enum base__storage__file__writing__error /*
<- base__storage__file__accessing__error__base */
{
  argument__valid__in /* derived */,
  memory__end /* derived */,
  destination__busy /* derived */,
  file__missing /* derived */,
  file__access__denied /* derived */,
  destination__end /* derived */,
//
  other,
}

enum base__storage__file__closure__error /*
<- base__storage__file__operating__error__base */
{
  argument__valid__in /* derived */,
  memory__end /* derived */,
  destination__busy /* derived */,
  file__missing /* derived */,
  file__access__denied /* derived */,
//
  other,
}

enum base__storage__file__accessing__error__base /*
<- base__storage__file__operating__error__base */
{
  argument__valid__in /* derived */,
  memory__end /* derived */,
  destination__busy /* derived */,
  file__missing /* derived */,
  file__access__denied /* derived */,
//
  destination__end /*
storage full */
  ,
}

enum base__storage__file__operating__error__base {
  argument__valid__in /*
at-least one arg.
  including the description itself */
  ,
  memory__end /*
memory full */
  ,
//
  destination__busy /*
un-responsive */
  ,
//
  file__missing /*
either dis-connected ,or not found */
  ,
  file__access__denied /*
including write access ,in case of read-only storage */
  ,
}
