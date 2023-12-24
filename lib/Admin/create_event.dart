import 'package:flutter/material.dart';
import 'qrcode.dart';
import './user_mng.dart';
import '../main.dart';
import 'package:quickalert/quickalert.dart';

class createEvent {
  String? eventName;
  String? rangeTime;
  String? quantityPeople;
  String? eventLocation;

  createEvent(
      {this.eventName,
      this.rangeTime,
      this.quantityPeople,
      this.eventLocation});
}

class create_event extends StatefulWidget {
  @override
  _CreateEvent createState() => _CreateEvent();
}

class _CreateEvent extends State<create_event> {
  int _selectedIndex = 0;

  List<createEvent> createEvents = [
    createEvent(
        eventName: 'หลักสูตรนวัตกรรมและเทคโนโลยีสารสนเทศทางการศึกษา',
        rangeTime: '3 วัน',
        quantityPeople: '120 คน',
        eventLocation: 'เซนทรัลพลาซ่าขอนแก่น'),
    createEvent(
        eventName: 'หลักสูตรนวัตกรรมและเทคโนโลยีสารสนเทศทางการศึกษา',
        rangeTime: '3 วัน',
        quantityPeople: '120 คน',
        eventLocation: 'เซนทรัลพลาซ่าขอนแก่น'),
    createEvent(
        eventName: 'หลักสูตรนวัตกรรมและเทคโนโลยีสารสนเทศทางการศึกษา',
        rangeTime: '3 วัน',
        quantityPeople: '120 คน',
        eventLocation: 'เซนทรัลพลาซ่าขอนแก่น'),
  ];
  List<Widget> _widgetOptions = <Widget>[
    Text('Create Event'),
    Text('User Management'),
    Text('Logout'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      if (index >= 0 && index < 2) {
        _selectedIndex = index;
        switch (index) {
          case 0:

            break;
          case 1:
                      MaterialPageRoute materialPageRoute = MaterialPageRoute(
                builder: (BuildContext context) => user_mng());
            Navigator.of(context).push(materialPageRoute);
            
            break;
          case 2:

          default:
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('createEvent Management'),
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
                color: Colors.green, // Replace
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddcreateEventDialog();
        },
        child: Icon(Icons.add),
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
      DataColumn(label: Text('หลักสูตรการอบรม')),
      DataColumn(label: Text('ระยะเวลาการอบรม')),
      DataColumn(label: Text('จำนวนผู้เข้าร่วม')),
      DataColumn(label: Text('สถานที่')),
      DataColumn(label: Text('Action')),
    ];
  }

  List<DataRow> _createRows() {
    return createEvents.map<DataRow>((createEvent createEvent) {
      return DataRow(cells: [
        DataCell(Text(createEvent.eventName ?? '')),
        DataCell(Text(createEvent.rangeTime ?? '')),
        DataCell(Text(createEvent.quantityPeople ?? '')),
        DataCell(Text(createEvent.eventLocation ?? '')),
        DataCell(
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.qr_code),
                onPressed: () {
                  _qrcodeCreateEventDialog();
                },
              ),
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  _showEditcreateEventDialog(createEvent);
                },
              ),
              SizedBox(width: 8),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  _deletecreateEvent(createEvent);
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
        // User Management page
          MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => create_event());
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
              MaterialPageRoute(builder: (BuildContext context) => MyApp());
          Navigator.of(context).push(materialPageRoute);
                    break;
        default:
      }
    });
  }

  void _showAddcreateEventDialog() {
    createEvent newcreateEvent = createEvent(eventName: null);
    _showcreateEventDialog(newcreateEvent);
  }

  void _showEditcreateEventDialog(createEvent createEvent) {
    _showcreateEventDialog(createEvent);
  }

  void _qrcodeCreateEventDialog() {
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext context) => qrcode());
    Navigator.of(context).push(materialPageRoute);
  }

  void _showcreateEventDialog(createEvent createEvent) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'หลักสูตรการอบรม'),
                onChanged: (value) {
                  createEvent.eventName = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'ระยะเวลาการอบรม'),
                onChanged: (value) {
                  createEvent.rangeTime = value;
                },
              ),
              TextField(
                decoration:
                    InputDecoration(labelText: 'จำนวนผู้เข้าร่วมการอบรม'),
                onChanged: (value) {
                  createEvent.quantityPeople = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'สถานที่'),
                onChanged: (value) {
                  createEvent.eventLocation = value;
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
                _savecreateEvent(createEvent);
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

  void _savecreateEvent(createEvent createEvent) {
    setState(() {
      if (createEvent.eventName != null && createEvent.eventName != null) {
        if (!createEvents.contains(createEvent)) {
          createEvents.add(createEvent);
        }
      }
    });
  }

  void _deletecreateEvent(createEvent createEvent) {
    setState(() {
      createEvents.remove(createEvent);
    });
  }
}

void main() {
  runApp(MaterialApp(
    home: create_event(),
  ));
}
