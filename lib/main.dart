import 'package:f1_app/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(F1App(
    appRouter: AppRouter(),
  ));
}

class F1App extends StatelessWidget {
  final AppRouter appRouter;
  const F1App({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
