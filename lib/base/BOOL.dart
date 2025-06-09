part of "_.dart";

typedef BOOL = bool;

const //
    OK = true,
    OK__NOT = !OK,
//
    TRUE = OK,
    YES = TRUE,
    FALSE = OK__NOT,
    NO = FALSE;

/*BOOL NOT(final BOOL value) => //
    value.not;*/

extension BOOL__extension on BOOL {
  BOOL get not => //
      !this;
}

extension BOOL__convert__text__representation__extension on BOOL {
  base__text__representation //
      text__representation() {
    return base__text__representation(
      (this ? "OK" : "NO"),
    );
  }
}
