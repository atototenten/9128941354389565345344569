part of "_.dart";

const //
    base__icon__size__default = 20.0;

gui__base__widget base__icon(
  final IconData icon, {
  required final Color color,
  final APPROX size = base__icon__size__default,
}) /*
fork of `flutter/widgets/icon.dart`::`Icon` */
{
  return SizedBox.square(
    dimension: size,
    child: Center(
      child: flutter__icon__basic(
        icon,
        size: size,
        color: color,
      ),
    ),
  );
}

gui__base__widget flutter__icon__basic(
  final IconData icon, {
  required final APPROX size,
  required final Color color,
}) {
  return gui__base__box__text__widget(
    TextSpan(
      text: string.fromCharCode(
        icon.codePoint,
      ),
      style: TextStyle(
        color: color,
        fontSize: size,
        fontFamily: icon.fontFamily,
        package: icon.fontPackage,
      ),
    ) /*
is not `component__text__segment`, because of `style.package` arg. */
    ,
    /*text__align: TextAlign.center,*/ /* replaced, with surrounding `SizedBox` */
    text__overflow: TextOverflow.visible,
  );
}
