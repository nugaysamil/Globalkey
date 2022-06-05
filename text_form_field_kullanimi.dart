import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class TextFormFieldKullanimi extends StatefulWidget {
  TextFormFieldKullanimi({Key? key}) : super(key: key);

  @override
  State<TextFormFieldKullanimi> createState() => _TextFormFieldKullanimiState();
}

class _TextFormFieldKullanimiState extends State<TextFormFieldKullanimi> {
  String _email = "", _password = "", _userName = "";
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextForm Field Kullanımı'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                TextFormField(
                  //initialValue: 'SamilNugay',
                  decoration: InputDecoration(
                      // errorStyle: TextStyle(color: Colors.teal),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      labelText: 'Username',
                      hintText: 'UserName'),
                  onSaved: (deger) {
                    _userName = deger!;
                  },
                  validator: (deger) {
                    if (deger!.isEmpty) {
                      return 'e mail boş olamaz';
                    } else if (!EmailValidator.validate(deger!)) {
                      return ' geçerli mail gir';
                    }
                    if (deger!.length < 4) {
                      return 'Username en az 4 karakter olmalı';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  // initialValue: 'samil_Nugay@hotmail.com',
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    // errorStyle: TextStyle(color: Colors.teal),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    labelText: 'Email',
                    hintText: 'Email',
                  ),
                  onSaved: (deger) {
                    _password = deger!;
                  },

                  validator: (deger) {
                    if (!EmailValidator.validate(deger!)) {
                      return 'Gecerli mail giriniz';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  // initialValue: 'samil_Nugay@hotmail.com',
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      // errorStyle: TextStyle(color: Colors.teal),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      labelText: 'Password',
                      hintText: 'Password'),
                  validator: (deger) {
                    if (deger!.length < 6) {
                      return 'Sifre en az 6 karakter olmalı';
                    } else
                      return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      bool _validate = _formKey.currentState!.validate();
                      if (_validate) {
                        _formKey.currentState!.save();
                        String result =
                            'username:$_userName\nemail:$_email\nSifre:$_password';

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.amber.shade300,
                            content: Text(
                              result,
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                        );
                        _formKey.currentState!.reset();
                      }
                    },
                    child: Text('Onayla')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
