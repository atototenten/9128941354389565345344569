part of "_.dart";

typedef gui__base__listing__item__build__function__format = //
    gui__base__widget Function(BuildContext build__context, NI);

const gui__base__listing__vertical__caching__extent__default = .5;

const NI Function(
  NI item__id,
  NI items__count,
) gui__base__listing__reverse__item__id = //
    array__reverse__element__id;

extension base__array__convert__widget__array__extension<value__type extends Object?> //
    on array<value__type> {
  array<gui__base__widget> convert__widget__array(
    final gui__base__widget separation,
    final gui__base__widget Function(NI, value__type) element__convert,
  ) {
    return base__items__generate(
      elements__count,
      separation,
      (final i) => element__convert(i, element(i)),
    );
  }
}

array<gui__base__widget> base__items__generate /*
if `separation` is not needed ,`convert` associated-fn. should be used */
    (
  final NI count /*
excluding `separation`s */
  ,
  final gui__base__widget separation,
  final gui__base__widget Function(NI i) generate,
) {
  if (count == 0) {
    return array__new__empty<gui__base__widget>();
  }

  return array__new__generated(
    ((count * 2) - 1),
    (final i) {
      if (i.isOdd) {
        return separation;
      }

      return generate(i ~/ 2);
    },
  );
}

array<gui__base__widget> base__items__and__title__generate({
  required final gui__base__widget title,
  final gui__base__widget? separation__title__and__item,
  required final NI items__count /*
  excluding `widgetSeparator`, this complexity is abstracted, and is none of user's business */
  ,
  required final gui__base__widget Function(NI i) item,
  required final gui__base__widget items__separation,
}) {
  if (items__count == 0) {
    return <gui__base__widget>[
      title,
      (separation__title__and__item ?? items__separation),
    ];
  }

  final items__count__1 /* including the first(maybe title) widget */ = ((items__count * 2) + 1);

  final items = array__new__filled<gui__base__widget>(
    items__count__1,
    gui__base__empty__widget,
  );

  items.first = title;
  items[1] = (separation__title__and__item ?? items__separation);

  base__iterate__until__basic(
    items__count__1,
    offset: 2,
    (final i) {
      items[i] = (i.isEven //
          ? item((i ~/ 2) - 1)
          : items__separation);
    },
  );

  return items;
}

typedef gui__base__listing__grow_able__listing__widget__function__format = gui__base__widget Function(
  gui__base__widget__building__context context,
  NI items__count,
  gui__base__listing__item__build__function__format item__widget,
);

class gui__base__list_ing__grow_able__children___record {
  const gui__base__list_ing__grow_able__children___record({
    required this.listing__build,
    required this.item__existing__build,
    required this.item__new__build,
    required this.item__new__dummy__build,
  });

  final gui__base__listing__grow_able__listing__widget__function__format listing__build;
  final gui__base__listing__item__build__function__format /* 2nd param. is `item__existing__id_` */ ? item__existing__build /*
not called, if `items__existing__count` is 0 */
      ;
  final gui__base__listing__item__build__function__format /* 2nd param. is `item__new__id_` */
      item__new__build /*
not called, if `items__new__count` is 0
call to this function, indicates, that the user is interested, in adding, an item, to the list
  similar to press-ing, the "Add" floating button */
      ;
  final gui__base__listing__item__build__function__format /* 2nd param. is `item__new__id_` */
      item__new__dummy__build /*
invoke `store.control()?.add:item` to add-item
not called, if `items__new__count` is 0
example :
  `GestureDetector(onTap: item__array__count__update, child: gui__base__listing__item(body: gui__base__box__text__primary("Add item ${item__id + 1}")))` */
      ;
}

