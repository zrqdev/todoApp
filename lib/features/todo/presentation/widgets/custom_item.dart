import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_text_style.dart';
import 'package:todo_app/features/data/models/task_model.dart';

class CustomItem extends StatelessWidget {
  const CustomItem({super.key, required this.text});

  final String text;

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
          Selector<TaskModel, bool>(
            selector: (context, prov) => prov.isCheck,
            builder: (context, isCheck, _) {
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
                  onChanged: (bool? value) {
                    print('change Value');
                    context
                        .read<TaskModel>()
                        .changeIsCheck();
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
