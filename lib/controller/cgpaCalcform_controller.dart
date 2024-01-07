import 'package:flutter/material.dart';
import 'models/course_model.dart';

class CgpaCalcFormController with ChangeNotifier {
  String? cgpa;
  double? currentCgpa;
  int? creditsEarned;
  PageController pageController = PageController();
  List<CourseModel> courseInfo = [];

  void onSelectCourseTaken(int courseTaken) {
    courseInfo = List.generate(
      courseTaken,
      (index) => CourseModel(courseNo: index + 1, credit: null, gradePoint: null),
    );
  }

  void calculateCGPA() {
    double totalGrade = 0;
    double totalCredit = 0;
    double gpa = 0;

    for (var course in courseInfo) {
      totalGrade += course.gradePoint!;
      totalCredit += course.credit!;
    }
    gpa = totalGrade / courseInfo.length;

    cgpa = ((gpa * totalCredit + currentCgpa! * creditsEarned!) /
            (creditsEarned! + totalCredit))
        .toStringAsFixed(2);
  }
}
