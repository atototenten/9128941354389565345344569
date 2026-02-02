import "dart:math" as math;

import "package:foundation/core/_.dart";
import "package:foundation/graphics/flutter/_.dart";

/*void main() {
  runApp(
    MaterialApp(
      home: SizedBox(
        height: 2 * 50, //100
        width: sqrt(3) * 50, //86.602
        child: CustomPaint(
          painter: HexagonPainter(),
          child: Container(),
        ),
      )/*ColoredBox(
        color: flutter__material__colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              box(),
              SizedBox(height: 32),
              gem(),
            ],
          ),
        ),
      )*/,
    ),
  );
}*/

class HexagonPainter //
    extends CustomPainter {
  @override
  void paint(
    final Canvas canvas,
    final Size size,
  ) =>
      canvas.drawPath(
        (Path()
          ..moveTo(size.width * 0.5, size.height * 0)
          ..lineTo(size.width * 1, size.height * 1 / 4)
          ..lineTo(size.width * 1, size.height * 3 / 4)
          ..lineTo(size.width * 0.5, size.height * 1)
          ..lineTo(size.width * 0, size.height * 3 / 4)
          ..lineTo(size.width * 0, size.height * 1 / 4)
          ..close()),
        (Paint()
          ..color = flutter__material__colors.teal
          ..style = PaintingStyle.fill),
      );

  @override
  BOOL shouldRepaint(
    final CustomPainter old_delegate,
  ) =>
      true;
}

class box extends StatelessWidget {
  const box();

  @override
  widget___protocol build(final widget__building__context___compo context) {
    const //
        width = 400.0,
        height = (width / 2.5),
        difference = 32;

    Color color(
      final int color__value,
    ) =>
        Color.fromARGB(
           INT__1__max,
          color__value,
          color__value,
          color__value,
        );

    final color__value = (INT__1__max - difference);

    /* FIX :handle color:value overflow */

    return DecoratedBox(
      decoration: BoxDecoration(
        color: color(((color__value - difference) - difference)),
        borderRadius: BorderRadius.all(
          Radius.circular(
            (.125 * width),
          ),
        ),
      ),
      child: SizedBox(
        width: width,
        height: height,
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.only(
              top: (.10 * height),
              right: (.10 * width),
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: color(color__value),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    (.1125 * width),
                  ),
                ),
              ),
              child: SizedBox(
                width: (.80 * width),
                height: (.45 * height),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class gem /*
usable for gems in video-games */
    extends StatelessWidget {
  const gem();

  @override
  widget___protocol build(final widget__building__context___compo context) {
    const //
        size = 400.0,
        difference = 32;

    Color color(
      final int color__value,
    ) =>
        Color.fromARGB(
           INT__1__max,
          color__value,
          color__value,
          color__value,
        );

    var color__value = INT__1__max;

    final //
        color_1 = color(color__value),
        deriv_ed__0__color = color((color__value -= difference)),
        deriv_ed__1__color = color((color__value -= difference)),
        deriv_ed__2__color = color((color__value -= difference));

    /* FIX :handle color:value overflow */

    return CustomPaint(
      size: Size(size, size),
      painter: hexagon__paint_er(
        border: color((color__value - difference - difference)),
        border__width: 8,
        color__top__left: color_1,
        color__top__right: deriv_ed__0__color,
        color__center__left: deriv_ed__0__color,
        color__center__right: deriv_ed__1__color,
        color__bottom__left: deriv_ed__1__color,
        color__bottom__right: deriv_ed__2__color,
      ),
    );
  }
}

class hexagon__paint_er extends CustomPainter {
  hexagon__paint_er({
    required this.color__bottom__right,
    required this.color__bottom__left,
    required this.color__center__left,
    required this.color__top__left,
    required this.color__top__right,
    required this.color__center__right,
    required this.border,
    required this.border__width,
  });

  final Color //
      color__bottom__right,
      color__bottom__left,
      color__center__left,
      color__top__left,
      color__top__right,
      color__center__right,
      border;

  final APPROX border__width;

  @override
  void paint(Canvas canvas, Size size) {
    final //
        centerX = size.width / 2,
        centerY = size.height / 2,
        radius = size.width / 2,
        borderPaint = Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = border__width
          ..color = border,
        trianglePaint1 = Paint()
          ..style = PaintingStyle.fill
          ..color = color__bottom__right,
        trianglePaint2 = Paint()
          ..style = PaintingStyle.fill
          ..color = color__bottom__left,
        trianglePaint3 = Paint()
          ..style = PaintingStyle.fill
          ..color = color__center__left,
        trianglePaint4 = Paint()
          ..style = PaintingStyle.fill
          ..color = color__top__left,
        trianglePaint5 = Paint()
          ..style = PaintingStyle.fill
          ..color = color__top__right,
        trianglePaint6 = Paint()
          ..style = PaintingStyle.fill
          ..color = color__center__right,
        angle = math.pi / 3,
        offsetAngle = math.pi / 6,
        hexagonPath = Path();

    for (int i = 0; i < 6; i++) {
      final //
          x = centerX + radius * math.cos(offsetAngle + angle * i),
          y = centerY + radius * math.sin(offsetAngle + angle * i);
      if (i == 0) {
        hexagonPath.moveTo(x, y);
      } else {
        hexagonPath.lineTo(x, y);
      }
    }

    hexagonPath.close();

    canvas.drawPath(hexagonPath, borderPaint);

    for (int i = 0; i < 6; i++) {
      final //
          trianglePath = Path(),
          x1 = centerX + radius * math.cos(offsetAngle + angle * i),
          y1 = centerY + radius * math.sin(offsetAngle + angle * i),
          x2 = centerX + radius * math.cos(offsetAngle + angle * (i + 1 >= 6 ? i + 1 - 6 : i + 1)),
          y2 = centerY + radius * math.sin(offsetAngle + angle * (i + 1 >= 6 ? i + 1 - 6 : i + 1)),
          x3 = centerX,
          y3 = centerY;

      trianglePath.moveTo(x1, y1);
      trianglePath.lineTo(x2, y2);
      trianglePath.lineTo(x3, y3);
      trianglePath.close();

      canvas.drawPath(
        trianglePath,
        switch (i) {
          0 => trianglePaint1,
          1 => trianglePaint2,
          2 => trianglePaint3,
          3 => trianglePaint4,
          4 => trianglePaint5,
          _ /*5*/ => trianglePaint6,
        },
      );
    }
  }

  @override
  BOOL shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
