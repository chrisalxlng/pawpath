import 'package:flutter/material.dart';
import 'package:pawpath/l10n/l10n.dart';

defaultWrapper(BuildContext context, int localeIndex, Brightness brightness,
        Widget? child) =>
    MaterialApp(
      theme: ThemeData(brightness: brightness),
      locale: locales[localeIndex % locales.length],
      localizationsDelegates: localizationDelegates,
      supportedLocales: locales,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: MediaQuery(
              data: MediaQuery.of(context).copyWith(
                platformBrightness: Brightness.light,
              ),
              child: Center(child: child))),
    );
