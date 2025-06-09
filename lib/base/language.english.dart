part of "_.dart";

const //
    language__hindi__numbers__count = 10,
    language__latin__english__alphabets__count = 26;

void language__english__count__text__convert__plural__if__needed__buffer(
  final StringBuffer buffer,
  final NIMR count,
  final string__raw word, [
  final BOOL suffix__s__ok /* {'s'|"es"} */ = OK,
]) {
  buffer
    ..write(count)
    ..write(char__space)
    ..write(word);

  if (count != 1) //
    buffer.write(suffix__s__ok //
        ? "s"
        : "es");
}

string__raw language__english__count__text__convert__plural__if__needed(
  final NIMR count,
  final string__raw word, [
  final BOOL suffix__s__ok = OK,
]) {
  final buffer = StringBuffer();

  language__english__count__text__convert__plural__if__needed__buffer(
    buffer,
    count,
    word,
    suffix__s__ok,
  );

  return buffer.toString();
}
