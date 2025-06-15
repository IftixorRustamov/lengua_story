import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lingua_story/service_locator.dart';

import 'my_app.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  await Hive.initFlutter();
  await Hive.openBox('authBox');
  runApp( MyApp());
}
