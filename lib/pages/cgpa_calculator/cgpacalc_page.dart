import 'package:flutter/material.dart';
import 'package:grade_status/config/constants.dart';
import 'package:grade_status/config/themes.dart';
import 'package:grade_status/widgets/widgets.dart';

import 'components/components.dart';

class CgpaCalcPage extends StatelessWidget {
  const CgpaCalcPage({super.key});
  final String title = "CGPA Calculator";
  final String subTitle =
      "Calculate what CGPA you will get after this semester based on your current Grades";

  @override
  Widget build(BuildContext context) {
    double padding = context.isDesktop ? context.paddingDesktop : context.paddingMobile;

    return Scaffold(
        drawer: drawer(),
        body: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.transparent, Pallete.primary.withOpacity(.15)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: padding),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const TopBar(),
                          //body content goes below
                          Text(title,
                              style: context.headline, textAlign: TextAlign.center),
                          Text(subTitle,
                              style: context.bodyText, textAlign: TextAlign.center),

                          const CgpaInfoForm(),
                        ],
                      ),
                    ),
                  ),
                ),
                const Footer(),
              ],
            ),
          ),
        ));
  }
}
