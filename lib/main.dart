import 'package:flutter/material.dart';
import 'package:frms/views/flats/flat_list.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Flats(),
      },
    ));
