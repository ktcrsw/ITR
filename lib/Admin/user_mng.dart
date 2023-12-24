import 'package:flutter/material.dart';
import './user_mng.dart';
import './create_event.dart';
import '../main.dart';
import 'package:quickalert/quickalert.dart';

class User {
  String registerDate;
  String username;
  String eventName;

  User({
    required this.registerDate,
    required this.username,
    required this.eventName,
  });
}

class user_mng extends StatefulWidget {
  @override
  _UserMng createState() => _UserMng();
}

class _UserMng extends State<user_mng> {
  int _selectedIndex = 1;
    void _onItemTapped(int index) {
    setState(() {
      if (index >= 0 && index < 2) {
        _selectedIndex = index;
        switch (index) {
          case 0:
            MaterialPageRoute materialPageRoute = MaterialPageRoute(
                builder: (BuildContext context) => create_event());
            Navigator.of(context).push(materialPageRoute);
            break;
          case 1:
            break;
          case 2:
            MaterialPageRoute materialPageRoute =
                MaterialPageRoute(builder: (BuildContext context) => MyApp());
            Navigator.of(context).push(materialPageRoute);
            break;
          default:
        }
      }
    });
  }


  List<User> users = [
    User(
      registerDate: '06/12/2015',
      username: 'Eddie',
      eventName:
          'หลักสูตรนวัตกรรมและเทคโนโลยีสารสนเทศทางการศึกษา',
    ),
    User(
      registerDate: '07/12/2015',
      username: 'Alex',
      eventName: 'หลักสูตรอบรมพัฒนาสมรรถนะครูสู่มืออาชีพ',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Management'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: _createDataTable(),
      ),
      
       bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Create Event',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'User Management',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemPress,
      ),
  
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddUserDialog();
        },
        child: Icon(Icons.add),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Username'), 
              accountEmail: null, 
              currentAccountPicture: CircleAvatar(
                backgroundImage:
                    AssetImage('assets/icon.png'), 
              ),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
            ListTile(
              title: Text('Create Event'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(0);
              },
            ),
            ListTile(
              title: Text('User Management'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(1);
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                MaterialPageRoute materialPageRoute =
              MaterialPageRoute(builder: (BuildContext context) => MyApp());
          Navigator.of(context).push(materialPageRoute);
                    
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _createDataTable() {
    return DataTable(
      columns: _createColumns(),
      rows: _createRows(),
    );
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(label: Text('Registed')),
      DataColumn(label: Text('Username')),
      DataColumn(label: Text('Event')),
      DataColumn(label: Text('Action')),
    ];
  }

  List<DataRow> _createRows() {
    return users.map<DataRow>((User user) {
      return DataRow(cells: [
        DataCell(Text(user.registerDate)),
        DataCell(Text(user.username)),
        DataCell(Text(user.eventName)),
        DataCell(
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  _showEditUserDialog(user);
                },
              ),
              SizedBox(width: 8),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  _deleteUser(user);
                },
              ),
            ],
          ),
        ),
      ]);
    }).toList();
  }

  void _onItemPress(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          // Create Event page
          MaterialPageRoute materialPageRoute = MaterialPageRoute(
              builder: (BuildContext context) => create_event());
          Navigator.of(context).push(materialPageRoute);
          break;
        case 1:
          // User Management page
          MaterialPageRoute materialPageRoute =
              MaterialPageRoute(builder: (BuildContext context) => user_mng());
          Navigator.of(context).push(materialPageRoute);
          break;
        case 2:
          MaterialPageRoute materialPageRoute =
              MaterialPageRoute(builder: (BuildContext context) => user_mng());
          Navigator.of(context).push(materialPageRoute);
          break;
          case 3:
                    MaterialPageRoute materialPageRoute =
              MaterialPageRoute(builder: (BuildContext context) => user_mng());
          Navigator.of(context).push(materialPageRoute);
          
                    break;
        default:
      }
    });
  }


  void _showAddUserDialog() {
    User newUser = User(registerDate: '', username: '', eventName: '');
    _showUserDialog(newUser);
  }

  void _showEditUserDialog(User user) {
    _showUserDialog(user);
  }

  void _showUserDialog(User user) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(user.username.isEmpty ? 'Add User' : 'Edit User'),
          content: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Registered'),
                onChanged: (value) {
                  user.registerDate = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Username'),
                onChanged: (value) {
                  user.username = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Event'),
                onChanged: (value) {
                  user.eventName = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                primary: Colors.black, // Set the text color to black
              ),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _saveUser(user);
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                primary: Colors.black, // Set the text color to black
              ),
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _saveUser(User user) {
    setState(() {
      if (!users.contains(user)) {
        users.add(user);
      }
    });
  }

  void _deleteUser(User user) {
    setState(() {
      users.remove(user);
    });
  }
}

void main() {
  runApp(MaterialApp(
    home: user_mng(),
  ));
}
