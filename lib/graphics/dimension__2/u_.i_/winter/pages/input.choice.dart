part of "../_.dart";

const //
    icon__chosen = flutter__material__icons.radio_button_checked;

/* gui__base__widget pages__input__choice__page({
  required final base__scrolling scroll__manager,
  required final string__raw page__title,
  required final NIMR item__array__count,
  NIMR? chosen__id /* choice__initial */,
  required final gui__base__listing__item__build__function__format listing__item__body__build,
  final IconData? submit__button__icon = flutter__icon__done,
  final string__raw submit__button__title = "Submit",
  required final void Function(NIMR chosen__id) submit__handle,
}) {
  Key listing__key = gui__base__widget__key__unique();

  procedure__empty__format listing__re_build = base__empty__procedure__empty;

  BOOL choice__update(final NIMR? choice) {
    chosen__id = choice;

    listing__key = gui__base__widget__key__unique();
    listing__re_build();

    return OK;
  }

  return page__foundation(
    RepaintBoundary(
      child: gui__base__widget__build__definitive(
        init_: (final state) => //
            (listing__re_build = state.re_build),
        de_init_: () => //
            (listing__re_build = base__empty__procedure__empty),
        build: (final context) => //
            base__list_ing__generat_ed(
          context: context,
          scroll__manager: scroll__manager,
          page__title: base__page__title__aligned__left(
            primary__text: page__title,
            secondary__text: "Choose any one option",
          ),
          item__array__count: item__array__count,
          item__build: (final build__context, final item__id) => //
              gui__base__listing__item__select_able(
            key: listing__key,
            selected__ok: (chosen__id == item__id),
            body: listing__item__body__build(
              build__context,
              item__id,
            ),
            selected__icon: icon__chosen,
            selection__handle: (final _) async => choice__update(item__id),
            de_selection__handle: (final _) async => choice__update(null),
          ),
          floating: ((chosen__id != null)
              ? base__button__floating(
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

gui__base__widget pages__input__choice__page__simple(
 final gui__base__widget__building__context context,{
  required final base__scrolling scroll__manager,
  required final gui__base__widget page__title,
  required final NIMR item__array__count,
  required final gui__base__listing__item__build__function__format listing__item__body__build,
  required final void Function(NIMR chosen__id) submit__handle,
}) =>
    page__foundation(
      base__list_ing__generat_ed(
        context: context,
        scroll__manager: scroll__manager,
        page__title: page__title,
        item__array__count: item__array__count,
        item__build: (final build__context, final item__id) => //
            GestureDetector(
          onTap: () => submit__handle(item__id),
          child: gui__base__listing__item(
            body: listing__item__body__build(
              build__context,
              item__id,
            ),
            trailing: base__icon(
              flutter__icon__press_able,
            ),
          ),
        ),
      ),
    );
