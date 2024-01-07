import 'package:flutter/material.dart';
import 'package:grade_status/config/constants.dart';
import 'package:grade_status/config/themes.dart';
import 'package:grade_status/widgets/widgets.dart';
import 'components/components.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

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
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: const Column(children: [
              TopBar(),
              HeroWidget(),
            ]),
          ),
          const Footer(),
        ]),
      ),
    );
  }
}
