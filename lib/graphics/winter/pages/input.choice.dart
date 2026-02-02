part of "../_.dart";

const //
    icon__chosen = flutter__material__icons.radio_button_checked;

/*widget___protocol pages__input__choice__page({
  required final scrolling scroll__manager,
  required final string page__title,
  required final INT item__array__count,
  INT? chosen__id /* choice__initial */,
  required final listing__item__build__function__format listing__item__body__build,
  final IconData? submit__button__icon = flutter__icon__done,
  final string submit__button__title = "Submit",
  required final void Function(INT chosen__id) submit__handle,
}) {
  Key listing__key = widget__key__unique();

  procedure__empty__format listing__build__re = empty__procedure__empty;

  BOOL choice__update(final INT? choice) {
    chosen__id = choice;

    listing__key = widget__key__unique();
    listing__build__re();

    return TRUE;
  }

  return page__foundation(
    RepaintBoundary(
      child: widget__build__definitive(
        init_: (final state) => //
            (listing__build__re = state.build__re),
        de_init_: () => //
            (listing__build__re = empty__procedure__empty),
        build: (final context) => //
            list_ing__generat_ed(
          context: context,
          scroll__manager: scroll__manager,
          page__title: page__title__aligned__left(
            primary__text: page__title,
            secondary__text: "Choose any one option",
          ),
          item__array__count: item__array__count,
          item__build: (final context, final item__id) => //
              listing__item__select_able(
            key: listing__key,
            selected___ok: (chosen__id == item__id),
            body: listing__item__body__build(
              context,
              item__id,
            ),
            selected__icon: icon__chosen,
            selection__handle: (_) async => choice__update(item__id),
            de_selection__handle: (_) async => choice__update(null),
          ),
          floating: ((chosen__id != null)
              ? button__floating(
                  scale: 1.25,
                  border__radius: BorderRadius.all(Radius.circular(28.px())),
                  icon: submit__button__icon,
                  title: submit__button__title,
                  press__handle: () => submit__handle(chosen__id!),
                )
              : NIL),
        ),
      ),
    ),
  );
} */

widget___protocol pages__input__choice__page__simple(
 final widget__building__context___compo context,{
  required final scrolling scroll__manager,
  required final widget___protocol page__title,
  required final INT item__array__count,
  required final listing__item__build__function__format listing__item__body__build,
  required final void Function(INT chosen__id) submit__handle,
}) =>
    page__foundation(
      list_ing__generat_ed(
        context: context,
        scroll__manager: scroll__manager,
        page__title: page__title,
        item__array__count: item__array__count,
        item__build: (final context, final item__id) => //
            GestureDetector(
          onTap: () => submit__handle(item__id),
          child: listing__item(
            body: listing__item__body__build(
              context,
              item__id,
            ),
            trailing: icon(
              flutter__icon__press_able,
            ),
          ),
        ),
      ),
    );
