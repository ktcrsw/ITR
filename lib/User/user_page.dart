import 'package:flutter/material.dart';
import './event.dart';
import '../main.dart';
import './qr_code.dart';
import '../Admin/qrcode.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:barcode_scan2/barcode_scan2.dart';

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    Text('User Home Page'),
    Text('Event'),
    Text('QrCode Reader'),
    Text('Logout'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          break;
        case 1:
          MaterialPageRoute materialPageRoute =
              MaterialPageRoute(builder: (BuildContext context) => Event());
          Navigator.of(context).push(materialPageRoute);
          break;
        case 2:
          MaterialPageRoute materialPageRoute =
              MaterialPageRoute(builder: (BuildContext context) => QRCodeScannerScreen());
          Navigator.of(context).push(materialPageRoute);
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Dashboard'),
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
                backgroundImage: AssetImage('assets/icon.png'),
              ),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(0);
              },
            ),
            ListTile(
              title: Text('Event'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(1);
              },
            ),
            ListTile(
              title: Text('Qr Code reader'),
              onTap: () {
                Navigator.pop(context);
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
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String result = "Scan a QR Code";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/avatar.png'),
          ),
          SizedBox(height: 20),
          Text(
            'John Doe',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () async {
              ScanResult scanResult = await BarcodeScanner.scan();
              setState(() {
                result = scanResult.rawContent ?? "Scan failed!";
              });
            },
            child: Icon(
              Icons.qr_code_scanner,
              size: 40,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: 5, 
              itemBuilder: (BuildContext context, int index) {
                EventItem eventItem = EventItem(
                  eventName: 'Event $index',
                  date: 'Date $index',
                  status: index % 2 == 0 ? 'Registered' : 'Unregistered',
                );

                return EventCard(eventItem: eventItem);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class EventItem {
  final String eventName;
  final String date;
  final String status;

  EventItem({
    required this.eventName,
    required this.date,
    required this.status,
  });
}

class EventCard extends StatelessWidget {
  final EventItem eventItem;

  const EventCard({required this.eventItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(eventItem.eventName),
        subtitle: Text('Date: ${eventItem.date}, Status: ${eventItem.status}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.qr_code),
              onPressed: () {
                                          MaterialPageRoute materialPageRoute =
                    MaterialPageRoute(builder: (BuildContext context) => qrcodeRegister());
                Navigator.of(context).push(materialPageRoute);
              },
            ),
            IconButton(
              icon: Icon(Icons.info),
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Text(eventItem.eventName),
                  content: Text('Date: 12 October 2023 - 15 October 2023 \nQuantity People: 15 \nLocation: เซนทรัลอุดรธานี \nMore Details: ...'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      
                      child: Text('Cancel', style: TextStyle(color:  Colors.black,)),
                      
                    ),
                    
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: Text('OK', style: TextStyle(color:  Colors.black,)),
                    ),
                    
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class qrcodeRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
            body: Center(
        child: QrImageView(
          data: 'ลงทะเบียน',
          version: QrVersions.auto,
          size: 500,
        ),
      ),
      
    );
  }
}
