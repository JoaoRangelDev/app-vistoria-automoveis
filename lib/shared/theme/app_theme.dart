import 'package:flutter/material.dart';

class ThemeApp {
  final BuildContext context;
  ThemeApp({required this.context});

  ThemeData vistoriaTheme() {
    return ThemeData(
      primarySwatch: Colors.purple,
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(fontSize: 25),
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        bodyText2: TextStyle(fontSize: 16.0),
        bodyText1: TextStyle(fontSize: 16.0),
      ),
      dataTableTheme: DataTableThemeData(
        headingTextStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        headingRowColor: MaterialStateProperty.resolveWith((states) => Colors.purple),
        dataRowHeight: 40,
        columnSpacing: 5,
      ),
      expansionTileTheme: const ExpansionTileThemeData(collapsedBackgroundColor: Colors.deepPurple, collapsedTextColor: Colors.white, collapsedIconColor: Colors.white),
      scrollbarTheme: ScrollbarThemeData(thumbColor:  MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            return Colors.purple;
          }),trackBorderColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            return Colors.purple;
          })),
    );
  }
}
