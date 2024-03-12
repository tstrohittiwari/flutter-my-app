// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'message_model.dart';
//
// class AppService extends ChangeNotifier {
//   // final _supabase = Supabase.instance.client;
//   // final _password = '222';
//
//   // Future<void> _createChatRoom() async {
//   //   final response = await _supabase
//   //
//   //   await _supabase
//   //       .from('contact')
//   //       .insert({'id': response.user!.id, 'username': 'User $i'}).execute();
//   }
//
//   // Future<void> createUsers() async {
//   //   await _createUser(1);
//   //   await _createUser(2);
//   // }
//
//   // Future<void> signIn(int i) async {
//   //   await _supabase.auth.signIn(email: 'test_$i@test.com', password: _password);
//   // }
//
//   // Future<void> signOut() async {
//   //   await _supabase.auth.signOut();
//   // }
//
// //return id of user
//   Future<String> _getUserTo() async {
//     final response = await Supabase.instance.client
//         .from('contact')
//         .select('id')
//         .not('id', 'eq', getCurrentUserId());
//
//
//     return response[0]['id'];
//   }
//
//   // Stream<List<Message>> getMessages() {
//   //   return Supabase.instance.client
//   //       .from('message')
//   //       .stream(['id'])
//   //       .order('created_at')
//   //
//   //       .map((maps) => maps
//   //       .map((item) => Message.fromJson(item, getCurrentUserId()))
//   //       .toList());
//   // }
//
//   Future<void> saveMessage(String content) async {
//     final userTo = await _getUserTo();
//
//     final message = Message.create(
//         content: content, userFrom: getCurrentUserId(), userTo: userTo);
//
//     await Supabase.instance.client.from('message').insert(message.toMap());
//   }
//
//   // Future<void> markAsRead(String messageId) async {
//   //   await Supabase.instance.client
//   //       .from('message')
//   //       .update({'mark_as_read': true})
//   //       .eq('id', messageId);
//   // }
//
//   // bool isAuthentificated() => Supabase.instance.client.auth.currentUser != null;
//   //
//   // String getCurrentUserId() =>
//   //     isAuthentificated() ? Supabase.instance.client.auth.currentUser!.id : '';
//   //
//   // String getCurrentUserEmail() =>
//   //     isAuthentificated() ? Supabase.instance.client.auth.currentUser!.email ?? '' : '';
// }
