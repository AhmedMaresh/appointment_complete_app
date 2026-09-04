import 'package:appointment_complete_flutter_app/core/di/dependency_injection.dart';
import 'package:appointment_complete_flutter_app/core/helpers/constants.dart';
import 'package:appointment_complete_flutter_app/core/helpers/extensions.dart';
import 'package:appointment_complete_flutter_app/core/helpers/shared_pref_helper.dart';
import 'package:appointment_complete_flutter_app/core/routing/app_router.dart';
import 'package:appointment_complete_flutter_app/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  await checkIfLoggedInUser();
  runApp(DocApp(appRouter: AppRouter()));
}

Future<void> checkIfLoggedInUser() async {
  String? userToken = await SharedPrefHelper.getSecuredString(
    SheredPrefKeys.userToken,
  );
  if (!userToken.isNullOrEmpty()) {
    isLoggedin = true;
  } else {
    isLoggedin = false;
  }
}
