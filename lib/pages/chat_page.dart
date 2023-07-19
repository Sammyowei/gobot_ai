import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gobot_ai/models/models.dart';
import 'package:gobot_ai/providers/providers.dart';
import 'package:gobot_ai/style/styles.dart';
import 'package:gobot_ai/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewChatPage extends ConsumerStatefulWidget {
  final String botName;
  final AiBotModels models;
  const NewChatPage({
    required this.models,
    required this.botName,
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewChatPageState();
}

class _NewChatPageState extends ConsumerState<NewChatPage> {
  final controller = TextEditingController();
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final darkTheme = ref.watch(themeProvider);
    final chatHistory = ref.watch(chatHistoryProvider);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        botName: widget.botName,
        color: darkTheme ? CustomAppColors.darkMode : CustomAppColors.lightMode,
      ),
      body: Column(
        children: [
          Container(
            child: Expanded(
              child: ListView.builder(
                itemCount: chatHistory.length,
                controller: scrollController,
                dragStartBehavior: DragStartBehavior.down,
                shrinkWrap: true,
                padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 8, bottom: 10)
                    .w,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8).w,
                    child: chatHistory[index],
                  );
                },
              ),
            ),
          ),
          CustomChatTextField(
            model: widget.models,
            controller: controller,
          ),
        ],
      ),
      // bottomSheet: CustomChatTextField(
      //   model: widget.models,
      //   controller: controller,
      // ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    scrollController.dispose();
    super.dispose();
  }
}
