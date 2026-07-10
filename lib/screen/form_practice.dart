import 'package:flutter/material.dart';

import 'home_page.dart';
import 'otp_state.dart';

class FormPractice extends StatefulWidget {
  const FormPractice({super.key});

  @override
  State<FormPractice> createState() => _FormPracticeState();
}

class _FormPracticeState extends State<FormPractice> {
  final _loginFormKey = GlobalKey<FormState>();
  bool _isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _loginFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Ismigini kiriting",
                  border: OutlineInputBorder(),
                ),

                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return 'Iltimos, ismigizni yozing!';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),

                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return 'Iltimos, Email kiritish majburiy!';
                  }
                  if (!v.contains('@')) {
                    return "Yaroqli email kiriting!!!";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                obscureText: _isPasswordHidden,
                decoration: InputDecoration(
                  labelText: "Parol",
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isPasswordHidden = !_isPasswordHidden;
                      });
                    },
                    icon: Icon(
                      _isPasswordHidden
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                  border: OutlineInputBorder(),
                ),

                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return 'Iltimos, Parol Kiritish majburiy!';
                  }
                  if (v.length < 6) {
                    return "Parol kamida 6 ta belgidan iborat bo'lisin!";
                  }
                  return null;
                },
              ),
              SizedBox(height: 25),
              ElevatedButton(
                onPressed: () async {
                  if (_loginFormKey.currentState!.validate()) {
                    final snackBarController = ScaffoldMessenger.of(context)
                        .showSnackBar(
                          SnackBar(
                            content: Text("Serverga so'rov yuborildi! 🎉"),
                            duration: Duration(seconds: 3),
                          ),
                        );

                    await snackBarController.closed;
                    if (!context.mounted) return;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const OtpFormPage()),
                    );
                  }
                },
                child: Text(
                  'Kirish',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
