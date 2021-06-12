import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _name = "";
  String _email = "";
  String _password = "";
  String _fecha = "";
  List<String> _poderes = ['Volar', 'Rayos X', 'Fuerza'];
  String _opcionSeleccionada = 'Volar';

  TextEditingController _inputFileDateController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inputs"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: [
          _createInput(),
          Divider(),
          _createEmail(),
          Divider(),
          _createPassword(),
          Divider(),
          _createDate(context),
          Divider(),
          _createDropdown(),
          Divider(),
          _createPerson()
        ],
      ),
    );
  }

  Widget _createInput() {
    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          counter: Text('Cantidad de letras ${_name.length}'),
          hintText: 'Nombre completo',
          labelText: 'Nombre',
          helperText: 'Solo en nombre',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle)),
      onChanged: (value) {
        setState(() {
          _name = value;
        });
      },
    );
  }

  Widget _createPerson() {
    return ListTile(
      title: Text('Nombre: $_name'),
      subtitle: Text('Email: $_email'),
    );
  }

  Widget _createEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          counter: Text('Cantidad de letras ${_email.length}'),
          hintText: 'Direccion de email',
          labelText: 'Email',
          helperText: 'Solo email',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.supervisor_account_rounded)),
      onChanged: (value) {
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _createPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          counter: Text('Cantidad de letras ${_password.length}'),
          hintText: 'Contraseña',
          labelText: 'Clave de seguridad',
          helperText: 'Solo password',
          suffixIcon: Icon(Icons.security),
          icon: Icon(Icons.admin_panel_settings_sharp)),
      onChanged: (value) {
        setState(() {
          _password = value;
        });
      },
    );
  }

  Widget _createDate(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFileDateController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          counter: Text('Cantidad de letras ${_password.length}'),
          hintText: 'Fecha de nacimiento',
          labelText: 'Fecha',
          helperText: 'Solo fecha',
          suffixIcon: Icon(Icons.calendar_today),
          icon: Icon(Icons.perm_contact_calendar)),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime pick = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'ES'));

    if (pick != null) {
      setState(() {
        _fecha = pick.toString();
        _inputFileDateController.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOptionDropdown() {
    List<DropdownMenuItem<String>> lista = [];
    _poderes.forEach((element) {
      lista.add(DropdownMenuItem(child: Text(element), value: element));
    });
    return lista;
  }

  Widget _createDropdown() {
    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(width: 30),
        Expanded(
            child: DropdownButton(
                value: _opcionSeleccionada,
                items: getOptionDropdown(),
                isExpanded: true,
                onChanged: (opt) {
                  setState(() {
                    _opcionSeleccionada = opt;
                  });
                }))
      ],
    );
  }
}
