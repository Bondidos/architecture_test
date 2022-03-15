import 'package:architecture_test/routes/genereate_route.dart';
import 'package:architecture_test/state_model/app_state_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<AppStateModel>(
      model: AppStateModel(),
      child: MaterialApp(
        title: 'Flutter Architecture',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: GenerateRoutes.generateRoute,
        initialRoute: '/',
      ),
    );
  }
}
