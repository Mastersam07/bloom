import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../shared/colors.dart';
import '../../shared/ui_helpers.dart';
import '../../widget/simple_text.dart';
import 'faq_list.dart';

class FAQSection extends StatelessWidget {
  const FAQSection({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        child: Container(
          alignment: Alignment.bottomCenter,
          decoration: const BoxDecoration(
            color: AppColors.backgroundColor,
            image: DecorationImage(
              image: appBGImageAsset,
              fit: BoxFit.scaleDown,
            ),
          ),
          padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
        preferredSize: const Size.fromHeight(kToolbarHeight + 10),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
        child: Column(
          children: [
            const SimpleText(
              'Frequently Asked Questions',
              weight: FontWeight.w700,
              size: 20,
            ),
            const SizedBox(height: 16),
            Container(
              alignment: Alignment.center,
              height: 56,
              decoration: const BoxDecoration(
                color: AppColors.textFieldColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: TextField(
                expands: true,
                maxLines: null,
                minLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search FAQs',
                  hintStyle: const TextStyle(
                    fontSize: 14.0,
                    color: AppColors.hintTextColor,
                    fontWeight: FontWeight.normal,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: AppColors.hintTextColor,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
                itemCount: faqList.length,
                itemBuilder: (context, i) {
                  return ExpansionTile(
                    title: SimpleText(
                      faqList[i].question,
                      size: 14.0,
                      color: AppColors.faqQuestionColor,
                      weight: FontWeight.w600,
                    ),
                    children: <Widget>[
                      Column(children: [
                        SimpleText(
                          faqList[i].answer,
                          size: 12.0,
                          weight: FontWeight.w400,
                        ),
                      ]),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
