import 'package:flutter/material.dart';
import 'package:lingua_story/service_locator.dart';

import 'my_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(const MyApp());
}
