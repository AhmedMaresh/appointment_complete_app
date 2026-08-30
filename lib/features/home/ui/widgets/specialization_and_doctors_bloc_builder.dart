import 'package:appointment_complete_flutter_app/core/helpers/spacing.dart';
import 'package:appointment_complete_flutter_app/core/theme/colors.dart';
import 'package:appointment_complete_flutter_app/features/home/logic/home_cubit.dart';
import 'package:appointment_complete_flutter_app/features/home/logic/home_state.dart';
import 'package:appointment_complete_flutter_app/features/home/ui/widgets/doctor_speacility_list_view.dart';
import 'package:appointment_complete_flutter_app/features/home/ui/widgets/doctors_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecializationAndDoctorsBlocBuilder extends StatelessWidget {
  const SpecializationAndDoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is SpecializationLoading ||
          current is SpecializationSuccess ||
          current is SpecializationError,
      builder: (context, state) {
        return state.maybeWhen(
          specializationLoading: () {
            return setupLoading();
          },
          specializationSuccess: (specializationsResponseModel) {
            var specializationList =
                specializationsResponseModel.specializationDataList;
            return setupSuccess(specializationList);
          },
          specializationError: (message) => setupError(),
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }

  Widget setupLoading() {
    return const SizedBox(
      height: 100,
      child: Center(
        child: CircularProgressIndicator(color: ColorsManager.mainBlue),
      ),
    );
  }

  Widget setupSuccess(dynamic specializationList) {
    return Expanded(
      child: Column(
        children: [
          DoctorSpeacilityListView(
            specializationDataList: specializationList ?? [],
          ),
          verticalSpace(8),
          DoctorsListView(doctorsList: specializationList?[0]?.doctorsList),
        ],
      ),
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
