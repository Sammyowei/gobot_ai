import 'package:flutter/material.dart';
import 'package:gobot_ai/providers/providers.dart';
import 'package:gobot_ai/style/styles.dart';
import 'package:gobot_ai/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewChatPage extends ConsumerStatefulWidget {
  final String botName;
  const NewChatPage({required this.botName, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewChatPageState();
}

class _NewChatPageState extends ConsumerState<NewChatPage> {
  @override
  Widget build(BuildContext context) {
    final darkTheme = ref.watch(themeProvider);
    final chatHistory = ref.watch(chatHistoryProvider);
    return Scaffold(
      appBar: CustomAppBar(
        botName: widget.botName,
        color: darkTheme ? CustomAppColors.darkMode : CustomAppColors.lightMode,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: chatHistory.length,
                itemBuilder: (context, index) {
                  return chatHistory[index];
                },
              ),
            ),
          ],
        ),
      ),
      bottomSheet: const CustomChatTextField(),
    );
  }
}
