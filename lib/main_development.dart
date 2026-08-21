import 'package:appointment_complete_flutter_app/core/di/dependency_injection.dart';
import 'package:appointment_complete_flutter_app/core/routing/app_router.dart';
import 'package:appointment_complete_flutter_app/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  runApp(DocApp(appRouter: AppRouter()));
}
