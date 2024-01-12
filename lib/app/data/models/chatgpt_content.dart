class ChatGptModel {
  final String content;

  ChatGptModel(this.content);

  factory ChatGptModel.fromJson(Map<String, dynamic> json) {
    return ChatGptModel(json['choices'][0]['message']['content']);
  }
}
