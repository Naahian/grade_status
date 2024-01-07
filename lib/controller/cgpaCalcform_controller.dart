import 'package:flutter/material.dart';
import 'models/course_model.dart';

class CgpaCalcFormController with ChangeNotifier {
  String? cgpa;
  double? currentCgpa;
  int? creditsEarned;
  PageController pageController = PageController();
  List<CourseModel> courseInfo = [];

  String messege = "";
  List<String> messeges = [
    "CG4 boy/girl 😎 embrace humbleness over pride :)",
    "Almost there! just a little more effort :)",
    "Not Bad! you can do even better next time. :D",
    "Dont worry! Remember, you are capable of doing great things :)",
    "Its not the end of the world. But it’s high time to be a hard worker and consistent",
  ];

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

    generateMessege(double.parse(cgpa!));
  }

  void generateMessege(double cgpa) {
    print(cgpa);
    if (cgpa == 4.0) {
      messege = messeges[0];
    } else if (3.4 < cgpa && cgpa <= 3.9) {
      messege = messeges[1];
    } else if (2.2 < cgpa && cgpa <= 3.4) {
      messege = messeges[2];
    } else if (1.5 < cgpa && cgpa <= 2.2) {
      messege = messeges[3];
    } else if (cgpa <= 1.5) {
      messege = messeges[4];
    }
    print(messege);
  }
}
