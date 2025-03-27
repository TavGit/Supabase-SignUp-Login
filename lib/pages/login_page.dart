import 'package:flutter/material.dart';
import 'package:supabase_auth/Auth/auth_service.dart';
import 'package:supabase_auth/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // dapatkan auth service
  final authService = AuthService();

  // buat teks controller untuk email dan password
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();


  // fungsi untuk login
  void login() async {
    // persiapkan data
    final email = _emailController.text;
    final password = _passwordController.text;

    // mencoba login
    try {
      await authService.signInWithEmailPassword(email, password);
      print('Login berhasil: $login'); // Tampilkan Pesan bahwa user bisa login
    }
    // tangani error
    catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Error akun anda blm terdaftar")));
      }
      print('Login gagal: $error'); // Tampilkan Pesan bahwa user tidak bisa login
    }
  }

  // buat tampilan UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Login"),
          ],
        ),
      ),
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

          SizedBox(height: 10),

          ElevatedButton(onPressed: login, child: Text("Login")),

          GestureDetector(
            onTap: () => 
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterPage()),
              ),
            child: Center(
              child: Text(
                "Belum punya akun?, Ayo daftar akun anda!!",
                style: TextStyle(color: Colors.red, fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
