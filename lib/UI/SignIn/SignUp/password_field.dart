import 'package:flutter/material.dart';

class PasswordStrengthField extends StatefulWidget {
  const PasswordStrengthField({super.key});

  @override
  _PasswordStrengthFieldState createState() => _PasswordStrengthFieldState();
}

class _PasswordStrengthFieldState extends State<PasswordStrengthField> {
  final TextEditingController _passwordController = TextEditingController();
  int _strengthLevel = 0;

  // Function to calculate password strength
  void _checkPasswordStrength(String password) {
    int strength = 0;

    if (password.length >= 6) strength++;
    if (password.contains(RegExp(r'[A-Z]'))) strength++;
    if (password.contains(RegExp(r'[0-9]'))) strength++;
    if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) strength++;

    setState(() {
      _strengthLevel = strength;
    });
  }

  // Function to build strength bar
  Widget _buildStrengthBar(int level) {
    return Row(
      children: List.generate(4, (index) {
        return Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 2),
            height: 10,
            decoration: BoxDecoration(
              color: index < level ? Colors.green : Colors.grey[300],
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: _passwordController,
          obscureText: true,
          decoration: const InputDecoration(
            labelText: 'Password',
            border: OutlineInputBorder(),
          ),
          onChanged: (password) {
            _checkPasswordStrength(password);
          },
        ),
        const SizedBox(height: 10),
        const Text("Password Strength"),
        _buildStrengthBar(_strengthLevel),
      ],
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }
}