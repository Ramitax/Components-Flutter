import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          _cardType1(),
          SizedBox(height: 30),
          _cardType2(),
          SizedBox(height: 30),
          _cardType1(),
          SizedBox(height: 30),
          _cardType2(),
          SizedBox(height: 30),
          _cardType1(),
          SizedBox(height: 30),
          _cardType2(),
          SizedBox(height: 30),
          _cardType1(),
          SizedBox(height: 30),
          _cardType2(),
        ],
      ),
    );
  }

  Widget _cardType1() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.photo_album_outlined,
              color: Colors.blue,
            ),
            title: Text('Titulo'),
            subtitle: Text(
                'Este es un subtitulo que va debajo del titulo de la tarjeta'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextButton(onPressed: () {}, child: Text('Cancelar')),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextButton(onPressed: () {}, child: Text('Aceptar')),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _cardType2() {
    final card = Container(
      child: Column(
        children: [
          FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage(
                'https://www.gardeningknowhow.com/wp-content/uploads/2020/12/lonely-japanese-cherry.jpg'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300,
            fit: BoxFit.cover,
          ),

          //Image( image: NetworkImage('https://www.gardeningknowhow.com/wp-content/uploads/2020/12/lonely-japanese-cherry.jpg')),

          Container(
            padding: EdgeInsets.all(10),
            child: Text('Imagen'),
          )
        ],
      ),
    );
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              spreadRadius: 2,
              offset: Offset(2, 5))
        ],
      ),
      child: ClipRRect(
        child: card,
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
