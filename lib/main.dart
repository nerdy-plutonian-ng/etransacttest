import 'package:codingtest/router_config.dart';
import 'package:flutter/material.dart';

main() {
  runApp(const CodingTestApp());
}

class CodingTestApp extends StatelessWidget {
  const CodingTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: routerConfig,
      title: 'Coding Test',
      theme: ThemeData(colorSchemeSeed: Colors.teal),
    );
  }
}
