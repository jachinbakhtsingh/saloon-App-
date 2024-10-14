import 'package:flutter/material.dart';

import 'otppage.dart';




class RegisterScreen extends StatelessWidget {
  String? _selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [  Positioned.fill(
          child: Image.asset(
            '../assets/cut4.jpg', // Replace with your background image asset
             fit: BoxFit.cover,
          ),
        ),
          // Background image
          // Registration form
          Center(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(16.0),
                width: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Please enter your data to complete your account registration process',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,color: Colors.white
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Name',labelStyle:TextStyle(color: Colors.white),
                        prefixIcon: Icon(Icons.person,color: Colors.white,),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      cursorColor: Colors.white, // Cursor color when focused
                    ),
                    SizedBox(height: 20),
                    TextField(
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Age',labelStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(Icons.calendar_today,color: Colors.white,),
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
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Gender',labelStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(Icons.person_outline,color: Colors.white,),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      value: _selectedGender,
                      items: ['Male',
                        'Female', 'Other']
                          .map((choice) => DropdownMenuItem<String>(
                        value: choice,
                        child: Text(choice,style: TextStyle(color: Colors.white),),
                      ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    TextField(
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: 'Phone Number',labelStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(Icons.phone,color: Colors.white,),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      cursorColor: Colors.white, // Cursor color when focused
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Otppage()),
                        );
                        // Handle registration
                      },
                      child: Text('Register',style: TextStyle(color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange, // Set the button color to orange
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        textStyle: TextStyle(fontSize: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void setState(Null Function() param0) {}
}
