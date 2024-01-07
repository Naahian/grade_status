import 'package:flutter/material.dart';
import 'package:grade_status/config/constants.dart';
import 'package:grade_status/widgets/widgets.dart';

class Helppage extends StatelessWidget {
  const Helppage({super.key});

  @override
  Widget build(BuildContext context) {
    double padding = context.isDesktop ? context.paddingDesktop : context.paddingMobile;
    return Scaffold(
        drawer: drawer(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: Column(children: [
                  const TopBar(),
                  //body content goes below
                  Text("Title Text", style: context.title),
                  Text("Subtitle Text", style: context.subTitle),
                  Text("Body Text", style: context.bodyText),
                ]),
              ),
              const Footer(),
            ],
          ),
        ));
  }
}
