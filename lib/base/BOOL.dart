part of "_.dart";

typedef BOOL = bool;

const //
TRUE = true,
    FALSE = /*false*/ !TRUE;

/*BOOL NOT(final BOOL value) => //
    value.NOT;*/

extension BOOL___extension on BOOL {
  BOOL get NOT => //
      !this;

  base__representation__text //
  representation__text() {
    return base__representation__text(
      (this ? "TRUE" : "FALSE"),
    );
  }
}
