import 'package:flutter/material.dart';
import 'package:pro_media_app/app/app.dart';
import 'package:pro_media_app/injection/injection.dart';

void main() {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProMediaApp());
}


