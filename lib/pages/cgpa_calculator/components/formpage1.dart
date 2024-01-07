import 'package:flutter/material.dart';
import 'package:grade_status/config/constants.dart';
import 'package:grade_status/controller/cgpaCalcform_controller.dart';
import 'package:provider/provider.dart';

class FormPage1 extends StatefulWidget {
  const FormPage1({
    super.key,
  });

  @override
  State<FormPage1> createState() => _FormPage1State();
}

class _FormPage1State extends State<FormPage1> {
  final List<int> _coursesInSemester = [2, 3, 4, 5, 6];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late CgpaCalcFormController calcController;

  @override
  Widget build(BuildContext context) {
    calcController = context.read<CgpaCalcFormController>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.isDesktop ? 160 : 0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 25),
            _buildCurrentCgpa(),
            const SizedBox(height: 15),
            _buildCreditsEarned(),
            const SizedBox(height: 15),
            _buildcourseTaken(),
            const SizedBox(height: 15),
            _buildNextBtn(),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  FilledButton _buildNextBtn() {
    return FilledButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            calcController.pageController.jumpToPage(1);
          }
        },
        child: const Text("Next"));
  }

  TextFormField _buildCurrentCgpa() {
    return TextFormField(
      validator: validateCgpa,
      onChanged: (newValue) => calcController.currentCgpa = double.parse(newValue),
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Current CGPA(CGPA in last Semester)",
      ),
    );
  }

  Widget _buildcourseTaken() {
    return DropdownButtonFormField(
      items: _coursesInSemester
          .map((element) => DropdownMenuItem(value: element, child: Text("$element")))
          .toList(),
      validator: (value) {
        if (value == null) return "*Required";
      },
      onChanged: (newValue) => calcController.onSelectCourseTaken(newValue!),
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        label: Text("Number of Courses in this Semester"),
      ),
    );
  }

  TextFormField _buildCreditsEarned() {
    return TextFormField(
      validator: validateTotalCredits,
      onSaved: (newValue) => calcController.creditsEarned = int.parse(newValue!),
      onChanged: (newValue) => calcController.creditsEarned = int.parse(newValue),
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Total Credits Earned",
      ),
    );
  }

  String? validateCgpa(value) {
    if (value!.isEmpty) return "*Required";
    try {
      double.parse(value);
    } catch (e) {
      return "*must be a number";
    }
    if (double.parse(value) > 4) return "must be less or equal to 4";
    return null;
  }

  String? validateTotalCredits(value) {
    if (value!.isEmpty) return "*Required";

    try {
      int.parse(value);
    } catch (e) {
      return "*must be a number";
    }
    if (int.parse(value) > 150) return "must be less than 150";
    return null;
  }
}
