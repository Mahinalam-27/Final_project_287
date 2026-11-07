
import 'package:final_project_287_g/login.dart';
import 'package:final_project_287_g/registration.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
        centerTitle: true,
        backgroundColor: const Color(0xFF673AB7),
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: Container(
          height: 400,
          width: 320,
          padding: EdgeInsets.all(20),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.deepPurple),
            boxShadow: [
              BoxShadow(
                color: Colors.deepPurple.shade100,
                blurRadius: 12,
                 spreadRadius: 2,
              ),
            ],
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Icon(
                Icons.person,
                size: 80,
                color: Colors.deepPurple,
              ),

              SizedBox(height: 15),

              Text(
                "Welcome!",
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  
                ),
              ),

              SizedBox(height: 10),

              Text(
                "Please Login or Create an Account",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),

              SizedBox(height: 28),

              // Login Button

              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                  ),
                  child: Text("Login"),
                ),
              ),

              SizedBox(height: 20),

              // Registration Button

              SizedBox(
                height: 50,
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistrationPage()));
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.deepPurple,
                    side: BorderSide(color: Colors.deepPurple),
                  ),
                  child: Text("Registration"),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

