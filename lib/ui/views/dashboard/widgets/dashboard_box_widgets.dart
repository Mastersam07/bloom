import 'package:flutter/material.dart';

import '../../../shared/colors.dart';
import '../../../widget/simple_text.dart';

class DashBoardBoxes1 extends StatelessWidget {
  final image;
  final title;
  final measurement;
  final unit;
  const DashBoardBoxes1({
    Key key,
    this.image,
    this.title,
    this.measurement,
    this.unit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.shortestSide / 2) + 25,
      width: (MediaQuery.of(context).size.width - 50) / 2,
      margin: const EdgeInsets.only(left: 0, right: 4),
      padding: const EdgeInsets.only(left: 8, top: 21, bottom: 21),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: AppColors.lightningbackgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: AppColors.lightningbackgroundColor,
            child: Image(
              image: image,
              height: 20,
              color: AppColors.blueColor,
              width: 12.5,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          SimpleText(
            title,
            maxLines: 2,
            color: AppColors.blueColor,
          ),
          const SizedBox(
            height: 16,
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: measurement,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                    )),
                TextSpan(
                  text: unit,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
