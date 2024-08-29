import 'package:flutter/material.dart';

class CompanyInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      // Set the AppBar icon color to black for better visibility
      ),
      body: Container(
        color: Colors.white, // Set the background color to white
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Company Info',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.cyan[400]
              ),
            ),
            SizedBox(height: 16.0), // Add spacing between the title and the image
            // Replace 'assets/company_logo.png' with the path to your company image
            Image.asset(
              'assets/images/geeksynergy.png',
              width: 300.0, // Adjust the width as needed
              height: 300.0, // Adjust the height as needed
            ),
            SizedBox(height: 16.0), // Add spacing between the image and the details
            Text(
              'Company: Geeksynergy Technologies Pvt Ltd',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.cyan[400],
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Address: Sanjayanagar, Bengaluru-56',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.cyan[400],
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Phone: XXXXXXXXX09',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.cyan[400],
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Email: XXXXXX@gmail.com',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.cyan[400],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
