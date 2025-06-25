part of "_.dart";

const //
    language__hindi__numbers__count = 10,
    language__latin__english__alphabets__count = 26;

void language__english__count__text__convert__plural__if__needed__buffer(
  final StringBuffer buffer,
  final NI count,
  final string word, [
  final BOOL suffix__s___ok /* {'s'|"es"} */ = OK,
]) {
  buffer
    ..write(count)
    ..write(char__space)
    ..write(word);

  if (count != 1) //
    buffer.write(suffix__s___ok //
        ? "s"
        : "es");
}

string language__english__count__text__convert__plural__if__needed(
  final NI count,
  final string word, [
  final BOOL suffix__s___ok = OK,
]) {
  final buffer = StringBuffer();

  language__english__count__text__convert__plural__if__needed__buffer(
    buffer,
    count,
    word,
    suffix__s___ok,
  );

  return buffer.toString();
}
