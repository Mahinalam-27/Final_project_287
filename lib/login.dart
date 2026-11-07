import 'package:flutter/material.dart';
import 'widgets/input_field.dart';
import 'package:final_project_287_g/registration.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 41, 131, 221),
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 330,
            padding: EdgeInsets.all(20),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.blue),
              boxShadow: [
                BoxShadow(color: Colors.grey, blurRadius: 15, spreadRadius: 2),
              ],
            ),

            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.login, size: 70, color: Colors.blue),

                  SizedBox(height: 15),

                  Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "Login to your account",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),

                  SizedBox(height: 30),

                  // Email Field
                  InputField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    labelText: "Email",
                    hintText: "Enter your email",
                    suffixIcon: Icon(Icons.email),
                    validator: (value) {
                      String pattern = r'^[\w.-]+@([\w-]+\.)+[\w-]{2,}$';

                      if (!RegExp(pattern).hasMatch(value)) {
                        return "Enter a valid email";
                      }

                      return null;
                    },
                  ),

                  SizedBox(height: 20),

                  // Password Field
                  InputField(
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    labelText: "Password",
                    hintText: "Enter your password",
                    suffixIcon: Icon(Icons.lock),
                    validator: (value) {
                      if (value.length < 6) {
                        return "Password must be at least 6 characters";
                      }

                      return null;
                    },
                  ),

                  SizedBox(height: 10),

                  // Forgot Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text("Forgot Password?"),
                    ),
                  ),

                  SizedBox(height: 15),

                  // Login Button
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          print("Login Successful");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      child: Text("Login"),
                    ),
                  ),

                  SizedBox(height: 15),

                  // Registration Navigation
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegistrationPage(),
                        ),
                      );
                    },
                    child: Text("Don't have an account? Register"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}