import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flat Rent Management System"),
        centerTitle: true,
        elevation: 5.0,
        backgroundColor: const Color.fromRGBO(49, 87, 110, 1.0),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
        child: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(3.0),
          children: <Widget>[
            makeDashboardItem("Flats", Icons.home, Colors.green, '/flat_list'),
            makeDashboardItem(
                "Residents", Icons.people_alt, Colors.lightGreen, '/'),
            makeDashboardItem("Rents", Icons.home, Colors.blue, '/'),
            makeDashboardItem("Users", Icons.alarm, Colors.cyan, '/'),
            makeDashboardItem("Invoices", Icons.alarm, Colors.deepOrange, '/'),
            makeDashboardItem("Reports", Icons.alarm, Colors.orange, '/'),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: const Color.fromRGBO(49, 87, 110, 1.0),
        child: SizedBox(
          height: 40.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                '© 2022 FRMS. All rights reserved.',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 13.0,
                ),
              ),
              Text(
                'Developed by Md. Imran Habib.',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Card makeDashboardItem(
      String title, IconData icon, Color color, String route) {
    return Card(
        elevation: 5.0,
        margin: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: color),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, route);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                const SizedBox(height: 50.0),
                Center(
                    child: Icon(
                  icon,
                  size: 40.0,
                  color: Colors.black,
                )),
                const SizedBox(height: 20.0),
                Center(
                  child: Text(title,
                      style:
                          const TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            ),
          ),
        ));
  }
}
