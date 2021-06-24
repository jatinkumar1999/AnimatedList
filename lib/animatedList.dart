import 'package:animated_list/data/data.dart';
import 'package:animated_list/listItemWidget.dart';
import 'package:animated_list/modal/list_Items.dart';
import 'package:flutter/material.dart';

class animatedList extends StatefulWidget {
  animatedList({Key key}) : super(key: key);

  @override
  _animatedListState createState() => _animatedListState();
}

class _animatedListState extends State<animatedList> {
  List<ListItem> listItems = List.from(itemList);

  final animatedkey = GlobalKey<AnimatedListState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedList(
        key: animatedkey,
        padding: EdgeInsets.only(top: 50),
        initialItemCount: listItems.length,
        itemBuilder: (context, index, animation) => ListItemWidget(
          item: listItems[index],
          animation: animation,
          onpressed: () => remove(index),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {},
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => insertitem(),
        ),
      ),
    );
  }

  void remove(int index) {
    final removeditem = listItems[index];
    listItems.removeAt(index);
    animatedkey.currentState.removeItem(
      index,
      (context, animation) => ListItemWidget(
        item: removeditem,
        animation: animation,
        onpressed: () {},
      ),
      duration: Duration(milliseconds: 600),
    );
  }

  void insertitem() {
    final index = 1;
    final element = ListItem(
        imgURl:
            "https://image.shutterstock.com/image-photo/colorful-flower-on-dark-tropical-600w-721703848.jpg",
        name: "Chimkande");
    listItems.insert(index, element);
    animatedkey.currentState.insertItem(index,
        duration: Duration(
          milliseconds: 600,
        ));
  }
}
