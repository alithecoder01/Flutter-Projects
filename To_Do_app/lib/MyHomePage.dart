import 'package:flutter/material.dart';
import 'package:to_to_app/dilogOpen.dart';
import 'ToDoTile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // the real value is here ..
  final _controller = TextEditingController();

  List toDoTasks = [
    ["Clean Room", false],
    ["Tidy Bed", false],
  ];

  void checkedController(int index, bool? state) {
    setState(() {
      toDoTasks[index][1] = !toDoTasks[index][1];
    });
  }

  void createNewTask() {
    setState(() {
      showDialog(
        context: context,
        builder: (context) => MyDilog(
          myController: _controller,
          onCanceled: () => Navigator.of(context).pop(),
          onSaved: () => onSaved(_controller),
        ),
      );
    });
  }

  void onSaved(value) {
    setState(() {
      toDoTasks.add([value.text, false]);
      Navigator.of(context).pop();
      _controller.clear();
    });
  }

  // delete task
  void deleteTask(int index) {
    setState(() {
      toDoTasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text("TO DO"),
        elevation: 1,
      ),
      body: ListView.builder(
        itemCount: toDoTasks.length,
        itemBuilder: (BuildContext context, int index) {
          return toDoTile(
            taskName: toDoTasks[index][0],
            taskState: toDoTasks[index][1],
            onChange: (state) => checkedController(index, state),
            deleteFunc: (context) => deleteTask(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
    );
  }
}
