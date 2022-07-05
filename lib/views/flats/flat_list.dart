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
  late List<Flat> flats;

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flat List'),
      ),
      body: flats.isEmpty
          ? const Center(
              child: Text('Empty'),
            )
          : ListView.builder(
              itemCount: flats.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.orange[200],
                  margin: const EdgeInsets.all(15),
                  elevation: 2.0,
                  child: ListTile(
                    title: Text(flats[index].name),
                    onTap: null,
                  ),
                );
              },
            ),
    );
  }
}
