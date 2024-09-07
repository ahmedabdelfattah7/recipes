
import 'package:flutter/material.dart';
import 'package:tadmon/app.dart';
import 'package:tadmon/core/service/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();
  runApp(const RecipeTask());
}

