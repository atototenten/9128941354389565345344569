part of "_.dart";

typedef java_script__type = /*Null|BOOL|NE8R|string|array<java_script__type>|java_script__object*/ Object__nilable;

typedef java_script__object = dictionary<string__raw, java_script__type>;

final string__raw Function(java_script__type) java_script__object__convert__text = //
    (const convert.JsonEncoder()).convert;

final java_script__type Function(string__raw) text__convert__java_script__object = //
    (const convert.JsonDecoder()).convert;