class gui__base__listing__grow_able<element__new__type> //
    implements gui__base__entity__component___protocol<gui__base__list_ing__grow_able__children___record> {
  gui__base__listing__grow_able({
    required this.items__existing__count,
    required this.items__new__count__limit,
  })  : _elements__new = base__accumulation__linear__basic<element__new__type>(),
        channel = base__event__channel__broadcast();

  final NI items__existing__count;
  final NI items__new__count__limit;

  final base__event__channel__broadcast channel;

  final base__accumulation__linear__basic<element__new__type> _elements__new;

  void add(
    final element__new__type element__new,
  ) {
    _elements__new.add__ending(
      element__new,
    );

    channel.event__dispatch();
  }

  /*void remove__element(final NI element__id,) {}*/

  element__new__type element__new(
    final NI id,
  ) =>
      _elements__new.element(
        id,
      );

  NI elements__new__count() => //
      _elements__new.elements__count();

  NI _elements__new__count__definitive() => //
      elements__new__count();

  array<element__new__type> elements__new__convert__array() => //
      _elements__new.convert__array();

  @override
  void dispose() {
    _elements__new.dispose();

    channel.dispose();
  }

  @override
  gui__base__widget widget__build(
    final gui__base__widget__building__context context, {
    required final gui__base__list_ing__grow_able__children___record children,
  }) /*
"element" is datum(singular form ,of data) ,while "item" is the gui form ,of "element"
  naming is simply naming ,nothing much (sense) */
  {
    return channel.handling__widget__build(
      context,
      children: gui__base__event__channel__handling__children___record(
        child__build: (final context) {
          final items__new__count = _elements__new__count__definitive();

          var items__count = (items__new__count + items__existing__count);
          if (items__new__count < items__new__count__limit) {
            items__count += 1;
          }

          return children.listing__build(
            context,
            items__count,
            (final build__context, var item__id) {
/*
(items__new__first___ok /* order ,the new-ly add-ed items ,before exist-ing ones */
    ? ((id < items__new__count) //
        ? items__new__array[base__listing__reverse__item__id(
            id,
            items__new__count,
          )]
        : items__exist_ing__array[base__listing__reverse__item__id(
            (id - items__new__count),
            items__exist_ing__count,
          )])
    : ((id < items__exist_ing__count) //
        ? items__exist_ing__array[base__listing__reverse__item__id(
            id,
            items__exist_ing__count,
          )]
        : items__new__array[base__listing__reverse__item__id(
            (id - items__exist_ing__count),
            items__new__count,
          )])) */

              if ((item__id = gui__base__listing__reverse__item__id(
                    item__id,
                    items__count,
                  )) <
                  items__existing__count) {
                return (children.item__existing__build?.call(
                      build__context,
                      item__id,
                    ) ??
                    gui__base__empty__widget);
              }

              item__id -= items__existing__count;

              return ((item__id/*<*/ != items__new__count) //
                  ? children.item__new__build(
                      build__context,
                      item__id,
                    )
                  : children.item__new__dummy__build(
                      build__context,
                      item__id,
                    ));
            },
          );
        },
      ),
    );
  }
}

