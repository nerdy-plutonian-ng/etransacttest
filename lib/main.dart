import 'package:codingtest/router_config.dart';
import 'package:codingtest/ui/screens/dashboard/dashboard_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main() {
  runApp(ChangeNotifierProvider(
    child: const CodingTestApp(),
    create: (_) => DashBoardState(),
  ));
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
