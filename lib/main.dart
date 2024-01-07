import 'package:flutter/material.dart';
import 'package:grade_status/config/constants.dart';
import 'package:grade_status/controller/cgpaCalcform_controller.dart';
import 'package:grade_status/pages/pages.dart';
import 'config/themes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CgpaCalcFormController()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    Size designSize = context.isMobile ? const Size(400, 800) : const Size(1024, 768);

    return ScreenUtilInit(
      designSize: designSize,
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'grade_status',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: _themeMode,
          initialRoute: "/",
          routes: {
            "/": (context) => child!,
            "/About": (context) => const Helppage(),
            "/cgpaCalculator": (context) => const CgpaCalcPage(),
          },
        );
      },
      child: const Homepage(),
    );
  }

  void toDark() => setState(() {
        _themeMode = ThemeMode.dark;
      });

  void toLight() => setState(() {
        _themeMode = ThemeMode.light;
      });
}
