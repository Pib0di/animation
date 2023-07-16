import 'package:animation/presentation/creation_area/cubit/drawing_lines_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Point extends StatefulWidget {
  Point({required this.left, required this.top, required super.key});

  static const double widthHeight = 15;
  double left = -widthHeight / 2;
  double top = -widthHeight / 2;

  Offset getOffset(){
    return Offset(left+ widthHeight / 2, top+ widthHeight / 2);
  }
  @override
  State<Point> createState() => _PointState();
}

class _PointState extends State<Point> {
  bool isSelect = false;
  final double widthHeight = Point.widthHeight;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawingLinesCubit, DrawingLinesState>(
      builder: (blocContext, state) {
        if (isSelect || state.key == context.widget.key) {
          widget.left = state.offset.dx - widthHeight / 2;
          widget.top = state.offset.dy - widthHeight / 2;
        }
        return Positioned(
          left: widget.left,
          top: widget.top,
          child: MouseRegion(
            onEnter: (enter) {
              setState(() {
                isSelect = true;
              });
              blocContext.read<DrawingLinesCubit>().updateOffset(Offset(
                  widget.left + widthHeight / 2, widget.top + widthHeight / 2));
              if (!blocContext.read<DrawingLinesCubit>().onHover) {
                blocContext
                    .read<DrawingLinesCubit>()
                    .setKey(context.widget.key!);
              }
            },
            onExit: (exit) {
              setState(() {
                isSelect = false;
              });
            },
            child: Container(
              width: widthHeight,
              height: widthHeight,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  width: isSelect ? 5 : 2,
                  color: isSelect ? Colors.lightGreen : Colors.blueAccent,
                  strokeAlign: BorderSide.strokeAlignOutside,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
