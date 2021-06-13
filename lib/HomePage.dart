import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _todo=TextEditingController();
final List<String> _todoList = <String>[];

  void _addTodoItem(String title) {
    //  a set state will notify the app that the state has changed
    setState(() {
      _todoList.add(title);
    });
    _todo.clear();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.grey,
          title: Center(child: Text('TODO')),
        ),
        body: ListView.builder(
          itemCount: _todoList.length,
          itemBuilder: (BuildContext context, int index) => Padding(
            padding: const EdgeInsets.only(left: 10, top: 5, right: 10),
            child: Card(
              child: Container(
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    _todoList[index],
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                      title: Center(
                          child: Text(
                        "ADD TODO",
                        style: TextStyle(color: Colors.blue),
                      )),
                      content: Container(
                        height: 120,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _todo,
                              decoration: InputDecoration(labelText: 'Todo'),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      'CANCEL',
                                      style: TextStyle(color: Colors.red),
                                    )),
                                MaterialButton(
                                    onPressed: () {
                                     _addTodoItem(_todo.text.toString());
                                     Navigator.of(context).pop(); 
                                    },
                                    child: Text(
                                      'ADD',
                                      style: TextStyle(color: Colors.blue),
                                    )),
                              ],
                            )
                          ],
                        ),
                      ));
                });
          },
          backgroundColor: Colors.blue[200],
          child: Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
