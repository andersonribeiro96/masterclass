import 'package:flutter/material.dart';
import 'package:masterclass/controllers/signup.controller.dart';
import 'package:masterclass/stores/app.store.dart';
import 'package:masterclass/view-models/signup.viewmodel.dart';
import 'package:masterclass/views/home.view.dart';
import 'package:provider/provider.dart';

class Singupview extends StatefulWidget {
  @override
  _SingupviewState createState() => _SingupviewState();
}

class _SingupviewState extends State<Singupview> {
  final _formkey = GlobalKey<FormState>();
  final _controller = new SignupController();
  var model = new SignupViewModel();

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<AppStore>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                Text("Cadastre-se"),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Nome",
                    labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Nome Inválido';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    model.name = val;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "E-mail",
                    labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Email Inválido';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    model.email = val;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Senha",
                    labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Senha Inválido';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    model.password = val;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                model.busy
                    ? Center(
                        child: Container(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : FlatButton(
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          if (_formkey.currentState.validate()) {
                            _formkey.currentState.save();
                          }

                          _controller.create(model).then((value) {
                            store.setUser(
                              value.name,
                              value.email,
                              value.picture,
                              value.token,
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeView()),
                            );
                          });
                        },
                        child: Text("Cadastrar"),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
