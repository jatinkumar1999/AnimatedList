import 'package:animated_list/animatedList.dart';
import 'package:animated_list/data/data.dart';
import 'package:animated_list/drawLine/DrawLine.dart';
import 'package:animated_list/modal/list_Items.dart';
import 'package:animated_list/siliver_app_bar/siliver_appbar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        primarySwatch: Colors.blue,
      ),
      home: line(),
    );
  }
}

class Age extends StatefulWidget {
  Age({Key key}) : super(key: key);

  @override
  _AgeState createState() => _AgeState();
}

class _AgeState extends State<Age> {
  List<ListItem> items = List.from(itemList);

  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        controller: controller,
        itemCount: items.length,
        itemBuilder: (context, index) => add(
          items: items[index],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: scrolldown,
        child: Icon(Icons.arrow_downward_rounded),
      ),
    );
  }

  void scrollup() {
    final double start = 0;
    // controller.jumpTo(start);

    controller.animateTo(start,
        duration: Duration(seconds: 1), curve: Curves.easeIn);
  }

  void scrolldown() {
    final double down = controller.position.maxScrollExtent;
    controller.animateTo(down,
        duration: Duration(seconds: 1), curve: Curves.easeInOut);
  }
}

class add extends StatelessWidget {
  final ListItem items;
  const add({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(items.imgURl),
          ),
          title: Text(items.name),
        ),
      ),
    );
  }
}
