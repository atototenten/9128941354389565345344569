part of "_.dart";

typedef gui__base__listing__item__build__function__format = //
    gui__base__widget Function(BuildContext build__context, INT);

const gui__base__listing__vertical__caching__extent__default = .5;

const INT Function(
  INT item__id,
  INT items__count,
)
gui__base__listing__reverse__item__id = //
    array__reverse__element__id;

extension base__array__convert__widget__array__extension<value__type extends Object?> //
    on array<value__type> {
  array<gui__base__widget> convert__widget__array(
    final gui__base__widget separation,
    final gui__base__widget Function(INT, value__type) element__convert,
  ) {
    return base__elements__generate(
      elements__count,
      separation,
      (final i) => element__convert(i, element(i)),
    ).convert__array();
  }
}

typedef gui__base__listing__grow_able__listing__widget__function__format =
    gui__base__widget Function(
      gui__base__widget__building__context context,
      INT items__count,
      gui__base__listing__item__build__function__format item__widget,
    );

class gui__base__listing__grow_able<element__new__type> //
    implements base__dispose___protocol {
  gui__base__listing__grow_able({
    required this.items__existing__count,
    required this.items__new__count__limit,
  }) : _elements__new = base__accumulation__linear__basic<element__new__type>(),
       _channel = base__event__channel__broadcast();

  final INT items__existing__count;
  final INT items__new__count__limit;

  final base__event__channel__broadcast _channel;

  final base__accumulation__linear__basic<element__new__type> _elements__new;

  @override
  void dispose() {
    _elements__new.dispose();

    _channel.dispose();
  }

  base__event__channel__broadcast___protocol //
  channel() => //
      _channel;

  void add(
    final element__new__type element__new,
  ) {
    _elements__new.add__ending(
      element__new,
    );

    _channel.event__dispatch();
  }

  /*void remove__element(final INT element__id,) {}*/

  element__new__type element__new(
    final INT id,
  ) => _elements__new.element(
    id,
  );

  INT elements__new__count() => //
      _elements__new.elements__count();

  INT _elements__new__count__definitive() => //
      elements__new__count();

  array<element__new__type> elements__new__convert__array() => //
      _elements__new.convert__array();

  gui__base__widget widget__build(
    final gui__base__widget__building__context context, {

    required final gui__base__listing__grow_able__listing__widget__function__format listing__build,
    required final gui__base__listing__item__build__function__format /* 2nd param. is `item__existing__id_` */ ? item__existing__build /*
not called, if `items__existing__count` is 0 */,
    required final gui__base__listing__item__build__function__format /* 2nd param. is `item__new__id_` */ item__new__build /*
not called, if `items__new__count` is 0
call to this function, indicates, that the user is interested, in adding, an item, to the list
  similar to press-ing, the "Add" floating button */,
    required final gui__base__listing__item__build__function__format /* 2nd param. is `item__new__id_` */ item__new__dummy__build /*
invoke `store.control()?.add:item` to add-item
not called, if `items__new__count` is 0
example :
  `GestureDetector(onTap: item__array__count__update, child: gui__base__listing__item(body: gui__base__box__text__primary("Add item ${item__id + 1}")))` */,
  }) /*
"element" is datum(singular form ,of data) ,while "item" is the gui form ,of "element"
  naming is simply naming ,nothing much (sense) */ {
    return _channel.handling__widget__build(
      context,
      child__build: (final context) {
        final items__new__count = _elements__new__count__definitive();

        var items__count = (items__new__count + items__existing__count);
        if (items__new__count < items__new__count__limit) {
          items__count += 1;
        }

        return listing__build(
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
              return (item__existing__build?.call(
                    build__context,
                    item__id,
                  ) ??
                  gui__base__empty__widget);
            }

            item__id -= items__existing__count;

            return ((item__id /*<*/ != items__new__count) //
                ? item__new__build(
                    build__context,
                    item__id,
                  )
                : item__new__dummy__build(
                    build__context,
                    item__id,
                  ));
          },
        );
      },
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

  INT elements__new__sav_ed__count() => //
      _elements__new__sav_ed.elements__count();

  @override
  INT _elements__new__count__definitive() => //
      (elements__new__sav_ed__count() + super._elements__new__count__definitive());

  element__new__sav_ed__type element__new__sav_ed(
    final INT id,
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
    required final INT items__existing__count,
    required final INT items__new__count__limit,
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
