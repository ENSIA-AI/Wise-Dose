


import 'package:flutter/material.dart';
import 'package:wise_dose/views/themes/style_simple/colors.dart';
import 'package:wise_dose/views/themes/style_simple/styles.dart';
import 'package:wise_dose/views/widgets/alternative_login.dart';
import 'package:wise_dose/views/widgets/gradient_button.dart';
import 'package:wise_dose/views/widgets/text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

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
              margin: const EdgeInsets.only(top: 20),
              child: Image.asset("assets/images/Logo.png"),
            ),
            Form(
              key : _formGlobalKey,
              child: Column(
                children: [
                  CustomTextFormField(label: "UserName", hint: "Enter UserName", validate: (value){
                    if(value == null || value == "a"){
                      return "aaaaa error";
                    }
                    return null;
                  }),
                  const SizedBox(height: 10,),
                  CustomTextFormField(label: "Email", hint: "Enter Email", validate: (value){
                    if(value == null || value == "a"){
                      return "aaaaa error";
                    }
                    return null;
                  }),
                  const SizedBox(height: 10,),
                  CustomTextFormField(label: "Password", hint: "Enter Password", validate: (value){
                    if(value == null || value == "a"){
                      return "aaaaa error";
                    }
                    return null;
                  }),
                  const SizedBox(height: 10,),
                  CustomTextFormField(label: "Password Confirmation", hint: "Confirm Password", validate: (value){
                    if(value == null || value == "a"){
                      return "aaaaa error";
                    }
                    return null;
                  }),
                  const SizedBox(height: 10,),
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
                        ]
                      ),
                  const SizedBox(height: 10),
                  GradientButton(onPressed: (){
                    _formGlobalKey.currentState!.validate();
                  }, 
                  text: "Signup", 
                  gradient: buttonColor),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const AlternativeLogin(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?", style: TextStyle(
                  fontSize: 14,
                  color: darkBlue
                ),),
                const SizedBox(width: 15),
                GestureDetector(
                  onTap: (){},
                    child: const Text("Login", style: TextStyle(
                      fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: Color.fromRGBO(116, 163, 207, 1)
                  )),
                )
              ],
            )
            
          ]
        )
        )
        
        ),)
    );
  }
}

