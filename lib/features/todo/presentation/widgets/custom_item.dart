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
  final int index;
  bool isCheck;

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
          Container(
            margin: EdgeInsets.only(right: 10, left: 10),
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
                context.read<TodoProvider>().changeIsDone(
                  index,
                );
              },
            ),
          ),

          Expanded(
            child: Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.style600.copyWith(
                fontSize: 16,
              ),
            ),
          ),

          IconButton(
            hoverColor: Colors.white,
            onPressed: () {
              context.read<TodoProvider>().deleteTask(
                index,
              );
            },
            icon: Icon(
              Icons.remove_circle_outlined,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
