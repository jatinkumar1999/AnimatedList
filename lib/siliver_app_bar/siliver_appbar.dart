import 'package:animated_list/data/data.dart';
import 'package:animated_list/modal/list_Items.dart';
import 'package:flutter/material.dart';

class Bar extends StatefulWidget {
  Bar({Key key}) : super(key: key);

  @override
  BarState createState() => BarState();
}

class BarState extends State<Bar> {
  List<ListItem> items = List.from(itemList);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            floating: true,
            leading: BackButton(),
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Jatin kumar"),
              background: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://image.shutterstock.com/image-photo/colorful-flower-on-dark-tropical-600w-721703848.jpg"))),
              ),
            ),
            actions: [
              Icon(Icons.settings),
            ],
          ),
          SliverToBoxAdapter(
            child: GridView.builder(
              primary: false,
              shrinkWrap: true,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return add(
                  items: items[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class add extends StatelessWidget {
  final ListItem items;
  const add({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 15),
      child: Container(
          height: 300,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Image.network(
            items.imgURl,
            fit: BoxFit.cover,
          )),
    );
  }
}
