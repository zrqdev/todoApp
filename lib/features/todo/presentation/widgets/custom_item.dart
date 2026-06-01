import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_text_style.dart';
import 'package:todo_app/features/todo/logic/todo_provider.dart';

// ignore: must_be_immutable
class CustomItem extends StatelessWidget {
  CustomItem({
    super.key,
    required this.text,
    required this.isCheck,
    required this.index,
  });

  final String text;
  bool isCheck;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.chineseBlack,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Selector<TodoProvider, bool>(
            selector: (context, prov) => prov.isDone(index),
            builder: (context, _, _) {
              return Container(
                margin: EdgeInsets.only(
                  right: 10,
                  left: 10,
                ),
                height: 22,
                width: 22,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadiusDirectional.circular(3),
                  border: isCheck
                      ? BoxBorder.all(color: AppColors.gray)
                      : null,
                ),

                child: Checkbox(
                  fillColor: WidgetStateColor.transparent,
                  checkColor: AppColors.checkColor,

                  value: isCheck,
                  onChanged: (value) {
                    context
                        .read<TodoProvider>()
                        .changeIsDone(index);
                  },
                ),
              );
            },
          ),

          Text(
            text,
            style: AppTextStyle.style600.copyWith(
              fontSize: 16,
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert_rounded),
          ),
        ],
      ),
    );
  }
}
