import 'package:get/get.dart';

import 'package:todo/model/todo.dart';

class AddTodoController extends GetxController {
  var todoList = <Todo>[].obs;

  addTodo(Todo value) {
    todoList.add(value);
  }

  removeTodo(Todo value) {
    todoList.remove(value);
  }

  @override
  void onInit() {
    super.onInit();
    var todo = <Todo>[
      Todo(title: "hii", details: "hey....."),
      Todo(title: "work", details: "hey....."),
      Todo(title: "arpar", details: "hey....."),
      Todo(title: "parar", details: "hey....."),
    ];
    todoList.value = todo;
  }
}
