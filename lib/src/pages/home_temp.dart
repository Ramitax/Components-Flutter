import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final options = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Componentes Temp'),
        ),
        body: ListView(
          children: _createItemsShort(),
        ),
      ),
    );
  }

  List<Widget> _createItems() {
    List<Widget> list = [];
    options.forEach((element) {
      final tempWidget = ListTile(
        title: Text(element.toString()),
      );
      list
        ..add(tempWidget)
        ..add(Divider(
          color: Colors.black,
          height: 2,
        ));
    });
    return list;
  }

  List<Widget> _createItemsShort() {
    return options.map((element) {
      return Column(
        children: [
          ListTile(
            title: Text(element),
            subtitle: Text('Esto es un subtitulo'),
            leading: Icon(Icons.accessibility_sharp),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {},
          ),
          Divider(
            color: Colors.black,
            height: 2,
          ),
        ],
      );
    }).toList();
  }
}
