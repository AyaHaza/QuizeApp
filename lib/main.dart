import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/config/get_it_config.dart';
import 'view/Questions.dart';
import 'view/login.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
        designSize: const Size(1000, 1000),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
      // locale: Locale('en'),
      debugShowCheckedModeBanner: false,
      home:core.get<SharedPreferences>().getString('userName') == null
          ? Login()
          : HomePage(),
    );});
  }
}
