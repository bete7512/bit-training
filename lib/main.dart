import 'package:bit_initial/utils/data/graphql-client.dart';
import 'package:bit_initial/utils/injector.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
// import 'package:hive_flutter/hive_flutter.dart';
import 'ui/screens/todo-page.dart';

void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveForFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
        client: graphqlClient,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Rensys',
          theme: ThemeData(
              fontFamily: 'Nunito',
              primarySwatch: Colors.blue,
              scaffoldBackgroundColor: Colors.white),
          home: TodoListScreen(),
        ));
  }
}
