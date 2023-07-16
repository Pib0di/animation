import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'drow_point_state.dart';

class DrowPointCubit extends Cubit<DrowPointState> {
  DrowPointCubit() : super(DrowPointInitial());
}
