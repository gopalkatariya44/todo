import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controller/add_todo_controller.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/page/homepage.dart';

class AddTodoPage extends StatelessWidget {
  var addTodoController = Get.put(AddTodoController());
  final _key = GlobalKey<FormState>();
  // final _title = TextEditingController();
  // final _details = TextEditingController();
  String _title = '';
  String _details = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("todo item"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _key,
          child: Column(
            children: [
              TextFormField(
                // controller: _title,
                key: UniqueKey(),
                decoration: const InputDecoration(
                  hintText: 'enter title hear',
                  border: OutlineInputBorder(),
                  labelText: 'Title *',
                ),
                validator: (value) =>
                    value!.isEmpty ? 'title cannot be blank' : null,
                onSaved: (value) {
                  _title = value!;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                // controller: _details,
                key: UniqueKey(),
                maxLines: 10,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'enter your content hear',
                  labelText: 'Details *',
                ),
                validator: (value) =>
                    value!.isEmpty ? 'content cannot be blank' : null,
                onSaved: (value) {
                  _details = value!;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(fixedSize: const Size(300, 50)),
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    _key.currentState!.save();
                    addTodoController.addTodo(
                      Todo(
                        details: _details,
                        title: _title,
                      ),
                    );
                    Get.back();
                  }
                },
                child: const Text("add note"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
