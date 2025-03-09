import 'package:cnpj_infos/features/home/page.dart';
import 'package:cnpj_infos/features/home/provider.dart';
import 'package:cnpj_infos/features/home/repository.dart';
import 'package:cnpj_infos/services/api.dart';
import 'package:cnpj_infos/services/setup_locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  setupoLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ChangeNotifierProvider(
        create: (_) => HomeProvider(
          HomeRepository(
            getIt<ApiService>(),
          ),
        ),
        child: HomePage(),
      ),
    );
  }
}
