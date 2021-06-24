import 'package:animated_list/modal/list_Items.dart';
import 'package:flutter/material.dart';

class ListItemWidget extends StatelessWidget {
  final ListItem item;
  final Animation<double> animation;
  final VoidCallback onpressed;
  ListItemWidget({
    Key key,
    @required this.item,
    @required this.animation,
    @required this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SizeTransition(
        key: ValueKey(item.imgURl),
        sizeFactor: animation,
        child: builditem(),
      );

  // SlideTransition(
  //   position: Tween<Offset>(
  //     begin: Offset(-1, 0),
  //     end: Offset.zero,
  //   ).animate(
  //       CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn)),
  //   child: builditem(),
  // );

  builditem() {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(item.imgURl),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          color: Colors.red,
          onPressed: onpressed,
        ),
        title: Text(item.name),
      ),
    );
  }
}
