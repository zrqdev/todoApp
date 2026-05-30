import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_text_style.dart';
import 'custom_item.dart';

class TodoScreenBody extends StatelessWidget {
  const TodoScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 16,
        left: 16,
        top: 32,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
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
                        '5/8',
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
                    '12.09.2025',
                    style: AppTextStyle.style600.copyWith(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextFormField(
                  style: AppTextStyle.style600.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
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
                      borderRadius: BorderRadius.circular(
                        6,
                      ),
                      borderSide: BorderSide(
                        color: AppColors.gray,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        6,
                      ),
                      borderSide: BorderSide(
                        width: 0.5,
                        color: AppColors.gray,
                      ),
                    ),
                  ),
                ),
              ),

              IconButton(
                onPressed: () {},
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

          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return CustomItem();
              },
            ),
          ),
        ],
      ),
    );
  }
}
