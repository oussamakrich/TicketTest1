import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  
  CustomInput({super.key, required this.hintText, required this.label, required this.controller, required this.isOne});

  String hintText;
  String label;
  final TextEditingController controller;
  bool isOne;


  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text(label, style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.height / 60)),
            const SizedBox(height: 3),
            SizedBox(
              width: MediaQuery.of(context).size.width * (isOne ? 1 : 0.42),
              height: MediaQuery.of(context).size.height * 0.05,
              child: TextFormField(
                style: TextStyle(color: Colors.black, fontSize: MediaQuery.of(context).size.height / 60),
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: const TextStyle(color: Colors.black),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  suffixIcon: const Icon(Icons.edit, color: Colors.grey),
                ),
                validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                  onSaved: (value) {
                  },
              ),
            ),
        ],
    );
  }
}