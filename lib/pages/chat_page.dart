import 'package:flutter/material.dart';
import 'package:gobot_ai/providers/providers.dart';
import 'package:gobot_ai/style/styles.dart';
import 'package:gobot_ai/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChatPage extends ConsumerStatefulWidget {
  final String botName;
  const ChatPage({required this.botName, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  @override
  Widget build(BuildContext context) {
    final darkTheme = ref.watch(themeProvider);

    return Scaffold(
      // resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        botName: widget.botName,
        color: darkTheme ? CustomAppColors.darkMode : CustomAppColors.lightMode,
      ),
      body: const ChatBody(),
      bottomSheet: const CustomChatTextField(),
    );
  }
}

class ChatBody extends ConsumerStatefulWidget {
  const ChatBody({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatBodyState();
}

class _ChatBodyState extends ConsumerState<ChatBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChatList(),
      ],
    );
  }
}

class ChatList extends ConsumerWidget {
  ChatList({super.key});

  final ScrollController chatScrollController = ScrollController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatHystory = ref.watch(chatHistoryProvider);
    return Flexible(
        child: ListView.builder(
      padding: const EdgeInsets.all(10),
      controller: chatScrollController,
      itemBuilder: (context, index) {
        if (chatHystory.isNotEmpty) {
          return chatHystory[index];
        } else {
          return Center(
            child: Container(
              color: Colors.green,
            ),
          );
        }
      },
    ));
  }
}
