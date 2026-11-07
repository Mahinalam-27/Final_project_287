import 'package:final_project_287_g/home_page.dart';
import 'package:final_project_287_g/login.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Authgate extends StatelessWidget {
  const Authgate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 229, 225, 215),
            body: Center(
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 30, 64, 67),
              ),
            ),
          );
        }
        final session = Supabase.instance.client.auth.currentSession;
        if (session != null) {
          return Homepage();
        } else {
          return LoginPage();
        }
      },
    );
  }
}
