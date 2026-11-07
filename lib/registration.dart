
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
      appBar: AppBar(
        title: Text("Registration"),
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
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 15,
                  spreadRadius: 2,
                ),
              ],
            ),

            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  Icon(
                    Icons.person_add,
                    size: 70,
                    color: Colors.blue,
                  ),

                  SizedBox(height: 15),

                  Text(
                    "Create Account",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),

                  SizedBox(height: 25),

                  // Name Field

                  InputField(
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    labelText: "Full Name",
                    hintText: "Enter your name",
                    suffixIcon: Icon(Icons.person),
                    validator: null,
                  ),

                  SizedBox(height: 15),

                  // Email Field

                  InputField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    labelText: "Email",
                    hintText: "Enter your email",
                    suffixIcon: Icon(Icons.email),
                    validator: null,
                  ),

                  SizedBox(height: 15),

                  // Password Field

                  InputField(
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    labelText: "Password",
                    hintText: "Enter your password",
                    suffixIcon: Icon(Icons.lock),
                    validator: null,
                  ),

                  SizedBox(height: 15),

                  // Confirm Password Field

                  InputField(
                    controller: confirmPasswordController,
                    keyboardType: TextInputType.text,
                    labelText: "Confirm Password",
                    hintText: "Confirm your password",
                    suffixIcon: Icon(Icons.lock_outline),
                    validator: null,
                  ),

                  SizedBox(height: 25),

                  // Register Button

                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                    onPressed: _isLoading ? null : register,

                    style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),

                  child: _isLoading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text("Register"),
                  )
                  ),

                  SizedBox(height: 15),

                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Already have an account? Login"),
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