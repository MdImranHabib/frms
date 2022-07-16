import 'package:flutter/material.dart';
import 'package:frms/views/dashboard.dart';
import 'package:frms/views/flats/flat_form.dart';
import 'package:frms/views/flats/flat_list.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Dashboard(),
        '/flat_list': (context) => const FlatList(),
        '/flat_form': (context) => const FlatForm(),
      },
      title: 'Flat Rent Management System',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF2661FA),
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    ));
