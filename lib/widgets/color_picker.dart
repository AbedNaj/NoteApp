import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/cubits/add_note_cubit/add_note_cubit.dart';

import 'color_item.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({
    super.key,
  });

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  int currentIndex = 0;
  List<Color> colors = const [
    Color(0xff1976D2),
    Color(0xffFFC107),
    Color(0xff1E88E5),
    Color(0xffFFD700),
    Color(0xff0D47A1),
    Color(0xffC62828),
    Color(0xff009688),
    Color(0xff9C27B0),
    Color(0xffDC143C),
    Color(0xff008080),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;

                BlocProvider.of<AddNoteCubit>(context).sColor = colors[index];
                setState(() {});
              },
              child: ColorItem(
                isSelected: currentIndex == index,
                color: colors[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
