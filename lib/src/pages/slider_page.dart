import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100;
  bool _bloquearCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
          padding: EdgeInsets.only(top: 50),
          child: Column(
            children: [
              _crearSlider(),
              _crearCheckBox(),
              _crearSwitch(),
              Expanded(child: _crearImagen())
            ],
          )),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      inactiveColor: Colors.lightBlue,
      value: _valorSlider,
      min: 10,
      max: 400,
      onChanged: (_bloquearCheck)
          ? null
          : (value) {
              setState(() {
                _valorSlider = value;
              });
            },
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          'https://www.tonica.la/__export/1606087293449/sites/debate/img/2020/11/22/batman-ranking-actores.jpg_423682103.jpg'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

  Widget _crearCheckBox() {
    /*
    return Checkbox(
        value: _bloquearCheck,
        onChanged: (value) {
          setState(() {
            _bloquearCheck = value;
          });
        });
      );
    */
    return CheckboxListTile(
        title: Text('Bloquear'),
        value: _bloquearCheck,
        onChanged: (value) {
          setState(() {
            _bloquearCheck = value;
          });
        });
  }

  Widget _crearSwitch() {
    return SwitchListTile(
        title: Text('Bloquear'),
        value: _bloquearCheck,
        onChanged: (value) {
          setState(() {
            _bloquearCheck = value;
          });
        });
  }
}
