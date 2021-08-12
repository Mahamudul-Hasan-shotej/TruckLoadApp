import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:truck_load_demo/Models/modelData/Color.dart';
import 'package:truck_load_demo/Models/modelData/SizeConfig.dart';
import 'package:truck_load_demo/Models/Provider/LockScreen/LockTaskModel.dart';
import 'package:truck_load_demo/Models/Provider/LockScreen/LockTodoModel.dart';
import 'package:truck_load_demo/Views/Order/Global.dart' as globals;

class LockScreen1 extends StatefulWidget {
  @override
  _LockScreen1State createState() => _LockScreen1State();
}

class _LockScreen1State extends State<LockScreen1> {
  String imageLock = 'images/lock_truck.png';
  String imageUnlock = 'images/unlock_truck.png';

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(
            horizontal: 4.59 * SizeConfig.widthMultiplier,
            vertical: 13.17 * SizeConfig.heightMultiplier),
        child: InkWell(
          onTap: () {
            if (globals.lockStatus == "Unlocked") {
              Provider.of<LockTodoModel>(context, listen: false)
                  .addTaskList('Locked', imageLock);
            } else {
              Provider.of<LockTodoModel>(context, listen: false)
                  .addTaskList('Unlocked', imageUnlock);
            }
          },
          child: Consumer<LockTodoModel>(builder: (context, todo, child) {
            if (todo.tasklist.isEmpty) {
              LockTaskModel lockTaskModel =
                  LockTaskModel('Unlock', imageUnlock);
              todo.tasklist.add(lockTaskModel);
            }
            return Column(children: [
              Image(
                image: AssetImage(todo.tasklist[0].image),
                height: 39.52 * SizeConfig.heightMultiplier,
              ),
              Center(
                child: todo.tasklist.isEmpty
                    ? Text('Initial Phase')
                    : RichText(
                        text: TextSpan(
                            text: 'Tap on the lock to',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 2.10 * SizeConfig.textMultiplier),
                            children: <TextSpan>[
                            TextSpan(
                                text: ' "${todo.tasklist[0].lockStatus}"',
                                style: TextStyle(
                                    color: todo.tasklist[0].getlockStatus ==
                                            'Locked'
                                        ? ColorConfig.themeColour
                                        : Colors.red,
                                    fontSize: 2.37 * SizeConfig.textMultiplier,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                              text: " smart lock option",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 2.10 * SizeConfig.textMultiplier),
                            )
                          ])),
              )
            ]);
          }),
        ));
  }
}
