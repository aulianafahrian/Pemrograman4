import 'package:flutter/material.dart';

class MyInput extends StatefulWidget {
  const MyInput({super.key});
  @override
  State<MyInput> createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {
  final TextEditingController _controller = TextEditingController();
  bool lightOn = false;
  String? language;

  void showSnackBar(String selectedLanguage) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('You choose $language'),
      duration: const Duration(seconds: 1),
    ));
  }

  bool agree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightOn ? Colors.amber : Colors.amber[700],
        title: const Text('Input Widget'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Write your name here...',
                labelText: 'Your Name',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Submit'),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text('Hello ${_controller.text}'),
                      );
                    });
              },
            ),
            Switch(
                value: lightOn,
                onChanged: (bool value) {
                  setState(() {
                    lightOn = value;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(lightOn ? 'Light On' : 'Light Off'),
                    duration: const Duration(seconds: 1),
                  ));
                }),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Radio<String>(
                    value: 'Dart',
                    groupValue: language,
                    onChanged: (String? value) {
                      setState(() {
                        language = value;
                        showSnackBar(value!);
                      });
                    },
                  ),
                  title: const Text('Dart'),
                ),
                ListTile(
                  leading: Radio<String>(
                    value: 'Kotlin',
                    groupValue: language,
                    onChanged: (String? value) {
                      setState(() {
                        language = value;
                        showSnackBar(value!);
                      });
                    },
                  ),
                  title: const Text('Kotlin'),
                ),
                ListTile(
                  leading: Radio<String>(
                    value: 'Swift',
                    groupValue: language,
                    onChanged: (String? value) {
                      setState(() {
                        language = value;
                        showSnackBar(value!);
                      });
                    },
                  ),
                  title: const Text('Swift'),
                ),
              ],
            ),
            ListTile(
              leading: Checkbox(
                value: agree,
                onChanged: (bool? value) {
                  setState(() {
                    agree = value!;
                    //showSnackBar1(value ? 'Agree' : 'Disagree');
                  });
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(agree ?  'You choose Agree' : 'You choose Disagree'),
                    duration: const Duration(seconds: 1),
                  ));
                },
              ),
              title: const Text('Agree / Disagree'),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
