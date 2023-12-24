import 'package:flutter/material.dart';
import 'Admin/admin.dart';


class forgot extends StatelessWidget {
  const forgot({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ITR',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.grey,
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      home: const MyHomePage(title: 'Training Registration'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void handleLogin() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      backgroundColor: Colors.white, // Set the background color of Scaffold
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            // Other UI elements...
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                'assets/logo.jpeg', // Replace 'assets/logo.png' with the correct path to your image
                height: 180, // Adjust the height as needed
                width: 180, // Adjust the width as needed
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Text(
                "Enter Your Email and we will send you a password reset link", style:TextStyle(
                  fontSize: 20
                )

              ),
            

            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              width: 30,
              height: 65,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius:
                    BorderRadius.circular(15), // 
              ),
              child: TextButton(
                onPressed: handleLogin,
                child: Text(
                  'Reset Password',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
