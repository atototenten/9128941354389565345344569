import "package:base/base/_.dart";

import "dart:io" as io;

//

const //
    io__shell__static__text__environment__variable__id = "SHELL";

text? io__shell() => //
    io.Platform.environment[io__shell__static__text__environment__variable__id];

string io__shell__process__run(
  final string command,
) {
  final shell = io__shell();

  if (shell ==  null) //
    throw "shell ==  null";

  final result = io.Process.runSync(
    shell,
    <string>["-c", command],
  );

  if (result.exitCode != 0) //
    throw "${result.exitCode}(exitCode), is NOT 0; stderr: \"${result.stderr}\"";

  final stdout = result.stdout;

  if (stdout is! text) //
    throw "\"$stdout\"(stdout) is NOT `text`";

  return stdout;
}
