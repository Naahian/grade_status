import 'package:flutter/material.dart';
import 'package:grade_status/config/constants.dart';

class HeroWidget extends StatelessWidget {
  final String heroTitle = "CGPA analyzer for Brac\nUniversity Students";
  final String heroSubtitle =
      "CGPA Calculator and required grade\nestimator according to your expectation";

  const HeroWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            heroTitle,
            style: context.title,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            heroSubtitle,
            style: context.subTitle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 25),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            direction: context.isDesktop ? Axis.horizontal : Axis.vertical,
            children: [
              cgpaButton(context),
              estimateButton(context),
            ],
          )
        ],
      ),
    );
  }

  SizedBox cgpaButton(BuildContext context) {
    return SizedBox(
        height: 45,
        child: FilledButton(
          onPressed: () => Navigator.of(context).popAndPushNamed("/cgpaCalculator"),
          child: const Text(
            "Calculate CGPA",
          ),
        ));
  }

  SizedBox estimateButton(BuildContext context) {
    return SizedBox(
        height: 45,
        child: OutlinedButton(
          onPressed: () {},
          child: const Text(
            "Estimate Grade",
          ),
        ));
  }
}
