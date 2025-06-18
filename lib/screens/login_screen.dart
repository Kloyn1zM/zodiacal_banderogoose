import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _nameController = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_checkInput);
  }

  void _checkInput() {
    setState(() {
      _isButtonEnabled = _nameController.text.trim().isNotEmpty;
    });
  }

  Future<void> _login() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', _nameController.text.trim());
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Вхід'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('lib/assets/images/gus.png', height: 200),
                const SizedBox(height: 32),
                Text(
                  'Вітаємо',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  'Введіть своє імʼя, щоб продовжити',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: "Ваше ім'я",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: _isButtonEnabled ? _login : null,
                  // icon: const Icon(Icons.arrow_forward),
                  label: const Text('Продовжити'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 42,
                      vertical: 12,
                    ),
                    textStyle: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    backgroundColor:
                        _isButtonEnabled ? Colors.blueAccent : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
