import 'package:depi_7_25/cubit/note_cubit.dart';
import 'package:depi_7_25/helpers/hive_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteScreen extends StatelessWidget {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NoteCubit>();
    print("Rebuild =======");
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Add a new Note'),
                content: TextField(
                  controller: _textController,
                  autofocus: true,
                  decoration: const InputDecoration(
                    hintText: "Enter the content of the Note.",
                  ),
                ),
                actions: [
                  TextButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      _textController.text = "";
                      Navigator.pop(context);
                    },
                  ),
                  TextButton(
                    child: Text('Add'),
                    onPressed: () {
                      // HiveHelper.myNotes.add(_textController.text);
                      cubit.addNote(_textController.text);
                      _textController.text = "";
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          "Note App",
          style: TextStyle(fontSize: 22, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              cubit.deleteAllNote();
            },
            icon: Icon(Icons.delete, color: Colors.red),
          ),
        ],
      ),
      body: BlocBuilder<NoteCubit, NoteState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: HiveHelper.myNotes.length,
            itemBuilder: (context, index) => Stack(
              children: [
                InkWell(
                  onTap: () async {
                    _textController.text = HiveHelper.myNotes[index];
                    await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Update a new Note'),
                          content: TextField(
                            controller: _textController,
                            autofocus: true,
                            decoration: const InputDecoration(
                              hintText: "Enter the content of the Note.",
                            ),
                          ),
                          actions: [
                            TextButton(
                              child: Text('Cancel'),
                              onPressed: () {
                                _textController.text = "";
                                Navigator.pop(context);
                              },
                            ),
                            TextButton(
                              child: Text('Update'),
                              onPressed: () {
                                cubit.updateNote(_textController.text, index);
                                _textController.text = "";
                                Navigator.pop(context);
                                print(HiveHelper.myNotes);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: index == 0
                          ? Colors.red.withOpacity(.2)
                          : index % 2 == 0
                          ? Colors.green.withOpacity(.2)
                          : Colors.yellow.withOpacity(.2),
                    ),
                    child: Center(child: Text(HiveHelper.myNotes[index])),
                  ),
                ),
                Positioned(
                  right: 40,
                  top: 40,
                  child: InkWell(
                    onTap: () {
                      cubit.deleteNote(index);
                    },
                    child: Icon(Icons.delete, color: Colors.red),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

///Note App:
// (1) add note ( Done )
// (2) remove note ( Done )
// (3) remove all notes ( Done )
// (4) update note (done )
