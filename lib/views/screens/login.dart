


import 'package:flutter/material.dart';
import 'package:wise_dose/views/themes/style_simple/colors.dart';
import 'package:wise_dose/views/themes/style_simple/styles.dart';
import 'package:wise_dose/views/widgets/gradient_button.dart';
import 'package:wise_dose/views/widgets/text_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              child: Image.asset("assets/images/Logo.png",),
            ),
            Form(
              key : _formGlobalKey,
              child: Column(
                children: [
                  CustomTextFormField(label: "UserName", hint: "UserName", validate: (value){
                    if(value == null || value == "a"){
                      return "aaaaa error";
                    }
                    return null;
                  }),
                  const SizedBox(height: 30,),
                  CustomTextFormField(label: "Password", hint: "Password", validate: (value){
                    if(value == null || value == "a"){
                      return "aaaaa error";
                    }
                    return null;
                  }),
                  const SizedBox(height: 30,),
                  Row(
                        children: [
                          Expanded(
                            child: Row(
                            children: [
                              GestureDetector(
                                onTap: (){},
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey, width: 1.0),
                                    borderRadius: BorderRadius.circular(5)        
                                  ),
                                ),
                              ),
                              const SizedBox(width: 5,),
                              const Text("Remember password", style: paragraphText,),
                            ],
                            )  
                          ),
                          const Text("Forgot password?",  style: orangeParagraphText,)
                        ]
                      ),
                  const SizedBox(height: 30),
                  GradientButton(onPressed: (){
                    _formGlobalKey.currentState!.validate();
                  }, 
                  text: "Login", 
                  gradient: buttonColor),
                ],
              ),
            ),
            const SizedBox(height: 30),
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
            const SizedBox(height: 30),
            Row(
              children: [
                ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    shadowColor: Colors.transparent,
                    side: const BorderSide(
                      color: darkBlue, // Border color
                      width: 0.5, // Border width
                    ),
                  ), 
                  child: const Row(
                    children: [
                      Text("Facebook", style: paragraphText,)
                    ],
                  ),
                ),
                const Expanded(child: SizedBox(height: 10,)),
                ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    shadowColor: Colors.transparent,
                    side: const BorderSide(
                      color: darkBlue, // Border color
                      width: 0.5, // Border width
                    ),
                  ), 
                  child: const Row(
                    children: [
                      Text("Google", style: paragraphText,)
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text("Don't have an account?", style: TextStyle(
                fontSize: 14,
                color: darkBlue
              ),),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: (){},
              child: const Text("Create account", style: TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(116, 163, 207, 1)
              )),
            )
          ]
        )
        )
        
        ),)
    );
  }
}