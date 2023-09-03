import 'package:flutter/material.dart';
import 'package:pawpath/app/counter/counter.dart';
import 'package:pawpath/l10n/l10n.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: localizationDelegates,
      supportedLocales: locales,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Counter(),
    );
  }
}
