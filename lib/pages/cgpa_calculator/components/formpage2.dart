import 'package:flutter/material.dart';
import 'package:grade_status/config/constants.dart';
import 'package:grade_status/controller/cgpaCalcform_controller.dart';
import 'package:provider/provider.dart';

class FormPage2 extends StatefulWidget {
  const FormPage2({
    super.key,
  });

  @override
  State<FormPage2> createState() => _FormPage2State();
}

class _FormPage2State extends State<FormPage2> {
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
            Column(
              children: calcController.courseInfo
                  .map(
                    (info) => courseInfoField(info.courseNo),
                  )
                  .toList(),
            ),
            //
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildBackButton(),
                const SizedBox(width: 10),
                _buildCalculateBtn(),
              ],
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  FilledButton _buildCalculateBtn() {
    return FilledButton(
        onPressed: () {
          calcController.calculateCGPA();
          if (_formKey.currentState!.validate()) {
            showDialog(
              context: context,
              builder: (context) => resultDialog(context),
            );
          }
        },
        child: const Text("Calculate"));
  }

  AlertDialog resultDialog(BuildContext context) {
    return AlertDialog(
      title: Text("CGPA ${calcController.cgpa}", textAlign: TextAlign.center),
      content: Text(calcController.messege, textAlign: TextAlign.center),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Got it"),
        )
      ],
    );
  }

  OutlinedButton _buildBackButton() {
    return OutlinedButton(
        onPressed: () => calcController.pageController.jumpToPage(0),
        child: const Text("Back"));
  }

  Widget courseInfoField(int courseNo) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text("Course-$courseNo"),
        ),
        Row(
          children: [
            Expanded(child: _buildCredits(courseNo)),
            const SizedBox(width: 15),
            Expanded(child: _buildGradePoint(courseNo)),
          ],
        ),
      ],
    );
  }

  TextFormField _buildGradePoint(int courseNo) {
    return TextFormField(
      validator: validateGradePoint,
      onChanged: (newValue) =>
          calcController.courseInfo[courseNo - 1].gradePoint = double.parse(newValue),
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Grade Point",
      ),
    );
  }

  TextFormField _buildCredits(int courseNo) {
    return TextFormField(
      validator: validateCredits,
      onChanged: (newValue) =>
          calcController.courseInfo[courseNo - 1].credit = int.parse(newValue),
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Credit",
      ),
    );
  }

  String? validateGradePoint(value) {
    if (value!.isEmpty) return "*Required";
    try {
      double.parse(value);
    } catch (e) {
      return "*must be a number";
    }
    if (double.parse(value) > 4) return "must be less or equal to 4";
    return null;
  }

  String? validateCredits(value) {
    if (value!.isEmpty) return "*Required";

    try {
      int.parse(value);
    } catch (e) {
      return "*must be a number";
    }
    if (int.parse(value) > 4) return "*not more than 5";
    return null;
  }
}
