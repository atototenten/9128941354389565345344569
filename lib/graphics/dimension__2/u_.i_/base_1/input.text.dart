part of "_.dart";

extension gui__base__input__text___extension //
    on gui__base__input__text___compo {
  gui__base__widget shell__widget__build(
    final gui__base__widget__building__context context, {
    final BOOL focussed___ok = FALSE,
    required final gui__base__widget__build__function__format state__active__build,
    required final gui__base__widget__build__function__format state__default__build,
  }) {
    return gui__base__widget__definitive__build(
      context,
      attach__handle: (final context) {
        return _shell__state___compo(
          active___ok: focussed___ok,
        );
      },
      detach__handle: (final storage) {},
      child__build: (final context, final storage) {
        if (storage.active___ok.not) {
          return GestureDetector(
            onTap: () {
              storage.active___ok = TRUE;
              context.build__re___raw();
            },
            child: state__default__build(context),
          );
        }

        return TapRegion(
          onTapOutside: (_) {
            storage.active___ok = FALSE;
            context.build__re___raw();
          },
          child: state__active__build(context),
        );
      },
    );
  }
}

class _shell__state___compo {
  _shell__state___compo({
    required this.active___ok,
  });

  BOOL active___ok;
}
