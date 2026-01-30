part of "_.dart";

extension gui__base__scrolling___extension //
    on gui__base__scrolling___compo {
  gui__base__widget separated__widget__build(
    final gui__base__widget__building__context context, {
    final EdgeInsetsGeometry? padding,
    required final gui__base__widget children__separation,
    required final INT children__count,
    required final gui__base__scrolling__child__build___procedure__format child__build,
  }) {
    final children__separated__generation = base__array__elements__separated__generation__meta___compo(
      elements__count: children__count,
    );

    return widget__build(
      context,
      padding: padding,
      children__count: children__separated__generation.elements__count__adjusted,
      child__build: (final context, final child__id__adjusted) {
        final child__id = children__separated__generation.element__id(
          element__id__adjusted: child__id__adjusted,
        );

        if (child__id == null) {
          return children__separation;
        }

        return RepaintBoundary(
          child: child__build(
            context,
            child__id,
          ),
        );
      },
    );
  }
}
