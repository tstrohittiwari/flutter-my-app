class GroupMessage {
  final String id;
  final String content;
  // final bool markAsRead;
  final String groupID;
  // final String userTo;
  final DateTime createAt;
  final bool isMine;

  GroupMessage({
    required this.id,
    required this.content,
    // required this.markAsRead,
    required this.groupID,
    // required this.userTo,
    required this.createAt,
    required this.isMine,
  });

  GroupMessage.create(
      {required this.content, required this.groupID})
      : id = '',
      // markAsRead = false,
        isMine = true,
        createAt = DateTime.now();

  GroupMessage.fromJson(Map<String, dynamic> json, String userId)
      : id = json['id'],
        content = json['content'],
  // markAsRead = json['mark_as_read'],
        groupID = json['groupID'],
        // userTo = json['user_to'],
        createAt = DateTime.parse(json['created_at']),
        isMine = json['user_from'] == userId;

  Map toMap() {
    return {
      'content': content,
      'groupID': groupID,
      // 'user_to': userTo,
      // 'mark_as_read': markAsRead,
    };
  }
}
