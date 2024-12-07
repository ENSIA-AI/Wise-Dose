


import 'package:flutter/material.dart';
import 'package:wise_dose/views/screens/calendar_page.dart';
import 'package:wise_dose/views/screens/login.dart';
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
  bool isChecked = false;
  String confPassword = "";

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
                    if(!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value ?? "")){
                      return "Invalid User Name";
                    }
                    return null;
                  }),
                  const SizedBox(height: 20,),
                  CustomTextFormField(label: "Email", hint: "Enter Email", validate: (value){
                    if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value ?? "")){
                      return "Invalid email address";
                    }
                    return null;
                  }),
                  const SizedBox(height: 20,),
                  CustomTextFormField(label: "Password", hint: "Enter Password", validate: (value){
                    confPassword = value ?? "";
                    if(value == null){
                      return "Password Must have digits, upper, lower and special characters";
                    }
                    bool hasUppercase = value.contains(RegExp(r'[A-Z]'));
                    bool hasDigits = value.contains(RegExp(r'[0-9]'));
                    bool hasLowercase = value.contains(RegExp(r'[a-z]'));
                    bool hasSpecialCharacters = value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
                    int hasMinLength = value.length;
                    if(!(hasUppercase && hasLowercase && hasSpecialCharacters && hasDigits)){
                      return "Password Must have digits, upper, lower and special characters";
                    }
                    if(hasMinLength < 8){
                      return "Password Must have At least 8 characters";
                    }
                    if(hasMinLength > 20){
                      return "Password Must have At Most 20 characters";
                    }
                    return null;
                  }),
                  const SizedBox(height: 20,),
                  CustomTextFormField(label: "Password Confirmation", hint: "Confirm Password", validate: (value){
                    if(value != confPassword){
                      return "Password Do Not Match";
                    }
                    return null;
                  }),
                  const SizedBox(height: 20,),
                  Row(
                        children: [
                          Expanded(
                            child: Row(
                            children: [
                            Transform.scale(
                              scale: 1, // Adjust the scale to make the checkbox bigger
                              child: Checkbox(
                                value: isChecked,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)
                                ),
                                side: const BorderSide(
                                  color: darkBlue, // Border color
                                  width: 0.5, // Border width
                                ),
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                },
                                activeColor: Colors.orange, // Color when checked
                                checkColor: Colors.white, // Color of the checkmark
                              ),
                            ),

                              const Text("Remember password", style: paragraphText,),
                            ],
                            )  
                          ),
                        ]
                      ),
                  const SizedBox(height: 20),
                  GradientButton(onPressed: (){
                    _formGlobalKey.currentState!.validate();
                  }, 
                  text: "Signup", 
                  gradient: buttonColor),
                ],
              ),
            ),
            const SizedBox(height: 20),
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
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  },
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

