import 'package:animation/widgets/point_path/point_path.dart';
import 'package:flutter/material.dart';

class Points {
  List<Offset> coordinates = [];
  // Offset offset = const Offset(20, 30);
  List<Point> points = [];

  List<Widget> getList() {
    List<Widget> pointList = points;
    return pointList;
  }
  List<Point> getListPoints() {
    return points;
  }
  // Offset getOffset(){
  //   return Offset();
  // }

  List<Offset> getCoordinates(){
    return coordinates;
  }

  void addPoint(Offset offset) {
    // coordinates.add(offset);
    coordinates.add(offset);
    points.add(Point(left: offset.dx, top: offset.dy, key: UniqueKey()));
  }

  void deletePoint(int index) {
    // coordinates.removeAt(index);
  }
}
