import 'package:flutter/material.dart';
import 'package:supabase_auth/Auth/auth_service.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  final authService = AuthService();
 

  void logout() async {
    await authService.signOut();
    print('Logout berhasil: $logout'); // Tampilkan Pesan bahwa user bisa logout
  }

  @override
  Widget build(BuildContext context) {
    final currentemail = authService.getCurrentUserEmail();
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Pages'),
        actions: [IconButton(onPressed: logout, icon: Icon(Icons.logout))],
      ),
      body: Center(
        child: Text(currentemail.toString()),
      ),
    );
  }
}
