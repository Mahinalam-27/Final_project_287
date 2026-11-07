import 'package:flutter/material.dart';
import 'login.dart';
import 'registration.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 228, 224, 213),

      appBar: AppBar(
        title: const Text("My Account"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 29, 67, 71),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Container(
          width: 330,
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 236, 232, 222),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color.fromARGB(255, 193, 166, 109),
            ),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 30, 69, 72),
                blurRadius: 15,
                spreadRadius: 2,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 199, 208, 202),
                  shape: BoxShape.circle,
                ),

                child: const Icon(
                  Icons.account_circle,
                  size: 75,
                  color: Color.fromARGB(255, 29, 67, 70),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Welcome!",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 31, 72, 75),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Your journey starts here.\nLogin or create an account to continue.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 105, 101, 93),
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,

                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 29, 66, 69),
                    foregroundColor: const Color.fromARGB(255, 233, 226, 226),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text("Login"),
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegistrationPage(),
                      ),
                    );
                  },

                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 32, 75, 79),
                    side: const BorderSide(
                      color: Color.fromARGB(255, 38, 87, 92),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text("Create Account"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
