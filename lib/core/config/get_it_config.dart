import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt core = GetIt.instance;

setup()async{
  core.registerFactory(() => SharedPreferences);
  core.registerSingleton(await SharedPreferences.getInstance());
}