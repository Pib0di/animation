import 'package:animation/presentation/creation_area/cubit/drawing_lines_cubit.dart';
import 'package:animation/presentation/creation_area/view/creation_area_view.dart';
import 'package:animation/presentation/creation_area/view/creation_page.dart';
import 'package:animation/presentation/side_menu/side_menu_page.dart';
import 'package:animation/presentation/side_menu/side_menu_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DrawingLinesCubit(),
      child: const Row(
        children: [
          SizedBox(
            width: 300,
            child: SideMenu(),
          ),
          Expanded(child: CreationView()),
        ],
      ),
    );
  }
}
