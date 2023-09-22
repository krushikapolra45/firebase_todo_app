import 'package:firebase_todo_app/res/constant/app_colors.dart';
import 'package:firebase_todo_app/res/constant/app_string.dart';
import 'package:flutter/material.dart';

import '../../model/to_do_model_view.dart';
import '../../res/constant/constant.dart';

class AddToDoScreen extends StatefulWidget {
  final int? index;

  const AddToDoScreen({super.key, this.index});

  @override
  State<AddToDoScreen> createState() => _AddToDoScreenState();
}

class _AddToDoScreenState extends State<AddToDoScreen> {
  String time = "";
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TimeOfDay _time = TimeOfDay(hour: 7, minute: 15);

  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState

    if (widget.index != null) {
      titleController.text = Constant.todoList[widget.index!].title!;
      contentController.text = Constant.todoList[widget.index!].content!;
      time = Constant.todoList[widget.index!].time!;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    EdgeInsets devicePadding = MediaQuery.of(context).viewPadding;
    return Padding(
      padding: devicePadding,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.index == null ? "Add To-do" : "Edit To-Do",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
          elevation: 0,
          backgroundColor: AppColors.pink,
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      // enabledBorder: enabledBorder,
                      contentPadding: const EdgeInsets.all(20),
                      isDense: true,
                      hintText: AppStrings.title,
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      // filled: true,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(10),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight / 40),
                  TextField(
                    controller: contentController,
                    decoration: InputDecoration(
                      // enabledBorder: enabledBorder,
                      contentPadding: const EdgeInsets.all(20),
                      isDense: true,
                      hintText: "contain",
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      // filled: true,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(10),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight / 40),
                  OutlinedButton(
                    style: ButtonStyle(
                      fixedSize: MaterialStatePropertyAll(
                        Size(screenWidth, screenHeight / 14),
                      ),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                    ),
                    onPressed: _selectTime,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        'time: ${_time.format(context)}',
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight / 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            AppColors.pink,
                          ),
                          fixedSize: MaterialStatePropertyAll(
                            Size(140, 50),
                          ),
                        ),
                        onPressed: () {
                          if (widget.index != null) {
                            //? To Edit to-do model in to-doModel list
                            Constant.todoList[widget.index!] = ToDoModelAddList(
                              title: titleController.text,
                              content: contentController.text,
                              time: time,
                            );
                            setState(() {});
                          } else {
                            //? To add to-do model in to-doModel list
                            Constant.todoList.add(
                              ToDoModelAddList(
                                title: titleController.text,
                                content: contentController.text,
                                time: time,
                              ),
                            );
                            setState(() {});
                          }
                          Navigator.pop(context);
                        },
                        child: Text(widget.index == null ? "Add To-do" : "Edit To-Do",
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColors.white,
                            )),
                      ),
                      SizedBox(width: screenWidth / 30),
                      OutlinedButton(
                        style: ButtonStyle(
                          fixedSize: MaterialStatePropertyAll(
                            Size(100, 50),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "delete",
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.pink,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
