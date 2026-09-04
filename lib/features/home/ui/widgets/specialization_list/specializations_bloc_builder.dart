import 'package:appointment_complete_flutter_app/core/helpers/spacing.dart';
import 'package:appointment_complete_flutter_app/features/home/logic/home_cubit.dart';
import 'package:appointment_complete_flutter_app/features/home/logic/home_state.dart';
import 'package:appointment_complete_flutter_app/features/home/ui/widgets/doctors_list/doctors_shimmer_loading.dart';
import 'package:appointment_complete_flutter_app/features/home/ui/widgets/specialization_list/speacility_list_view.dart';
import 'package:appointment_complete_flutter_app/features/home/ui/widgets/specialization_list/speciality_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecializationsBlocBuilder extends StatelessWidget {
  const SpecializationsBlocBuilder({super.key});

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
          specializationSuccess: (specializationDataList) {
            var specializationList = specializationDataList;
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
    return Expanded(
      child: Column(
        children: [
          const SpecialityShimmerLoading(),
          verticalSpace(8),
          const DoctorsShimmerLoading(),
        ],
      ),
    );
  }

  Widget setupSuccess(dynamic specializationList) {
    return SpeacilityListView(specializationDataList: specializationList ?? []);
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
