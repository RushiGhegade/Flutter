import 'dart:developer';

import 'package:flutter/material.dart';

class ContactUsPage extends StatelessWidget {
  Widget myShowNavigationBar(BuildContext context) {
    return Center(
      child: Text(
        "Contact Us",
        style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.037,
            fontWeight: FontWeight.bold,
            color: Colors.orange),
      ),
    );
  }

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   title:
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            myShowNavigationBar(context),
            // Header Text
            Text(
              'We\'d love to hear from you!',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),

            // Name Field
            _buildTextField(
                hintText: 'Your Name',
                prefixIcon: Icons.person,
                textcontroller: name),
            SizedBox(height: 20),

            // Email Field
            _buildTextField(
                hintText: 'Your Email',
                prefixIcon: Icons.email,
                textcontroller: email),
            SizedBox(height: 20),

            // Message Field
            _buildTextField(
              hintText: 'Your Message',
              prefixIcon: Icons.message,
              textcontroller: message,
              maxLines: 5,
            ),
            SizedBox(height: 30),

            // Submit Button
            ElevatedButton(
              onPressed: () {
                // Handle form submission
                log("${email.text}");

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.orange,
                    content: Text(
                      "'We appreciate your message! i will respond as soon as possible.'",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Send Message',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Custom Text Field Widget
  Widget _buildTextField({
    required String hintText,
    required IconData prefixIcon,
    required TextEditingController textcontroller,
    int maxLines = 1,
  }) {
    return TextField(
      controller: textcontroller,
      style: TextStyle(color: Colors.white),
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white54),
        prefixIcon: Icon(prefixIcon, color: Colors.white54),
        filled: true,
        fillColor: Colors.grey[900],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blueAccent, width: 2),
        ),
      ),
    );
  }
}
