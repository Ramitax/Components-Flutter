import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AvatarPage'),
        actions: [
          Container(
            padding: EdgeInsets.all(4),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://cdn.forbes.com.mx/2018/11/stan-lee.jpg'),
              radius: 22,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              right: 10,
            ),
            child: CircleAvatar(
              child: Text("RA"),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://cdn.forbes.com.mx/2018/11/stan-lee.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.keyboard_arrow_left,
          size: 40,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
