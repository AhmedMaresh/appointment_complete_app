import 'package:appointment_complete_flutter_app/core/helpers/spacing.dart';
import 'package:appointment_complete_flutter_app/core/theme/colors.dart';
import 'package:appointment_complete_flutter_app/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DoctorSpeacilityListView extends StatelessWidget {
  const DoctorSpeacilityListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 24.w),
            child: Column(
              children: [
                verticalSpace(5),
                CircleAvatar(
                  radius: 28.0,
                  backgroundColor: ColorsManager.lightBlue,
                  child: SvgPicture.asset(
                    'assets/svgs/general_speciality.svg',
                    height: 40.h,
                    width: 30.w,
                  ),
                ),
                verticalSpace(8),
                Text('Specialization', style: TextStyles.font12DarkBlueRegular),
              ],
            ),
          );
        },
      ),
    );
  }
}
