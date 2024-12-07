
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wise_dose/views/themes/style_simple/colors.dart';
import 'package:wise_dose/views/themes/style_simple/styles.dart';
import 'package:wise_dose/views/widgets/gradient_button.dart';
import 'package:wise_dose/views/widgets/transparent_button.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final pageController = PageController();
  late bool inFirstPage;
  late bool inLastPage;

  @override
  void initState() {
    inFirstPage = true;
    inLastPage = false;
    super.initState();
  }

  @override void dispose() {
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
      body: Container(
        padding: const EdgeInsets.only(bottom: 150),
        child: PageView(
        controller: pageController,
        onPageChanged: (value) {
            setState(() {
              inFirstPage = (value == 0);
              inLastPage = (value == 4);
            });
        },
        children: [
          Column(
            children: [
                const SizedBox(height: 100,),
                SvgPicture.asset("assets/images/onboarding1.svg",),
                const SizedBox(height: 10,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text("You too? You always forget to take your pills on time?", style: standardText, textAlign: TextAlign.center,),
                )
            ],
          ),
          Column(
            children: [
              const SizedBox(height: 93,),
              SvgPicture.asset("assets/images/onboarding2.svg",),
              const SizedBox(height: 17,),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    text: 'No longer a problem with our app, with daily ', // First part of the text
                    style: standardText,
                    children: [
                      TextSpan(
                        text: 'reminders, notifications and history statistics!', // Second part
                        style: lightBlueStandardText,
                      ),
                    ],
                  ),
                )
                )             
            ],
          ),
          Column(
            children: [
              const SizedBox(height: 94,),              
              SvgPicture.asset("assets/images/onboarding3.svg",),
              const SizedBox(height: 16,), 
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    text: 'Create ', // First part of the text
                    style: standardText,
                    children: [
                      TextSpan(
                        text: 'your account ', // Second part
                        style: lightBlueStandardText,
                      ),
                      TextSpan(
                        text: 'to manage your medications from other devices!', // Second part
                        style: standardText,
                      ),
                    ],
                  ),
                )     
              )         
            ],
          ),
          Column(
            children: [
              const SizedBox(height: 170,),              
              SvgPicture.asset("assets/images/onboarding4.svg",),
              const SizedBox(height: 24,), 
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    text: 'You want to manage your ', // First part of the text
                    style: standardText,
                    children: [
                      TextSpan(
                        text: 'whole family’s ', // Second part
                        style: lightBlueStandardText,
                      ),
                      TextSpan(
                        text: 'medications?', // Second part
                        style: standardText,
                      ),
                    ],
                  ),
                )
              )               
            ],
          ),
          Column(
            children: [
              const SizedBox(height: 95,),              
              SvgPicture.asset("assets/images/onboarding5.svg",),
              const SizedBox(height: 14,),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  text: 'Manage multiple accounts with our ', // First part of the text
                  style: standardText,
                  children: [
                    TextSpan(
                      text: 'multi-user features!', // Second part
                      style: lightBlueStandardText,
                    ),
                  ],
                ),
              )
              )                         
             ],
          ),
        ],
      ),
      ),
      bottomSheet: Container(
        color: const Color.fromRGBO(250, 250, 250, 1),
        height: 200,
        child: Column(
              children: [
                SmoothPageIndicator(
                  controller: pageController, 
                  count: 5,
                  effect: const WormEffect(
                    dotColor: darkBlue,
                    activeDotColor: lightBlue,
                    dotWidth: 10,
                    dotHeight: 10,
                    spacing: 5
                  ),
                  onDotClicked: (index) => pageController.animateToPage(
                    index, 
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeIn
                  ),
                ),
                const SizedBox(height: 50,),
                if(!inFirstPage && !inLastPage)  Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TransparentButton(onPressed: (){
                          pageController.previousPage(duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
                        }, 
                        content: "Back", width: 100
                      ),
                    GradientButton(onPressed: (){
                      pageController.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
                    }, text: "Next", gradient: buttonColor, width: 100,)
                ],)
              ),  
              if(inFirstPage) Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                        GradientButton(onPressed: (){
                          pageController.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
                        }, text: "Next", gradient: buttonColor, width: 100,)
                    ],)
                ),
              if(inLastPage) Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                        GradientButton(onPressed: () async{
                        }, text: "Create account", gradient: buttonColor, width: 200,),
                        const SizedBox(height: 10,),
                        TransparentButton(onPressed: ()async {
                        }, 
                        content: "Stay offline", width: 200
                      ),
                        ],
                      )
                        
                    ],)
                )
              ],
            ),
      ),
    );
  }
}