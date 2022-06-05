import 'package:flutter/material.dart';
import 'package:flutter_inputs/text_form_field_kullanimi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TextFormFieldKullanimi()
    );
  }
}

class TextFieldIslemler extends StatefulWidget {
  final String title;
  const TextFieldIslemler({Key? key, required this.title}) : super(key: key);

  @override
  State<TextFieldIslemler> createState() => _TextFieldIslemlerState();
}

class _TextFieldIslemlerState extends State<TextFieldIslemler> {
  late TextEditingController _emailController;
  late FocusNode _focusNode;
  int maxLineCount = 1;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: 'samil@samil.com');
    _focusNode = FocusNode();
    _focusNode.addListener(
      () {
        if (_focusNode.hasFocus) {
          maxLineCount = 3;
        } else {
          maxLineCount = 1;
        }
      },
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Form Islemleri',
      )),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            focusNode: _focusNode,
            controller: _emailController,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            autofocus: true,
            maxLines: maxLineCount,
            maxLength: 20,
            onChanged: (String deger) {
              if (deger.length > 3) {
                setState(() {
                  _emailController.value = TextEditingValue(
                      text: deger,
                      selection: TextSelection.collapsed(offset: deger.length));
                });
              }
            },
            cursorColor: Colors.pink,
            decoration: InputDecoration(
              labelText: 'Label Text',
              hintText: 'Email gir',
              // icon: Icon(Icons.add),
              prefixIcon: Icon(Icons.email),
              suffixIcon: Icon(Icons.access_alarms_outlined),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
              ),
            ),
            onSubmitted: (String deger) {
              print(deger);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(_emailController.text),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _emailController.text = 'samil_nugay@hotmail.com';
          setState(() {});
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}
