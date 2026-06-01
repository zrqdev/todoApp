import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_text_style.dart';
import 'package:todo_app/features/todo/data/models/task_model.dart';
import 'package:todo_app/features/todo/logic/todo_provider.dart';
import 'custom_item.dart';

class TodoScreenBody extends StatefulWidget {
  const TodoScreenBody({super.key});

  @override
  State<TodoScreenBody> createState() =>
      _TodoScreenBodyState();
}

class _TodoScreenBodyState extends State<TodoScreenBody> {
  late final TextEditingController _textEditingController;
  final _formKey = GlobalKey<FormState>();
  int selectedItem = 0;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    List<TaskModel> _tasks = context
        .watch<TodoProvider>()
        .allTask;
    int _countTasks = context
        .watch<TodoProvider>()
        .countFinshingTasks;
    return Padding(
      padding: const EdgeInsets.only(
        right: 16,
        left: 16,
        top: 32,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          // heder card
          Container(
            margin: EdgeInsets.only(bottom: 18),
            alignment: Alignment.center,
            height: 187,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(
                  0xFFFFFFFF,
                ).withValues(alpha: 70),
                width: 0.3,
              ),
              color: AppColors.veryDark,
              borderRadius: BorderRadius.circular(34),
            ),

            child: Stack(
              children: [
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Todo Done",
                      style: AppTextStyle.style600,
                    ),

                    Container(
                      alignment: Alignment.center,
                      height: 116,
                      width: 116,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),

                      child: Text(
                        '$_countTasks/${_tasks.length}',
                        style: AppTextStyle.style600
                            .copyWith(
                              color: AppColors.veryDark,
                            ),
                      ),
                    ),
                  ],
                ),

                Positioned(
                  bottom: 0,
                  left: 20,
                  child: Text(
                    DateFormat(
                      'MM.dd.yyyy',
                    ).format(DateTime.now()),
                    style: AppTextStyle.style600.copyWith(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(bottom: 45),
            child: Form(
              key: _formKey,
              child: Row(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextFormField(
                      validator: (value) {
                        if (null == value || "" == value) {
                          return 'Plase enter task';
                        }
                        return null;
                      },
                      controller: _textEditingController,
                      style: AppTextStyle.style600.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        decorationStyle:
                            TextDecorationStyle.solid,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.veryDark,
                        hintText: 'inpute a new task',
                        hintStyle: AppTextStyle.style600
                            .copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: AppColors.gray,
                            ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(6),
                          borderSide: BorderSide(
                            color: AppColors.gray,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(6),
                          borderSide: BorderSide(
                            width: 0.5,
                            color: AppColors.gray,
                          ),
                        ),

                        errorBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(6),
                          borderSide: BorderSide(
                            width: 0.5,
                            color: AppColors.errorColor,
                          ),
                        ),
                        errorStyle: TextStyle(fontSize: 15),
                        focusedErrorBorder:
                            OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(6),
                              borderSide: BorderSide(
                                width: 0.5,
                                color: AppColors.errorColor,
                              ),
                            ),
                      ),
                    ),
                  ),

                  IconButton(
                    onPressed: () {
                      if (_formKey.currentState!
                          .validate()) {
                        print(_textEditingController.text);
                        context
                            .read<TodoProvider>()
                            .addTask(
                              _textEditingController.text,
                            );
                        _textEditingController.clear();
                      }
                    },
                    icon: Container(
                      margin: EdgeInsets.only(left: 12),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(Icons.add, size: 35),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                return Selector<TodoProvider, void>(
                  selector: (context, prove) =>
                      prove.isDone(index),
                  builder: (context, _, _) {
                    return GestureDetector(
                      onTap: () {
                        context
                            .read<TodoProvider>()
                            .changeIsDone(index);
                      },
                      child: CustomItem(
                        text: _tasks[index].text,
                        isCheck: _tasks[index].isDone,
                        index: index,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
