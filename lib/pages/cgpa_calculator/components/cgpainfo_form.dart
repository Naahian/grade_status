import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grade_status/config/constants.dart';
import 'package:grade_status/controller/cgpaCalcform_controller.dart';
import 'package:provider/provider.dart';
import 'components.dart';

class CgpaInfoForm extends StatelessWidget {
  const CgpaInfoForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double padding = context.isDesktop ? 100.w : 0;
    final controller = context.read<CgpaCalcFormController>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: ExpandablePageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: const [
          FormPage1(),
          FormPage2(),
        ],
      ),
    );
  }
}

/*
form-1 controller:
  check if all fields are filled
  
 */