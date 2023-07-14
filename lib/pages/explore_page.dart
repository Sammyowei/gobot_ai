import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gobot_ai/providers/theme_provider.dart';
import 'package:gobot_ai/style/styles.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:gobot_ai/utils/utils.dart';

import '../widgets/widgets.dart';

class ExplorePage extends ConsumerStatefulWidget {
  const ExplorePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ExplorePageState();
}

class _ExplorePageState extends ConsumerState<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = ref.watch(themeProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10).w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.verticalSpace,
              CustomText(
                text: "Explore",
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
                textColor: isDarkMode
                    ? CustomAppColors.boldTextDarkTheme
                    : CustomAppColors.boldTextLightTheme,
              ),
              20.verticalSpace,
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 17,
                  children: List.generate(
                    explore.length,
                    (index) => explore[index],
                  ),
                ),
              ),
              10.verticalSpace,
              Container(
                child: Center(
                  child: CustomText(
                    text: "More features coming soon",
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    textColor: CustomAppColors.primaryColor.withOpacity(.8),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<BotContainerButton> explore = [
    BotContainerButton(
      imagePath: AppIcons.bfffBot,
      title: "BFFFBot",
      shortDescription: "Friendly and helpful chatbot.",
    ),
    BotContainerButton(
      imagePath: AppIcons.qAndA,
      title: "Q&A",
      shortDescription: "Answers questions based on existing knowledge",
    ),
    BotContainerButton(
      imagePath: AppIcons.translify,
      title: "Translatify",
      shortDescription: "Translate English to other languages",
    ),
    BotContainerButton(
      imagePath: AppIcons.linguaBot,
      title: "LinguaBot",
      shortDescription: "Grammar and language accuracy",
    ),
    BotContainerButton(
      imagePath: AppIcons.simplfy,
      title: "Simplify",
      shortDescription: "Summarizes text into concise format",
      forPremium: true,
    ),
    BotContainerButton(
      imagePath: AppIcons.nameGen,
      title: "NameGen",
      shortDescription: "Extracts keywords from block of texts",
      forPremium: true,
    ),
    BotContainerButton(
      imagePath: AppIcons.recipeGen,
      title: "RecipieGen",
      shortDescription: "Create Unique creative recipes",
      forPremium: true,
    ),
    BotContainerButton(
      imagePath: AppIcons.sassyBot,
      title: "SassyBot",
      shortDescription: "Sarcastic yet informative chatbot",
      forPremium: true,
    ),
    BotContainerButton(
      imagePath: AppIcons.directions,
      title: "Directions",
      shortDescription: "Provide turn by turn navigation",
      forPremium: true,
    ),
    BotContainerButton(
      imagePath: AppIcons.tutorBot,
      title: "TutorBot",
      shortDescription: "AI-based tutoring and assistance",
      forPremium: true,
    ),
  ];
}
