part of 'drawing_lines_cubit.dart';

@immutable
abstract class DrawingLinesState {
  DrawingLinesState(this.offset, {this.key} );

  late final Offset offset;
  late Key? key = UniqueKey();
}

class DrawingLinesInitial extends DrawingLinesState {
  DrawingLinesInitial() : super(Offset.zero);
}

class DrawingLinesPenUpdate extends DrawingLinesState {
  DrawingLinesPenUpdate(super.offset, {super.key});
}

class DrawingLinesAdd extends DrawingLinesState {
  DrawingLinesAdd(super.offset);
}

class DrawingLinesSetKey extends DrawingLinesState {
  DrawingLinesSetKey(this.key, super.offset);
  Key? key;
}