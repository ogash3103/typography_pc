import 'package:flutter/material.dart';

class OtpFormPage extends StatefulWidget {
  const OtpFormPage({super.key});

  @override
  State<OtpFormPage> createState() => _OtpFormPageState();
}

class _OtpFormPageState extends State<OtpFormPage> {
  late TextEditingController _p1, _p2, _p3, _p4;
  late FocusNode _f1, _f2, _f3, _f4;

  @override
  void initState() {
    super.initState();
    _p1 = TextEditingController();
    _p2 = TextEditingController();
    _p3 = TextEditingController();
    _p4 = TextEditingController();

    _f1 = FocusNode();
    _f2 = FocusNode();
    _f3 = FocusNode();
    _f4 = FocusNode();
  }

  @override
  void dispose() {
    _p1.dispose(); _p2.dispose(); _p3.dispose(); _p4.dispose();
    _f1.dispose(); _f2.dispose(); _f3.dispose(); _f4.dispose();
    super.dispose();
  }

  // 2. Umumiy TextField vidjetini yaratuvchi funksiya
  Widget _buildOtpBox({
    required TextEditingController controller,
    required FocusNode currentFocus,
    FocusNode? nextFocus,
    FocusNode? previousFocus,
  }) {
    return SizedBox(
      width: 60,
      child: TextField(
        controller: controller,
        focusNode: currentFocus,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        decoration: const InputDecoration(
          counterText: "",
          border: OutlineInputBorder(),
        ),
        onChanged: (value) {
          if (value.length == 1 && nextFocus != null) {
            FocusScope.of(context).requestFocus(nextFocus);
          } else if (value.isEmpty && previousFocus != null) {
            FocusScope.of(context).requestFocus(previousFocus);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SMS Tasdiqlash")),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildOtpBox(controller: _p1, currentFocus: _f1, nextFocus: _f2),
            _buildOtpBox(controller: _p2, currentFocus: _f2, nextFocus: _f3, previousFocus: _f1),
            _buildOtpBox(controller: _p3, currentFocus: _f3, nextFocus: _f4, previousFocus: _f2),
            _buildOtpBox(controller: _p4, currentFocus: _f4, previousFocus: _f3),
          ],
        ),
      ),
    );
  }
}