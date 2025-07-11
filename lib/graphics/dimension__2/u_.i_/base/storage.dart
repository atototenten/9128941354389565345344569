part of "_.dart";

late string //
    _directory__permanent__path,
    _directory__cache__path,
    _directory__temporary__path;

string base__storage__directory__permanent__path() /*
program level/specific
can be cleaned ,anytime ,by the user */
{
  return _directory__permanent__path;
}

string base__storage__directory__cache__path() /*
program specific
would be cleaned ,anytime ,by the environment ,or the user */
{
  return _directory__cache__path;
}

string base__storage__directory__temporary__path() /*
system:operating level (common/shared among all the programs)
will be cleaned ,before the environment's next run-time session ,or after the current session */
{
  return _directory__temporary__path;
}

value__asyn<void> base__storage__init_() async {
  /*base__platform__web__support__not__throw();*/
  if (base__program__compilation__platform == base__program__compilation__platforms.web) {
    return;
  }

  _directory__permanent__path = (await path_provider.getApplicationSupportDirectory()).path;
  _directory__cache__path = (await path_provider.getApplicationCacheDirectory()).path;
  _directory__temporary__path = (await path_provider.getTemporaryDirectory()).path;
}

class base__storage__cache__file {
  const base__storage__cache__file(
    this.path,
    this.mod__latest__date_time,
    this.bytes,
  );

  final string path;
  final int mod__latest__date_time;
  final BS1__array bytes;
}

/* external value__asyn<void> base__storage__cache__file__set(
  final string path,
  final BS1__array bytes, [
  final int? mod__latest__date_time,
]);

external value__asyn<base__storage__cache__file?> base__storage__cache__file__get(
  final string path,
); */
