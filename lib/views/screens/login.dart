import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wise_dose/cubits/remember_pwd_cubit.dart';
import 'package:wise_dose/views/screens/signup.dart';
import 'package:wise_dose/views/themes/style_simple/colors.dart';
import 'package:wise_dose/views/themes/style_simple/styles.dart';
import 'package:wise_dose/views/widgets/alternative_login.dart';
import 'package:wise_dose/views/widgets/bottom_bar.dart';
import 'package:wise_dose/views/widgets/gradient_button.dart';
import 'package:wise_dose/views/widgets/text_field.dart';




class Login extends StatelessWidget {
  final _formGlobalKey = GlobalKey<FormState>();

  Login({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
        body: SingleChildScrollView(
      child: Center(
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 20,),
                      child: Image.asset("assets/images/Logo.jpeg", height: 125),
                    ),
                    Form(
                      key: _formGlobalKey,
                      child: Column(
                        children: [
                          CustomTextFormField(
                              label: "UserName",
                              hint: "UserName",
                              validate: (value) {
                                if (!RegExp(r'^[a-zA-Z0-9]+$')
                                    .hasMatch(value ?? "")) {
                                  return "Invalid User Name";
                                }
                                return null;
                              },
                              save: (value) {},
                              ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextFormField(
                              obscure: true,
                              label: "Password",
                              hint: "Password",
                              validate: (value) {
                                if (value == null) {
                                  return "Password Must have digits, upper, lower and special characters";
                                }
                                bool hasUppercase =
                                    value.contains(RegExp(r'[A-Z]'));
                                bool hasDigits =
                                    value.contains(RegExp(r'[0-9]'));
                                bool hasLowercase =
                                    value.contains(RegExp(r'[a-z]'));
                                bool hasSpecialCharacters = value.contains(
                                    RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
                                int hasMinLength = value.length;
                                if (!(hasUppercase &&
                                    hasLowercase &&
                                    hasSpecialCharacters &&
                                    hasDigits)) {
                                  return "Password Must have digits, upper, lower and special characters";
                                }
                                if (hasMinLength < 8) {
                                  return "Password Must have At least 8 characters";
                                }
                                if (hasMinLength > 20) {
                                  return "Password Must have At Most 20 characters";
                                }
                                return null;
                              },                                   
                              save: (value) {},
                            ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(children: [
                            Expanded(
                              child: Row(
                              children: [
                                BlocBuilder<RememberPwdCubit, bool>(
                                  builder: (context, isChecked){
                                  return (
                                    Transform.scale(
                                      scale:
                                          1, // Adjust the scale to make the checkbox bigger
                                      child: Checkbox(
                                        value: isChecked,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(4)),
                                        side: const BorderSide(
                                          color: darkBlue, // Border color
                                          width: 0.5, // Border width
                                        ),
                                        onChanged: (bool? value) {
                                          context.read<RememberPwdCubit>().changeRememberState();
                                        },
                                        activeColor:
                                            Colors.orange, // Color when checked
                                        checkColor:
                                            Colors.white, // Color of the checkmark
                                      ),
                                    )
                                  );
                                }),                         
                                const Text(
                                  "Remember password",
                                  style: paragraphText,
                                ),
                              ],
                            )),
                            const Text(
                              "Forgot password?",
                              style: orangeParagraphText,
                            )
                          ]),
                          const SizedBox(height: 10),
                          GradientButton(
                              onPressed: () {
                                if (_formGlobalKey.currentState!.validate()) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Bottom_Nav_Bar()));
                                }
                              },
                              text: "Login",
                              gradient: buttonColor),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const AlternativeLogin(),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(fontSize: 14, color: darkBlue),
                        ),
                        const SizedBox(width: 15),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Signup()),
                            );
                          },
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Signup()));
                            },
                            child: const Text("Signup",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: Color.fromRGBO(116, 163, 207, 1))),
                          ),
                        )
                      ],
                    )
                  ]))),
    ));
  }
}
