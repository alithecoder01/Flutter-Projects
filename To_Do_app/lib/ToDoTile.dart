import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class toDoTile extends StatelessWidget {
  String taskName;
  bool taskState;
  Function(bool?)? onChange;
  Function(BuildContext)? deleteFunc;

  toDoTile({
    Key? key,
    required this.taskName,
    required this.taskState,
    required this.onChange,
    required this.deleteFunc,
  }) : super(key: key);

  void todoNew(String taskName, bool State) {
    this.taskName = taskName;
    this.taskState = State;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, right: 25.0, left: 25.0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteFunc,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(12.0),
          )
        ]),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Checkbox(
                value: taskState,
                onChanged: onChange,
                checkColor: Colors.white,
                activeColor: Colors.black,
              ),
              Text(
                taskName,
                style: TextStyle(
                  decoration: taskState
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
