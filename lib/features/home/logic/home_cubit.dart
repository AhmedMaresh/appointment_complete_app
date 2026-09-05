import 'package:appointment_complete_flutter_app/core/helpers/extensions.dart';
import 'package:appointment_complete_flutter_app/core/networking/api_result.dart';
import 'package:appointment_complete_flutter_app/features/home/data/models/specializations_response_model.dart';
import 'package:appointment_complete_flutter_app/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(HomeRepo homeRepo)
    : _homeRepo = homeRepo,
      super(const HomeState.initial());

  List<SpecializationsData?>? specializationList = [];

  void getSpecialization() async {
    emit(const HomeState.specializationLoading());
    final response = await _homeRepo.getSpecialization();
    response.when(
      success: (specializationResponseModel) {
        specializationList =
            specializationResponseModel.specializationDataList ?? [];

        getDoctorsList(specializationId: specializationList?.first?.id);

        emit(HomeState.specializationSuccess(specializationList));
      },
      failure: (apiErrorModel) {
        emit(HomeState.specializationError(apiErrorModel));
      },
    );
  }

  void getDoctorsList({required int? specializationId}) {
    List<Doctors?>? doctorsList = getDoctorsListBySpecializationId(
      specializationId,
    );

    if (!doctorsList.isNullOrEmpty()) {
      emit(HomeState.doctorSuccess(doctorsList));
    } else {
      emit(const HomeState.doctorError());
    }
  }

  /// returns the list of doctors based on the specialization id
  List<Doctors?>? getDoctorsListBySpecializationId(int? specializationId) {
    return specializationList
        ?.firstWhere((specialization) => specialization?.id == specializationId)
        ?.doctorsList;
  }
}
