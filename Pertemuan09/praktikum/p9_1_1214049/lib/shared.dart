import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyShared extends StatefulWidget {
  const MyShared({Key? key}) : super(key: key);

  @override
  State<MyShared> createState() => _MySharedState();
}

class _MySharedState extends State<MyShared> {
final _inputController = TextEditingController();
final _outputController = TextEditingController();

late SharedPreferences data;

void saveData() async {
  data = await SharedPreferences.getInstance();
  data.setString('input', _inputController.text);
  _inputController.clear();
}

void getData() async {
  data = await SharedPreferences.getInstance();
  _outputController.text = data.getString('input').toString();
}

void removeData() async {
  data = await SharedPreferences.getInstance();
  data.remove('input');
  _outputController.clear();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text('Shared Preferences',
              style: TextStyle(color: Colors.white))),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 24,
          ),
          child: Column(
            children: [
              TextFormField(
                controller: _inputController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  saveData();
                },
                child: const Text('Simpan'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _outputController,
                readOnly: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      getData();
                    },
                    child: const Text('Tampilkan'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      removeData();
                    },
                    child: const Text('Hapus'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
