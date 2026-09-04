import 'package:appointment_complete_flutter_app/features/home/data/models/specializations_response_model.dart';
import 'package:appointment_complete_flutter_app/features/home/logic/home_cubit.dart';
import 'package:appointment_complete_flutter_app/features/home/ui/widgets/specialization_list/speciality_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpeacilityListView extends StatefulWidget {
  final List<SpecializationsData?> specializationDataList;
  const SpeacilityListView({super.key, required this.specializationDataList});

  @override
  State<SpeacilityListView> createState() => _SpeacilityListViewState();
}

class _SpeacilityListViewState extends State<SpeacilityListView> {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.specializationDataList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              context.read<HomeCubit>().getDoctorsList(
                specializationId: widget.specializationDataList[index]?.id,
              );
            },
            child: SpecialityListViewItem(
              specializationsData: widget.specializationDataList[index],
              itemIndex: index,
              selectedIndex: selectedIndex,
            ),
          );
        },
      ),
    );
  }
}
