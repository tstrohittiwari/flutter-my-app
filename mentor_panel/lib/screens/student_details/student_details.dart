import 'dart:core';
import 'package:flutter/material.dart';
// import 'package:mentor_panel/screens/student_details/pop_up.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Student {
  final String name;
  final String rank;
  final String category;
  final String homeState;
  final String gender;

  Student({
    required this.name,
    required this.rank,
    required this.category,
    required this.homeState,
    required this.gender,
  });
}

class StudentDetails extends StatefulWidget {
  const StudentDetails({Key? key}) : super(key: key);

  @override
  State<StudentDetails> createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();

  //AUTH mentorInfo = //
  // fetch mentor's councelling
  final mentorCoun = "jossa";

//FETCHING DATA FROM SUPABASE(JO ROHIT KO NHI AATA)
  Future<List<Map<String, dynamic>>> fetchdata(mentorCoun) async {
    final response =
        await Supabase.instance.client.from('studentdata').select().eq('councelling' , mentorCoun);
    return response;
  }

  List<Map<String, dynamic>>? fetchedData;

  @override
  void initState() {
    super.initState();
    _fetchData(mentorCoun);
  }

  Future<void> _fetchData(mentorCoun) async {
    try {
      fetchedData = await fetchdata(mentorCoun);
    } catch (error) {}
  }

  //UPDATE STUDENT DETAILS(YE BHI NHI AATA)
  void _updateStudentDetails(currentStudentId, name, rank, domicile) async {
    final response = await Supabase.instance.client.from('studentdata').update({
      // Fields to update (key-value pairs)
      'name': name.text,
      'rank': rank.text,
      'domicile': domicile.text,
    }).eq('id', currentStudentId); // Filter by id

    // if (response.error != null) {
    //   // Handle error
    //   print(response.error!.message);
    // } else {
    //   // Update successful
    //   print('Data updated successfully!');
    // }
  }
  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }
  //SUTEDNT DETAILS
  void _showStudentDetails(map) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: Colors.white,
          ),
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 20),
              Text(
                "Student Details",
                style: TextStyle(fontSize: 30),
              ),
              for (var detail in [
                {'label': 'Name', 'value': map['name']},
                {'label': 'Rank', 'value': map['rank']},
                {'label': 'Category', 'value': map['category']},
                {'label': 'Domicile', 'value': map['domicile']},
                {'label': 'Gender', 'value': map['gender']},
              ])
                // for(var d in fetchedData!)
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(detail['label']! + ": "),
                        Text(detail['value']!),
                      ],
                    ),
                  ),
                ),
              ElevatedButton(
                onPressed: () async {
                  // _updateStudentDetails(map['id'], "change", "change");
                  await showDialog<void>(
                      context: context,
                      builder: (context) => AlertDialog(
                            content: Stack(
                              clipBehavior: Clip.none,
                              children: <Widget>[
                                Positioned(
                                  right: -40,
                                  top: -40,
                                  child: InkResponse(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const CircleAvatar(
                                      backgroundColor: Colors.red,
                                      child: Icon(Icons.close),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: TextField(
                                        controller: _controller1,
                                        decoration: InputDecoration(
                                          labelText: 'Name',
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: TextField(
                                        controller: _controller2,
                                        decoration: InputDecoration(
                                          labelText: 'Category',
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: TextField(
                                        controller: _controller3,
                                        decoration: InputDecoration(
                                          labelText: 'Domicile',
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: ElevatedButton(
                                        child: const Text('Submit'),
                                        onPressed: () {
                                          // Do something with the text in _controller1.text and _controller2.text
                                          _updateStudentDetails(map['id'], _controller1, _controller2,_controller3);
                                          Navigator.of(context).pop();
                                          setState(() {

                                          });

                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ));
                },
                child: const Text('Edit'),
              ),
            ],
          ),
        );
      },
    );
  }

  //STUDENT LIST
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Students"),
      ),
      body:
      FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchdata(mentorCoun),
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
                  onTap: () => _showStudentDetails(student),
                  trailing: IconButton(
                    onPressed: () => _showStudentDetails(student),
                    icon: Icon(Icons.info_outline),
                  ),
                  leading: const Text(
                    "GFG",
                    style: TextStyle(color: Colors.green, fontSize: 15),
                  ),
                  title: Text(student['name']),
                  subtitle: Text(student['rank']),
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