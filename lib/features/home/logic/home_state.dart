import 'package:appointment_complete_flutter_app/core/networking/api_error_model.dart';
import 'package:appointment_complete_flutter_app/features/home/data/models/specializations_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  //Specialization
  const factory HomeState.specializationLoading() = SpecializationLoading;
  const factory HomeState.specializationSuccess(
    List<SpecializationsData?>? specializationDataList,
  ) = SpecializationSuccess;
  const factory HomeState.specializationError(ApiErrorModel apiErrorModel) =
      SpecializationError;

  //Doctors
  const factory HomeState.doctorSuccess(List<Doctors?>? doctorsList) =
      DoctorSuccess;
  const factory HomeState.doctorError() = DoctorError;
}
