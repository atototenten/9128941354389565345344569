import "dart:ffi" as dart__ffi;

import "../../core/_.dart";

extension byte__array__memory__offset__accession___extension //
    on byte__array {
  INT memory__offset() {
    return /*this.*/ address.value; /*
      this is a bug ,that "address" field is accessible outside the argument-context (to a leaf native external)
        but we exploit it */
  }
}
