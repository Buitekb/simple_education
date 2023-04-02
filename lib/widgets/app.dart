import 'package:flutter/material.dart';
import 'package:simple_education/constants/app_colors.dart';
import 'package:simple_education/widgets/courses_section.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CoursesSection(),
      theme: ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.bottomBar,
          selectedItemColor: AppColors.accent,
          unselectedItemColor: AppColors.gray600,
          showUnselectedLabels: true,
        )
      ),
    );
  }
}
