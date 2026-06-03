import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_responsive.dart';
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
  late AppResponsive _appResponsive;
  late double topPadding;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TodoProvider todoProvider = context
        .watch<TodoProvider>();
    topPadding = MediaQuery.of(context).padding.top;
    _appResponsive = AppResponsive(context: context);

    return Padding(
      padding: EdgeInsets.only(
        right: 16,
        left: 16,
        top: (16 + topPadding),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          // heder card
          Container(
            margin: EdgeInsets.only(bottom: 18),
            padding: EdgeInsets.all(16),
            alignment: Alignment.center,
            height: _appResponsive.headerCardHeight,
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
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,

                    children: [
                      Text(
                        "Todo Done",
                        style: AppTextStyle.style600
                            .copyWith(
                              fontSize: _appResponsive
                                  .setFontSize(40),
                            ),
                      ),

                      Container(
                        alignment: Alignment.center,

                        height: _appResponsive.circleHeight,
                        width: _appResponsive.circleWidth,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),

                        child: Text(
                          '${todoProvider.countFinshingTasks}/${todoProvider.allTask.length}',
                          style: AppTextStyle.style600
                              .copyWith(
                                color: AppColors.veryDark,
                                fontSize: _appResponsive
                                    .setFontSize(40),
                              ),
                        ),
                      ),
                    ],
                  ),
                ),

                Positioned(
                  bottom: 0,
                  child: Text(
                    DateFormat(
                      'MM.dd.yyyy',
                    ).format(DateTime.now()),
                    style: AppTextStyle.style600.copyWith(
                      fontSize: _appResponsive.setFontSize(
                        20,
                      ),
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
                mainAxisAlignment: MainAxisAlignment.center,
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

                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!
                          .validate()) {
                        context
                            .read<TodoProvider>()
                            .addTask(
                              _textEditingController.text,
                            );
                        _textEditingController.clear();
                      }
                    },
                    child: Container(
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
              itemCount: todoProvider.allTask.length,
              itemBuilder: (context, index) {
                final TaskModel task =
                    todoProvider.allTask[index];

                return GestureDetector(
                  onTap: () {
                    todoProvider.changeIsDone(index);
                  },
                  child: CustomItem(
                    text: task.text,
                    isCheck: task.isDone,
                    index: index,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
