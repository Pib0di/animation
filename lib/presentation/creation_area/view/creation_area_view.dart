import 'package:animation/presentation/creation_area/cubit/drawing_lines_cubit.dart';
import 'package:animation/widgets/path_animation/path_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreationView extends StatelessWidget {
  const CreationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawingLinesCubit, DrawingLinesState>(
      builder: (context, state) {
        final drawingLinesCubit = context.read<DrawingLinesCubit>();
        return GestureDetector(
          onPanUpdate: (event) {
            drawingLinesCubit.updateOffset(event.localPosition);
          },
          onPanStart: (event) {
            drawingLinesCubit.onPanStart();
          },
          onPanEnd: (event) {
            drawingLinesCubit.onPanEnd();
          },
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('http://klubmama.ru/uploads/posts/2022-08/1661300371_17-klubmama-ru-p-podelka-zakat-na-more-foto-19.jpg'),
                    )
                ),
              ),
              PathAnimation(),
              const sdfa(),
              Stack(
                children: [
                  ...drawingLinesCubit.points.getList().isNotEmpty
                      ? drawingLinesCubit.points.getList()
                      : [
                          const Center(
                              child: Text(
                            'Маршрут пустой',
                            style: TextStyle(color: Colors.white),
                          ))
                        ],
                ],
              ),

            ],
          ),
        );
      },
    );
  }
}

class LinesPainter extends CustomPainter {
  LinesPainter(this.context);

  final BuildContext context;

  @override
  bool? hitTest(Offset position) {
    // TODO: implement hitTest
    // print('hitTest => $position');
    final rect = const Rect.fromLTWH(0, 0, 100, 100);
    // print(rect.contains(position));

    double calculateDistanceFromPointToLine(Offset point, Offset lineStart, Offset lineEnd) {
      double dx = lineEnd.dx - lineStart.dx;
      double dy = lineEnd.dy - lineStart.dy;
      double distance = (dy * point.dx - dx * point.dy + lineEnd.dx * lineStart.dy - lineEnd.dy * lineStart.dx).abs() /
          Offset(dx, dy).distance;

      return distance;
    }
    // print(calculateDistanceFromPointToLine(position, Offset(0, 0), Offset(200, 200)));
    return super.hitTest(position);
  }
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 3
      ..style = PaintingStyle.fill;
    final path = Path();
    final points = context.read<DrawingLinesCubit>().points;
    if (context.read<DrawingLinesCubit>().points.getCoordinates().length >= 2) {
      for (var i = 0; i < points.getCoordinates().length - 1; ++i) {
        canvas.drawLine(
          points.getListPoints()[i].getOffset(),
          points.getListPoints()[i + 1].getOffset(),
          paint,
        );

      }
    }
  }

  @override
  bool shouldRepaint(LinesPainter oldDelegate) => false;
}

class LinePainter extends CustomPainter {
  LinePainter(this.context);

  Offset offset1 = Offset.zero;
  Offset offset2 = Offset.zero;
  final BuildContext context;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;
    canvas.drawLine(
      Offset.zero,
      context.read<DrawingLinesCubit>().state.offset,
      paint,
    );
  }

  @override
  bool shouldRepaint(LinePainter oldDelegate) => false;
}
class CirclePainter extends CustomPainter {
  CirclePainter(this.context);

  final BuildContext context;
  Offset position = const Offset(200, 200);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;
    // position = context.read<DrawingLinesCubit>().state.offset;
    canvas.drawCircle(position, 10, paint); // Рисуем прямоугольник на холсте
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) => false;
}

class sdfa extends StatelessWidget {
  const sdfa({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawingLinesCubit, DrawingLinesState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            print('SDHOFIH');
          },
          child: Stack(
            children: [
              SizedBox(
                width: double.maxFinite,
                height: double.maxFinite,
                child: CustomPaint(
                  painter: LinesPainter(context),
                ),
              ),
              Text('${state.offset}', style: Theme.of(context).textTheme.displayMedium,),
              // ClipPath(
              //   clipper: MyCustomClipper(context),
              //   child: Container(
              //     color: Colors.blueAccent,
              //     // width: double.maxFinite,
              //     // height: double.maxFinite,
              //     // child: Text('${state.offset}'),
              //   ),
              // ),
            ],
          ),
        );
      },
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  MyCustomClipper(this.context);

  final BuildContext context;

  @override
  Path getClip(Size size) {
    Path path = Path();
    Paint()
      ..color = Colors.white
      ..strokeWidth = 4
      ..style = PaintingStyle.fill;

    path.moveTo(0, size.height / 2);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width, (size.height-1) / 2);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
