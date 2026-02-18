import "../../core/_.dart";
import "../core/_.dart";
import "../flutter/_.dart";
import "_.dart";

abstract class value__updation__event__channel__observation___protocol {
  void observe(final event__basic__handle___procedure__format updation__event__handle);

  void observation__cancel(final event__basic__handle___procedure__format updation__event__handle);
}

class value__updation__event__channel___compo<value___type> /*
- highly optimized ,to reduce in-visible (hence use-less) updation
    via buffering ,till the very next frame
      in worst case ,delayed by exactly one frame
        if event is received ,during a frame-cycle
        generally im-perceptible
          but in-appropriate for hard real-time ,or mission-critical systems
            although even flutter is in-appropriate ,in such scenarios */ //
    extends
        event__channel__broadcast //
    implements value__updation__event__channel__observation___protocol {
  value__updation__event__channel___compo(
    this._value__active, {
    super.name___debug,
  }) : _value__scheduled = value__optional__absent__compo<value___type>();

  value___type _value__active;
  value__optional___union<value___type> _value__scheduled;

  @override
  void dispose() {
    _value__scheduled = value__optional__absent__compo<value___type>();
    super.dispose();
  }

  @override
  void observe(final event__basic__handle___procedure__format updation__event__handle) {
    descriptions__add(updation__event__handle);
  }

  @override
  void observation__cancel(final event__basic__handle___procedure__format updation__event__handle) {
    descriptions__remove(updation__event__handle);
  }

  value___type value__active() {
    return _value__active;
  }

  void value__update(final value___type value__new) {
    final scheduling__pending___ok = switch (_value__scheduled) {
      value__optional__present__compo<value___type>() => FALSE /*
        must have been scheduled already ,right after the updation */,
      value__optional__absent__compo<value___type>() => TRUE,
    };

    _value__scheduled = value__optional__present__compo(value__new);

    if (scheduling__pending___ok.NOT) {
      return;
    }

    WidgetsBinding.instance.task__rendering__frame__next__before__schedule(_value__active__update);
  }

  void _value__active__update() {
    final value__scheduled = _value__scheduled;

    final value___type value__active__new;

    switch (value__scheduled) {
      case value__optional__present__compo<value___type>():
        value__active__new = value__scheduled.value;
        break;

      case value__optional__absent__compo<value___type>():
        return;
    }

    _value__scheduled = value__optional__absent__compo();

    _value__active = value__active__new;

    event__dispatch();
  }
}

extension value__updation__event__channel__observation___extension //
    on value__updation__event__channel__observation___protocol {
  widget___protocol handling__widget__build(
    final widget__building__context___compo context, {
    required final widget__build___procedure__format child__build,
  }) {
    return widget__advanced__build(
      context,
      attach__handle: (final context) {
        void re_build() {
          context.re_build();
        }

        this.observe(re_build);

        return (re_build: re_build);
      },
      detach__handle: (final storage) {
        this.observation__cancel(storage.re_build);
      },
      child__build: (final context, _) {
        return child__build(context);
      },
    );
  }
}
