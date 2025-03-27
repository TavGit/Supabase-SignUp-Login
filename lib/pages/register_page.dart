import 'package:flutter/material.dart';
import 'package:supabase_auth/Auth/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // dapatkan auth service
  final authService = AuthService();

  // buat teks controller untuk email dan password
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();

  // fungsi untuk daftar
  void signUp() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmpasswordController.text.trim();

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password dan konfirmasi password tidak cocok')),
      );
      return;
    }

    try {
      await authService.signUp(email, password);
      print('Registrasi berhasil: $signUp'); // Tampilkan Pesan bahwa user bisa registarsi
      Navigator.pop(context);
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password harus 6 karakter atau lebih')),
      );
      print('Registrasi gagal: $error'); // Tampilkan Pesan bahwa user tidak bisa registarsi
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue,
      appBar: AppBar(title: Text("Registrasi Akun")),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 50),
        children: [
          TextField(
            controller: _emailController,
            decoration: InputDecoration(labelText: "Email"),
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(labelText: "Password"),
          ),
          TextField(
            controller: _confirmpasswordController,
            // obscureText: true,
            decoration: InputDecoration(labelText: "Konfirmasi Password"),
          ),

          SizedBox(height: 12),

          ElevatedButton(onPressed: signUp, child: Text("Daftar")),
        ],
      ),
    );
  }
}

