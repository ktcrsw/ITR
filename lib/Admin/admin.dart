import 'package:flutter/material.dart';
import './user_mng.dart';
import './create_event.dart';
import '../main.dart';
import 'package:quickalert/quickalert.dart';

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    Text('Create Event'),
    Text('User Management'),
    Text('Logout'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          MaterialPageRoute materialPageRoute =
              MaterialPageRoute(builder: (BuildContext context) => Admin());
          Navigator.of(context).push(materialPageRoute);
          break;
        case 1:
          MaterialPageRoute materialPageRoute = MaterialPageRoute(
              builder: (BuildContext context) => create_event());
          Navigator.of(context).push(materialPageRoute);
          break;
        case 2:
          MaterialPageRoute materialPageRoute =
              MaterialPageRoute(builder: (BuildContext context) => user_mng());
          Navigator.of(context).push(materialPageRoute);
          break;
        case 4:
          MaterialPageRoute materialPageRoute =
              MaterialPageRoute(builder: (BuildContext context) => MyApp());
          Navigator.of(context).push(materialPageRoute);
          QuickAlert.show(
            context: context,
            type: QuickAlertType.success,
            text: 'ออกจากระบบสำเร็จ',
          );
          break;

        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/icon.png'),
              radius: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Username',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Username'), // Replace with actual username
              accountEmail: null, // Add user email if available
              currentAccountPicture: CircleAvatar(
                backgroundImage:
                    AssetImage('assets/icon.png'), // Replace with actual path
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Create Event'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(1);
              },
            ),
            ListTile(
              title: Text('User Management'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(2);
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(4);
              },
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Admin(),
  ));
}
