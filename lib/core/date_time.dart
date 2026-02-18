part of "_.dart";

class date_time {
  static const //
  duration__second__micro__seconds__nano = 1000,
      duration__second__milli__seconds__micro = 1000,
      duration__second__milli__seconds__nano = (duration__second__milli__seconds__micro * duration__second__micro__seconds__nano),
      duration__second__seconds__milli = 1000,
      duration__second__seconds__nano = (duration__second__seconds__milli * duration__second__milli__seconds__nano),
      duration__minute__seconds = 60,
      duration__minute__seconds__nano = (duration__minute__seconds * duration__second__seconds__nano),
      duration__hour__minutes = 60,
      duration__hour__seconds__nano = (duration__hour__minutes * duration__minute__seconds__nano),
      duration__day__hours = 24,
      duration__day__seconds__nano = (duration__day__hours * duration__hour__seconds__nano),
      duration__week__days = 7,
      duration__month__days = 30,
      duration__month__weeks = 4,
      duration__year__quarter__months = 3,
      duration__year__months = (4 * duration__year__quarter__months),
      duration__year__weeks = (4 /*quarters*/ * 13 /*((duration__year__quarter__months * duration__month__weeks) + 1)*/ ),
      duration__year__days = 365 /*((duration__year__quarter__months * duration__month__days) + 1)*/,
      duration__decade__years = 10,
      duration__year__cycle__years = 4,
      duration__year__cycle__days = ((duration__year__cycle__years * duration__year__days) + 1); /*
all values are simplified ,and not exact to solar values
the granular unit is nano-seconds until a day ,then itself */

  static const //
  offset__years__unix = 1970,
      offset__years__ideal__current = 2020;

  static const INT //
  year__reduced__size = INT__1__size,
      seconds__reduced__size = INT__4__size;

  factory date_time.current({
    required final INT offset__years /*= offset__years__ideal__current*/,
  }) {
    return date_time.DateTime__convert(
      DateTime.now() /* ".toUtc()" is point-less */,
      offset__years: offset__years,
    );
  }

  factory date_time.DateTime__convert(
    final DateTime value, {
    required final INT offset__years /*= offset__years__ideal__current*/,
  }) {
    return date_time.raw(
      seconds__nano: ((value.microsecondsSinceEpoch - DateTime.utc(offset__years).microsecondsSinceEpoch) * duration__second__micro__seconds__nano),
      offset__years: offset__years,
    );
  }

  date_time.minutes__convert(
    final INT minutes, {
    final INT seconds__nano__remaining = 0,
    required this.offset__years /*= offset__years__ideal__current*/,
  }) : _seconds__nano = (seconds__nano__remaining + (minutes * duration__minute__seconds__nano));

  const date_time.raw({
    required final INT seconds__nano,
    required this.offset__years,
  }) : _seconds__nano = seconds__nano;

  final INT _seconds__nano /*
stored as a single combined value ,instead of separate {28(`64-36`)-bits `minutes` ,and 36-bits `seconds__nano`}
  to prevent the wastage of capacity
    584 years for combined ,while 510 years for separate */;
  final INT offset__years;

  INT minutes() {
    return (_seconds__nano ~/ duration__minute__seconds__nano);
  }

  DateTime convert__DateTime() {
    final offset__seconds__micro = DateTime.utc(offset__years).microsecondsSinceEpoch;

    return DateTime.fromMicrosecondsSinceEpoch(
      ((_seconds__nano ~/ duration__second__micro__seconds__nano) + offset__seconds__micro),
      isUtc: TRUE,
    );
  }

  date_time__relative___union convert__relative({
    date_time? other /* must be after "this" */,
  }) {
    if (other == null) {
      other = date_time.current(
        offset__years: offset__years,
      );
    } else {
      if (other.offset__years != offset__years) {
        throw "`(other.offset__years ~= offset__years)`(${other.offset__years} ~= $offset__years)";
      }
    }

    final seconds__nano = (other._seconds__nano - _seconds__nano);

    if (seconds__nano < duration__minute__seconds__nano) {
      return date_time__relative__duration__little();
    }

    if (seconds__nano < duration__hour__seconds__nano) {
      return date_time__relative__duration__big(
        (seconds__nano ~/ duration__minute__seconds__nano),
        duration: date_time__relative__durations.minute,
      );
    } else if (seconds__nano < duration__day__seconds__nano) {
      return date_time__relative__duration__big(
        (seconds__nano ~/ duration__hour__seconds__nano),
        duration: date_time__relative__durations.hour,
      );
    }

    final days = (seconds__nano ~/ duration__day__seconds__nano);

    if (days < duration__week__days) {
      return date_time__relative__duration__big(
        days,
        duration: date_time__relative__durations.day,
      );
    } else if (days < duration__month__days) {
      return date_time__relative__duration__big(
        (days ~/ duration__week__days),
        duration: date_time__relative__durations.week,
      );
    } else if (days < duration__year__days) {
      return date_time__relative__duration__big(
        (days ~/ duration__month__days),
        duration: date_time__relative__durations.month,
      );
    }

    return date_time__relative__duration__big(
      (days ~/ duration__year__days),
      duration: date_time__relative__durations.year,
    );
  }

  string convert__text() {
    final //
    DateTime = convert__DateTime(),
        buffer = (StringBuffer()
          ..write(calendar__gregorian__month__static__text__array[DateTime.month - 1].substring(0, 3))
          ..write(" ")
          ..write(DateTime.day)
          ..write(" (")
          ..write(calendar__gregorian__week__day__static__text__array[DateTime.weekday - 1].substring(0, 3))
          ..write("), ")
          ..write(DateTime.year)
          ..write("; ")
          ..write(DateTime.hour)
          ..write(":")
          ..write(DateTime.minute)
          ..write(".")
          ..write(DateTime.second)
          ..write(DateTime.millisecond.toString().padLeft(3, "0"))
          ..write(DateTime.microsecond.toString().padLeft(3, "0"))
          ..write("".padLeft(3, "0"))),
        result = buffer.toString();

    buffer.clear();

    return result;
  }

