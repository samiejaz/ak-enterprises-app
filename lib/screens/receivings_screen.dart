import 'dart:io';

import 'package:ak_enterprises_app/components/date_picker_component.dart';
import 'package:ak_enterprises_app/components/number_input_component.dart';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class ReceivingsScreen extends StatefulWidget {
  const ReceivingsScreen({super.key});

  @override
  State<ReceivingsScreen> createState() => _ReceivingsScreenState();
}

class _ReceivingsScreenState extends State<ReceivingsScreen> {
  final TextEditingController cashReceivedController = TextEditingController();
  bool _isChecked = false;

  File? _image;

  final _picker = ImagePicker();
  Future<void> _openImagePicker() async {
    final pickedImage = await showDialog<XFile>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Image Source'),
          actions: [
            TextButton(
              child: const Text('Camera'),
              onPressed: () async {
                Navigator.of(context)
                    .pop(await _picker.pickImage(source: ImageSource.camera));
              },
            ),
            TextButton(
              child: const Text('Gallery'),
              onPressed: () async {
                Navigator.of(context)
                    .pop(await _picker.pickImage(source: ImageSource.gallery));
              },
            ),
          ],
        );
      },
    );

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  void _toggleCheckbox(bool? value) {
    setState(() {
      _isChecked = value!;
    });
  }

  Widget _recordInfo() {
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.blue, width: 2.0))),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Customer Name:",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Invoice No:",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Abdul Sami",
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "12345678",
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Inv Type: ",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Inv Val:",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Software",
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "190000000",
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _form() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row 1
            Row(
              children: [
                const Expanded(
                  flex: 4,
                  child: Center(
                    child: Text("Cheque Received"),
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  flex: 8,
                  child: Row(
                    children: [
                      Expanded(
                        child: NumberInputComponent(
                          controller: cashReceivedController,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Row 2
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  flex: 4,
                  child: Center(
                    child: Text("Cheque Received"),
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  flex: 8,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: NumberInputComponent(
                              controller: cashReceivedController,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: DatePickerComponent(
                              onDateSelected: (value) {},
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            flex: 8,
                            child: Row(
                              children: [
                                Expanded(
                                  child: NumberInputComponent(
                                    controller: cashReceivedController,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Checkbox(
                                  value: _isChecked,
                                  onChanged: _toggleCheckbox,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Row 3
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  flex: 4,
                  child: Center(
                    child: Text("Online Payment"),
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  flex: 8,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: NumberInputComponent(
                              controller: cashReceivedController,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            flex: 8,
                            child: Row(
                              children: [
                                Expanded(
                                  child: NumberInputComponent(
                                    controller: cashReceivedController,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Checkbox(
                                  value: _isChecked,
                                  onChanged: _toggleCheckbox,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Row 4
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  flex: 4,
                  child: Text("WHT:"),
                ),
                const SizedBox(width: 6),
                Expanded(
                  flex: 8,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: NumberInputComponent(
                              controller: cashReceivedController,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: DatePickerComponent(
                              onDateSelected: (value) {},
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Checkbox(
                                  value: _isChecked,
                                  onChanged: _toggleCheckbox,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Row 5
            Row(
              children: [
                const Expanded(
                  flex: 4,
                  child: Center(
                    child: Text("Upload Receiving"),
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  flex: 8,
                  child: Row(
                    children: [
                      Expanded(
                          child: GestureDetector(
                        onTap: _openImagePicker,
                        child: Container(
                          decoration: BoxDecoration(
                              color: _image != null
                                  ? Colors.blue
                                  : const Color.fromARGB(255, 39, 187, 76)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15),
                          child: Center(
                            child: Text(
                              _image != null
                                  ? "File Uploaded"
                                  : "Take Pic/Upload",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  flex: 4,
                  child: Center(
                    child: Text(
                      "Return Stock Value",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  flex: 8,
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Expanded(
                              child: Center(
                            child: Text(
                              "Return From Invoice",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.blue),
                            ),
                          )),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            flex: 8,
                            child: Row(
                              children: [
                                Expanded(
                                  child: NumberInputComponent(
                                    controller: cashReceivedController,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 8,
                            child: Row(
                              children: [
                                Expanded(
                                  child: NumberInputComponent(
                                    controller: cashReceivedController,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Expanded(
                  flex: 4,
                  child: Center(
                    child: Text(
                      "Receving Bounced",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  flex: 8,
                  child: Row(
                    children: [
                      Expanded(
                        child: NumberInputComponent(
                          controller: cashReceivedController,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Expanded(
                  flex: 4,
                  child: Center(
                    child: Text("Next Due Date"),
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  flex: 8,
                  child: Row(
                    children: [
                      Expanded(
                        child: NumberInputComponent(
                          controller: cashReceivedController,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: GestureDetector(
                child: Container(
                  width: 200,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 39, 187, 76)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: const Center(
                    child: Text(
                      "Save",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget showCompleteDeliveryPopup() {
    return SingleChildScrollView(
        child: Column(children: [_recordInfo(), _form()]));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: showCompleteDeliveryPopup()));
  }
}
