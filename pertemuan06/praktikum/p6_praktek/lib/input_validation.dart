import 'package:flutter/material.dart';

class MyInputValidation extends StatefulWidget {
  const MyInputValidation({super.key});

  @override
  State<MyInputValidation> createState() => _MyInputValidationState();
}

class _MyInputValidationState extends State<MyInputValidation> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerNama = TextEditingController();

  void dispose() {
    _controllerEmail.dispose();
    _controllerNama.dispose();
    super.dispose();
  }

  String? validateEmail(String? value) {
    const String expression = "[a-zA-Z0-9+._%-+]{1,256}"
        "\\@"
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}"
        "("
        "\\."
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}"
        ")+";
    final RegExp regExp = RegExp(expression);

    if (value == null || value.isEmpty) {
      return 'Email tidak boleh kosong';
    }
    if (!regExp.hasMatch(value)) {
      return 'Email tidak valid';
    }

    if (value.length < 6) {
      return 'Email tidak boleh kurang dari 6 karakter';
    }
    return null;
  }

  String? validateNama(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nama tidak boleh kosong';
    }
    if (value.length < 2) {
      return 'Nama tidak boleh kurang dari 6 karakter';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[700],
        title: const Text('Input Validation'),
      ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _controllerEmail,
                  decoration: const InputDecoration(
                    hintText: 'Tulis Email Anda Disini...',
                    labelText: 'Email Anda',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    fillColor: Color.fromARGB(255, 152, 221, 155),
                    filled: true,
                  ),
                  validator: validateEmail,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _controllerNama,
                  decoration: const InputDecoration(
                    hintText: 'Tulis Nama Anda Disini...',
                    labelText: 'Nama Anda',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    fillColor: Color.fromARGB(255, 152, 221, 155),
                    filled: true,
                  ),
                  validator: validateNama,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')));
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('Email ${_controllerEmail.text}'),
                                    Text('Hello ${_controllerNama.text} ')
                                  ],
                                ),
                              );
                            });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Data Tidak Valid')));
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ]),
              )
            ]),
          )),
    );
  }
}
