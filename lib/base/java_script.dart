part of "_.dart";

typedef java_script__type = /*Null|BOOL|APPROX|string|ARRAY<java_script__type>|java_script__object*/ Object__nilable;

typedef java_script__object = dictionary<string, java_script__type>;

final string Function(java_script__type) java_script__type__convert__text = //
    (const dart__convert.JsonEncoder()).convert;

final java_script__type Function(string) text__convert__java_script__type = //
    (const dart__convert.JsonDecoder()).convert;
