import "package:base/base/_.dart";

import "package:dart_lmdb2/dart_lmdb2.dart" as lib;

/*
LMDB is preferable over SQLite
  because
    former's data-mutation operation ,writes the changes to storage ,just once
      instead of the latter's practice of writing twice
        in both the transacting options (write-ahead-log ,and rollback-journal)
    the former is designed specifically for the modern storage-hardware
      example : former's data mutation behavior matches the modern storage-hardware (example : flash memory)
        which is "internal copy-on-write"
          while "in-place write" is not supported at all
    the former is a storage-engine
      hence lowest-level ,and higher-efficiency
      while the latter is fundamentally a {relational-data modeling} abstraction (over an internal storage-engine)
        with many arguably excessive (considering the an embedded nature) features
          example : a complete SQL-VM ,which has very-high overhead ,and {slightest ,and fragile} query-optimizations
    latter cannot represent(model) many prominent data-struct.s (simple ,as well as complex)
      example : unions ,arrays ,enum.s
      although manually encoding ,then storing the data as native types (example : integers ,bytes) ,is possible
        but an un-natural work-around ,and discouraged by the experts */
