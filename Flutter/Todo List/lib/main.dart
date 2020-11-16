import 'package:flutter/material.dart';
import 'Screens/tasks_screen.dart';
import 'models/task_data.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskData()),
      ],
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
