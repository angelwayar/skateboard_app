import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/home.page.dart';
import 'provider/providers.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => IndexNotifier(),
        child: const MyHomePage(),
      ),
    );
  }
}
