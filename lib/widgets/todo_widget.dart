import 'package:flutter/material.dart';

class ToDo extends StatefulWidget {
  const ToDo({super.key});

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  final TextEditingController todoTextController = TextEditingController();
  String _priority = '1';
  // ignore: unused_field
  final Map _tasks = {};
  final List _todos = [];
  final Map _colors = {
    '1': Colors.red,
    '2': Colors.orange,
    '3': Colors.green,
  };
  Widget priorityButton(String text) {
    return IconButton(
        onPressed: () {
          setState(() {
            _priority = text;
          });
        },
        splashRadius: 25,
        padding: const EdgeInsets.all(2),
        highlightColor: _colors[text],
        hoverColor: _colors[text],
        icon: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 17),
        ));
  }

  void storeTask() {
    setState(() {
      _todos.add({"title": todoTextController.text, "priority": _priority});
      todoTextController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          TextField(
            controller: todoTextController,
            onSubmitted: (value) {
              if (todoTextController.text.isNotEmpty) {
                storeTask();
              }
            },
            style:  TextStyle(color: _colors[_priority]),
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: 'Enter your todo',
                hintStyle: TextStyle(color: Colors.grey[400])),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [for (var p in _colors.keys) priorityButton(p)],
            ),
          ),
          Expanded(
              child: Material(
            color: Colors.transparent,
            child: ListView.builder(
                itemCount: _todos.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(
                          _todos[index]['title'],
                          style: TextStyle(color: _colors[_todos[index]['priority']]),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              _todos.removeAt(index);
                            });
                          },
                          icon: const Icon(Icons.delete),
                          color: Colors.red[900],
                        ),
                        tileColor: const Color.fromARGB(255, 43, 43, 43),
                      ),
                      const SizedBox(
                        height: 5,
                      )
                    ],
                  );
                }),
          )),
        ],
      ),
    );
  }
}
