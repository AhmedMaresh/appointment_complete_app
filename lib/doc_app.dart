import 'package:appointment_complete_flutter_app/core/routing/app_router.dart';
import 'package:appointment_complete_flutter_app/core/routing/routes.dart';
import 'package:appointment_complete_flutter_app/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocApp extends StatelessWidget {
  final AppRouter appRouter;
  const DocApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Appointment Complete',
        theme: ThemeData(
          primaryColor: ColorsManager.mainBlue,
          scaffoldBackgroundColor: Colors.white,
        ),
        initialRoute: Routes.homeScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
