import 'package:appointment_complete_flutter_app/core/helpers/spacing.dart';
import 'package:appointment_complete_flutter_app/features/home/ui/widgets/doctor_speacility_list_view.dart';
import 'package:appointment_complete_flutter_app/features/home/ui/widgets/doctors_blue_container.dart';
import 'package:appointment_complete_flutter_app/features/home/ui/widgets/doctors_list_view.dart';
import 'package:appointment_complete_flutter_app/features/home/ui/widgets/doctors_speacility_see_all.dart';
import 'package:appointment_complete_flutter_app/features/home/ui/widgets/home_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTopBar(),
              const DoctorsBlueContainer(),
              verticalSpace(24.h),
              const DoctorsSpeacilitySeeAll(),
              verticalSpace(18),
              const DoctorSpeacilityListView(),
              verticalSpace(8),
              const DoctorsListView(),
            ],
          ),
        ),
      ),
    );
  }
}
