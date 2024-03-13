class GroupMessage {
  final String id;
  final String content;
  final String groupID;
  final DateTime createAt;
  final String mentorID;

  GroupMessage({
    required this.id,
    required this.content,
    // required this.markAsRead,
    required this.groupID,
    // required this.userTo,
    required this.createAt,
    required this.mentorID,
  });

  GroupMessage.create(
      {required this.content, required this.groupID, required this.mentorID})
      : id = '',
  // markAsRead = false,



        createAt = DateTime.now();

  GroupMessage.fromJson(Map<String, dynamic> json, String userId)
      : id = json['id'],
        content = json['content'],
  // markAsRead = json['mark_as_read'],
        groupID = json['groupID'],
  // userTo = json['user_to'],
        createAt = DateTime.parse(json['created_at']),
        mentorID = json['senderID'];

  Map toMap() {
    return {
      'content': content,
      'groupID': groupID,
      'senderID': mentorID,
      // 'isMine': isMine
      // 'user_to': userTo,
      // 'mark_as_read': markAsRead,
    };
  }
}