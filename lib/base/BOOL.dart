part of "_.dart";

typedef BOOL = bool;

const //
TRUE = true,
    FALSE = /*false*/ !TRUE;

/*BOOL NOT(final BOOL value) => //
    value.not;*/

extension BOOL__extension on BOOL {
  BOOL get not => //
      !this;
}

extension BOOL__convert__representation__text__extension on BOOL {
  base__representation__text //
  representation__text() {
    return base__representation__text(
      (this ? "TRUE" : "FALSE"),
    );
  }
}
