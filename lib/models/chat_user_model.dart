class GChatUser {
  final ChatAuthor author;
  final String id;

  GChatUser({required this.author, required this.id}) : super();
}

enum ChatAuthor {
  user,
  bot,
}
