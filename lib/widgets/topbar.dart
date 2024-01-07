import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grade_status/config/constants.dart';
import 'package:grade_status/main.dart';

const navigationItems = [
  NavMenu(label: 'Home', routeName: "/"),
  NavMenu(label: 'About', routeName: "/About"),
  NavMenu(label: 'Help', routeName: "/"),
  ToggleThemeBtn(),
];

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text("GRADE_STATUS", style: context.headline),
        navigation(context),
      ]),
    );
  }

  Widget navigation(BuildContext context) => context.isDesktop
      ? const NavigationMenu()
      : IconButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          icon: const Icon(Icons.menu));
}

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: 5,
      runSpacing: 5,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: navigationItems,
    );
  }
}

Drawer drawer() {
  List<Widget> drawerItems = [];
  drawerItems.addAll(navigationItems);
  drawerItems.insert(0, const DrawerHeader(child: Center(child: Text("GRADE_STATUS"))));

  return Drawer(
    child: Column(children: drawerItems),
  );
}

class ToggleThemeBtn extends StatelessWidget {
  const ToggleThemeBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.brightness_medium,
        size: 20.sp,
      ),
      onPressed: () {
        Theme.of(context).brightness == Brightness.light
            ? MyApp.of(context).toDark()
            : MyApp.of(context).toLight();
      },
    );
  }
}

class NavMenu extends StatelessWidget {
  const NavMenu({
    super.key,
    required this.label,
    required this.routeName,
  });
  final String label;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => Navigator.of(context).popAndPushNamed(routeName),
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Text(
        label,
        style: context.bodyText,
      ),
    );
  }
}
