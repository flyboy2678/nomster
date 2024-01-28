import 'package:flutter/material.dart';
import 'package:nomster/pages/on_boarding_page.dart';
import 'package:nomster/provider/api_service_notifier.dart';
import 'package:nomster/provider/random_recipe_data.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ApiServiceNotifier()),
        ChangeNotifierProvider(create: (_) => RandomRecipeNotifier()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
          useMaterial3: true,
        ),
        home: OnBoardingPage(),
      ),
    );
  }
}