/*class gui__base__listing__grow_able__sav_able //
    <element__new__type, element__new__sav_ed__type> /*
`element__new` is `element__new__un_sav_ed` */ //
    extends gui__base__listing__grow_able<element__new__type> {
  gui__base__listing__grow_able__sav_able() //
      : _elements__new__sav_ed = base__accumulation__linear__basic<element__new__sav_ed__type>();

  final base__accumulation__linear__basic<element__new__sav_ed__type> _elements__new__sav_ed;

  BOOL? _save__allow___ok;

  void save__elements(
    final array<element__new__sav_ed__type> elements__new__sav_ed__array /*
must have same elements:count as input/param. */
    ,
  ) /*
`elements:new`[`:array`] should not be cached after this proc. 
  ,because its flush-ed */
  {
    _elements__new.flush();

    elements__new__sav_ed__array.iterate__basic(
      (final _, final element__new__sav_ed) {
        _elements__new__sav_ed.add(
          element__new__sav_ed,
        );
      },
    );

    channel.event__announce();
  }

  NI elements__new__sav_ed__count() => //
      _elements__new__sav_ed.elements__count();

  @override
  NI _elements__new__count__definitive() => //
      (elements__new__sav_ed__count() + super._elements__new__count__definitive());

  element__new__sav_ed__type element__new__sav_ed(
    final NI id,
  ) =>
      _elements__new__sav_ed.element(
        id,
      );

  array<element__new__sav_ed__type> elements__new__sav_ed__convert__array() => //
      _elements__new__sav_ed.convert__array();

  BOOL? save__allow___ok() {
    return _save__allow___ok;
  }

  void save__allow() {
    if (_save__allow___ok == OK) {
      return;
    }

    _save__allow___ok = OK;
    channel.event__announce();
  }

  void save__allow__auto_() {
    if (_save__allow___ok == NIL) {
      return;
    }

    _save__allow___ok = NIL;
    channel.event__announce();
  }

  @override
  void dispose() {
    super.dispose();
    _elements__new__sav_ed.dispose();
  }
}

extension gui__base__listing__grow_able__sav_able__widget //
    <element__new__type, element__new__sav_ed__type> //
    on gui__base__listing__grow_able__sav_able //
    <element__new__type, element__new__sav_ed__type> {
  gui__base__widget widget //
      <element__new__type, element__new__sav_ed__type>({
    required final gui__base__listing__grow_able__listing__widget__function__format listing,
    required final NI items__existing__count,
    required final NI items__new__count__limit,
    required final gui__base__listing__item__build__function__format /* 2nd param. is `item__exist_ing__id` */ ? item__existing__build,
    required final gui__base__listing__item__build__function__format /* 2nd param. is `item__new__sav_ed__id` */ item__new__saved__build,
    required final gui__base__listing__item__build__function__format /* 2nd param. is `item__new__un_sav_ed__id` */
        item__new__un_saved__build,
    required final gui__base__listing__item__build__function__format /* 2nd param. is `item__new__id` */ item__new__dummy__build,
    final gui__base__widget? save__button /*
not visible ,if no elements ,are un-sav-ed */
    ,
  }) {
    return (this as gui__base__listing__grow_able<element__new__type>).widget(
      listing: listing,
      items__existing__count: items__existing__count,
      items__new__count__limit: items__new__count__limit,
      item__existing__build: item__existing__build,
      item__new__build: (
        final context,
        final item__new__id,
      ) {
        final elements__new__saved__count_1 = elements__new__sav_ed__count();

        if (item__new__id < elements__new__saved__count_1) {
          return item__new__saved__build(
            context,
            item__new__id,
          );
        }

        return item__new__un_saved__build(
          context,
          (item__new__id - elements__new__saved__count_1),
        );
      },
      item__new__dummy__build: item__new__dummy__build,
      /*floating__button: ((save__button != null)
          ? (final context) {
              if /*F*/ (_save__allow___ok == OK) {
                return save__button;
              }

              if /*F*/ (_save__allow___ok == NO) {
                return gui__base__empty__widget;
              }

              if /*F*/ (elements__new__count() == 0) {
                return gui__base__empty__widget;
              }

              return save__button;
            }
          : /*(final context) => //
            base__button__floating(
              icon: flutter__material__icons.save,
              title: "save",
              press__handle: () {
                if (store.elements__new__count() == 0) {
                  context.navigation().forward__overlay__notice(
                    notice__build: (final context) => //
                        notice__basic(
                      context: context,
                      title: "nothing to save",
                      body: "no items available ,to add",
                    ),
                  );
                  return;
                }

                context.navigation().forward__overlay__waiting(
                  data__base__table__rows__add(
                    entity.elements__new__convert__array(),
                  ),
                  success__handle: entity.save__elements,
                  waiting__build: NIL,
                  $error__handle: NIL,
                );
              },
            )*/
          NIL),*/
    );
  }
}*/
