import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../providers/user_provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  int _age = 0;
  double _weight = 0.0;
  double _height = 0.0;
  String? _fitnessGoal;

  // Lista de opções para metas
  List<String> metas = ['Emagrecer', 'Condicionamento', 'Hipertrofia'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: Text(
          'Perfil do Usuário',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Theme(
          data: ThemeData(
            primaryColor: Colors.white,
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: Colors.white,
              selectionColor: Colors.white,
              selectionHandleColor: Colors.white,
            ),
            inputDecorationTheme: InputDecorationTheme(
              labelStyle: TextStyle(color: Colors.white),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nome'),
                  style: TextStyle(color: Colors.white),
                  onSaved: (value) => _name = value!,
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Idade'),
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.white),
                  onSaved: (value) => _age = int.parse(value!),
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Peso (kg)'),
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.white),
                  onSaved: (value) => _weight = double.parse(value!),
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Altura (cm)'),
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.white),
                  onSaved: (value) => _height = double.parse(value!),
                ),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Meta de Condicionamento Físico',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  value: _fitnessGoal,
                  items: metas.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: TextStyle(color: Colors.white)),
                    );
                  }).toList(),
                  dropdownColor: Colors.deepPurple,
                  onChanged: (String? newValue) {
                    setState(() {
                      _fitnessGoal = newValue;
                    });
                  },
                  onSaved: (value) => _fitnessGoal = value,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _formKey.currentState!.save();
                    Provider.of<UserProvider>(context, listen: false)
                        .setUser(User(
                      name: _name,
                      age: _age,
                      weight: _weight,
                      height: _height,
                      fitnessGoal: _fitnessGoal!,
                    ));
                    Navigator.pop(context);
                  },
                  child: Text('Salvar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
