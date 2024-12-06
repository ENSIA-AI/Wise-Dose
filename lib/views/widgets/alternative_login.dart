
import 'package:flutter/material.dart';
import 'package:wise_dose/views/themes/style_simple/colors.dart';
import 'package:wise_dose/views/themes/style_simple/styles.dart';

class AlternativeLogin extends StatelessWidget {
  const AlternativeLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 1,
                  width: 100,
                  decoration: BoxDecoration(border: Border.all(color: darkBlue, width: 1)),
                ),
                const SizedBox(width: 30),
                const Text("Or Use", style: paragraphText,),
                const SizedBox(width: 30),
                Container(
                  height: 1,
                  width: 100,
                  decoration: BoxDecoration(border: Border.all(color: darkBlue, width: 1)),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    shadowColor: Colors.transparent,
                    side: const BorderSide(
                      color: darkBlue, // Border color
                      width: 0.5, // Border width
                    ),
                  ), 
                  child: Container(
                    width: 80,
                    child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Facebook", style: paragraphText,)
                    ],
                  ),)
                ),
                const SizedBox(width: 30,),
                ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    shadowColor: Colors.transparent,
                    side: const BorderSide(
                      color: darkBlue, // Border color
                      width: 0.5, // Border width
                    ),
                  ), 
                  child: Container(
                    width: 80,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Google", style: paragraphText,)
                    ],
                  ),)
                ),
              ],
            ),]
    );
  }
}

