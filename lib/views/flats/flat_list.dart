import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frms/models/flat.dart';
import 'package:frms/services/flat.services.dart';

class Flats extends StatefulWidget {
  const Flats({Key? key}) : super(key: key);

  @override
  State<Flats> createState() => _FlatsState();
}

class _FlatsState extends State<Flats> {
  List<Flat> flats = <Flat>[];

  getFlats() {
    FlatService.fetchFlats().then((response) {
      Iterable list = json.decode(response.body);
      List<Flat> flatList = <Flat>[];
      flatList = list.map((model) => Flat.fromObject(model)).toList();

      setState(() {
        flats = flatList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    getFlats();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Flat List'),
        centerTitle: false,
        elevation: 5.0,
      ),
      body: flats.isEmpty
          ? const Center(
              child: Text('Empty'),
            )
          : ListView.builder(
              itemCount: flats.length,
              itemBuilder: (context, index) {
                return Card(
                  color: flats[index].status ? Colors.red : Colors.green,
                  margin: const EdgeInsets.all(10),
                  elevation: 2.0,
                  child: ListTile(
                    textColor: Colors.white,
                    iconColor: Colors.white,
                    title: Text(
                      flats[index].name,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(flats[index].category),
                    onTap: null,
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.delete),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.blue[900],
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
