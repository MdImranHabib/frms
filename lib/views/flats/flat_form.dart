import 'package:flutter/material.dart';
import 'package:frms/models/flat.dart';
import 'package:frms/services/flat.services.dart';

class FlatForm extends StatefulWidget {
  const FlatForm({Key? key}) : super(key: key);

  @override
  State<FlatForm> createState() => _FlatFormState();
}

class _FlatFormState extends State<FlatForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final _flatNameController = TextEditingController();
  final _flatCategoryController = TextEditingController();
  final _flatDescriptionController = TextEditingController();
  final _flatRentController = TextEditingController();
  final _flatMeterNoController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _flatNameController.dispose();
    _flatCategoryController.dispose();
    _flatDescriptionController.dispose();
    _flatRentController.dispose();
    _flatMeterNoController.dispose();
    super.dispose();
  }

  void addFlat(String flatName, String flatCategory, String flatDescription,
      int flatRent, String flatMeterNo) {
    Flat flat = Flat(
        id: 0,
        name: flatName,
        category: 'Large',
        description: flatDescription,
        rent: flatRent,
        meterNo: flatMeterNo,
        status: false);

    FlatService.createFlat(flat).then((response) {
      if (response == true) {
        // Navigator.pushReplacementNamed(context, '/flat_list');
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Add or Edit Flat'),
        centerTitle: false,
        elevation: 5.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // const Align(
            //   alignment: Alignment.topLeft,
            //   child: Text("Enter your data",
            //       style: TextStyle(
            //         fontSize: 24,
            //       )),
            // ),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Flat Name',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        border: OutlineInputBorder()),
                    // onFieldSubmitted: (value) {
                    //   setState(() {
                    //     firstName = value.capitalize();
                    //     // firstNameList.add(firstName);
                    //   });
                    // },
                    // onChanged: (value) {
                    //   setState(() {
                    //     firstName = value.capitalize();
                    //   });
                    // },
                    controller: _flatNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Flat Name must contain at least 1 characters';
                      } else if (value.contains(RegExp(r'^[0-9_\-=@,\.;]+$'))) {
                        return 'Flat Name cannot contain special characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // DropdownButtonFormField(
                  //     decoration: const InputDecoration(
                  //         enabledBorder: OutlineInputBorder(
                  //           borderRadius:
                  //               BorderRadius.all(Radius.circular(20.0)),
                  //           borderSide:
                  //               BorderSide(color: Colors.grey, width: 0.0),
                  //         ),
                  //         border: OutlineInputBorder()),
                  //     items: const [
                  //       DropdownMenuItem(
                  //         value: 'Small',
                  //         child: Text('Small'),
                  //       ),
                  //       DropdownMenuItem(
                  //         value: 'Semi-Large',
                  //         child: Text('Semi-Large'),
                  //       ),
                  //       DropdownMenuItem(
                  //         value: 'Large',
                  //         child: Text('Large'),
                  //       ),
                  //       DropdownMenuItem(
                  //         value: 'Extra-Large',
                  //         child: Text('Extra-Large'),
                  //       )
                  //     ],
                  //     hint: const Text("Select Flat Category"),
                  //     onChanged: (value) {
                  //       setState(() {
                  //         measure = value;
                  //         // measureList.add(measure);
                  //       });
                  //     },
                  //     onSaved: (value) {
                  //       setState(() {
                  //         measure = value;
                  //       });
                  //     }),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Flat Description',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        border: OutlineInputBorder()),
                    controller: _flatDescriptionController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Flat Description must contain at least 1 characters';
                      } else if (value.contains(RegExp(r'^[0-9_\-=@,\.;]+$'))) {
                        return 'Flat Description cannot contain special characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Flat Rent',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        border: OutlineInputBorder()),
                    keyboardType: TextInputType.number,
                    controller: _flatRentController,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.contains(RegExp(r'^[a-zA-Z\-]'))) {
                        return 'Use only numbers!';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Meter No',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        border: OutlineInputBorder()),
                    controller: _flatMeterNoController,
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 3) {
                        return 'Meter No must contain at least 3 characters';
                      } else if (value.contains(RegExp(r'^[0-9_\-=@,\.;]+$'))) {
                        return 'Meter No cannot contain special characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50)),
                    onPressed: () {
                      //Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        addFlat(
                            _flatNameController.text,
                            _flatCategoryController.text,
                            _flatDescriptionController.text,
                            int.parse(_flatRentController.text),
                            _flatMeterNoController.text);
                      } else {
                        const AlertDialog(
                          content: Text('Submitted failed!'),
                        );
                      }
                    },
                    child: const Text("Submit"),
                  ),
                ],
              ),
            ),
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
}
