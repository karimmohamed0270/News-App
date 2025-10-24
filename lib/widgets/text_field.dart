import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String texthint;
  Function(String)? onchange;
  final bool? obstract;
  final TextInputType? keyboardType;
  CustomTextField({
    super.key,
    required this.texthint,
    this.onchange,
    this.obstract = false,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        // to make password secure
        obscureText: obstract!,
        // //  check if the textfield is empty
        // validator: (value) {
        //   if (value!.isEmpty) {
        //     return 'Please enter your $texthint';
        //   }
        // },
        onChanged: onchange,
        keyboardType: keyboardType,

        decoration: InputDecoration(
          hintText: texthint,
          hintStyle: const TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.blue)),
        ),
      ),
    );
  }
}
