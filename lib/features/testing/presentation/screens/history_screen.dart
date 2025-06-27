import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:lingua_story/features/testing/presentation/screens/test_true_false_screen.dart';
import '../../../../core/common/components/action_app_bar.dart';
import '../../../../core/common/components/default_button.dart';
import '../../../../core/common/constants/colors/app_colors.dart';
import '../../../../core/common/constants/strings/app_strings.dart';
import '../../../../core/common/constants/styles/textstyles/jost_textstyle.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/utils/app_responsive.dart';
import '../../../../service_locator.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: ActionAppBarWg(onBackPressed: () => Navigator.pop(context), actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz_outlined, size: 26,))
      ],),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: appW(19)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: appH(10)),

              // 🧙‍♂️ Story image
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  "assets/images/history_image.png",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(height: appH(16)),

              // 📖 Title
              Text(
                AppStrings.historyName1,
                textAlign: TextAlign.center,
                style: sl<JostTextStyles>().semiBold(
                  color: AppColors.black,
                  fontSize: 20,
                ),
              ),

              SizedBox(height: appH(12)),

              // 📝 Story Text
              Text(
                '''Bobby was a curious little boy. He loved stories about magic and adventure. One day, while playing in the attic, he found an old, dusty hat. It was big and black.
"Maybe it's a magic hat!" Bobby thought. He put it on his head. Suddenly, a small white rabbit jumped out!
"Wow!" Bobby said, surprised. He tried again. This time, a red ball appeared. Bobby laughed and clapped his hands. Excited, he ran downstairs to show his mom. "Look, Mom! It’s magic!"
His mom smiled and picked up the hat. "This is Grandpa’s old magician’s hat. He used to perform magic tricks!"
Bobby’s eyes grew wide. "Can I learn magic too?"
"Of course!" his mom said. From that day, Bobby practiced magic tricks every day. He learned to pull out flowers, coins, and even a little bird. One day, he performed a magic show for his family.
Everyone clapped. "Bravo, Bobby!"
Bobby smiled. The hat was not really magic, but it had given him something special—a love for magic!''',
                textAlign: TextAlign.justify,
                style: sl<JostTextStyles>().regular(
                  color: AppColors.textColor,
                  fontSize: 18,
                ),
              ),

              SizedBox(height: appH(24)),

              // 🚀 Start Button
              DefaultButton(
                title: AppStrings.boshlash,
                onPressed: () {
                  AppRouter.go(TestTrueFalseScreen());
                },
              ),

              SizedBox(height: appH(30)),
            ],
          ),
        ),
      ),
    );
  }
}
