import 'package:final_project_287_g/login.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'widgets/input_field.dart';

class RegistrationPage extends StatefulWidget {
  RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool _isLoading = false;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final _supabase = Supabase.instance.client;

  void register() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Password does not match")),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final authResponse = await _supabase.auth.signUp(
        email: email,
        password: password,
        data: {
          'full_name': name,
        },
      );
      if (!mounted) return;
      if (authResponse.user != null) {
        nameController.clear();
        emailController.clear();
        passwordController.clear();
        confirmPasswordController.clear();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Registration Successful")),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      }
    } on AuthException catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message)),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 220, 210),

      appBar: AppBar(
        title: Text("Create Account"),
        centerTitle: true,
        backgroundColor: const Color(0xff234E52),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 530,
            padding: EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 236, 231, 219),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: const Color.fromARGB(255, 209, 178, 113),
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 35, 81, 85),
                  blurRadius: 15,
                  spreadRadius: 2,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.person_add_alt_1,
                    size: 70,
                    color: Color(0xff234E52),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Join Us",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff234E52),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Create your account to get started",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xff77736B),
                    ),
                  ),

                  SizedBox(height: 25),
                  InputField(
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    labelText: "Full Name",
                    hintText: "Enter your name",
                    suffixIcon: Icon(Icons.person_outline),
                    validator: null,
                  ),

                  SizedBox(height: 15),

                  InputField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    labelText: "Email",
                    hintText: "Enter your email",
                    suffixIcon: Icon(Icons.email_outlined),
                    validator: null,
                  ),

                  SizedBox(height: 15),

                  InputField(
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    labelText: "Password",
                    hintText: "Enter your password",
                    suffixIcon: Icon(Icons.lock_outline),
                    validator: null,
                  ),

                  SizedBox(height: 15),

                  InputField(
                    controller: confirmPasswordController,
                    keyboardType: TextInputType.text,
                    labelText: "Confirm Password",
                    hintText: "Confirm your password",
                    suffixIcon: Icon(Icons.verified_user_outlined),
                    validator: null,
                  ),
                  SizedBox(height: 25),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : register,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff234E52),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: _isLoading
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text("Create Account"),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Already have an account? Login",
                      style: TextStyle(
                        color: Color.fromARGB(255, 28, 65, 68),
                      ),
                    ),
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
