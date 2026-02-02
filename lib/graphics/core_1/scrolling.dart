part of "_.dart";

extension scrolling___extension //
    on scrolling___compo {
  widget___protocol separated__widget__build(
    final widget__building__context___compo context, {
    final EdgeInsetsGeometry? padding,
    required final widget___protocol children__separation,
    required final INT children__count,
    required final scrolling__child__build___procedure__format child__build,
  }) {
    final children__separated__generation = array__elements__separated__generation__meta___compo(
      elements__count: children__count,
    );

    return this.widget__build(
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
