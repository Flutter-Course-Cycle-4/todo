import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TasksScreen extends StatefulWidget {
  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  late DateTime selectedDay;
  @override
  void initState() {
    super.initState();
    selectedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          onDaySelected: (sd, fd) {
            setState(() {
              selectedDay = sd;
            });
            print(selectedDay);
          },
          weekendDays: [],
          selectedDayPredicate: (day) {
            return isSameDay(selectedDay, day);
          },
          locale: AppLocalizations.of(context)!.localeName,
          availableCalendarFormats: {CalendarFormat.week: 'week'},
          headerStyle: HeaderStyle(titleCentered: true),
          calendarFormat: CalendarFormat.week,
          focusedDay: selectedDay,
          firstDay: DateTime.now().subtract(Duration(days: 365)),
          lastDay: DateTime.now().add(Duration(days: 365)),
          calendarStyle: CalendarStyle(
            todayTextStyle: TextStyle(color: Colors.black),
            defaultTextStyle: TextStyle(color: Colors.black),
            defaultDecoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            todayDecoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            selectedTextStyle: TextStyle(color: Colors.white),
            selectedDecoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.red,
                ),
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
                        color: Theme.of(context).primaryColor,
                      ),
                      title: Text(
                        'Task Title',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
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
                            Text('10:00 pm'),
                          ],
                        ),
                      ),
                      trailing: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).primaryColor,
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
              ),
            ],
          ),
        )
      ],
    );
  }
}
//modalBottomSheet
