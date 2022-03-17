import 'package:architecture_test/app_state/app_state_bloc.dart';
import 'package:architecture_test/routes/genereate_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => AppStateBloc(),
      child: MaterialApp(
        title: 'Flutter Architecture',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: GenerateRoutes.generateRoute,
        initialRoute: '/',
      ),
      dispose: (ctx, AppStateBloc bloc) => bloc.dispose(),
    );
  }
}
