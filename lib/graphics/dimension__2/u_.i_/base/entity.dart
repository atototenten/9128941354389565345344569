part of "_.dart";

class gui__base__entity__overlay___compo //
    implements
        gui__base__entity___protocol {
  const gui__base__entity__overlay___compo({
    required this.dispose__handle,
    required this.widget__build,
  });

  final dispose__procedure__format? dispose__handle;
  final gui__base__widget__build__function__format widget__build;

  @override
  void dispose() {
    final dispose__handle_1 = dispose__handle;

    if (dispose__handle_1 == null) {
      return;
    }

    dispose__handle_1();
  }
}

extension gui__base__entity__page___extension //
    on gui__base__entity__page___protocol {
  gui__base__entity__overlay___compo entity__overlay() {
    return gui__base__entity__overlay___compo(
      dispose__handle: dispose,
      widget__build: widget__build,
    );
  }
}

abstract class gui__base__entity__page___protocol //
    implements
        gui__base__entity___protocol {
  gui__base__widget //
      widget__build(final gui__base__widget__building__context context);
}

/*abstract class gui__base__entity__component___protocol /*
instances must not ,be created in `widget::build`
  ,even if `.dispose` is set to be invoked ,through `gui__base__widget__build.detach`
    ,because attach/detach are not called ,if tree is re-fresh-ed ,without altering
  ,no problem ,in event-emitted proc.s ,like `event__press__handle`
more efficient(run-time and run-memory-space) ,than closures ,due to dart-lang.'s design-choices
flagship(current) examples :
  - `base__list_ing__grow_able__entity` */ //
    <children__type extends Object> //
    implements
        gui__base__entity___protocol {
  gui__base__widget //
      widget__build /*
not named `build`
  because its vague(because its an internal-part ,of the widget)
    ,for a depo.(which contains data ,and g.u.i. is merely an optional part-of-it) */
      (
    final gui__base__widget__building__context context, {
    required covariant final children__type children,
  });
}*/

abstract class gui__base__entity___protocol /*
`::dispose` should be called ,only once
derived `::dispose`s should begin with calling `super::dispose` */ //
    implements
        base__dispose___protocol {}
