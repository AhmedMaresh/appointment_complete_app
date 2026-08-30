import 'package:appointment_complete_flutter_app/core/networking/api_result.dart';
import 'package:appointment_complete_flutter_app/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(HomeRepo homeRepo)
    : _homeRepo = homeRepo,
      super(const HomeState.initial());

  void getSpecialization() async {
    emit(const HomeState.specializationLoading());
    final response = await _homeRepo.getSpecialization();
    response.when(
      success: (specializationResponseData) {
        emit(HomeState.specializationSuccess(specializationResponseData));
      },
      failure: (error) {
        emit(HomeState.specializationError(error.toString()));
      },
    );
  }
}
