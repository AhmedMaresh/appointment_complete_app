import 'package:appointment_complete_flutter_app/core/theme/styles.dart';
import 'package:flutter/material.dart';

class DoctorsSpeacilitySeeAll extends StatelessWidget {
  const DoctorsSpeacilitySeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Doctor Speacility', style: TextStyles.font18DarkBlueSemiBold),
        Spacer(),
        Text('See All', style: TextStyles.font12BlueRegular),
      ],
    );
  }
}
