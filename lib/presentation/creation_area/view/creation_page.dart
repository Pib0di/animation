import 'package:animation/presentation/creation_area/cubit/drawing_lines_cubit.dart';
import 'package:animation/presentation/creation_area/view/creation_area_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreationPage extends StatelessWidget {
  const CreationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DrawingLinesCubit(),
      child: const CreationView(),
    );
  }
}
