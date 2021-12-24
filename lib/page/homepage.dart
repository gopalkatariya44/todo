import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controller/add_todo_controller.dart';
import 'package:todo/controller/string_controller.dart';
import 'package:todo/page/add_todo_page.dart';
import 'package:todo/page/search_page.dart';

class HomePage extends StatelessWidget {
  var stringController = Get.put(StringController());
  var addTodoController = Get.put(AddTodoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(stringController.appTitle),
        actions: [
          ElevatedButton(
            onPressed: () {
              showSearch(context: context, delegate: SearchPage());
              // Get.to();
            },
            child: const Icon(Icons.search),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(AddTodoPage());
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
      body: GetX<AddTodoController>(
        builder: (controller) {
          return controller.todoList.isEmpty
              ? const Center(child: Text("empty"))
              : GridView.builder(
                  itemCount: controller.todoList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (ctx, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Text(
                                  // controller.datas.read("title"),
                                  controller.todoList[index].title,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  controller.todoList[index].details,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Get.dialog(
                                      Scaffold(
                                        backgroundColor: Colors.transparent,
                                        body: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Text(
                                                "Are you sure you want to delete this ?"),
                                            Row(
                                              children: [
                                                ElevatedButton(
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  child: Text("Cancel"),
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    controller.removeTodo(
                                                        controller
                                                            .todoList[index]);
                                                    Get.back();
                                                  },
                                                  child: Text("Ok"),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  icon: const Icon(Icons.delete),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.edit),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Get.to(
            AddTodoPage(),
          );
        },
      ),
    );
  }
}
