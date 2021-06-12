import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController scrollController = new ScrollController();

  List<int> _listaNumeros = [];
  int ultimoNum = 0;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    agregar10();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        //agregar10();
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
      ),
      body: Stack(
        children: [crearLista(), crearLoading()],
      ),
    );
  }

  Widget crearLista() {
    return RefreshIndicator(
        child: ListView.builder(
            controller: scrollController,
            itemCount: _listaNumeros.length,
            itemBuilder: (BuildContext context, int index) {
              final imagen = _listaNumeros[index];
              return FadeInImage(
                  placeholder: AssetImage('assets/jar-loading.gif'),
                  image:
                      NetworkImage("https://picsum.photos/id/$index/500/300"));
            }),
        onRefresh: obtenerPaginaUno);
  }

  Future obtenerPaginaUno() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _listaNumeros.clear();
      ultimoNum++;
      agregar10();
    });
    return Future.delayed(duration);
  }

  void agregar10() {
    for (var i = 0; i < 10; i++) {
      ultimoNum++;
      _listaNumeros.add(ultimoNum);
    }
    setState(() {});
  }

  Future fetchData() async {
    isLoading = true;
    setState(() {});

    return new Timer(Duration(seconds: 2), respuestaHttp);
  }

  void respuestaHttp() {
    isLoading = false;
    scrollController.animateTo(scrollController.position.pixels + 100,
        duration: Duration(milliseconds: 250), curve: Curves.fastOutSlowIn);
    agregar10();
  }

  Widget crearLoading() {
    if (isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [CircularProgressIndicator()],
            ),
          )
        ],
      );
    } else {
      return Container();
    }
  }
}
