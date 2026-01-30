part of "_.dart";

extension DateTime___extension //
    on DateTime {
  DateTime select__date() {
    if (isUtc.NOT) {
      return DateTime(year, month, day);
    }

    return DateTime.utc(year, month, day);
  }
}
