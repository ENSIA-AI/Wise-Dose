

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingInstance extends StatefulWidget {

  const OnboardingInstance({
    super.key,
  });

  @override
  State<OnboardingInstance> createState() => _OnboardingInstanceState();
}

class _OnboardingInstanceState extends State<OnboardingInstance> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          SvgPicture.asset("assets/images/onboarding1.svg"),
          const Text("You too? You always forget to take your pills on time?"),
        ],
      );
  }
}