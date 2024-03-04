import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_pay/app/app.locator.dart';
import 'package:smart_pay/app/app.router.dart';
import 'package:smart_pay/services/snackbar_service.dart';
import 'package:stacked_services/stacked_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await setupLocator();
  setupSnackBar();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      //THE DESIGN SIZE SHOULD ALWAYS BE A CONSTANT AND SHOULDNT CHANGE ON FIGMA WITH OTHER UI DESIGNS
      designSize: const Size(375, 812),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        title: 'Smart Pay',
        debugShowCheckedModeBanner: false,
        // If you've added the stacked_services package then set the navigatorKey, otherwise set
        // your own navigator key
        navigatorKey: StackedService.navigatorKey,
        // Construct the StackedRouter and set the onGenerateRoute function
        onGenerateRoute: StackedRouter().onGenerateRoute,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
