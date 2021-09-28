import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/block/list_komponen.dart';
import 'package:new_project/UI/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MultiBlocProvider(providers: [
          BlocProvider(
            create: (context) => ListKomponen()..add(ArticleEvent()),
          )
        ], child: HomePage()));
  }
}
