import 'package:animation/presentation/creation_area/cubit/drawing_lines_cubit.dart';
import 'package:animation/presentation/side_menu/side_menu_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SideMenuPage extends StatelessWidget {
  const SideMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DrawingLinesCubit(),
      child: const SideMenu(),
    );
  }
}
