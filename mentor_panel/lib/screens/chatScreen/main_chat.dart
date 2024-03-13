import 'package:flutter/material.dart';
import 'package:mentor_panel/screens/chatScreen/chat_screen.dart';
import 'package:mentor_panel/screens/chatScreen/search_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatMainScreen extends StatefulWidget {
  const ChatMainScreen({super.key});

  @override
  State<ChatMainScreen> createState() => _ChatMainScreenState();
}

class _ChatMainScreenState extends State<ChatMainScreen> {

  // //MENTOR'S COUNCELLING
  // final  client = Supabase.instance.client;
  // final mentor = client.auth.currentUser();
  void getMentorcoun(coun) async{
    coun = await Supabase.instance.client.from('mentor').select('coun');
        // .eq('mentor_id', currentMentor);
  }

  final String coun = "hsts";

  Future<List<Map<String, dynamic>>> fetchdata(coun) async {
    final response =
        await Supabase.instance.client.from('studentdata').select().eq('councelling', coun);

    return response;
  }

  List<Map<String, dynamic>>? fetchedData;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      fetchedData = await fetchdata(coun);
    } catch (error) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Students"),
        actions: [
          // IconButton(onPressed: (){
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => ChatPage(),
          //     ),
          //   );
          // }, icon: Icon(Icons.search))
        ],
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchdata(coun),
        // Assuming fetchData() returns a Future<List<Map<String, dynamic>>>
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data =
                snapshot.data!; // Safe access to data after checking hasData
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                final student = data[index];
                // final jsonString = jsonEncode(student);
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  ChatPage(studentID: student['id']),
                      ),
                    );
                  },
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  ChatPage(studentID: student['id']),
                        ),
                      );
                    },
                    icon: Icon(Icons.mark_unread_chat_alt_outlined),
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Colors.amber,
                  ),
                  title: Text(student['name']),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
                child:
                    Text('Error: ${snapshot.error}')); // Display error message
          }

          // Show a loading indicator while fetching data
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

