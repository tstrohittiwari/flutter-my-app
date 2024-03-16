import 'package:flutter/material.dart';
import 'package:mentor_panel/screens/chatScreen/chat_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';



class ChatMainScreen extends StatefulWidget {

  //AUTH
  // final councelling;
  // const ChatMainScreen({Key? key, required this.councelling}) : super(key: key);

  final councelling = 'hsts';
  const ChatMainScreen({Key? key}) : super(key: key);


  @override
  State<ChatMainScreen> createState() => _ChatMainScreenState();
}

class _ChatMainScreenState extends State<ChatMainScreen> {
  final String mentorID = '20993e27-880e-4a3c-8de0-40f5284a9c98';

  Future<List<Map<String, dynamic>>> fetchdata() async {
    final response =
    await Supabase.instance.client
        .from('studentdata')
        .select()
        .eq('councelling', widget.councelling);

    print(response);
    return response;
  }

  List<Map<String, dynamic>>? fetchedData;

  @override
  void initState() {
    super.initState();
      print(widget.councelling);
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      fetchedData = await fetchdata();
    } catch (error) {}
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Students"),

      ),
      body:
      FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchdata(),
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
                        builder: (context) =>
                            ChatPage(studentID: student['id']),
                      ),
                    );
                  },
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ChatPage(studentID: student['id']),
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

