import 'package:animation/presentation/creation_area/cubit/drawing_lines_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    double i = 200;
    return BlocBuilder<DrawingLinesCubit, DrawingLinesState>(
      builder: (context, state) {
        return ListView(children: [
          Text(
            state.offset.toString(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          ElevatedButton(
            onPressed: () {
              context.read<DrawingLinesCubit>().addPoint(Offset(i, i));
              i += 10;
            },
            child: const Text(
              'Добавить путь',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          )
        ]);
      },
    );
  }
}
