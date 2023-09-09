import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app_sqflite/controller/tasks_controller.dart';
import 'package:notes_app_sqflite/view/widget/tasks/task_check_box.dart';

class CustomListViewTasks extends GetView<TasksController> {
  const CustomListViewTasks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => SizedBox(
          height: 10,
        ),
        shrinkWrap: true,
        // physics: NeverScrollableScrollPhysics(),
        itemCount: controller.data.length,
        itemBuilder: (context, index) {
          return Dismissible(
            direction: DismissDirection.startToEnd,
            key: Key("${controller.data[index]}"),
            onDismissed: (direction) =>
                controller.deleteData(controller.data[index]['id']),
            child: Card(
              color: Theme.of(context).colorScheme.onTertiary,
              //! elevation: 0.0,
              child: ListTile(
                title: Text(
                  "${controller.data[index]['title']}",
                  style: TextStyle(
                    decoration: controller.isChekced == true
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    color: controller.isChekced == true
                        ? const Color.fromARGB(255, 161, 161, 161)
                        : Theme.of(context).colorScheme.secondary,
                  ),
                  maxLines: 1,
                ),
                trailing: TskCheckBox(
                  checkState: controller.isChekced,
                  checkboxChanged: (newValue) {
                    controller.updateData(
                        newValue!, controller.data[index]['id']);
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
