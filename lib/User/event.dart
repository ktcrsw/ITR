import 'package:flutter/material.dart';
import './qr_code.dart';

class event {
  String? eventName;
  String? rangeTime;
  String? quantityPeople;
  String? eventLocation;

  event(
      {this.eventName,
      this.rangeTime,
      this.quantityPeople,
      this.eventLocation});
}

class Event extends StatefulWidget {
  @override
  _event createState() => _event();
}

class _event extends State<Event> {
  int _selectedIndex = 1;

  List<event> events = [
    event(
        eventName: 'หลักสูตรนวัตกรรมและเทคโนโลยีสารสนเทศทางการศึกษา',
        rangeTime: '3 วัน',
        quantityPeople: '120 คน',
        eventLocation: 'เซนทรัลพลาซ่าขอนแก่น'),
    event(
        eventName: 'หลักสูตรนวัตกรรมและเทคโนโลยีสารสนเทศทางการศึกษา',
        rangeTime: '3 วัน',
        quantityPeople: '120 คน',
        eventLocation: 'เซนทรัลพลาซ่าขอนแก่น'),
    event(
        eventName: 'หลักสูตรนวัตกรรมและเทคโนโลยีสารสนเทศทางการศึกษา',
        rangeTime: '3 วัน',
        quantityPeople: '120 คน',
        eventLocation: 'เซนทรัลพลาซ่าขอนแก่น'),
    event(
        eventName: 'หลักสูตรนวัตกรรมและเทคโนโลยีสารสนเทศทางการศึกษา',
        rangeTime: '3 วัน',
        quantityPeople: '120 คน',
        eventLocation: 'เซนทรัลพลาซ่าขอนแก่น'),
    event(
        eventName: 'หลักสูตรนวัตกรรมและเทคโนโลยีสารสนเทศทางการศึกษา',
        rangeTime: '3 วัน',
        quantityPeople: '120 คน',
        eventLocation: 'เซนทรัลพลาซ่าขอนแก่น'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('event Management'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: _createDataTable(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Event',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: 'QrCode Reader',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
        onTap: _onItemTapped,
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
    return events.map<DataRow>((event event) {
      return DataRow(cells: [
        DataCell(Text(event.eventName ?? '')),
        DataCell(Text(event.rangeTime ?? '')),
        DataCell(Text(event.quantityPeople ?? '')),
        DataCell(Text(event.eventLocation ?? '')),
        DataCell(
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  _showEditeventDialog(event);
                },
              ),
              SizedBox(width: 8),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  _deleteevent(event);
                },
              ),
            ],
          ),
        ),
      ]);
    }).toList();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          // Add the navigation logic for the Home tab
          break;
        case 1:
          // Do nothing, already in event Management
          break;
        default:
      }
    });
  }

  void _showAddeventDialog() {
    event newevent = event(eventName: null);
    _showeventDialog(newevent);
  }

  void _showEditeventDialog(event event) {
    _showeventDialog(event);
  }

  void _showeventDialog(event event) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'หลักสูตรการอบรม'),
                onChanged: (value) {
                  event.eventName = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'ระยะเวลาการอบรม'),
                onChanged: (value) {
                  event.rangeTime = value;
                },
              ),
              TextField(
                decoration:
                    InputDecoration(labelText: 'จำนวนผู้เข้าร่วมการอบรม'),
                onChanged: (value) {
                  event.quantityPeople = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'สถานที่'),
                onChanged: (value) {
                  event.eventLocation = value;
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
                _saveevent(event);
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

  void _saveevent(event event) {
    setState(() {
      if (event.eventName != null && event.eventName != null) {
        if (!events.contains(event)) {
          events.add(event);
        }
      }
    });
  }

  void _deleteevent(event event) {
    setState(() {
      events.remove(event);
    });
  }
}

void main() {
  runApp(MaterialApp(
    home: Event(),
  ));
}

