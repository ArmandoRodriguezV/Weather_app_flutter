import 'package:clima/my_app.dart';
import 'package:clima/providers/data_provider.dart';
import 'package:clima/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => DataProvider()),
      ],
      child: MyApp()
    )
  );
}