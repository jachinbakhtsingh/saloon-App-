import 'package:flutter/material.dart';
import 'package:saloon/Detailspage.dart';
import 'package:saloon/otppage.dart';

import 'Homepage.dart';
import 'Registerpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: LoginScreen(),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('../assets/cut2.jpg',
              width: 100,
              height: 100,), // Replace with your image asset
              SizedBox(height: 20),
              Text(
                'Welcome back 👋',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,color: Colors.white
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Please enter your login information below to access your account',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,color: Colors.white
                ),
              ),
              SizedBox(height: 20),
              TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Username',labelStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.email,color: Colors.white,),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                  cursorColor: Colors.white,
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: true,style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Phone number',labelStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.phone,color: Colors.white,),
                  suffixIcon: Icon(Icons.visibility,),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                ),
                  cursorColor: Colors.white,
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Handle forgot password
                  },
                  child: Text('Forgot password?',style: TextStyle(color: Colors.white),),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      Homepage()),
                );
                  // Handle login
                },
                child: Text('Login',style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  textStyle: TextStyle(fontSize: 18) ,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              TextButton(
                onPressed: () {
                  // Handle register
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
                child: Text("Don't have an account? Register",style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




