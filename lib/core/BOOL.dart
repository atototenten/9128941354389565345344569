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

  representation__text___compo //
  representation__text() {
    return representation__text___compo(
      (this ? "TRUE" : "FALSE"),
    );
  }
}
