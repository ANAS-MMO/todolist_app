import 'package:flutter/material.dart';
import 'package:to_do_list_app/widgets/todo_widget.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 49, 49, 49),
        appBar: AppBar(
          title: const Text('ToDo List'),
          backgroundColor: Colors.teal,
        ),
        body: const ToDo(),
      ),
    );
  }
}