import 'package:flutter/material.dart';
 import 'Admin/create_event.dart';
 import 'admin/admin.dart';
import 'User/user_page.dart';
import 'signup.dart';
import 'forgot.dart';
import 'package:quickalert/quickalert.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

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
  String name = nameController.text;
  String password = passwordController.text;

  print("Name: $name");
  print("Password: $password");

  if (name == 'admin' && password == 'admin') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) => create_event()),
    );
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      text: 'เข้าสู่ระบบสำเร็จ',
    );
  } else if (name == '' || password == '') {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.warning,
      text: 'โปรดกรอกข้อมูล',
    );
  } else if (name == 'viangphing') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) => ProfilePage()),
    );
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      text: 'เข้าสู่ระบบสำเร็จ',
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(15),
              child: Image.asset(
                'assets/logo.jpeg',
                height: 200,
                width: 200,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
                keyboardType: TextInputType.text, // Specify keyboardType
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => forgot()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0,
                    ),
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              width: 30,
              height: 65,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextButton(
                onPressed: handleLogin,
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Don\'t have an account?"),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => signup()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0,
                    ),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
