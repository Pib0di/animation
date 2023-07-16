import 'package:flutter/material.dart';
import 'dart:ui';

class PathAnimation extends StatefulWidget {
  @override
  _PathAnimationState createState() => _PathAnimationState();
}

class _PathAnimationState extends State<PathAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    // Создаем анимационный контроллер
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    // Создаем кривую анимации
    CurvedAnimation curve =
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    // Создаем анимацию по пути
    _animation = Tween<Offset>(
      begin: Offset(100, 100),
      end: Offset(200, 200),
    ).animate(curve);

    // Запускаем анимацию
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Stack(fit: StackFit.expand, children: [
          Positioned(
            top: _animation.value.dx,
            left: _animation.value.dy,
            child: child!,
          ),
        ]);
      },
      child: Container(
        width: 100,
        height: 100,
        color: Colors.greenAccent,
      ),
    );
  }
}

// class PathAnimation extends StatefulWidget {
//   @override
//   _PathAnimationState createState() => _PathAnimationState();
// }
//
// class _PathAnimationState extends State<PathAnimation> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Offset> _animation;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Создаем анимационный контроллер
//     _controller = AnimationController(
//       duration: Duration(seconds: 10),
//       vsync: this,
//     );
//
//     // Определяем путь, по которому будет двигаться объект
//     final path = Path()
//       ..moveTo(50, 50)
//       ..lineTo(200, 200)
//       ..lineTo(250, 100)
//       ..lineTo(50, 50);
//
//     // Создаем Tween, используя путь
//     final tween = PathTween(path: path);
//
//     // Создаем анимацию
//     _animation = tween.animate(_controller);
//
//     // Запускаем анимацию
//     _controller.forward();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _animation,
//       builder: (context, child) {
//         return CustomPaint(
//           painter: PathPainter(path: _animation.value),
//           child: Container(),
//         );
//       },
//     );
//   }
// }
//
// class PathPainter extends CustomPainter {
//   Offset path;
//
//   PathPainter({required this.path});
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.redAccent
//       ..style = PaintingStyle.fill;
//
//     canvas.drawCircle(path, 10, paint);
//   }
//
//   @override
//   bool shouldRepaint(PathPainter oldDelegate) {
//     return oldDelegate.path != path;
//   }
// }
//
// class PathTween extends Tween<Offset> {
//   final Path path;
//
//   PathTween({required this.path}) : super(begin: Offset(50, 50), end: Offset(100, 100));
//
//   @override
//   Offset lerp(double t) {
//     final length = path.computeMetrics().length;
//     final distance = length * t;
//
//     Tangent? tangent = path.computeMetrics().isEmpty
//         ? null
//         : path.computeMetrics().first.getTangentForOffset(distance);
//
//     return Offset(tangent!.position!.dx, tangent!.position!.dy) ?? Offset(20, 20);
//   }
// }
