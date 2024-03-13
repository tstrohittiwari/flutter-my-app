class Message {
  final String id;
  final String content;
  // final bool markAsRead;
  final String mentorID;
  final String studentID;
  final DateTime createAt;
  final bool isMine;

  Message({
    required this.id,
    required this.content,
    // required this.markAsRead,
    required this.mentorID,
    required this.studentID,
    required this.createAt,
    required this.isMine,
  });

  Message.create(
      {required this.content, required this.mentorID, required this.studentID, required this.isMine})
      : id = '',
  // markAsRead = false,
  // isMine = true,
        createAt = DateTime.now();

  Message.fromJson(Map<String, dynamic> json, String userId)
      : id = json['id'],
        content = json['content'],
  // markAsRead = json['mark_as_read'],
        mentorID = json['mentorID'],
        studentID = json['studentID'],
        createAt = DateTime.parse(json['created_at']),
        isMine = json['isMine'];

  Map toMap() {
    return {
      'content': content,
      'mentorID': mentorID,
      'studentID': studentID,
      'isMine': isMine
      // 'mark_as_read': markAsRead,
    };
  }
}
