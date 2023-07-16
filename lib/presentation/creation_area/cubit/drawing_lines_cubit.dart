import 'package:animation/data/animation_path.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'drawing_lines_state.dart';

class DrawingLinesCubit extends Cubit<DrawingLinesState> {
  DrawingLinesCubit() : super(DrawingLinesInitial());

  Offset offset = Offset.zero;
  Key key = UniqueKey();
  final Points points = Points();
  late List<Widget> pointsList = [points.points.first];
  bool onHover = false;

  void onPenUpdate(Offset offset) => emit(state);

  void updateOffset(Offset offset) {
    this.offset = offset;
    emit(DrawingLinesPenUpdate(offset, key: key));
  }
  void setKey(Key key) {
    this.key = key;
    emit(DrawingLinesSetKey(key, offset));
  }
  void addPoint(Offset offset) {
    print('add $offset');
    // this.offset = offset;
    points.addPoint(offset);
    emit(DrawingLinesAdd(offset));
  }

  void onPanStart() {
    onHover = true;
  }
  void onPanEnd() {
    onHover = false;
  }

// @override
// String toString() => 'TimerRunInProgress { duration: $offset }';
//
// @override
// void onChange(Change<DrawingLinesState> change) {
//   super.onChange(change);
//   print('${change.runtimeType} ${change}');
// }
}
