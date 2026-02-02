part of "_.dart";

abstract class storage__file__meta__basic___protocol /*
completely raw and un-cached
  with direct syn.ation ,instead of distinct
`offset`/`count` are based on block-id. (not byte-id.)
  to match the reality (of hardware) */ //
    implements
        dispose__asyn___protocol<storage__file__closure__error> {
  ASYN<storage__file__reading__result___union> //
      read__asyn /*
fetch data */
      ({
    required final INT count,
    required final INT offset,
  });

  ASYN<storage__file__writing__error?> //
      write__asyn /*
re-place data */
      (
    final storage__file__blocks value, {
    required final INT offset,
  });

  @override
  ASYN<storage__file__closure__error?> //
      dispose__asyn();
}

class storage__file__reading__result__success //
    implements
        storage__file__reading__result___union {
  const storage__file__reading__result__success(
    this.value,
  );

  final storage__file__blocks value;
}

class storage__file__reading__result__failure //
    implements
        storage__file__reading__result___union {
  const storage__file__reading__result__failure(
    this.value,
  );

  final storage__file__reading__error value;
}

enum storage__file__reading__error /*
<- storage__file__accessing__error__base */
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

sealed class storage__file__reading__result___union {}

enum storage__file__writing__error /*
<- storage__file__accessing__error__base */
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

enum storage__file__closure__error /*
<- storage__file__operating__error__base */
{
  argument__valid__in /* derived */,
  memory__end /* derived */,
  destination__busy /* derived */,
  file__missing /* derived */,
  file__access__denied /* derived */,
//
  other,
}

enum storage__file__accessing__error__base /*
<- storage__file__operating__error__base */
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

enum storage__file__operating__error__base {
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
