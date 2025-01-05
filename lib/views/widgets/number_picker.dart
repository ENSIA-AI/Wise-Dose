// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:wise_dose/cubits/number_picker_cubit.dart';
import 'package:wise_dose/views/themes/style_simple/styles.dart';


class NumberPage extends StatelessWidget {
  const NumberPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: BlocBuilder<NumberPickerCubit, List<int>>(
          builder: (context, state) { 
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberPicker(
                  minValue: 0,
                  maxValue: 23,
                  value: state[0],
                  zeroPad: true,
                  infiniteLoop: true,
                  itemWidth: 80,
                  itemHeight: 60,
                  onChanged: (value) {
                    context.read<NumberPickerCubit>().setHours(value);
                  },
                  textStyle: unselectedCounter,
                  selectedTextStyle: selectedCounter,
                ),
                Text(
                  ":",
                  style: TextStyle(color: Colors.black, fontSize: 40.0),
                ),
                NumberPicker(
                  minValue: 0,
                  maxValue: 59,
                  value: state[1],
                  zeroPad: true,
                  infiniteLoop: true,
                  itemWidth: 80,
                  itemHeight: 60,
                  onChanged: (value) {
                    context.read<NumberPickerCubit>().setMinutes(value);
                  },
                  textStyle: unselectedCounter,
                  selectedTextStyle: selectedCounter,),
                  Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    )
                ]);
              }),
      ),
    );
  }
}
