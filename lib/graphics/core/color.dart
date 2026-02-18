part of "_.dart";

const //
color__transparent = color__transparent__dark,
    color__transparent__light = Color(0x00FFFFFF),
    color__transparent__dark = /*Color(0x00000000)*/ flutter__material__colors.transparent,
    color__white = Color(0xFFFFFFFF),
    color__black = Color(0xFF000000);

const APPROX //
image__filter__blur__sensitive__extra /* as foreground of a random picture */ = 64,
    image__filter__blur__sensitive /* sensitive to the background, expected as foreground of a picture */ = 32,
    image__filter__blur__crucial /* for top-navigation, and status-bar's background */ = 16,
    image__filter__blur__default = 8,
    image__filter__blur__clear /* for quite sexy look */ = 4,
    image__filter__blur__min_ /* for sexy-est look */ = 1;

Color color__grey({
  required final APPROX color,
  final APPROX alpha = 1.0,
}) {
  return Color.from(
    alpha: alpha,
    red: color,
    green: color,
    blue: color,
  );
}

extension Color___extension //
    on Color {
  Color mutate /*
- useful in brightening/whitening/darkening a color
  usually for gradients
- example : "gradient(begin: theme__accent___color ,end: theme__accent___color.mutate(color: .250))" */ ({
    required final APPROX color,
    final APPROX alpha = 0,
  }) {
    return Color.from(
      alpha: (a + alpha).clamp(0, 1),
      red: (r + color).clamp(0, 1),
      green: (g + color).clamp(0, 1),
      blue: (b + color).clamp(0, 1),
    );
  }
}

dart__ui.ImageFilter image__filter__blur(
  final APPROX value,
) {
  return dart__ui.ImageFilter.blur(
    sigmaX: value,
    sigmaY: value,
  );
}

Color color__generate({
  required final INT intensity /*
  throw (lines relative to the offset, of function's body):
    1 */,
  required final BOOL b__dark_mode /* 3..255 vs 255..3, both inclusive, for `OK`(dark), and `NO`(light) respectively */,
  required final BOOL b__solid /* or `b__semi_transparent`(with alpha) */,
  required final INT interval,
}) {
  if ((intensity < (256 ~/ interval)).NOT) {
    throw "`intensity` MUST be in-range 0...${((256 ~/ interval) - 1)}, inclusive, when `interval` is $interval";
  }

  final ({INT primary, INT secondary}) value = (b__dark_mode
      ? (
          primary: (((intensity + 1) * interval) - 1),
          secondary: 0,
        )
      : (
          primary: ((INT__1__limit - (intensity * interval)) - 1),
          secondary: INT__1__max,
        ));

  return (b__solid //
      ? Color.fromARGB(value.secondary, value.primary, value.primary, value.primary)
      : Color.fromARGB(value.primary, value.secondary, value.secondary, value.secondary));
}

Color color__value__convert__Color(
  final INT color__value,
) {
  return Color(0xFF000000 | color__value);
}

INT Color__convert__color__value(
  final Color color,
) {
  return (color.value & 0xFFFFFF);
}

Color color__whiten(
  final Color color,
  final INT intensity,
) {
  final INT //
  red = (color.red + intensity),
      green = (color.green + intensity),
      blue = (color.blue + intensity);

  return Color.fromARGB(
    color.alpha,
    ((red < INT__1__limit) ? red : INT__1__max),
    ((green < INT__1__limit) ? green : INT__1__max),
    ((blue < INT__1__limit) ? blue : INT__1__max),
  );
}

extension Color$whiten on Color {
  Color whiten(final INT intensity) => //
      color__whiten(this, intensity);
}

late final _random = dart__math.Random.secure();

INT get _color__random => //
    _random.nextInt(INT__1__limit);

/** copied from `https://stackoverflow.com/a/43235` */
Color color__random(
  final Color color,
) {
  return Color.fromARGB(
    INT__1__max,
    ((_color__random + color.red) ~/ 2),
    ((_color__random + color.green) ~/ 2),
    ((_color__random + color.blue) ~/ 2),
  );
}

/*
forked
  from `flutter/lib/src/material/theme_data.dart`::`ThemeData`::`static Brightness estimateBrightnessForColor(Color color)`
  on 2023-5-29
  original is copied below, the function */
Color color__contrasted(
  final Color color,
) {
  final APPROX relativeLuminance = color.computeLuminance();

  return (((relativeLuminance + 0.05) * (relativeLuminance + 0.05) > 0.0525 /* kThreshold */ ) //
      ? color__white
      : color__black);
}
/*
  /// Determines whether the given [Color] is [Brightness.light] or
  /// [Brightness.dark].
  ///
  /// This compares the luminosity of the given color to a threshold value that
  /// matches the Material Design specification.
  static Brightness estimateBrightnessForColor(Color color) {
    final APPROX relativeLuminance = color.computeLuminance();

    // See <https://www.w3.org/TR/WCAG20/#contrast-ratiodef>
    // The spec says to use kThreshold=0.0525, but Material Design appears to bias
    // more towards using light text than WCAG20 recommends. Material Design spec
    // doesn't say what value to use, but 0.15 seemed close to what the Material
    // Design spec shows for its color palette on
    // <https://material.io/go/design-theming#color-color-palette>.
    const APPROX kThreshold = 0.15;
    if ((relativeLuminance + 0.05) * (relativeLuminance + 0.05) > kThreshold) {
      return Brightness.light;
    }
    return Brightness.dark;
  }
*/

Color color__sensitive(
  final Color color,
) => color__contrasted(color);

Color color__high_contrast(
  final Color color,
) => color__contrasted(color);
