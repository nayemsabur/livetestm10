import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Selectable List Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SelectableListScreen(),
    );
  }
}

class SelectableListScreen extends StatefulWidget {
  @override
  _SelectableListScreenState createState() => _SelectableListScreenState();
}

class _SelectableListScreenState extends State<SelectableListScreen> {
  List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];
  List<bool> isSelected = [false, false, false, false, false];

  int selectedCount = 0;

  void updateSelectedCount() {
    int count = 0;
    for (int i = 0; i < isSelected.length; i++) {
      if (isSelected[i]) {
        count++;
      }
    }
    setState(() {
      selectedCount = count;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selectable List'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            selected: isSelected[index],
            onTap: () {
              setState(() {
                isSelected[index] = !isSelected[index];
                updateSelectedCount();
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Selected Items'),
                content: Text('You have selected $selectedCount items.'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Close'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
