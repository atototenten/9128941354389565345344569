import "_.dart";

class _entity__component__children___record /*
`Record`-literal is not used
  due to variance issues ,of dart-lang.
  example :`
typedef _value__handling__children___record<value__type>
  = ({ gui__base__widget Function( gui__base__widget__building__context ,value__type ) child__build });
` */
{
  const _entity__component__children___record({
    required this.child__build,
  });

  final gui__base__widget__build__function__format child__build;
}

class _entity__component__example //
    implements gui__base__entity__component___protocol //
    <_entity__component__children___record> {
  const _entity__component__example();

  @override
  void dispose() {
    throw UnimplementedError();
  }

  @override
  gui__base__widget //
      widget__build(
    final gui__base__widget__building__context context, {
    required final _entity__component__children___record children,
  }) {
    throw UnimplementedError();
  }
}
