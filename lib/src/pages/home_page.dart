import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/utils/icon_string.dart';
import 'package:flutter/material.dart';
import 'package:componentes/src/providers/menu_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: _list(),
    );
  }

  Widget _list() {
    //menuProvider.loadData().then(print);
    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        print('Builder');
        return ListView(
          children: _createListItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _createListItems(List<dynamic> data, BuildContext context) {
    final List<Widget> options = [];
    data.forEach((option) {
      final widgetTemp = ListTile(
        title: Text(option['texto']),
        leading: getIcon(option['icon']),
        trailing: Icon(
          Icons.keyboard_arrow_right_rounded,
          color: Colors.blue,
        ),
        onTap: () {
          Navigator.pushNamed(context, option['ruta']);

          //final route = MaterialPageRoute(
          //builder: (context) {
          //return AlertPage();
          //},
          //);
          //Navigator.push(context, route);
        },
      );
      options
        ..add(widgetTemp)
        ..add(Divider(
          color: Colors.blue,
          height: 2,
          thickness: 0.4,
        ));
    });
    return options;
  }
}