  string convert__text__partial() {
    final //
    DateTime_1 = convert__DateTime(),
        DateTime__current = DateTime.now().toUtc(),
            //
            year__same___ok =
            (DateTime_1.year == DateTime__current.year),
        month__same___ok = (year__same___ok && (DateTime_1.month == DateTime__current.month)),
        day__same___ok = (month__same___ok && (DateTime_1.day == DateTime__current.day)),
        hour__same___ok = (day__same___ok && (DateTime_1.hour == DateTime__current.hour)),
        minute__same___ok = (hour__same___ok && (DateTime_1.minute == DateTime__current.minute)),
            //
            buffer =
            StringBuffer();

    if (month__same___ok.NOT) {
      buffer
        ..write(calendar__gregorian__month__static__text__array[DateTime_1.month - 1].substring(0, 3))
        ..write(" ");
    }

    if (day__same___ok.NOT) {
      buffer
        ..write(DateTime_1.day)
        ..write(" (")
        ..write(calendar__gregorian__week__day__static__text__array[DateTime_1.weekday - 1].substring(0, 3))
        ..write(")");
    }

    if (year__same___ok.NOT) {
      buffer
        ..write(", ")
        ..write(DateTime_1.year);
    }

    if (day__same___ok.NOT) {
      buffer //
          .write("; ");
    }

    if (hour__same___ok.NOT) {
      buffer
        ..write(DateTime_1.hour)
        ..write(":");
    }

    if (minute__same___ok) {
      buffer
        ..write("same ")
        ..write(
          (((DateTime_1.second == DateTime__current.second) && //
                  (DateTime_1.millisecond == DateTime__current.millisecond) && //
                  (DateTime_1.microsecond == DateTime__current.microsecond))
              ? "time"
              : "minute"),
        );
    } else {
      buffer //
          .write(DateTime_1.minute);

      if (hour__same___ok) {
        buffer //
            .write(" minutes");
      }
    }

    final result = buffer.toString();

    buffer.clear();

    return result;
  }
}

class date_time__relative__duration__big //
    implements date_time__relative___union {
  const date_time__relative__duration__big(
    this.value, {
    required this.duration,
  });

  final INT value;
  final date_time__relative__durations duration;

  @override
  string convert__text /*
FIX
  months and minutes ,are visually ambiguous ,for `concise__ok` */ ({
    final BOOL short___ok = FALSE,
  }) {
    final duration__title__suffix = //
        ((value == 1) /*F*/ //
        ? empty___string
        : "s");

    if (short___ok) {
      final duration__title = switch (duration) {
        date_time__relative__durations.month => "mo",
        date_time__relative__durations.minute => "min$duration__title__suffix",
        _ => duration.name[0],
      };

      return "$value${duration__title} ago";
    }

    return "$value ${duration.name}$duration__title__suffix ago";
  }
}

enum date_time__relative__durations //
{
  year,
  month,
  week,
  day,
  hour,
  minute,
}

class date_time__relative__duration__little /*
seconds */ //
    implements
        date_time__relative___union //
        {
  const date_time__relative__duration__little();

  @override
  string convert__text({
    final BOOL short___ok = FALSE,
  }) {
    if (short___ok) {
      return "moments ago";
    }

    return "few seconds ago";
  }
}

sealed class date_time__relative___union {
  string convert__text({
    final BOOL short___ok = FALSE,
  });
}

void date_time__test() {
  const offset__years = date_time.offset__years__ideal__current;

  [
    (
      title: "global default",
      date_time: DateTime.now().toUtc(),
      global___ok: TRUE,
    ),
    (
      title: "non-global(local) default",
      date_time: DateTime.now(),
      global___ok: FALSE,
    ),
    (
      title: "before a minute",
      date_time: DateTime.now().subtract(
        Duration(
          minutes: 1,
        ),
      ),
      global___ok: FALSE,
    ),
    (
      title: "before an hour",
      date_time: DateTime.now().subtract(
        Duration(
          hours: 1,
        ),
      ),
      global___ok: FALSE,
    ),
    (
      title: "before a day",
      date_time: DateTime.now().subtract(
        Duration(
          days: 1,
        ),
      ),
      global___ok: FALSE,
    ),
    (
      title: "before 45 days",
      date_time: DateTime.now().subtract(
        Duration(
          days: 45,
        ),
      ),
      global___ok: FALSE,
    ),
    (
      title: "before 400 days",
      date_time: DateTime.now().subtract(
        Duration(
          days: 400,
        ),
      ),
      global___ok: FALSE,
    ),
    (
      title: "before 800 days",
      date_time: DateTime.now().subtract(
        Duration(
          days: 800,
        ),
      ),
      global___ok: FALSE,
    ),
  ].iterate__forwards(
    (final e, final i) {
      e.title.print();

      final value = date_time.DateTime__convert(
        e.date_time,
        offset__years: offset__years,
      );

      e.date_time.toIso8601String().print();

      {
        final date_time = value.convert__DateTime(
          /*global___ok: e.global___ok,*/
        );

        if (date_time != e.date_time) {
          throw "${date_time.toIso8601String()} ~= original";
        }

        date_time.representation__text().print("DateTime");
      }

      value.representation__text().print("text");

      date_time
          .current(
            offset__years: offset__years,
          )
          .convert__relative(
            other: value,
          )
          .representation__text()
          .print("relative");

      print__blank();

      return TRUE;
    },
  );
}
