import 'package:get_it/get_it.dart';
import 'package:lingua_story/core/common/constants/styles/textstyles/app_textstyles.dart';
import 'package:lingua_story/core/common/constants/styles/textstyles/jost_textstyle.dart';
import 'package:lingua_story/core/common/constants/styles/textstyles/mulish_textstyle.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  sl.registerSingleton<AppTextStyles>(JostTextStyles());
  sl.registerSingleton<JostTextStyles>(JostTextStyles());
  sl.registerSingleton<MulishTextStyles>(MulishTextStyles());
}
