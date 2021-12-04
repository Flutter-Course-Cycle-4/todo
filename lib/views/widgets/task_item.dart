import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:todo/models/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;

  TaskItem(this.task);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.red,
      ),
      margin: EdgeInsets.only(bottom: 10),
      child: Slidable(
        startActionPane: ActionPane(
          extentRatio: 0.25,
          motion: BehindMotion(),
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.red,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 30,
                    ),
                    Text(
                      AppLocalizations.of(context)!.delete_btn,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.secondary,
          ),
          padding: EdgeInsets.all(10),
          //margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: ListTile(
            horizontalTitleGap: 0,
            leading: VerticalDivider(
              thickness: 4,
              color: task.done ? Colors.green : Theme.of(context).primaryColor,
            ),
            title: Text(
              task.title,
              style: TextStyle(
                color:
                    task.done ? Colors.green : Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Container(
              margin: EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  Icon(
                    Icons.timer,
                    size: 14,
                  ),
                  Text(DateFormat('hh:mm a').format(task.dateTime)),
                ],
              ),
            ),
            trailing: (task.done)
                ? Text(
                    'Done!',
                    style: TextStyle(color: Colors.green, fontSize: 20),
                  )
                : ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        task.done
                            ? Colors.green
                            : Theme.of(context).primaryColor,
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Icon(Icons.check),
                  ),
          ),
        ),
      ),
    );
  }
}
