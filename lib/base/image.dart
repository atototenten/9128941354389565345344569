part of "_.dart";

/*
  to compress a raster image (or picture, or photograph)
    convert the bitmap(bytes sequence)
      from `RGBA...RGBA...RGBA`
      to `RRR...GGG...BBB...AAA...`
        then pass through run-length compression
    if has alpha color
      convert 16-bit per-color (hdr)
        to 8-bit per-color (sdr)
          -> 4-bit per-color
            -> 2-bit per-color
    if alpha is absent
      hdr -> sdr
        further reduction will cause byte alignment issues
    if alpha is 0, hence pixel is invisible
      make it empty
      
  `https://compress-or-die.com/Understanding-PNG`
  `https://phoboslab.org/log/2021/11/qoi-fast-lossless-image-compression`
  `https://q-viper.github.io/2021/05/24/coding-run-length-encoding-in-python/` */

const //
    image__dimension__size = NI2__size;

BS1__array image__convert__bytes(
  final BS1__array image, {
  required final NI width,
  required final NI height,
  required final BOOL b__alpha,
}) /*
  `__pixel__sub`
  test
    file.bytes.count: 939_469
    image
      width: 1_024
      height: 1_024
      channel__array__count: 3
      pixel.arr.count: 3_145_728
    result
      channel.red.bytes.count: 1_838_168
      channel.blue.bytes.count: 1_837_872
      channel.green.bytes.count: 1_840_572
      bytes.count: 5_516_621

  testing
    natural(mountains) pictures, video-game textures
      repetition count
        0: easily three-fourth
        <3: hardly one-tenth
        >7: mere single digit */
{
  final //
      dimension = (width * height),
      channel__array__count = (!b__alpha ? 3 : 4),
      channel__array = array__new__generated(
        channel__array__count,
        (final _) => base__byte__array__accumulation(),
      ),
      channel__rep__count__array = array__new__filled(
        channel__array__count,
        0,
      ),
      channel__rep__not__count__array = array__new__filled(
        channel__array__count,
        0,
      ),
      channel__rep__minor__count__array = array__new__filled(
        channel__array__count,
        0,
      ),
      channel__rep__major__count__array = array__new__filled(
        channel__array__count,
        0,
      ),
      channel__rep__value__array = array__new__filled<NI?>(
        channel__array__count,
        null,
      );

  width.representation__text().print("width");
  height.representation__text().print("height");
  dimension.representation__text().print("dimension");
  channel__array__count.representation__text().print("channel__array__count");

  base__iterate__basic(dimension, (final pixel__id) {
    base__iterate__basic(channel__array__count, (final channel__id) {
      final //
          id = (channel__id + (pixel__id * channel__array__count)),
          value__rep = channel__rep__value__array[channel__id];

      if (value__rep != null) {
        if (value__rep != image[id]) {
          channel__array[channel__id]
            ..add__NI((1 + channel__rep__count__array[channel__id]))
            ..add__NI(value__rep);

          if (channel__rep__count__array[channel__id] == 0) //
            channel__rep__not__count__array[channel__id] += 1;
          else if (channel__rep__count__array[channel__id] < 3) //
            channel__rep__minor__count__array[channel__id] += 1;
          else if (channel__rep__count__array[channel__id] > 7) //
            channel__rep__major__count__array[channel__id] += 1;

          channel__rep__count__array[channel__id] = 0;
          channel__rep__value__array[channel__id] = image[id];
        } else //
          channel__rep__count__array[channel__id] += 1;
      } else //
        channel__rep__value__array[channel__id] = image[id];
    });
  });

  base__iterate__basic(channel__array__count, (final channel__id) {
    //final id = (channel__id + ((dimension - 1) * channel__array__count));

    if (channel__rep__value__array[channel__id] != null) {
      channel__array[channel__id]
        ..add__NI((1 + channel__rep__count__array[channel__id]))
        ..add__NI(channel__rep__value__array[channel__id]!);

      if (channel__rep__count__array[channel__id] == 0) //
        channel__rep__not__count__array[channel__id] += 1;
    }
  });

  final sink = base__byte__array__accumulation();

  channel__array.iterate__basic(    (final channel__id, final channel) {
      final bys = channel.convert__byte__array();

      bys.representation__text().print(
            "channel__bys",
          );

      bys.bytes__count.representation__text().print(
            "channel__bys.count",
          );

      {
        final //
            rep__not__count = channel__rep__not__count__array[channel__id],
            effectiveness__percentage = (((dimension - rep__not__count) / dimension) * 100)
            /*,channel__bys__count__optimistic = ((bys.count / effectiveness__percentage) * 100)*/ /*
  blunder
    test returned a value, approx `(8 * dimension)` */
            ;

        rep__not__count.representation__text().print(
              "sub-pixel, un-repetition, count",
            );

        channel__rep__minor__count__array[channel__id].representation__text().print(
              "sub-pixel, minor(1-3 inclusive), repetition, count",
            );

        channel__rep__major__count__array[channel__id].representation__text().print(
              "sub-pixel, major(7+ inclusive), repetition, count",
            );

        effectiveness__percentage.toStringAsFixed(2).representation__text().print(
              "compression, effectiveness, percentage",
            );
      }

      sink
        ..add__NI(bys.bytes__count)
        ..add(bys);
    },
  );

  final result = sink.convert__byte__array();

  result.elements__count.representation__text().print(
        "result.count",
      );

  return result;
}
